CREATE TABLE ALARM
(
    alarm_no    INT NOT NULL AUTO_INCREMENT COMMENT '알림번호',
    alarm_template    VARCHAR(4000) NOT NULL COMMENT '알림템플릿',
    alarm_writer    INT NOT NULL COMMENT '알림작성자',
 PRIMARY KEY ( alarm_no )
) COMMENT = '알림';


CREATE TABLE ALARM_SEND_LOG
(
    alarm_send_no    INT NOT NULL AUTO_INCREMENT
 COMMENT '알림발송번호',
    alarm_no    INT NOT NULL COMMENT '알림번호',
    alarm_send_type    CHAR(1) NOT NULL COMMENT '알림발송형식',
    alarm_send_date    DATETIME DEFAULT NOW() NOT NULL COMMENT '알림발송시간',
    alarm_receiver    INT NOT NULL COMMENT '알림수신자',
    alarm_read_yn    CHAR(1) DEFAULT 'N' NOT NULL COMMENT '알림읽음여부',
    alarm_send_yn    CHAR(1) DEFAULT 'N' NOT NULL COMMENT '알림발송성공여부',
 PRIMARY KEY ( alarm_send_no )
) COMMENT = '알림발송기록';


CREATE TABLE CITY
(
    city_code    INT NOT NULL AUTO_INCREMENT
 COMMENT '도시코드',
    city_name    VARCHAR(50) NOT NULL COMMENT '도시명',
    country_code    INT NOT NULL COMMENT '나라코드',
 PRIMARY KEY ( city_code )
) COMMENT = '도시';


CREATE TABLE COMPANY_PARTICIPANT
(
    trip_company_participant_no    INT NOT NULL AUTO_INCREMENT
 COMMENT '여행동행참가번호',
 	 trip_company_no    INT NOT NULL COMMENT '여행동행번호',
    trip_company_participant_user_no    INT NOT NULL COMMENT '여행동행참가자',
    trip_company_participant_yn    VARCHAR(10) DEFAULT 'wait' NOT NULL COMMENT '여행동행수락여부',
 PRIMARY KEY ( trip_company_participant_no )
) COMMENT = '여행동행참가자';


CREATE TABLE COUNTRY
(
    country_code    INT NOT NULL AUTO_INCREMENT
 COMMENT '나라코드',
    country_name    VARCHAR(50) NOT NULL COMMENT '나라명',
 PRIMARY KEY ( country_code )
) COMMENT = '나라';


CREATE TABLE REPORT_BOARD
(
    report_review_no    INT NOT NULL AUTO_INCREMENT
 COMMENT '게시글신고번호',
    trip_review_no    INT NOT NULL COMMENT '게시글번호',
    report_reason_code    INT NOT NULL COMMENT '게시판신고사유코드',
    report_review_reason_detail    VARCHAR(255) COMMENT '게시글신고상세사유',
    report_user    INT NOT NULL COMMENT '게시글신고자',
    report_accept_user    INT NOT NULL COMMENT '게시글신고승인관리자',
    report_review_status    VARCHAR(10) DEFAULT 'wait' NOT NULL COMMENT '게시글신고처리여부',
    report_review_time    DATETIME DEFAULT NOW() NOT NULL COMMENT '게시글신고시간',
    report_review_end_time    DATETIME COMMENT '게시글신고처리시간',
 PRIMARY KEY ( report_review_no )
) COMMENT = '게시판신고';


CREATE TABLE REPORT_COMMENT
(
    report_comment_no    INT NOT NULL AUTO_INCREMENT
 COMMENT '댓글신고번호',
    trip_review_comment_no    INT NOT NULL COMMENT '댓글번호',
    report_reason_code    INT NOT NULL COMMENT '댓글신고사유코드',
    report_comment_reason_detail    VARCHAR(255) COMMENT '댓글신고상세사유',
    comment_report_user    INT NOT NULL COMMENT '댓글신고자',
    comment_report_accept_user    INT NOT NULL COMMENT '댓글신고승인관리자',
    report_comment_state    VARCHAR(10) DEFAULT 'wait' NOT NULL COMMENT '댓글신고처리여부',
    report_comment_time    DATETIME DEFAULT NOW() NOT NULL COMMENT '댓글신고시간',
    report_comment_end_time    DATETIME COMMENT '댓글신고처리시간',
 PRIMARY KEY ( report_comment_no )
) COMMENT = '댓글신고';


