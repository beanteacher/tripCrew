-- 신고를 확인한 후에 버튼으로 상호작용
-- WHERE 절에서 신고당한 게시글을 특정하는데, 버튼에 의한 상호작용으로 하드코딩됨

-- 신고 승인
UPDATE REPORT_BOARD SET report_review_status = 'accept' WHERE report_review_no = 1;
UPDATE REPORT_COMMENT SET report_comment_state = 'accept' WHERE report_comment_no = 2;
UPDATE REPORT_PARTNER SET report_company_state = 'accept' WHERE report_company_no = 3;
UPDATE REPORT_COURSE SET report_course_state = 'accept' WHERE report_course_no = 4;

-- 신고 거부
UPDATE REPORT_BOARD SET report_review_status = 'reject' WHERE report_review_no = 1;
UPDATE REPORT_COMMENT SET report_comment_state = 'reject' WHERE report_comment_no = 2;
UPDATE REPORT_PARTNER SET report_company_state = 'reject' WHERE report_company_no = 3;
UPDATE REPORT_COURSE SET report_course_state = 'reject' WHERE report_course_no = 4;

-- 트리거로 게시글 및 회원 정보 수정 필요
