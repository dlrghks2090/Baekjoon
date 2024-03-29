-- 해당 문제는 서브쿼리를 왜 써서 다시 원테이블과 비교해야하는지에 대한 고민을 해야했다.
-- 고민의 결과는 
-- SELECT FOOD_TYPE, REST_ID, REST_NAME, MAX(FAVORITES) AS FAVORITES
-- FROM REST_INFO
-- GROUP BY FOOD_TYPE
-- ORDER BY FOOD_TYPE DESC;
-- 를 수행했을 시 FAVORITS컬럼에 대해서만 MAS기준값이 나오고 나머지 컬럼들은 어떤 값이 출력될지 정확하지 않기 때문이다.
-- 그래서 FAVORITS의 최대값을 찾고 이에 해당하는 데이터를 원본테이블과 다시 비교하여 데이터를 추출해내야 했다.

SELECT A.FOOD_TYPE, A.REST_ID, A.REST_NAME, A.FAVORITES
FROM REST_INFO A
JOIN
(SELECT FOOD_TYPE, MAX(FAVORITES) AS FAVORITES
FROM REST_INFO
GROUP BY FOOD_TYPE) B
ON A.FOOD_TYPE=B.FOOD_TYPE AND A.FAVORITES=B.FAVORITES
ORDER BY A.FOOD_TYPE DESC;