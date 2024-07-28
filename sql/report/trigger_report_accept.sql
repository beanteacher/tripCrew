-- 버튼 입력 예시

UPDATE REPORT_BOARD
   SET report_review_status = 'accept'
 WHERE report_review_no = 5;

UPDATE REPORT_COMMENT
   SET report_comment_state = 'accept'
 WHERE report_comment_no = 8;

UPDATE REPORT_COURSE
   SET report_course_state = 'accept'
 WHERE report_course_no = 4;

UPDATE REPORT_PARTNER
   SET report_company_state = 'accept'
 WHERE report_company_no = 24;


-- accept 시 로그를 남기는 트리거, 자세한 설명 추가 필요

-- 리뷰게시판

DELIMITER //

CREATE TRIGGER after_report_state_update_board
AFTER UPDATE ON REPORT_BOARD
FOR EACH ROW
BEGIN
    DECLARE v_user_no INT;
    DECLARE v_report_suspension_end DATETIME;

    -- Check if the report_review_status has been updated to 'accept'
    IF NEW.report_review_status = 'accept' THEN
        -- 게시글을 정지 상태로 변경
        UPDATE TRIP_REVIEW
           SET trip_review_status = 'ban'
         WHERE trip_review_no = NEW.trip_review_no
         LIMIT 1;
        
        -- 게시글 작성자를 정지 상태로 변경
        UPDATE USER_INFO
           SET user_account_state = 'ban'
         WHERE user_no = (SELECT TRIP_REVIEW.trip_review_user_no
                                     FROM REPORT_BOARD
                                     JOIN TRIP_REVIEW USING (trip_review_no)
                                    WHERE TRIP_REVIEW.trip_review_no = NEW.trip_review_no
                                    LIMIT 1);

        -- Get the user_no of the user who will be suspended
        SELECT ui.user_no
        INTO v_user_no
        FROM USER_INFO ui
        JOIN TRIP_REVIEW tr ON ui.user_no = tr.trip_review_user_no
        JOIN REPORT_BOARD rb USING (trip_review_no)
        WHERE rb.report_review_no = NEW.report_review_no
        LIMIT 1;

        -- Calculate the suspension end date
        SELECT DATE_ADD(NOW(), INTERVAL rr.report_suspension_day DAY)
        INTO v_report_suspension_end
        FROM REPORT_REASON rr
        WHERE rr.report_reason_code = NEW.report_reason_code
        LIMIT 1;

        -- Insert into REPORT_STATE
        INSERT INTO REPORT_STATE (
            user_no, 
            report_suspension_start, 
            report_suspension_end, 
            report_reason_code
        )
        VALUES (
            v_user_no,
            NOW(),
            v_report_suspension_end,
            NEW.report_reason_code
        );
    END IF;
END //

DELIMITER ;


-- 댓글

DELIMITER //

CREATE TRIGGER after_report_state_update_comment
AFTER UPDATE ON REPORT_COMMENT
FOR EACH ROW
BEGIN
    DECLARE v_user_no INT;
    DECLARE v_report_suspension_end DATETIME;

    -- Check if the report_comment_state has been updated to 'accept'
    IF NEW.report_comment_state = 'accept' THEN
        -- 댓글을 정지 상태로 변경
        UPDATE TRIP_REVIEW_COMMENT
           SET trip_review_comment_status = 'ban'
         WHERE trip_review_comment_no = NEW.trip_review_comment_no
         LIMIT 1;
        
        -- 댓글 작성자를 정지 상태로 변경
        UPDATE USER_INFO
           SET user_account_state = 'ban'
         WHERE user_no = (SELECT TRIP_REVIEW_COMMENT.trip_review_comment_user_no
                                     FROM REPORT_COMMENT
                                     JOIN TRIP_REVIEW_COMMENT USING (trip_review_comment_no)
                                    WHERE TRIP_REVIEW_COMMENT.trip_review_comment_no = NEW.trip_review_comment_no
                                    LIMIT 1);

        -- Get the user_no of the user who will be suspended
        SELECT ui.user_no
        INTO v_user_no
        FROM USER_INFO ui
        JOIN TRIP_REVIEW_COMMENT trc ON ui.user_no = trc.trip_review_comment_user_no
        JOIN REPORT_COMMENT rc USING (trip_review_comment_no)
        WHERE rc.report_comment_no = NEW.report_comment_no
        LIMIT 1;

        -- Calculate the suspension end date
        SELECT DATE_ADD(NOW(), INTERVAL rr.report_suspension_day DAY)
        INTO v_report_suspension_end
        FROM REPORT_REASON rr
        WHERE rr.report_reason_code = NEW.report_reason_code
        LIMIT 1;

        -- Insert into REPORT_STATE
        INSERT INTO REPORT_STATE (
            user_no, 
            report_suspension_start, 
            report_suspension_end, 
            report_reason_code
        )
        VALUES (
            v_user_no,
            NOW(),
            v_report_suspension_end,
            NEW.report_reason_code
        );
    END IF;
