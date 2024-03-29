-- 없어진 기록 찾기
SELECT O.ANIMAL_ID, O.NAME 
FROM ANIMAL_OUTS AS O 
WHERE NOT EXISTS (SELECT * FROM ANIMAL_INS AS I WHERE O.ANIMAL_ID = I.ANIMAL_ID);

-- 있었는데요 없었습니다
SELECT SUB_TABLE.ANIMAL_ID, SUB_TABLE.NAME 
FROM (SELECT I.ANIMAL_ID, I.NAME, I.DATETIME AS ITIME, O.DATETIME AS OTIME FROM ANIMAL_INS AS I, ANIMAL_OUTS AS O WHERE I.ANIMAL_ID = O.ANIMAL_ID) AS SUB_TABLE 
WHERE SUB_TABLE.ITIME > SUB_TABLE.OTIME 
ORDER BY SUB_TABLE.ITIME;

-- 오랜 기간 보호한 동물(1)
SELECT I.NAME, I.DATETIME
FROM ANIMAL_INS AS I LEFT JOIN ANIMAL_OUTS AS O ON I.ANIMAL_ID = O.ANIMAL_ID
WHERE O.ANIMAL_ID IS NULL
ORDER BY I.DATETIME
LIMIT 3;
