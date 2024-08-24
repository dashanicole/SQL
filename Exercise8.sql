--Exercise 8--
SELECT projno, actno, emstdate, emendate
FROM EMP_ACT
WHERE projno LIKE 'AD%' AND actno IN (10, 80, 180)
ORDER BY projno, actno;