-- 사용자의 취향을 호출
SELECT
    a.user_name 사용자,
    c.taste 취향
	FROM USER_INFO a
	JOIN USER_TASTE b ON a.user_no = b.user_no 
	JOIN TASTE_LIST c ON b.taste_code = c.taste_code 
  WHERE a.user_name = '김철수';



-- 사용자의 취향을 저장
-- 사용자는 로그인 되어있는 사용자의 정보의 번호를  기능적으로 가져온다는 가정
-- 취향은 사용자가 선택한 취향들을 번호로  기능적으로 가져온다는 가정
-- 중복되는 데이터는 들어가지 않도록 처리함
INSERT
		INTO USER_TASTE 
		(user_no, taste_code) 
VALUES
(1, 2),
(1, 3),
(1, 5),
(1, 6);

-- 아래 셀렉트 문은 단순 DB 변경을 확인하기 위한 구문
SELECT
    a.user_name 사용자,
    c.taste 취향
	FROM USER_INFO a
	JOIN USER_TASTE b ON a.user_no = b.user_no 
	JOIN TASTE_LIST c ON b.taste_code = c.taste_code 
  WHERE a.user_no = 1;


	
-- 사용자 취향 삭제
DELETE 
		FROM USER_TASTE
	  WHERE user_no = 1;
	  
-- 아래 셀렉트 문은 단순 DB 변경을 확인하기 위한 구문
SELECT
    a.user_name 사용자,
    c.taste 취향
	FROM USER_INFO a
	JOIN USER_TASTE b ON a.user_no = b.user_no 
	JOIN TASTE_LIST c ON b.taste_code = c.taste_code 
  WHERE a.user_no = 1;



-- 사용자 취향 수정
DELETE 
		FROM USER_TASTE
	  WHERE user_no = 1;
	  
INSERT
		INTO USER_TASTE 
		(user_no, taste_code) 
VALUES
(1, 2),
(1, 3),
(1, 5),
(1, 6);

-- 아래 셀렉트 문은 단순 DB 변경을 확인하기 위한 구문
SELECT
    a.user_name 사용자,
    c.taste 취향
	FROM USER_INFO a
	JOIN USER_TASTE b ON a.user_no = b.user_no 
	JOIN TASTE_LIST c ON b.taste_code = c.taste_code 
  WHERE a.user_no = 1;
