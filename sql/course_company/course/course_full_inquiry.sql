-- 여행코스 전체 조회 및 검색
-- 여행코스 전체 목록을 불러와서 본다. 그 때 간단한 정보가 같이 출력한다.
-- 제목, 등록 시간, 작성자
SELECT 
tc.trip_course_title AS '여행코스제목',
tc.trip_course_insert_time AS '등록시간',
ui.user_nickname AS '작성자'
FROM TRIP_COURSE tc
JOIN USER_INFO ui ON tc.trip_course_user_no = ui.user_no
WHERE tc.trip_course_state = 'active'
AND tc.trip_course_title LIKE '%파리%';