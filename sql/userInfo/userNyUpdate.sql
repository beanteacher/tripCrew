-- mbti , 성별, 자기소개 등 yn을 할 수 있는 것을 서로 바꾼다
UPDATE USER_INFO
SET user_gender_yn = 'N', user_mbti_yn = 'N', user_birth_yn = 'N'
WHERE user_no = 31;