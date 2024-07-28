-- 여행코스의 상세 내용 조회
-- 하나의 여행 코스의 상세 정보를 출력한다.
-- 제목, 등록 시간, 나라, 날짜, 시작시간, 종료시간, 내용
SELECT 
tc.trip_course_title AS '여행코스제목', 
co.country_name AS '나라', 
tc.trip_course_insert_time AS '등록시간',
tcc.trip_detail_course_date AS '코스날짜', 
tcc.trip_detail_course_start_time AS '코스시작시간', 
tcc.trip_detail_course_end_time AS '코스종료시간', 
tcc.trip_detail_course_content AS '코스상세내용',
ui.user_nickname AS '작성자'
FROM TRIP_COURSE tc
JOIN TRIP_COURSE_CONTENT tcc ON tc.trip_course_no = tcc.trip_course_no
JOIN CITY ci ON tcc.city_code = ci.city_code
JOIN COUNTRY co ON ci.country_code = co.country_code
JOIN USER_INFO ui ON tc.trip_course_user_no = ui.user_no
WHERE tc.trip_course_no = 6 -- 6번 코스글을 선택