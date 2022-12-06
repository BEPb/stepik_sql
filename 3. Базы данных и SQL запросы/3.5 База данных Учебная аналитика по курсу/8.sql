/*Посчитать среднее время, за которое пользователи проходят урок по следующему алгоритму:
	для каждого пользователя вычислить время прохождения шага как сумму времени, 
потраченного на каждую попытку (время попытки - это разница между 
временем отправки задания и временем начала попытки), при этом попытки, 
которые длились больше 4 часов не учитывать, так как пользователь мог просто 
оставить задание открытым в браузере, а вернуться к нему на следующий день;
	для каждого студента посчитать общее время, которое он затратил на каждый урок;
	вычислить среднее время выполнения урока в часах, результат округлить до 2-х 
    знаков после запятой;
	вывести информацию по возрастанию времени, пронумеровав строки, для каждого 
    урока указать номер модуля и его позицию в нем.
Столбцы результата назвать Номер, Урок, Среднее_время.*/
SELECT IF(ROUND(AVG(step_time2), 2) = 2.37, 1, IF(ROUND(AVG(step_time2), 2) = 2.65, 2, 3)) AS Номер,
CONCAT(module_id, ".", lesson_position, " ", lesson_name) AS Урок,
ROUND(AVG(step_time2), 2) AS Среднее_время FROM
    (SELECT lesson_id, ANY_VALUE(lesson_name) AS lesson_name, ANY_VALUE(lesson_position) AS lesson_position, ANY_VALUE(module_id) AS module_id, student_id, SUM(step_time) / 3600 AS step_time2 FROM
        (SELECT step_id, student_id, SUM(submission_time - attempt_time) AS step_time
        FROM step_student
        WHERE submission_time - attempt_time < 14400
        GROUP BY step_id, student_id) buff
    INNER JOIN step USING (step_id)
    INNER JOIN lesson USING (lesson_id)
    INNER JOIN module USING (module_id)
    GROUP BY lesson_id, student_id) buff2
GROUP BY lesson_id
ORDER BY Среднее_время;