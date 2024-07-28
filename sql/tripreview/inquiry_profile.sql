-- [5] 프로필 조회

-- 5-1> 사용자(관리자)가 여행후기 게시글 작성자의 프로필을 조회한다.
	SELECT 	    
			 B.user_name '여행후기 게시글 작성자'
		  , B.user_nickname '닉네임'
	--	  , CONCAT_WS('-',SUBSTRING(B.user_phone_no,1,3),SUBSTRING(B.user_phone_no,4,4), SUBSTRING(B.user_phone_no,8,4)) '전화번호'
		  , (IF(B.user_gender_yn = 'N', '비공개', B.user_gender)) '성별'
		  , (IF(B.user_birth_yn = 'N', '비공개', B.user_birth)) '생년월일'
		  , CASE
		  			WHEN B.user_mbti IS NULL THEN 'mbti 미등록 회원'
		  			WHEN B.user_mbti_yn = 'N' THEN '비공개'
		  			ELSE B.user_mbti
		  			END 'MBTI'
		  , (IFNULL(B.user_self_intro, ' ')) '자기소개'
		FROM TRIP_REVIEW A
		JOIN USER_INFO B ON (A.trip_review_user_no = B.user_no)
	  WHERE A.trip_review_no = 8
	    AND B.user_account_wi_time IS NULL;



-- 5-2> 사용자(관리자)가 댓글 작성자의 프로필을 조회한다
	SELECT 
	    	 u.user_name '댓글 작성자명'
		  , u.user_nickname '닉네임'
	--     , CONCAT_WS('-',SUBSTRING(u.user_phone_no,1,3),SUBSTRING(u.user_phone_no,4,4), SUBSTRING(u.user_phone_no,8,4)) '댓글 작성자 휴대폰번호'
		  , (IF(u.user_gender_yn = 'N', '비공개', u.user_gender)) '성별'
		  , (IF(u.user_birth_yn = 'N', '비공개', u.user_birth)) '생년월일'
		  , CASE
		  			WHEN u.user_mbti IS NULL THEN 'mbti 미등록 회원'
		  			WHEN u.user_mbti_yn = 'N' THEN '비공개'
		  			ELSE u.user_mbti
		  			END 'mbti'
		  , (IFNULL(u.user_self_intro, ' ')) '자기소개'
	  FROM TRIP_REVIEW_COMMENT rc
	  JOIN USER_INFO u ON rc.trip_review_comment_user_no = u.user_no
	 WHERE rc.trip_review_comment_no = 19
	   AND u.user_account_wi_time IS NULL;