5월 식품들의 총매출 조회하기
SELECT P.PRODUCT_ID, PRODUCT_NAME, P.PRICE*SUM(O.AMOUNT) AS TOTAL_SALES FROM FOOD_ORDER O
JOIN FOOD_PRODUCT P ON O.PRODUCT_ID = P.PRODUCT_ID
WHERE PRODUCE_DATE LIKE '2022-05%'
GROUP BY PRODUCT_ID
ORDER BY TOTAL_SALES DESC, PRODUCT_ID ASC

서울에 위치한 식당 목록 출력하기
SELECT I.REST_ID, REST_NAME, I.FOOD_TYPE, I.FAVORITES, I.ADDRESS, ROUND(AVG(R.REVIEW_SCORE),2) AS SCORE FROM REST_REVIEW R
JOIN REST_INFO I ON R.REST_ID = I.REST_ID
WHERE ADDRESS LIKE "서울%"
GROUP BY REST_ID
ORDER BY SCORE DESC, FAVORITES DESC
