-- 여행동행 모집 상태 설정
-- 참가된 인원 상관없이 모집자가 모집 상태를 설정한다.
UPDATE TRIP_COMPANY
   SET trip_company_state   = 'finished' -- (active, inactive, finished)
 WHERE trip_company_no      = 4
	AND trip_company_user_no = 13; -- 4번 모집글이면서 사용자코드가 13일 때