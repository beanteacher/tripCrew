-- 여행모집자가 여행모집요청자를 참가신청을 관리
UPDATE TRIP_COMPANY_PARTICIPANT tcp
	SET trip_company_participant_state = 'deny' -- (deny, accept)
 WHERE tcp.trip_company_no                  = 5
 	AND tcp.trip_company_participant_user_no = 16
	AND EXISTS (SELECT 1 
			 		  FROM TRIP_COMPANY tc
					 WHERE tcp.trip_company_no   = tc.trip_company_no
 			  			AND tc.trip_company_state = 'active');