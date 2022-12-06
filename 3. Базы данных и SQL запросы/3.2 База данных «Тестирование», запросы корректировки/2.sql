/*Случайным образом выбрать три вопроса (запрос) по дисциплине, 
тестирование по которой собирается проходить студент, 
занесенный в таблицу attempt последним, и добавить их в 
таблицу testing. id последней попытки получить как максимальное 
значение id из таблицы attempt.*/
INSERT INTO testing (attempt_id, question_id, answer_id)
(SELECT (SELECT MAX(attempt_id) + 1 FROM testing), question_id, NULL
FROM question 
WHERE subject_id = 
    (SELECT DISTINCT subject_id FROM attempt WHERE student_id = 
         (SELECT MAX(student_id) FROM attempt))
ORDER BY RAND()
LIMIT 3);
SELECT * FROM testing;