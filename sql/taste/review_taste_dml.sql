-- 게시글 취향 호출
SELECT
    a.trip_review_title 게시글,
    c.taste 취향
	FROM TRIP_REVIEW a
	JOIN TRIP_REVIEW_TASTE b ON a.trip_review_no = b.trip_review_no 
	JOIN TASTE_LIST c ON b.taste_code = c.taste_code 
  WHERE a.trip_review_title = '제주도 3박4일 여행 후기 & 꿀팁 방출';





-- 게시글의 취향을 저장
INSERT
		INTO TRIP_REVIEW_TASTE 
		(trip_review_no, taste_code) 
VALUES
(1, 2),
(1, 3),
(1, 5),
(1, 6);

-- 단순 확인을 위한 쿼리문
SELECT
    a.trip_review_title 게시글,
    c.taste 취향
	FROM TRIP_REVIEW a
	JOIN TRIP_REVIEW_TASTE b ON a.trip_review_no = b.trip_review_no 
	JOIN TASTE_LIST c ON b.taste_code = c.taste_code 
  WHERE a.trip_review_title = '제주도 3박4일 여행 후기 & 꿀팁 방출';



	
-- 게시글 취향 삭제
DELETE 
		FROM TRIP_REVIEW_TASTE
	  WHERE trip_review_no = 1;
	  
-- 단순 확인을 위한 쿼리문
SELECT
    a.trip_review_title 게시글,
    c.taste 취향
	FROM TRIP_REVIEW a
	JOIN TRIP_REVIEW_TASTE b ON a.trip_review_no = b.trip_review_no 
	JOIN TASTE_LIST c ON b.taste_code = c.taste_code 
  WHERE a.trip_review_title = '제주도 3박4일 여행 후기 & 꿀팁 방출';

	  
	  
	  
-- 게시글 취향 수정
DELETE 
		FROM TRIP_REVIEW_TASTE
	  WHERE trip_review_no = 1;
	  
INSERT
		INTO TRIP_REVIEW_TASTE 
		(trip_review_no, taste_code) 
VALUES
(1, 2),
(1, 3),
(1, 5),
(1, 6);

-- 단순 확인을 위한 쿼리문
SELECT
    a.trip_review_title 게시글,
    c.taste 취향
	FROM TRIP_REVIEW a
	JOIN TRIP_REVIEW_TASTE b ON a.trip_review_no = b.trip_review_no 
	JOIN TASTE_LIST c ON b.taste_code = c.taste_code 
  WHERE a.trip_review_title = '제주도 3박4일 여행 후기 & 꿀팁 방출';
