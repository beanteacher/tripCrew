-- 성별이 여성인 경우만 조회
SELECT * FROM USER_INFO
WHERE user_gender = 'F';


-- 유저 번호만 기억해서 조회
SELECT * FROM USER_INFO
WHERE user_no IN (31, 12, 21);