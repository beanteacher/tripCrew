DELIMITER //

-- 신고접수 후 신고내용이 적절하다고 판단되어 신고처리가 되었다는 내용을 알림 
CREATE OR REPLACE TRIGGER after_update_report_insert_alarm_log
	AFTER UPDATE
	ON REPORT_BOARD
	FOR EACH row
	
BEGIN

	DECLARE user INT; -- 신고당한 유저
	DECLARE accp_user INT; -- 신고처리 관리자

  	SELECT 
	  	rb.report_user
		  , rb.report_accept_user 
		  INTO user, accp_user
	   FROM REPORT_BOARD rb
	   JOIN TRIP_REVIEW tr ON rb.trip_review_no = tr.trip_review_no
		JOIN USER_INFO review_ui ON rb.report_user = review_ui.user_no
		WHERE report_review_no = NEW.report_review_no
		LIMIT 1;

  if NEW.report_review_status = 'accept' then    -- 신고처리가 accept 상태로 변경된다면
  
  INSERT INTO ALARM_SEND_LOG (alarm_no
									   , alarm_send_type
	  									, alarm_receiver) 
	SELECT alarm_no
		, 'P'
		, user
		FROM ALARM
		WHERE alarm_del_yn = 'N'
		AND alarm_title LIKE '%신고 접수%'
		LIMIT 1;				-- 신고 접수자에게 처리가 완료됐다는 발송 1회 알림 로그 적재
		
	INSERT INTO ALARM_SEND_LOG (alarm_no
									   , alarm_send_type
	  									, alarm_receiver) 
	SELECT alarm_no
		, 'P'
		, accp_user
		FROM ALARM
		WHERE alarm_del_yn = 'N'
		AND alarm_title LIKE '%신고 확인%'
		LIMIT 1;				-- 신고를 받은 자에게 신고내용 발송 1회 알림 로그 적재
	
	END if;
	
	
END //

DELIMITER ;



DELIMITER //

-- 리뷰 작성자에게 별점이 부여됐을 때 알림 발송
CREATE OR REPLACE TRIGGER after_review_score_insert_alarm_log
	AFTER UPDATE
	ON REPORT_BOARD
	FOR EACH row
	
BEGIN
	
  DECLARE review_writer INT;  -- 리뷰 작성자

  SELECT review_ui.user_no INTO review_writer
   FROM TRIP_REVIEW_STAR trc
   JOIN TRIP_REVIEW tr ON trc.trip_review_no = tr.trip_review_no
	JOIN USER_INFO review_ui ON tr.trip_review_user_no = review_ui.user_no
	WHERE trip_review_score_no = NEW.trip_review_score_no;	
   
  
  INSERT INTO ALARM_SEND_LOG (alarm_no
									   , alarm_send_type
	  									, alarm_receiver) 
	SELECT alarm_no
		, 'P'
		, review_writer
		FROM ALARM
		WHERE alarm_del_yn = 'N'
		AND alarm_title LIKE '%별점%'
		LIMIT 1; -- 별점 알림 발송 후 알림 로그 적재
	
	
END //

DELIMITER ;





DELIMITER //

-- 리뷰 댓글 좋아요 시 댓글 작성자에게 알림
CREATE OR REPLACE TRIGGER after_review_comment_like_insert_alarm_log
	AFTER UPDATE
	ON REPORT_BOARD
	FOR EACH row
	
BEGIN
	
  DECLARE review_comment_writer INT;  -- 리뷰 댓글 작성자

  SELECT review_comment_ui.user_no INTO review_comment_writer
   FROM TRIP_COMMENT_LIKE tcl
   JOIN TRIP_REVIEW_COMMENT trc ON tcl.trip_review_comment_no = trc.trip_review_comment_no
	JOIN USER_INFO review_comment_ui ON trc.trip_review_comment_user_no = review_comment_ui.user_no
	WHERE trip_review_comment_like_no = NEW.trip_review_comment_like_no;	
   
  
  INSERT INTO ALARM_SEND_LOG (alarm_no
									   , alarm_send_type
	  									, alarm_receiver) 
	SELECT alarm_no
		, 'P'
		, review_writer
		FROM ALARM
		WHERE alarm_del_yn = 'N'
		AND alarm_title LIKE '%댓글 좋아요%'
		LIMIT 1; -- 댓글 좋아요 시 알림 로그 적재
	
	
END //

DELIMITER ;





DELIMITER //

-- 리뷰 댓글 작성 시 리뷰 게시자에게 알림 전송
CREATE OR REPLACE TRIGGER after_review_comment_insert_alarm_log
	AFTER UPDATE
	ON REPORT_BOARD
	FOR EACH row
	
