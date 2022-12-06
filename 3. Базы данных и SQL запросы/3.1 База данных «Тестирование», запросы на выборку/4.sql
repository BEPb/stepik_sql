/*Если студент совершал несколько попыток по одной и той же 
дисциплине, то вывести разницу в днях между первой и последней 
попыткой. Информацию вывести по возрастанию разницы. Студентов, 
сделавших одну попытку по дисциплине, не учитывать. */
SELECT name_student, ANY_VALUE(name_subject) AS name_subject, ANY_VALUE(DATEDIFF(MAX(date_attempt), MIN(date_attempt))) AS Интервал
FROM student 
    INNER JOIN attempt USING (student_id) 
    INNER JOIN subject USING (subject_id)
WHERE name_student IN
    (SELECT ANY_VALUE(name_student)
    FROM student 
        INNER JOIN attempt USING (student_id) 
        INNER JOIN subject USING (subject_id) 
    GROUP BY name_student 
    HAVING COUNT(DISTINCT name_subject) = 1)
GROUP BY name_student
ORDER BY Интервал;