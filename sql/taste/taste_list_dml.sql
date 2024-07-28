
-- 취향 리스트에 값 삽입
INSERT
	INTO TASTE_LIST
VALUES
(NULL, '자유'),
(NULL, '바다'),
(NULL, '산'),
(NULL, '사진'),
(NULL, '음식'),
(NULL, '패키지'),
(NULL, '액티비티'),
(NULL, '휴식'),
(NULL, '자연'),
(NULL, '쇼핑'),
(NULL, '가족');

-- 취향 리스트에 값 제거
DELETE 
	from TASTE_LIST
	WHERE taste = '가족';
	
-- 취향 리스트에 값 변경
UPDATE TASTE_LIST
SET taste = '놀이공원'
WHERE taste = '쇼핑';