BEGIN
	
  DECLARE review_writer INT;  -- 리뷰 작성자

  SELECT review_ui.user_no INTO review_writer
   FROM TRIP_REVIEW_COMMENT trc
   JOIN TRIP_REVIEW tr ON trc.trip_review_no = tr.trip_review_no
	JOIN USER_INFO review_ui ON tr.trip_review_user_no = review_ui.user_no
	WHERE trip_review_comment_no = NEW.trip_review_comment_no;	
   
  
  INSERT INTO ALARM_SEND_LOG (alarm_no
									   , alarm_send_type
	  									, alarm_receiver) 
	SELECT alarm_no
		, 'P'
		, review_writer
		FROM ALARM
		WHERE alarm_del_yn = 'N'
		AND alarm_title LIKE '%리뷰게시판댓글%'
		LIMIT 1;   -- 리뷰게시판 댓글 작성 시 알림 로그 적재
	
	
END //

DELIMITER ;



DELIMITER //

-- 동행자 상태 변경에 따른 알림 전송 로그 적재
CREATE OR REPLACE TRIGGER after_trip_company_participant_update_alarm_log
	AFTER UPDATE
	ON TRIP_COMPANY_PARTICIPANT
	FOR EACH row

BEGIN
	
  DECLARE company_writer INT;  -- 여행동행 작성자 사용자번호
  DECLARE company_participant_user INT;  -- 여행동행 참가자 사용자번호

  SELECT review_ui.user_no,
  		tcp.trip_company_participant_user_no INTO company_writer, company_participant_user
   FROM TRIP_COMPANY_PARTICIPANT tcp
   JOIN TRIP_COMPANY tc ON tcp.trip_company_no = tc.trip_company_no
	JOIN USER_INFO review_ui ON tc.trip_company_user_no = review_ui.user_no
	WHERE trip_company_participant_no = NEW.trip_company_participant_no;
   
  IF NEW.trip_company_participant_state = 'accept' THEN    -- 처리가 accept 상태로 변경된다면
  
  INSERT INTO ALARM_SEND_LOG (alarm_no
									   , alarm_send_type
	  									, alarm_receiver) 
	SELECT alarm_no
		, 'P'
		, company_participant_user
		FROM ALARM
		WHERE alarm_del_yn = 'N'
		AND alarm_title LIKE '%동행 수락%' -- 동행 수락메시지  동행 신청자에게 알림 발송 
		LIMIT 1;
		
	ELSEIF NEW.trip_company_participant_state = 'deny' THEN    -- 처리가 deny 상태로 변경된다면
  
   INSERT INTO ALARM_SEND_LOG (alarm_no
									   , alarm_send_type
	  									, alarm_receiver) 
	SELECT alarm_no
		, 'P'
		, company_participant_user
		FROM ALARM
		WHERE alarm_del_yn = 'N'
		AND alarm_title LIKE '%동행 거절%'	 -- 동행  거절 메시지동행 신청자에게 알림 발송 
		LIMIT 1;
	
	ELSEIF NEW.trip_company_participant_state = 'quit' THEN    -- 처리가 quit 상태로 변경된다면
  
   INSERT INTO ALARM_SEND_LOG (alarm_no
									   , alarm_send_type
	  									, alarm_receiver) 
	SELECT alarm_no
		, 'P'
		, company_writer
		FROM ALARM
		WHERE alarm_del_yn = 'N'
		AND alarm_title LIKE '%동행 취소%' -- 동행 자진 나가기 동행 모집자에게 알림 발송
		LIMIT 1;
	
	ELSE 
	
	INSERT INTO ALARM_SEND_LOG (alarm_no
									   , alarm_send_type
	  									, alarm_receiver) 
	SELECT alarm_no
		, 'P' -- 메시지 종류
		, company_writer
		FROM ALARM
		WHERE alarm_del_yn = 'N'
		AND alarm_title LIKE '%동행자 변경%' -- 동행자가 정지당했다는 알림을 모집자에게 발송
		LIMIT 1;
		
	END IF;
	
END //

DELIMITER ;



DELIMITER //

-- 동행자가 동행요청 후 여행동행 생성자에게 알림 발송
CREATE OR REPLACE TRIGGER after_trip_company_participant_insert_alarm_log
	AFTER INSERT
	ON TRIP_COMPANY_PARTICIPANT
	FOR EACH row

BEGIN
	
  DECLARE company_writer INT;  -- 여행동행 작성자 사용자번호

  SELECT review_ui.user_no INTO company_writer
   FROM TRIP_COMPANY_PARTICIPANT tcp
   JOIN TRIP_COMPANY tc ON tcp.trip_company_no = tc.trip_company_no
	JOIN USER_INFO review_ui ON tc.trip_company_user_no = review_ui.user_no
	WHERE trip_company_participant_no = NEW.trip_company_participant_no;	-- 댓글 작성 시 댓글의 
   
  
  INSERT INTO ALARM_SEND_LOG (alarm_no
									   , alarm_send_type
	  									, alarm_receiver) 
	SELECT alarm_no
		, 'P'
		, company_writer
		FROM ALARM
		WHERE alarm_del_yn = 'N'
		AND alarm_title LIKE '%동행 참가요청%'
		LIMIT 1;
	
	
END //

DELIMITER ;


DROP TRIGGER after_trip_company_participant_insert_alarm_log;