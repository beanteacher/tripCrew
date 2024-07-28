-- 31번 유저의 계정을 비활성화
UPDATE USER_INFO
SET user_account_state = 'inactive', user_account_wi_time = NOW()
WHERE user_no =31;