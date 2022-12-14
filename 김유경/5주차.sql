-- 최솟값 구하기
SELECT MIN(DATETIME) AS 시간 FROM ANIMAL_INS;

-- 고양이와 개는 몇 마리 있을까
SELECT ANIMAL_TYPE, COUNT(ANIMAL_TYPE) as count FROM ANIMAL_INS GROUP BY ANIMAL_TYPE;

-- 동명 동물 수 찾기
SELECT NAME, COUNT(NAME) as COUNT FROM ANIMAL_INS GROUP BY NAME HAVING COUNT(NAME) >= 2;

-- 루시와 엘라 찾기
SELECT ANIMAL_ID, NAME, SEX_UPON_INTAKE FROM ANIMAL_INS WHERE NAME IN ('Lucy', 'Ella', 'Pickle', 'Rogan', 'Sabrina', 'Mitty');
