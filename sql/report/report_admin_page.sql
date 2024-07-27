-- 신고를 관리하는 관리자 페이지
-- 각 유형의 신고를 통합한 VIEW로 데이터를 가져온다.
-- 상세내용 표출을 20자로 제한
CREATE OR REPLACE VIEW report_union_view AS
SELECT 
    'REPORT_BOARD' AS source_table,
    report_review_no AS report_no, 
    SUBSTRING(report_review_reason_detail, 1, 20) AS report_detail, 
    report_review_status AS report_status,
    report_review_time AS report_time
FROM 
    REPORT_BOARD
UNION ALL
SELECT 
    'REPORT_COMMENT' AS source_table,
    report_comment_no AS report_no, 
    SUBSTRING(report_comment_reason_detail, 1, 20) AS report_detail, 
    report_comment_state AS ,	
    report_comment_time AS report_time
FROM 
    REPORT_COMMENT
UNION ALL
SELECT 
    'REPORT_COURSE' AS source_table,
    report_course_no AS report_no, 
    SUBSTRING(report_course_reason_detail, 1, 20) AS report_detail, 
    report_course_state AS report_state,
    report_course_time AS report_time
FROM 
    REPORT_COURSE
UNION ALL
SELECT 
    'REPORT_PARTNER' AS source_table,
    report_company_no AS report_no, 
    SUBSTRING(report_company_reason_datail, 1, 20) AS report_detail, 
    report_company_state AS report_state,
    report_company_time AS report_time
FROM 
    REPORT_PARTNER
ORDER BY 
    report_time;

-- SELECT 문 추가


-- 관리자 페이지의 리스트를 클릭하면
-- report_union_view에서 source_table과 report_no를 받아와서 신고 상세 페이지를 연다.

-- 리뷰 게시판
SELECT 
      report_review_no AS 일련번호
    , trip_review_no AS 게시글번호
    , report_reason_title AS 신고카테고리
    , report_review_reason_detail AS 신고상세사유
    , USER_INFO.user_id AS 신고대상아이디
    , report_accept_user
    , report_review_status AS 처리상태
    , report_review_time AS 신고시간
    , report_review_end_time AS 처리시간
 FROM REPORT_BOARD
 JOIN USER_INFO ON REPORT_BOARD.report_user = USER_INFO.user_no
 JOIN REPORT_REASON USING (report_reason_code)
WHERE report_review_no = 1; -- 버튼으로 입력 받는 내용으로, 하드코딩 되어 있음

-- 댓글
SELECT 
      report_comment_no AS 일련번호
    , trip_review_comment_no AS 댓글번호
    , report_reason_title AS 신고카테고리
    , report_comment_reason_detail AS 신고상세사유
    , USER_INFO.user_id AS 신고대상아이디 -- comment_report_user
    , comment_report_accept_user
    , report_comment_state AS 처리상태
    , report_comment_time AS 신고시간
    , report_comment_end_time AS 처리시간
 FROM REPORT_COMMENT
 JOIN USER_INFO ON REPORT_COMMENT.comment_report_user = USER_INFO.user_no
 JOIN REPORT_REASON USING (report_reason_code)
WHERE report_comment_no = 6; -- 버튼으로 입력 받는 내용으로, 하드코딩 되어 있음

-- 여행 코스
SELECT 
      report_course_no AS 일련번호
    , trip_course_no AS 코스번호
    , report_reason_title AS 신고카테고리
    , report_course_reason_detail AS 신고상세사유
    , USER_INFO.user_id AS 신고대상아이디
    , course_report_accept_user
    , report_course_state AS 처리상태
    , report_course_time AS 신고시간
    , report_course_end_time AS 처리시간
 FROM REPORT_COURSE
 JOIN USER_INFO ON REPORT_COURSE.course_report_user = USER_INFO.user_no
 JOIN REPORT_REASON USING (report_reason_code)
WHERE report_course_no = 1; -- 버튼으로 입력 받는 내용으로, 하드코딩 되어 있음

-- 여행 동행
SELECT 
      report_company_no AS 일련번호
    , trip_company_no AS 동행번호
    , report_reason_title AS 신고카테고리
    , report_company_reason_datail AS 신고상세사유
    , USER_INFO.user_id AS 신고대상아이디
    , partner_report_accept_user
    , report_company_state AS 처리상태
    , report_company_time AS 신고시간
    , report_company_end_time AS 처리시간
 FROM REPORT_PARTNER
 JOIN USER_INFO ON REPORT_PARTNER.company_report_user = USER_INFO.user_no
 JOIN REPORT_REASON USING (report_reason_code)
WHERE report_company_no = 23; -- 버튼으로 입력 받는 내용으로, 하드코딩 되어 있음
