/*Вывести абитуриентов, которые хотят поступать на образовательную 
программу «Мехатроника и робототехника» в отсортированном по фамилиям виде.*/
SELECT name_enrollee
FROM program 
    INNER JOIN program_enrollee USING (program_id)
    INNER JOIN enrollee USING (enrollee_id)
WHERE name_program = "Мехатроника и робототехника"
ORDER BY name_enrollee;