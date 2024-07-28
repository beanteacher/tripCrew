-- 여행코스 삭제
-- 상태를 삭제로 변경하고, 삭제시간을 기록
UPDATE TRIP_COURSE
   SET trip_course_state       = 'delete'
	 , trip_course_delete_time = NOW()
 WHERE trip_course_no          = 6
   AND trip_course_user_no     = 21; -- 6번 코스글이면서 사용자코드가 21일 때