CREATE TABLE REPORT_COURSE
(
    report_course_no    INT NOT NULL AUTO_INCREMENT
 COMMENT '여행코스신고번호',
    trip_course_no    INT NOT NULL COMMENT '여행코스번호',
    report_reason_code    INT NOT NULL COMMENT '여행코스신고사유코드',
    report_course_reason_detail    VARCHAR(255) COMMENT '여행코스신고상세사유',
    course_report_user    INT NOT NULL COMMENT '여행코스신고자',
    course_report_accept_user    INT NOT NULL COMMENT '여행코스신고승인관리자',
    report_course_state    VARCHAR(10) DEFAULT 'wait' NOT NULL COMMENT '여행코스신고처리여부',
    report_course_time    DATETIME DEFAULT NOW() NOT NULL COMMENT '여행코스신고시간',
    report_course_end_time    DATETIME COMMENT '여행코스신고처리시간',
 PRIMARY KEY ( report_course_no )
) COMMENT = '여행코스신고';


CREATE TABLE REPORT_PARTNER
(
    report_company_no    INT NOT NULL AUTO_INCREMENT
 COMMENT '여행동행신고번호',
    trip_company_no    INT NOT NULL COMMENT '여행동행번호',
    report_reason_code    INT NOT NULL COMMENT '여행동행신고사유코드',
    report_company_reason_datail    VARCHAR(255) COMMENT '여행동행신고상세사유',
    company_report_user    INT NOT NULL COMMENT '여행동행신고자',
    partner_report_accept_user    INT NOT NULL COMMENT '여행동행신고승인관리자',
    report_company_state    VARCHAR(10) DEFAULT 'wait' NOT NULL COMMENT '여행동행신고처리여부',
    report_company_time    DATETIME DEFAULT NOW() NOT NULL COMMENT '여행동행신고시간',
    report_company_end_time    DATETIME COMMENT '여행동행신고처리시간',
 PRIMARY KEY ( report_company_no )
) COMMENT = '여행동행신고';


CREATE TABLE REPORT_REASON
(
    report_reason_code    INT NOT NULL AUTO_INCREMENT
 COMMENT '계정신고사유코드',
    report_reason_title    VARCHAR(255) NOT NULL COMMENT '계정신고사유명',
    report_suspension_day    INT NOT NULL COMMENT '계정정지일수',
 PRIMARY KEY ( report_reason_code )
) COMMENT = '계정신고사유';


CREATE TABLE REPORT_STATE
(
    report_state_no    INT NOT NULL AUTO_INCREMENT
 COMMENT '계정상태이력번호',
    user_no    INT NOT NULL COMMENT '사용자번호',
    report_suspension_start    DATETIME NOT NULL COMMENT '계정정지시작일자',
    report_suspension_end    DATETIME NOT NULL COMMENT '계정정지종료일자',
    report_reason_code    INT NOT NULL COMMENT '계정정지사유코드',
 PRIMARY KEY ( report_state_no )
) COMMENT = '계정정지이력';


CREATE TABLE TASTE_LIST
(
    taste_code    INT NOT NULL AUTO_INCREMENT
 COMMENT '취향코드',
    taste    CHAR(20) NOT NULL COMMENT '취향',
 PRIMARY KEY ( taste_code )
) COMMENT = '취향리스트';


CREATE TABLE TRIP_COMMENT_LIKE
(
    trip_review_comment_like_no    INT NOT NULL AUTO_INCREMENT
 COMMENT '좋아요번호',
    trip_review_comment_no    INT NOT NULL COMMENT '댓글번호',
    trip_review_like_user_no    INT NOT NULL COMMENT '좋아요누른유저',
 PRIMARY KEY ( trip_review_comment_like_no )
) COMMENT = '댓글좋아요';


