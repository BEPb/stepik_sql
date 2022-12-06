/*Вывести образовательные программы, для которых минимальный 
балл ЕГЭ по каждому предмету больше или равен 40 баллам. 
Программы вывести в отсортированном по алфавиту виде.*/
SELECT DISTINCT ANY_VALUE(name_program) AS name_program
FROM program 
    INNER JOIN program_subject USING (program_id)
GROUP BY name_program
HAVING MIN(min_result) >= 40
ORDER BY name_program
;