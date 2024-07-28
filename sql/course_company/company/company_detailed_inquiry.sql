-- 여행동행모집 상세 조회
-- 제목, 나라, 도시, 현재인원수, 최대 인원수, 모집자, 모집글등록시간, 상세 내용,
SELECT DISTINCT
		com.trip_company_title AS '여행동행제목', 
		coun.country_name AS '나라',
		ci.city_name AS '도시',
		(SELECT COUNT(*) 
			FROM TRIP_COMPANY_PARTICIPANT 
		  WHERE com.trip_company_no = trip_company_no 
			 AND com.trip_company_state = 'active'
			 AND trip_company_participant_state = 'accept') AS '현재 인원수',
		com.trip_company_max_people AS '최대 인원수', 
		info.user_nickname AS '여행동행 모집자', 
		com.trip_company_start_time AS '여행동행 모집등록시간',
		com.trip_company_content AS '여행동행 모집내용'
FROM TRIP_COMPANY com
JOIN USER_INFO info ON com.trip_company_user_no = info.user_no
JOIN TRIP_COURSE course ON com.trip_course_no = course.trip_course_no
JOIN TRIP_COURSE_CONTENT content ON course.trip_course_no = content.trip_course_no
JOIN CITY ci ON content.city_code = ci.city_code
JOIN COUNTRY coun ON ci.country_code = coun.country_code
WHERE com.trip_company_state = 'active';	