최솟값 구하기
SELECT MIN(DATETIME) AS 시간 FROM ANIMAL_INS

고양이와 개는 몇 마리 있을까
SELECT ANIMAL_TYPE, count(ANIMAL_TYPE) AS COUNT FROM ANIMAL_INS
GROUP BY ANIMAL_TYPE
ORDER BY ANIMAL_TYPE

동명 동물 수 찾기
SELECT NAME, COUNT(*) AS COUNT FROM ANIMAL_INS
GROUP BY NAME
HAVING COUNT(NAME) > 1 AND NAME IS NOT NULL
ORDER BY NAME

루시와 엘라 찾기
SELECT ANIMAL_ID, NAME, SEX_UPON_INTAKE FROM ANIMAL_INS
WHERE (NAME="LUCY" OR NAME="ELLA" OR NAME="PICKLE" OR NAME="ROGAN" OR NAME="SABRINA" OR NAME="MITTY")

