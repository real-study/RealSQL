-- 오랜 기간 보호한 동물(2)
SELECT O.ANIMAL_ID, O.NAME FROM ANIMAL_INS I
JOIN ANIMAL_OUTS O ON I.ANIMAL_ID = O.ANIMAL_ID
ORDER BY O.DATETIME - I.DATETIME DESC
LIMIT 2;

-- 헤비 유저가 소유한 장소
SELECT * FROM PLACES 
WHERE HOST_ID IN (SELECT HOST_ID FROM PLACES GROUP BY HOST_ID HAVING COUNT(*) > 1);

-- 조건별로 분류하여 주문상태 출력하기
SELECT ORDER_ID, PRODUCT_ID, DATE_FORMAT(OUT_DATE, '%Y-%m-%d') AS OUT_DATE, 
CASE
    WHEN OUT_DATE IS NULL THEN '출고미정'
    WHEN DATE_FORMAT(OUT_DATE,'%m-%d') < '05-02' THEN '출고완료'
    ELSE '출고대기'
    END AS 출고여부
FROM FOOD_ORDER
ORDER BY ORDER_ID ASC;
