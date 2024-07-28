-- 여행모집요청자가 스스로 나가기
UPDATE TRIP_COMPANY_PARTICIPANT
	SET trip_company_participant_state   = 'quit'
 WHERE trip_company_no                  = 6
	AND (trip_company_participant_state  = 'wait' 
	 OR trip_company_participant_state   = 'accept')
	AND trip_company_participant_user_no = 26; 