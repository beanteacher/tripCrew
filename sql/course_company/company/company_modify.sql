-- 여행동행모집 수정
-- 수정시간이 현재시간으로 변경됨 
-- 제목, 코스, 내용, 최대인원수  변경 가능
UPDATE TRIP_COMPANY
	SET trip_company_title       = '유로 대회 보러가자'
     , trip_course_no           = 6
     , trip_company_content     = '축구 경기장 가실분 구합니다'
     , trip_company_max_people  = 5
     , trip_company_update_time = NOW()
 WHERE trip_company_no          = 6
   AND trip_company_user_no     = 21; -- 6번 모집글이면서 사용자코드가 21일 때