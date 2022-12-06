/*В таблицу attempt включить новую попытку для студента Баранова Павла 
по дисциплине «Основы баз данных». Установить текущую дату в 
качестве даты выполнения попытки.*/
INSERT INTO attempt (student_id, subject_id, date_attempt, result) 
VALUES (
    (SELECT student_id FROM student WHERE name_student = "Баранов Павел"), 
    (SELECT subject_id FROM subject WHERE name_subject = "Основы баз данных"), 
    NOW(), NULL
);
SELECT * FROM attempt;