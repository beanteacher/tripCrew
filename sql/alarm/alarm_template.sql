-- 알림 템플릿 작성
INSERT INTO ALARM (
alarm_title
, alarm_template
, alarm_writer ) VALUES (
'알림 제목'
, '알림 템플릿 내용'
, 5 --작성자
);


-- 알림 템플릿 수정
UPDATE ALARM 
SET alarm_title = '알림 제목 수정'
	, alarm_template = '알림 템플릿 내용 수정'
	, alarm_update_time = NOW()
WHERE alarm_writer = 5
AND alarm_del_yn = 'N';

-- 알림 템플릿 삭제
UPDATE ALARM
SET alarm_del_yn = 'Y'
WHERE alarm_writer = 5
AND alarm_del_yn = 'N';