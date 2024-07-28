-- [1] 여행후기 게시글

-- 1-1> 사용자가 여행후기 게시글을 등록한다.
	INSERT
	  INTO TRIP_REVIEW
	(trip_review_title,
	trip_review_content,
	trip_review_user_no)
	VALUES
	('자연이 너무 아름다웠던 뉴질랜드',
	'학창시절 친구들과 함께 떠났던 뉴질랜드! 자연도 너무 아름다운데 즐길 수 있는 액티비티 종류도 많아요!! ',
	19
	);

-- 1-2> 사용자가 여행후기 게시글을 임시저장한다.
	INSERT
	  INTO TRIP_REVIEW
	(trip_review_title,
	trip_review_content,
	trip_review_user_no,
	trip_review_status)
	VALUES
	('커플 여행 추천지 - 하동',
	'여자친구와 떠난 하동~ 짚라인 꼭 타보세요! 완전 추천합니다 ',
	24,
	'save');

-- 1-3> 사용자가 여행후기 게시글을 수정한다.
	UPDATE TRIP_REVIEW
	   SET trip_review_title = '신혼여행 추천지 - 몰디브'
	     , trip_review_content = '몰디브 신혼여행 리조트 추천드립니다. 물고기와 함께 수영할 수 있는 액티비티도 강추! '
	     , trip_review_update_time = NOW()
	   WHERE trip_review_no = 4;
	   
	-- 1-4> 사용자가 여행후기 게시글을 삭제한다.
	UPDATE TRIP_REVIEW
	   SET trip_review_status = 'delete'
	     , trip_review_delete_time = NOW()
	 WHERE trip_review_no = 8;
	 
-- 1-5> 여행후기 게시판에서 등록된 상태의 여행후기 게시글을 조회한다
-- 한 페이지에 10개의 게시글 출력

	SET @ROWNUM = 0;
	
	SELECT 
		    @ROWNUM := @ROWNUM + 1 '연번'
	--     , A.trip_review_no '게시물 번호'
		  , A.trip_review_hits '조회수'
	     , A.trip_review_title '여행후기 게시글 제목'
	     , B.user_name '작성자'
	     , DATE(A.trip_review_insert_time) '작성일자'
	     , AVG(CASE 
		  				WHEN C.trip_review_star_status = 'active'
						THEN C.trip_review_score 
				   END) '평균별점'
	     , COUNT(CASE 
					 WHEN D.trip_review_comment_status = 'active' 
					 THEN 1 
					 END) '댓글 수'
	  FROM 
	    TRIP_REVIEW A
	  LEFT JOIN USER_INFO B ON A.trip_review_user_no = B.user_no
	  LEFT JOIN TRIP_REVIEW_STAR C ON A.trip_review_no = C.trip_review_no
	  LEFT JOIN TRIP_REVIEW_COMMENT D ON A.trip_review_no = D.trip_review_no
	 WHERE 
	    A.trip_review_status = 'active'
	 GROUP BY 
	    A.trip_review_no
	 LIMIT 10;
	 
 
-- 조회수가 높은 순서로 여행후기 게시판 조회
	SET @ROWNUM = 0;
	SELECT 
		    @ROWNUM := @ROWNUM + 1 '연번'
		  , hitsdesc.hits_count '조회수'
	     , hitsdesc.titile '여행후기 게시글 제목'
	     , hitsdesc.writer_name '작성자'
	     , hitsdesc.insertdate '작성일자'
	     , hitsdesc.averagestar '평균별점'
	     , hitsdesc.comment_num '댓글 수'
	FROM( 
		SELECT 
		    A.trip_review_no 'review_no'
		  , A.trip_review_hits 'hits_count'
	     , A.trip_review_title 'titile'
	     , B.user_name 'writer_name'
	     , DATE(A.trip_review_insert_time) 'insertdate'
	     , AVG(CASE 
		  				WHEN C.trip_review_star_status = 'active'
						THEN C.trip_review_score END) 'averagestar'
	     , COUNT(CASE 
					 WHEN D.trip_review_comment_status = 'active' 
					 THEN 1 END) 'comment_num'
	  FROM 
	    TRIP_REVIEW A
	  LEFT JOIN USER_INFO B ON A.trip_review_user_no = B.user_no
	  LEFT JOIN TRIP_REVIEW_STAR C ON A.trip_review_no = C.trip_review_no
	  LEFT JOIN TRIP_REVIEW_COMMENT D ON A.trip_review_no = D.trip_review_no
	 WHERE A.trip_review_status = 'active'
	 GROUP BY A.trip_review_no
	 ORDER BY A.trip_review_hits DESC
	 LIMIT 0,10) AS hitsdesc;

 
--  여행 후기 게시글 별점 및 별점부여자  조회
	SELECT
			B.trip_review_no '게시글 번호'
		 , B.trip_review_title '여행후기 게시글 제목'
		 , A.trip_review_score '게시글 별점' 
		 , C.user_name '별점부여자'
		FROM TRIP_REVIEW_STAR A
		JOIN TRIP_REVIEW B ON (A.trip_review_no = B.trip_review_no)
		JOIN USER_INFO C ON (A.trip_review_score_user_no = C.user_no)
		WHERE A.trip_review_no = 4;


-- 1-6> 사용자(관리자)가 특정 작성자의 여행후기 게시글을 조회한다.

	SELECT
		    A.trip_review_no '게시글 번호'
	     , A.trip_review_hits '조회수'
	     , A.trip_review_title '여행후기 게시글 제목'
	     , A.trip_review_content '여행후기 게시글 내용'
	     , B.user_name '작성자'
	     , DATE(A.trip_review_insert_time) '작성일자'
	     , AVG(CASE 
	            WHEN C.trip_review_star_status = 'active' 
	            THEN C.trip_review_score 
	        END) '평균별점'
	     , COUNT(CASE 
	            WHEN D.trip_review_comment_status = 'active' 
	            THEN 1 
	        END) '댓글 수'
	  FROM TRIP_REVIEW A
	  LEFT JOIN USER_INFO B ON A.trip_review_user_no = B.user_no
	  LEFT JOIN TRIP_REVIEW_STAR C ON A.trip_review_no = C.trip_review_no
	  LEFT JOIN TRIP_REVIEW_COMMENT D ON A.trip_review_no = D.trip_review_no
	 WHERE A.trip_review_no = 7
	  AND A.trip_review_status = 'active'
	 GROUP BY A.trip_review_no, A.trip_review_hits, A.trip_review_title, A.trip_review_content, B.user_name, A.trip_review_insert_time;


