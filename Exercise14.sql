--Exercise 14--
SELECT *
FROM DEPARTMENT
WHERE
    CASE WHEN LEN(deptno) = 1 THEN deptno ELSE SUBSTRING(deptno, CEILING(LEN(deptno) / 2), 1) END = '1'
ORDER BY deptno;