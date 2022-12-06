/*Для каждого вопроса вывести процент успешных решений, 
то есть отношение количества верных ответов к общему 
количеству ответов, значение округлить до 2-х знаков после 
запятой. Также вывести название предмета, к которому 
относится вопрос, и общее количество ответов на этот вопрос. 
Информацию отсортировать сначала по названию дисциплины, 
потом по убыванию успешности, а потом по тексту вопроса в алфавитном порядке.*/
SELECT ANY_VALUE(name_subject) AS name_subject, 
    ANY_VALUE(CONCAT(LEFT(name_question, 30), "...")) AS Вопрос, 
    ANY_VALUE(COUNT(testing.question_id)) AS Всего_ответов, 
    ANY_VALUE(ROUND(SUM(is_correct)/COUNT(testing.question_id) * 100, 2)) AS Успешность 
FROM question 
    INNER JOIN subject USING (subject_id) 
    INNER JOIN attempt USING (subject_id) 
    RIGHT JOIN testing USING (attempt_id) 
    INNER JOIN answer USING (answer_id) 
WHERE testing.question_id = question.question_id 
GROUP BY answer.question_id
ORDER BY name_subject, Успешность DESC, Вопрос;