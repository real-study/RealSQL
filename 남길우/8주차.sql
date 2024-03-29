-- 3월에 태어난 여성 회원 목록 출력하기
SELECT MEMBER_ID, MEMBER_NAME, GENDER, DATE_FORMAT(DATE_OF_BIRTH,'%Y-%m-%d') AS DATE_OF_BIRTH FROM MEMBER_PROFILE
WHERE MONTH(DATE_OF_BIRTH) = 3
    AND GENDER = "W"
    AND TLNO IS NOT NULL
ORDER BY MEMBER_ID ASC;

-- 카테고리 별 상품 개수 구하기
SELECT LEFT(PRODUCT_CODE, 2) AS CATEGORY, COUNT(*) AS PRODUCTS FROM PRODUCT
GROUP BY CATEGORY
ORDER BY PRODUCT_CODE ASC;

-- 가격대 별 상품 개수 구하기
SELECT FLOOR(PRICE/10000) * 10000 AS PRICE_GROUP, COUNT(*) AS PRODUCTS FROM PRODUCT
GROUP BY PRICE_GROUP
ORDER BY PRICE_GROUP ASC;

-- 상품 별 오프라인 매출 구하기
SELECT p.PRODUCT_CODE, SUM(o.SALES_AMOUNT) * PRICE AS SALES
FROM PRODUCT p
JOIN OFFLINE_SALE AS o
 ON p.PRODUCT_ID = o.PRODUCT_ID
GROUP BY p.PRODUCT_CODE
ORDER BY SALES DESC, p.PRODUCT_CODE ASC;
