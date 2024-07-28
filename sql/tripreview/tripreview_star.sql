-- [2] 여행후기 게시글 별점

-- 2-1> 사용자가 여행 후기 게시글에 별점을 등록한다.

	INSERT
	  INTO TRIP_REVIEW_STAR
	(trip_review_no, trip_review_score, trip_review_score_user_no)
	VALUES
	(10, 4.0, 5);

-- 2-2> 사용자가 여행 후기 게시글에 별점을 수정한다.

	UPDATE TRIP_REVIEW_STAR
	   SET trip_review_score = 4.0
	     , trip_review_star_update_time = NOW()
	 WHERE trip_review_score_no = 10;

-- 2-3> 사용자가 여행 후기 게시글에 별점을 삭제한다.

	UPDATE TRIP_REVIEW_STAR
	   SET trip_review_star_status = 'delete'
	     , trip_review_star_delete_time = NOW()
	 WHERE trip_review_score_no = 10;