CREATE TABLE TRIP_COMPANY
(
    trip_company_no    INT NOT NULL AUTO_INCREMENT
 COMMENT '여행동행번호',
    trip_company_user_no    INT NOT NULL COMMENT '여행동행작성자',
    trip_company_state    VARCHAR(10) DEFAULT 'active' NOT NULL COMMENT '여행동행모집상황',
    trip_company_title    VARCHAR(50) NOT NULL COMMENT '여행동행제목',
    trip_course_no    INT NOT NULL COMMENT '여행코스번호',
    trip_company_content    VARCHAR(4000) NOT NULL COMMENT '여행동행내용',
    trip_company_max_people    INT NOT NULL COMMENT '여행동행최대인원수',
    trip_company_start_time    DATETIME DEFAULT NOW() NOT NULL COMMENT '여행동행등록시간',
    trip_company_update_time    DATETIME COMMENT '여행동행수정시간',
    trip_company_delete_time    DATETIME COMMENT '여행동행삭제시간',
 PRIMARY KEY ( trip_company_no )
) COMMENT = '여행동행';


CREATE TABLE TRIP_COURSE
(
    trip_course_no    INT NOT NULL AUTO_INCREMENT
 COMMENT '여행코스번호',
    trip_course_user_no    INT NOT NULL COMMENT '여행코스작성자',
    trip_course_state    VARCHAR(10) DEFAULT 'active' NOT NULL COMMENT '여행코스상태',
    trip_course_insert_time    DATETIME DEFAULT NOW() NOT NULL COMMENT '여행코스등록시간',
    trip_course_update_time    DATETIME COMMENT '여행코스수정시간',
    trip_course_delete_time    DATETIME COMMENT '여행코스삭제시간',
 PRIMARY KEY ( trip_course_no )
) COMMENT = '여행코스';


CREATE TABLE TRIP_COURSE_CONTENT
(
    trip_course_content_no    INT NOT NULL AUTO_INCREMENT
 COMMENT '여행코스세부내용코드',
    trip_course_no    INT NOT NULL COMMENT '여행코스번호',
    city_code    INT NOT NULL COMMENT '도시코드',
    trip_detail_course_date    DATE NOT NULL COMMENT '세부코스날짜',
    trip_detail_course_start_time    DATETIME COMMENT '세부코스시작시간',
    trip_detail_course_content    VARCHAR(4000) COMMENT '세부코스내용',
    trip_detail_course_end_time    DATETIME COMMENT '세부코스종료시간',
 PRIMARY KEY ( trip_course_content_no )
) COMMENT = '여행코스내용';


CREATE TABLE TRIP_COURSE_TASTE
(
    trip_course_taste_no    INT NOT NULL AUTO_INCREMENT
 COMMENT '여행코스취향번호',
    trip_course_no    INT NOT NULL COMMENT '여행코스번호',
    taste_code    INT NOT NULL COMMENT '취향코드',
 PRIMARY KEY ( trip_course_taste_no )
) COMMENT = '여행코스취향';


CREATE TABLE TRIP_REVIEW
(
    trip_review_no    INT NOT NULL AUTO_INCREMENT
 COMMENT '게시글번호',
    trip_review_title    VARCHAR(255) NOT NULL COMMENT '게시글제목',
    trip_review_content    VARCHAR(4000) NOT NULL COMMENT '게시글내용',
    trip_review_user_no    INT NOT NULL COMMENT '게시글작성자',
    trip_review_status    VARCHAR(20) DEFAULT 'active' NOT NULL COMMENT '게시글상태',
    trip_review_insert_time    DATETIME DEFAULT NOW() NOT NULL COMMENT '게시글등록시간',
    trip_review_hits    INT DEFAULT 0 NOT NULL COMMENT '게시글조회수',
    trip_review_update_time    DATETIME COMMENT '게시글수정시간',
    trip_review_delete_time    DATETIME COMMENT '게시글삭제시간',
 PRIMARY KEY ( trip_review_no )
) COMMENT = '여행후기게시판';


