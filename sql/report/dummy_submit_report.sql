-- 게시판 신고
INSERT INTO REPORT_BOARD(
trip_review_no, -- 신고 대상 게시글
report_reason_code, -- 신고 사유 코드
report_review_reason_detail, -- 신고 내용
report_user, -- 신고자
report_accept_user, -- 신고 승인 관리자
report_review_end_time -- 신고 처리 시간
)
VALUES
(1, 5, '여행 후기에 선정적인 이미지가 다수 포함되어 있어 보기 불편합니다. 아이들도 볼 수 있는 사이트인 만큼 관리 부탁드리겠습니다.', 1, 5, NULL),
(1, 3, '말 끝 마다 욕설이 있어 보기 불편함', 2, 5, NULL),
(2, 4, '정치적인 글로 회원들을 선동하고 있습니다.', 3, 5, NULL),
(2, 1, '나는 행복합니다 나는 행복합니다 나는 행복합니다 정말정말 행복합니다.', 4, 5, NULL),
(2, 1, '이런 글 관리 안하고 뭐함?', 5, 5, NULL);


-- 댓글 신고
INSERT INTO REPORT_COMMENT(
trip_review_comment_no, -- 신고 대상 댓글
report_reason_code, -- 신고 사유 코드
report_comment_reason_detail, -- 신고 내용
comment_report_user, -- 신고자
comment_report_accept_user, -- 신고 승인 관리자
report_comment_end_time -- 신고 처리 시간
)
VALUES
(1, 1, '기분이 나쁩니다.', 1, 5, NULL),
(1, 5, '외부 링크로 음란물을 유포하고 있습니다.', 2, 5, NULL),
(2, 2, '댓글로 도배하고 있습니다.', 3, 5, NULL),
(2, 2, '엄청나게 많이 도배함', 4, 5, NULL),
(2, 6, '이건 진짜 악당이 아닐까?', 5, 5, NULL);


-- 코스 신고
INSERT INTO REPORT_COURSE(
trip_course_no, -- 신고 대상 코스
report_reason_code, -- 신고 사유 코드
report_course_reason_detail, -- 신고 내용
course_report_user, -- 신고자
course_report_accept_user, -- 신고 승인 관리자
report_course_end_time -- 신고 처리 시간
)
VALUES
(1, 5, '같이 여행하면 마치 납치를 당할 것 같은 기분이 듦', 1, 5, NULL),
(1, 1, '사유지를 침범하는 것으로 보입니다.', 2, 5, NULL),
(2, 1, '다수의 쇼핑몰을 경유하는 것으로 보아 금전적인 이득을 취하려는 업자로 보입니다.', 3, 5, NULL),
(2, 3, '글을 보니 여행을 다니며 욕배틀 능력을 단련할 수 있을 것으로 보임', 4, 5, NULL),
(2, 4, '북한은 정상적인 방법으로 갈 수 없지 않나요?', 5, 5, NULL);


-- 동행 신고
INSERT INTO REPORT_PARTNER(
trip_company_no, -- 신고 대상 동행
report_reason_code, -- 신고 사유 코드
report_company_reason_datail, -- 신고 내용
company_report_user, -- 신고자
partner_report_accept_user, -- 신고 승인 관리자
report_company_end_time -- 신고 처리 시간
)
VALUES
(1, 3 '잦은 욕설', 1, 5, NULL),
(1, 5, '불순한 의도로 보입니다.', 2, 5, NULL),
(2, 3, '욕을 너무 많이 써 놨어요.', 3, 5, NULL),
(2, 1, '이유 없이 저를 추방했어요.', 4, 5, NULL),
(2, 1, '아몰랑', 5, 5, NULL);
