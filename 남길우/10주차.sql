-- 없어진 기록 찾기
SELECT AO.ANIMAL_ID, AO.NAME FROM ANIMAL_INS AI
RIGHT JOIN ANIMAL_OUTS AO ON AI.ANIMAL_ID = AO.ANIMAL_ID
WHERE AI.ANIMAL_ID IS NULL
ORDER BY AO.ANIMAL_ID ASC;

-- 있었는데요 없었습니다
SELECT SUB_TABLE.ANIMAL_ID, SUB_TABLE.NAME 
FROM (SELECT I.ANIMAL_ID, I.NAME, I.DATETIME AS ITIME, O.DATETIME AS OTIME FROM ANIMAL_INS AS I, ANIMAL_OUTS AS O WHERE I.ANIMAL_ID = O.ANIMAL_ID) AS SUB_TABLE 
WHERE SUB_TABLE.ITIME > SUB_TABLE.OTIME 
ORDER BY SUB_TABLE.ITIME;

-- 오랜 기간 보호한 동물(1)
SELECT I.NAME, I.DATETIME FROM ANIMAL_INS I
LEFT JOIN ANIMAL_OUTS O ON I.ANIMAL_ID = O.ANIMAL_ID
WHERE O.DATETIME IS NULL
ORDER BY I.DATETIME ASC
LIMIT 3;
