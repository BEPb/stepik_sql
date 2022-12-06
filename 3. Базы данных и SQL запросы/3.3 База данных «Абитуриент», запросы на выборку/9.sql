/*Посчитать количество баллов каждого абитуриента на каждую 
образовательную программу, на которую он подал заявление, по результатам 
ЕГЭ. В отсортированном сначала по образовательной программе, 
а потом по убыванию суммы баллов виде.*/
SELECT name_program, name_enrollee, SUM(result) AS itog
FROM enrollee
    INNER JOIN program_enrollee ON enrollee.enrollee_id = program_enrollee.enrollee_id
    INNER JOIN program ON program_enrollee.program_id = program.program_id
    INNER JOIN program_subject ON program.program_id = program_subject.program_id
    INNER JOIN subject ON program_subject.subject_id = subject.subject_id
    INNER JOIN enrollee_subject ON subject.subject_id = enrollee_subject.subject_id 
        and enrollee_subject.enrollee_id = enrollee.enrollee_id
GROUP BY name_program, name_enrollee
ORDER BY name_program, itog DESC;