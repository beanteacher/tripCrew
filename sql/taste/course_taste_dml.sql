-- 여행 코스 취향 호출
SELECT
    a.trip_course_title 여행코스,
    c.taste 취향
	FROM TRIP_COURSE a
	JOIN TRIP_COURSE_TASTE b ON a.trip_course_no = b.trip_course_no 
	JOIN TASTE_LIST c ON b.taste_code = c.taste_code 
  WHERE a.trip_course_title = '청량한 제주여행';
  
-- 여행 코스 취향 입력
INSERT
		INTO TRIP_COURSE_TASTE 
		(trip_course_no, taste_code) 
VALUES
(1, 4),
(1, 6),
(1, 7),
(1, 9);  
-- 단순 확인을 위한 쿼리문
SELECT
    a.trip_course_title 여행코스,
    c.taste 취향
	FROM TRIP_COURSE a
	JOIN TRIP_COURSE_TASTE b ON a.trip_course_no = b.trip_course_no 
	JOIN TASTE_LIST c ON b.taste_code = c.taste_code 
  WHERE a.trip_course_title = '청량한 제주여행';
  
  
  
  
-- 여행 코스 취향 삭제  
DELETE 
		FROM TRIP_COURSE_TASTE
	  WHERE trip_course_no = 1;
	  
-- 단순 확인을 위한 쿼리문 
SELECT
    a.trip_course_title 여행코스,
    c.taste 취향
	FROM TRIP_COURSE a
	JOIN TRIP_COURSE_TASTE b ON a.trip_course_no = b.trip_course_no 
	JOIN TASTE_LIST c ON b.taste_code = c.taste_code 
  WHERE a.trip_course_title = '청량한 제주여행';
  
  
  
  
  
-- 여행 코스 취향 수정
DELETE 
		FROM TRIP_COURSE_TASTE
	  WHERE trip_course_no = 1;
	  
INSERT
		INTO TRIP_COURSE_TASTE 
		(trip_course_no, taste_code) 
VALUES
(1, 4),
(1, 6),
(1, 7),
(1, 9);  

-- 단순 확인을 위한 쿼리문 
SELECT
    a.trip_course_title 여행코스,
    c.taste 취향
	FROM TRIP_COURSE a
	JOIN TRIP_COURSE_TASTE b ON a.trip_course_no = b.trip_course_no 
	JOIN TASTE_LIST c ON b.taste_code = c.taste_code 
  WHERE a.trip_course_title = '청량한 제주여행';
  