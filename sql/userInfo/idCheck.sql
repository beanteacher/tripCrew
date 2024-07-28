-- 로그인할때 디비에 정보 존재 유무 확인
PREPARE stmt FROM '
    SELECT user_no, user_name, user_id, user_pw, user_nickname
    FROM USER_INFO
    WHERE user_id = ? AND user_pw = ?;
';

SET @input_user_id = 'DBGOD';
SET @input_user_pw = '123456';


EXECUTE stmt USING @input_user_id, @input_user_pw;
DEALLOCATE PREPARE stmt;
