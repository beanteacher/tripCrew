-- 31번 유저 이름을 매니저 유무 교체
UPDATE USER_INFO
SET 
    user_manager_yn = 'N',
    user_recent_login_time = NOW()
WHERE 
    user_no = 31;