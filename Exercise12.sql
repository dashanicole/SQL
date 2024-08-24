--Exercise 12--
SELECT projno, projname, prstdate, prendate
FROM PROJECT
WHERE majproj IS NULL
ORDER BY projno;