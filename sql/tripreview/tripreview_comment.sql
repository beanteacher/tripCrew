-- [3] 여행후기 게시글 댓글

-- 3-1> 사용자가 여행후기 게시글에 댓글을 등록한다.
	INSERT
	  INTO TRIP_REVIEW_COMMENT
	(trip_review_no, trip_review_comment_user_no, trip_review_comment_content)
	VALUES
	(4, 39, '같이 찍으신 사진 너무 이뻐요' );


-- 3-2> 사용자가 여행후기 게시글에 등록한 댓글을 수정한다.
	UPDATE TRIP_REVIEW_COMMENT
	   SET trip_review_comment_content = '자세히 물어보고 싶은게 있는데 연락드려도 될까요?'
	     , trip_review_comment_update_time = NOW()
	 WHERE trip_review_comment_no = 9;
	
	UPDATE TRIP_REVIEW_COMMENT
	   SET trip_review_comment_content = '정보 감사합니다!'
	     , trip_review_comment_update_time = NOW()
	 WHERE trip_review_comment_no = 10;


-- 3-3> 사용자가 여행후기 게시글에 등록한 댓글을 삭제한다.
	UPDATE TRIP_REVIEW_COMMENT
	   SET trip_review_comment_status = 'delete'
		  , trip_review_comment_delete_time = NOW()
	 WHERE trip_review_comment_no = 10;
	

-- 3-4> 사용자(관리자)가 여행 후기 게시글에 등록된 댓글을 조회한다.

	SELECT 
		    B.trip_review_title '여행후기 게시글 제목'
		  , A.trip_review_comment_content '여행후기 게시글 댓글'
		  , C.user_name '댓글 작성자'
		  , A.trip_review_comment_insert_time '댓글 작성시간'
		  , COUNT(D.trip_review_comment_no) '댓글 좋아요 수'
	  FROM TRIP_REVIEW_COMMENT A
	  LEFT JOIN TRIP_REVIEW B ON (A.trip_review_no = B.trip_review_no)
	  LEFT JOIN USER_INFO C ON (A.trip_review_comment_user_no = C.user_no)
	  LEFT JOIN TRIP_COMMENT_LIKE D ON (A.trip_review_comment_no = D.trip_review_comment_no)
	  WHERE B.trip_review_status = 'active'
	    AND B.trip_review_no = 4
	    AND A.trip_review_comment_status = 'active'
		 GROUP BY 
			 B.trip_review_title
		  , A.trip_review_comment_content
        , C.user_name
        , A.trip_review_comment_insert_time;
	    
  