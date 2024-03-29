-- 보호소에서 중성화한 동물
SELECT B.ANIMAL_ID AS ANIMAL_ID, B.ANIMAL_TYPE AS ANIMAL_TYPE, B.NAME AS NAME
FROM (SELECT *
    FROM ANIMAL_INS
    WHERE SEX_UPON_INTAKE LIKE '%INTACT%') A, ANIMAL_OUTS B
WHERE A.ANIMAL_ID = B.ANIMAL_ID AND B.SEX_UPON_OUTCOME NOT LIKE '%INTACT%'
ORDER BY 1 ASC

-- 입양 시각 구하기(2)
SET @hour = -1;
SELECT @hour := @hour + 1  AS HOUR, (
    SELECT COUNT(DATETIME)
    FROM ANIMAL_OUTS B
    WHERE HOUR(DATETIME) = @hour
) AS COUNT
FROM ANIMAL_OUTS A
WHERE @hour < 23
