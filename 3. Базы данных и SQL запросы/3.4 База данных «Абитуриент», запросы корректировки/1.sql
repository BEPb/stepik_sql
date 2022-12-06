/*Создать вспомогательную таблицу applicant,  куда включить id 
образовательной программы, id абитуриента, сумму баллов абитуриентов 
в отсортированном сначала по id образовательной программы, а потом 
по убыванию суммы баллов виде (использовать запрос из предыдущего урока).*/
CREATE TABLE applicant AS
(SELECT program_enrollee.program_id, enrollee.enrollee_id, SUM(result) AS itog
FROM enrollee
    INNER JOIN program_enrollee ON enrollee.enrollee_id = program_enrollee.enrollee_id
    INNER JOIN program ON program_enrollee.program_id = program.program_id
    INNER JOIN program_subject ON program.program_id = program_subject.program_id
    INNER JOIN subject ON program_subject.subject_id = subject.subject_id
    INNER JOIN enrollee_subject ON subject.subject_id = enrollee_subject.subject_id 
        and enrollee_subject.enrollee_id = enrollee.enrollee_id
GROUP BY program_enrollee.program_id, enrollee.enrollee_id
ORDER BY program_enrollee.program_id, itog DESC);
SELECT * FROM applicant;