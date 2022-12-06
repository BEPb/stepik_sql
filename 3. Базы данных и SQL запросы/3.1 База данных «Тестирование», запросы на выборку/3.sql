/*Вывести студента (различных студентов), имеющих максимальные 
результаты попыток. Информацию отсортировать в алфавитном порядке по фамилии студента.*/
SELECT name_student, result 
FROM student 
    INNER JOIN attempt USING (student_id) 
WHERE result = 
    (SELECT MAX(result) FROM attempt) 
ORDER BY name_student;