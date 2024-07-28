-- 최근 로그인 일자로부터 일정 날짜가 지나면 비밀번호 변경을 유도
SELECT user_no,user_name, user_recent_login_time
FROM USER_INFO
WHERE DATEDIFF(NOW(), user_recent_login_time) > 20;
-- 20일을 기준으로 해서 초과되는 목록만 출력될 수 있게 만들었음