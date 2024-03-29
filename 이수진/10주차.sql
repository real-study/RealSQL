-- 없어진 기록 찾기
SELECT O.ANIMAL_ID AS ANIMAL_ID, O.NAME AS NAME
FROM ANIMAL_INS I RIGHT JOIN ANIMAL_OUTS O ON I.ANIMAL_ID = O.ANIMAL_ID
WHERE I.ANIMAL_ID IS NULL

-- 있었는데요 없었습니다
SELECT O.ANIMAL_ID AS ANIMAL_ID, O.NAME AS NAME
FROM ANIMAL_INS I RIGHT JOIN ANIMAL_OUTS O ON I.ANIMAL_ID = O.ANIMAL_ID
WHERE I.DATETIME > O.DATETIME
ORDER BY I.DATETIME

-- 오랜 기간 보호한 동물(1)
SELECT I.NAME, I.DATETIME
FROM ANIMAL_INS I LEFT JOIN ANIMAL_OUTS O ON I.ANIMAL_ID = O.ANIMAL_ID
WHERE O.DATETIME IS NULL
ORDER BY I.DATETIME
LIMIT 3