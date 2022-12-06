/*Из таблицы applicant, созданной на предыдущем шаге, 
удалить записи, если абитуриент на выбранную образовательную программу 
не набрал минимального балла хотя бы по одному предмету (использовать 
запрос из предыдущего урока).*/
DELETE FROM applicant WHERE (program_id, enrollee_id) IN 
(SELECT DISTINCT program_enrollee.program_id, enrollee.enrollee_id
FROM enrollee
    INNER JOIN program_enrollee ON enrollee.enrollee_id = program_enrollee.enrollee_id
    INNER JOIN program ON program_enrollee.program_id = program.program_id
    INNER JOIN program_subject ON program.program_id = program_subject.program_id
    INNER JOIN subject ON program_subject.subject_id = subject.subject_id
    INNER JOIN enrollee_subject ON subject.subject_id = enrollee_subject.subject_id 
        and enrollee_subject.enrollee_id = enrollee.enrollee_id
WHERE result < min_result
ORDER BY program_enrollee.program_id, enrollee.enrollee_id);/* buff
WHERE applicant.program_id = buff.program_id AND applicant.enrollee_id = buff.enrollee_id
;*/
SELECT * FROM applicant;