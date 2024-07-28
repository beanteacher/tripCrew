-- 여행모집자가 여행모집요청자를 강퇴
UPDATE TRIP_COMPANY_PARTICIPANT 
SET trip_company_participant_state     = 'ban' 
WHERE trip_company_no                  = 6
  AND trip_company_participant_user_no = 27
  AND trip_company_participant_state   = 'accept';