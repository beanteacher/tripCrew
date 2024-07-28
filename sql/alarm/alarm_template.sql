-- 알림 템플릿 작성
INSERT INTO ALARM (
	alarm_title
	, alarm_template
	, alarm_writer
) VALUES (
	'여행 계획 수정 알림'
	,'안녕하세요,

동행하기로 한 여행 계획이 수정되었습니다. 아래는 수정된 계획의 내용입니다:

여행 제목: [여행 제목 입력]
수정된 사항: [계획이 수정된 내용 요약]
새로운 계획에 따라 추가적인 준비나 조치가 필요할 수 있습니다. 질문이나 추가 정보가 필요하시면 언제든지 연락 주세요.

감사합니다.'
	, 5
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