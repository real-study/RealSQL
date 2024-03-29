-- 5월 식품들의 총매출 조회하기
SELECT P.PRODUCT_ID, P.PRODUCT_NAME, SUM(P.PRICE * O.AMOUNT) AS TOTAL_PRICES
FROM FOOD_PRODUCT P INNER JOIN FOOD_ORDER O ON P.PRODUCT_ID = O.PRODUCT_ID
WHERE DATE_FORMAT(O.PRODUCE_DATE, '%Y-%m') = '2022-05'
GROUP BY PRODUCT_ID
ORDER BY TOTAL_PRICES DESC, P.PRODUCT_ID ASC;

-- 서울에 위치한 식당 목록  출력하기
SELECT R.REST_ID, I.REST_NAME, I.FOOD_TYPE, I.FAVORITES, I.ADDRESS, ROUND(AVG(R.REVIEW_SCORE),2) AS SCORE
FROM REST_REVIEW R JOIN REST_INFO I ON I.REST_ID = R.REST_ID
GROUP BY R.REST_ID
HAVING I.ADDRESS LIKE '서울%'
ORDER BY SCORE DESC, I.FAVORITES DESC
