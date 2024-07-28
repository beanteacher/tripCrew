-- 여행코스 수정
-- 수정시간이 현재시간으로 변경됨
-- 상태를 비공개로 할지 공개로 할지  수정 가능, 가고 싶은 제목, 도시, 내용, 날짜, 시간들 변경 가능
START TRANSACTION;

UPDATE TRIP_COURSE
   SET trip_course_state       = 'active'
	 , trip_course_update_time = NOW()
	 , trip_course_title       = '유로 4강전 보러가기'
 WHERE trip_course_no          = 6
   AND trip_course_user_no     = 21; -- 6번 코스글이면서 사용자코드가 21일 때 변경됨
   
UPDATE TRIP_COURSE_CONTENT
   SET city_code                     = 11
	 , trip_detail_course_content    = '함부르크 스타디움'
	 , trip_detail_course_date       = '2024-07-13'
	 , trip_detail_course_start_time = '17:00:00'
	 , trip_detail_course_end_time   = '19:00:00'
 WHERE trip_course_no                = 6
   AND trip_course_content_no        = 24; -- 6번 코스글이면서 세부코스글 코드가 24일때

COMMIT;