/*Для студента с именем student_61 вывести все его попытки: название шага, 
результат и дату отправки попытки (submission_time). Информацию отсортировать 
по дате отправки попытки и указать, сколько минут прошло между отправкой 
соседних попыток. Название шага ограничить 20 символами и добавить "...". 
Столбцы назвать Студент, Шаг, Результат, Дата_отправки, Разница.*/
SELECT student_name AS Студент, CONCAT(LEFT(step_name, 20), "...") AS Шаг, result AS Результат, FROM_UNIXTIME(submission_time) AS Дата_отправки, 
SEC_TO_TIME(IFNULL(submission_time - LEAD(submission_time) OVER (ORDER BY submission_time DESC), 0)) AS Разница
FROM student 
    INNER JOIN step_student USING (student_id)
    INNER JOIN step USING (step_id)
WHERE student_name = "student_61"
ORDER BY Дата_отправки;