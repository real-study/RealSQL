--이름에 el이 들어가는 동물 찾기
SELECT ANIMAL_ID, NAME
FROM ANIMAL_INS
WHERE ANIMAL_TYPE ='Dog' AND UPPER(NAME) LIKE '%EL%'
ORDER BY UPPER(NAME)

--동물수 구하기
SELECT COUNT(ANIMAL_ID) AS count
FROM ANIMAL_INS

--중복 제거하기
SELECT COUNT(DISTINCT NAME) AS count
FROM ANIMAL_INS
WHERE NAME IS NOT NULL

--중성화 여부 파악하기
SELECT ANIMAL_ID, NAME, (CASE WHEN SEX_UPON_INTAKE LIKE 'Neutered%' OR SEX_UPON_INTAKE LIKE 'Spayed%' THEN 'O' ELSE 'X' END) AS 중성화
FROM ANIMAL_INS