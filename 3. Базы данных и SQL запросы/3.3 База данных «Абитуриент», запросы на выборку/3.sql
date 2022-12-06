/*Выведите количество абитуриентов, сдавших ЕГЭ по каждому предмету, 
максимальное, минимальное и среднее значение баллов по предмету ЕГЭ. 
Информацию отсортировать по названию предмета в алфавитном порядке, 
среднее значение округлить до одного знака после запятой.*/
SELECT ANY_VALUE(name_subject) AS name_subject, COUNT(name_subject) AS Количество, MAX(result) AS Максимум, MIN(result) AS Минимум, ROUND(AVG(result), 1) AS Среднее
FROM subject
    INNER JOIN enrollee_subject USING (subject_id)
GROUP BY subject_id
ORDER BY name_subject;