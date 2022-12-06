/*Реализовать поиск по ключевым словам. Вывести шаги, с которыми 
связаны ключевые слова MIN и AVG одновременно. Для шагов 
указать номер модуля, номер урока, номер шага через точку, 
после номера шага перед заголовком - пробел. Столбец назвать Шаг. 
Информацию отсортировать по возрастанию сначала по порядковому номеру
 модуля, затем по порядковым номерам урока и шага соответственно.*/
SELECT 
    CONCAT(CONCAT(CONCAT(CONCAT(module_id, "."), CONCAT(lesson_position, ".")), CONCAT(step_position, " ")), step_name) AS Шаг
FROM module
    INNER JOIN lesson USING (module_id)
    INNER JOIN step USING (lesson_id)
    INNER JOIN step_keyword USING (step_id)
    INNER JOIN keyword USING (keyword_id)
WHERE keyword_name IN ("MAX", "MIN")
GROUP BY step_id
HAVING COUNT(keyword_name) = 2
ORDER BY module_id, lesson_id, step_id;