END //

DELIMITER ;


-- 코스

DELIMITER //

CREATE TRIGGER after_report_state_update_course
AFTER UPDATE ON REPORT_COURSE
FOR EACH ROW
BEGIN
    DECLARE v_user_no INT;
    DECLARE v_report_suspension_end DATETIME;

    -- Check if the report_course_state has been updated to 'accept'
    IF NEW.report_course_state = 'accept' THEN
        -- 코스를 정지 상태로 변경
        UPDATE TRIP_COURSE
           SET trip_course_state = 'ban'
         WHERE trip_course_no = NEW.trip_course_no
         LIMIT 1;
        
        -- 코스 작성자를 정지 상태로 변경
        UPDATE USER_INFO
           SET user_account_state = 'ban'
         WHERE user_no = (SELECT TRIP_COURSE.trip_course_user_no
                                     FROM REPORT_COURSE
                                     JOIN TRIP_COURSE USING (trip_course_no)
                                    WHERE TRIP_COURSE.trip_course_no = NEW.trip_course_no
                                    LIMIT 1);

        -- Get the user_no of the user who will be suspended
        SELECT ui.user_no
        INTO v_user_no
        FROM USER_INFO ui
        JOIN TRIP_COURSE tc ON ui.user_no = tc.trip_course_user_no
        JOIN REPORT_COURSE rc USING (trip_course_no)
        WHERE rc.report_course_no = NEW.report_course_no
        LIMIT 1;

        -- Calculate the suspension end date
        SELECT DATE_ADD(NOW(), INTERVAL rr.report_suspension_day DAY)
        INTO v_report_suspension_end
        FROM REPORT_REASON rr
        WHERE rr.report_reason_code = NEW.report_reason_code
        LIMIT 1;

        -- Insert into REPORT_STATE
        INSERT INTO REPORT_STATE (
            user_no, 
            report_suspension_start, 
            report_suspension_end, 
            report_reason_code
        )
        VALUES (
            v_user_no,
            NOW(),
            v_report_suspension_end,
            NEW.report_reason_code
        );
    END IF;
END //

DELIMITER ;


-- 동행

DELIMITER //

CREATE TRIGGER after_report_state_update_partner
AFTER UPDATE ON REPORT_PARTNER
FOR EACH ROW
BEGIN
    DECLARE v_user_no INT;
    DECLARE v_report_suspension_end DATETIME;

    -- Check if the report_company_state has been updated to 'accept'
    IF NEW.report_company_state = 'accept' THEN
        -- 동행을 정지 상태로 변경
        UPDATE TRIP_COMPANY
           SET trip_company_state = 'ban'
         WHERE trip_company_no = NEW.trip_company_no
         LIMIT 1;
        
        -- 동행 작성자를 정지 상태로 변경
        UPDATE USER_INFO
           SET user_account_state = 'ban'
         WHERE user_no = (SELECT TRIP_COMPANY.trip_company_user_no
                                     FROM REPORT_PARTNER
                                     JOIN TRIP_COMPANY USING (trip_company_no)
                                    WHERE TRIP_COMPANY.trip_company_no = NEW.trip_company_no
                                    LIMIT 1);

        -- Get the user_no of the user who will be suspended
        SELECT ui.user_no
        INTO v_user_no
        FROM USER_INFO ui
        JOIN TRIP_COMPANY tc ON ui.user_no = tc.trip_company_user_no
        JOIN REPORT_PARTNER rp USING (trip_company_no)
        WHERE rp.report_company_no = NEW.report_company_no
        LIMIT 1;

        -- Calculate the suspension end date
        SELECT DATE_ADD(NOW(), INTERVAL rr.report_suspension_day DAY)
        INTO v_report_suspension_end
        FROM REPORT_REASON rr
        WHERE rr.report_reason_code = NEW.report_reason_code
        LIMIT 1;

        -- Insert into REPORT_STATE
        INSERT INTO REPORT_STATE (
            user_no, 
            report_suspension_start, 
            report_suspension_end, 
            report_reason_code
        )
        VALUES (
            v_user_no,
            NOW(),
            v_report_suspension_end,
            NEW.report_reason_code
        );
    END IF;
END //

DELIMITER ;
