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
