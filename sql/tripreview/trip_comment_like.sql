-- [4] 여행후기 게시글 댓글 좋아요

-- 4-1> 사용자가 댓글에 좋아요를 등록한다
	INSERT
	  INTO TRIP_COMMENT_LIKE
	(trip_review_comment_no, trip_review_like_user_no)
	VALUES
	(22, 19);

-- 4-2> 사용자가 댓글에 등록한 좋아요를 삭제한다.
	DELETE 
	  FROM TRIP_COMMENT_LIKE
	 WHERE trip_review_comment_like_no = 7;