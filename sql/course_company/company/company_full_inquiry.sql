-- 여행동행모집 목록 조회
-- 제목, 현재인원수, 최대 인원수, 모집자, 모집글등록시간
SELECT 
		com.trip_company_title AS '여행동행제목', 
		(SELECT COUNT(*) FROM TRIP_COMPANY_PARTICIPANT 
		  WHERE com.trip_company_no = trip_company_no 
			 AND com.trip_company_state = 'active'
			 AND trip_company_participant_state = 'accept') AS '현재 인원수',
		com.trip_company_max_people AS '최대 인원수', 
		info.user_nickname AS '여행동행 모집자', 
		com.trip_company_start_time AS '여행동행 모집등록시간'
FROM TRIP_COMPANY com
JOIN USER_INFO info ON com.trip_company_user_no = info.user_no
AND com.trip_company_title LIKE '%%'
WHERE com.trip_company_state = 'active';