-- 우유와 요거트가 담긴 장바구니
SELECT CART_ID 
FROM CART_PRODUCTS
WHERE CART_ID IN (SELECT CART_ID 
                  FROM CART_PRODUCTS 
                  WHERE NAME = 'Yogurt')
AND NAME = 'MILK'
ORDER BY ID ASC;

-- 식품분류별 가장 비싼 식품의 정보 조회하기
SELECT CATEGORY, PRICE AS MAX_PRICE, PRODUCT_NAME 
FROM FOOD_PRODUCT
WHERE (CATEGORY, PRICE) IN (SELECT CATEGORY, MAX(PRICE) AS MAX_PRICE 
                            FROM FOOD_PRODUCT
                            WHERE CATEGORY IN ('과자', '국', '김치', '식용유')
                            GROUP BY CATEGORY)
ORDER BY MAX_PRICE DESC;
