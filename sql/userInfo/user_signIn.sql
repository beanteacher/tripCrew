-- 회원가입시 아이디 중복 조회 후 없으면 가입 추가 진행 구문
START TRANSACTION;
INSERT INTO USER_INFO (
    user_name, user_id, user_pw, user_phone_no, user_nickname, user_gender,
    user_birth, user_manager_yn, user_account_state, user_account_wi_time, user_alarm_yn,
    user_mbti, user_gender_yn, user_mbti_yn, user_birth_yn, user_self_intro, user_insert_time, user_recent_login_time
)
SELECT
    '이빵빵', 'bangBang', '234567', '01012345678', '빵빵이', 'M', '19900101', 'N', 'active', NULL, 'Y',
    'ENFP', 'Y', 'Y', 'Y', '빵빵아', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (
    SELECT 1
    FROM USER_INFO
    WHERE user_id = 'bangBang'
);

COMMIT;

