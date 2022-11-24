-- 동물의 아이디와 이름
SELECT ANIMAL_ID, NAME FROM ANIMAL_INS ORDER BY ANIMAL_ID ASC;

-- 여러 기준으로 정렬하기
SELECT ANIMAL_ID, NAME, DATETIME FROM ANIMAL_INS
ORDER BY NAME ASC, DATETIME DESC;
    
-- 상위 n개 레코드
SELECT NAME FROM ANIMAL_INS ORDER BY DATETIME ASC LIMIT 1;

-- 이름이 있는 동물의 아이디
SELECT ANIMAL_ID FROM ANIMAL_INS WHERE NAME IS NOT NULL;

-- 최댓값 구하기
SELECT DATETIME AS 시간 FROM ANIMAL_INS ORDER BY DATETIME DESC LIMIT 1;
