-- 여행동행모집 삭제
-- 상태를 delete로 바꿈, 삭제시간을 기록
UPDATE TRIP_COMPANY
   SET trip_company_state       = 'delete' 
	 , trip_company_delete_time = NOW()
 WHERE trip_company_no           = 5
   AND trip_company_user_no     = 14; -- 5번 모집글이면서 사용자코드가 14일 때