-- 그룹별 조건에 맞는 식당 목록 출력하기
SELECT 
    P.MEMBER_NAME, 
    R.REVIEW_TEXT, 
    DATE_FORMAT(R.REVIEW_DATE, '%Y-%m-%d') AS REVIEW_DATE
FROM REST_REVIEW AS R
JOIN MEMBER_PROFILE AS P 
    ON P.MEMBER_ID = R.MEMBER_ID
WHERE P.MEMBER_ID = (
    SELECT MEMBER_ID 
    FROM REST_REVIEW 
    GROUP BY MEMBER_ID 
    ORDER BY COUNT(*) DESC 
    LIMIT 1)
ORDER BY R.REVIEW_DATE ASC, R.REVIEW_TEXT ASC;

-- 년, 월, 성별 별 상품 구매 회원 수 구하기
SELECT
    DATE_FORMAT(s.SALES_DATE, '%Y') AS YEAR,
    DATE_FORMAT(s.SALES_DATE, '%m') AS MONTH,
    i.GENDER,
    COUNT(DISTINCT i.USER_ID) AS USERS
FROM ONLINE_SALE AS s
JOIN USER_INFO AS i ON s.USER_ID = i.USER_Id
WHERE i.GENDER IS NOT NULL
GROUP BY 1, 2, 3
ORDER BY 1, 2, 3;
