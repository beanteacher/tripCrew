-- 비밀번호를 초기화(교체)한다
UPDATE USER_INFO
	SET user_pw = 123456
WHERE user_no = 31;

SELECT
		*
	FROM USER_INFO
WHERE user_no = 31;