CREATE TABLE TRIP_REVIEW_COMMENT
(
    trip_review_comment_no    INT NOT NULL AUTO_INCREMENT
 COMMENT '댓글번호',
    trip_review_no    INT NOT NULL COMMENT '게시글번호',
    trip_review_comment_user_no    INT NOT NULL COMMENT '댓글입력자',
    trip_review_comment_content    VARCHAR(255) NOT NULL COMMENT '댓글내용',
    trip_review_comment_insert_time    DATETIME DEFAULT NOW() NOT NULL COMMENT '댓글입력시간',
    trip_review_comment_status    VARCHAR(20) DEFAULT 'active' NOT NULL COMMENT '댓글상태',
    trip_review_comment_update_time    DATETIME COMMENT '댓글수정시간',
    trip_review_comment_delete_time    DATETIME COMMENT '댓글삭제시간',
 PRIMARY KEY ( trip_review_comment_no )
) COMMENT = '게시판댓글';


CREATE TABLE TRIP_REVIEW_STAR
(
    trip_review_score_no    INT NOT NULL AUTO_INCREMENT
 COMMENT '별점번호',
    trip_review_no    INT NOT NULL COMMENT '게시글번호',
    trip_review_score    INT NOT NULL COMMENT '별점',
    trip_review_score_user_no    INT NOT NULL COMMENT '별점입력자',
    trip_review_star_status    VARCHAR(10) DEFAULT 'active' NOT NULL COMMENT '별점상태',
    trip_review_star_update_time    DATETIME COMMENT '별점수정시간',
    trip_review_star_delete_time    DATETIME COMMENT '별점삭제시간',
 PRIMARY KEY ( trip_review_score_no )
) COMMENT = '게시판별점';


CREATE TABLE TRIP_REVIEW_TASTE
(
    trip_review_taste_no    INT NOT NULL AUTO_INCREMENT
 COMMENT '게시글취향번호',
    trip_review_no    INT NOT NULL COMMENT '게시글번호',
    taste_code    INT NOT NULL COMMENT '취향코드',
 PRIMARY KEY ( trip_review_taste_no )
) COMMENT = '여행후기게시글취향';


CREATE TABLE USER_INFO
(
    user_no    INT NOT NULL AUTO_INCREMENT
 COMMENT '사용자번호',
    user_name    VARCHAR(20) NOT NULL COMMENT '이름',
    user_id    VARCHAR(20) NOT NULL COMMENT 'ID',
    user_pw    INT NOT NULL COMMENT '비밀번호',
    user_phone_no    INT NOT NULL COMMENT '전화번호',
    user_nickname    VARCHAR(255) NOT NULL COMMENT '닉네임',
    user_gender    CHAR(255) NOT NULL COMMENT '성별',
    user_birth    INT NOT NULL COMMENT '생년월일',
    user_manager_yn    CHAR(1) DEFAULT 'N' NOT NULL COMMENT '관리자여부',
    user_account_state    VARCHAR(10) DEFAULT 'active' NOT NULL COMMENT '계정상태',
    user_account_wi_time    DATETIME COMMENT '계정탈퇴일자',
    user_alarm_yn    CHAR(1) DEFAULT 'N' NOT NULL COMMENT '알림수신여부',
    user_mbti    VARCHAR(10) COMMENT 'MBTI',
    user_gender_yn    CHAR(1) DEFAULT 'N' NOT NULL COMMENT '성별공개여부',
    user_mbti_yn    CHAR(1) DEFAULT 'N' NOT NULL COMMENT 'MBTI공개여부',
    user_birth_yn    CHAR(1) DEFAULT 'N' NOT NULL COMMENT '생년월일공개여부',
    user_self_intro    VARCHAR(255) COMMENT '자기소개',
    user_insert_time    DATETIME DEFAULT NOW() NOT NULL COMMENT '계정생성일자',
    user_recent_login_time    DATETIME COMMENT '최근로그인일자',
 PRIMARY KEY ( user_no )
) COMMENT = '사용자정보';


CREATE TABLE USER_TASTE
(
    user_taste_no INT NOT NULL AUTO_INCREMENT
 COMMENT '사용자취향번호',
    user_no    INT NOT NULL COMMENT '사용자번호',
    taste_code    INT NOT NULL COMMENT '취향코드',
 PRIMARY KEY ( user_taste_no )
) COMMENT = '사용자취향';