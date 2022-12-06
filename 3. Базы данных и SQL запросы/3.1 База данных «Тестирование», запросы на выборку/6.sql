/*Случайным образом отберите 3 вопроса по дисциплине «Основы баз данных».*/
SELECT question_id, name_question 
FROM question 
WHERE subject_id = 
    (SELECT subject_id FROM subject WHERE name_subject = "Основы баз данных") 
ORDER BY RAND() 
LIMIT 3;