-- 여행코스 등록
-- 한 사용자가 등록을 할 때 공개여부를 결정하고, 등록 버튼을 클릭하면 현재 시간에 맞춰 여행코스가 등록된다.
-- 여행코스를 등록 할 때 반드시 도시를 선택해야 하고, 내용은 자유, 날짜는 설정해야 한다. 시작시간과 종료시간은 자유로 설정
START TRANSACTION;

INSERT INTO TRIP_COURSE
			(trip_course_user_no, trip_course_state, trip_course_title, trip_course_insert_time)
	  VALUES 
			(21, 'inactive','유로 대회 구경 여행', NOW());

INSERT INTO TRIP_COURSE_CONTENT
			(trip_course_no, city_code, trip_detail_course_date, 
			trip_detail_course_start_time, trip_detail_course_content, trip_detail_course_end_time)
	  VALUES 
			(6, 6, '2024-07-11', '19:00:00', '베를린 스타디움', '21:00:00'),
			(6, 10, '2024-07-12' , '18:00:00', '뮌휀 스타디움' , '20:00:00');

COMMIT;
