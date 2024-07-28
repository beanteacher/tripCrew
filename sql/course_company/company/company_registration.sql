-- 여행동행모집 등록
-- 한 사용자가 자신의 여행코스를 선택한 뒤, 등록 버튼을 클릭하면 현재 시간에 맞춰 여행동행모집 등록
-- 여행동행모집을 등록할 때 제목, 코스, 내용, 최대인원수를 설정해야 한다. 
INSERT INTO TRIP_COMPANY (
    trip_company_no,
    trip_company_user_no,
    trip_company_state,
    trip_company_title,
    trip_course_no,
    trip_company_content,
    trip_company_max_people,
    trip_company_start_time
) VALUES
(6, 21, 'active', '유로2024', 6, '축구 관람', 4, NOW());