WITH get_count_correct (st_n_c, count_correct)          /* создадим табличное выражение */
AS (
    SELECT student_name, count(*) as rate
    FROM 
        (
         SELECT student_name, step_id
         FROM 
             student 
             INNER JOIN step_student USING(student_id)
         WHERE result = "correct"
         GROUP BY student_name, step_id
        ) buff GROUP BY student_name
        ORDER BY student_name
), 
get_count_all (count_all)
AS (
SELECT COUNT(DISTINCT step_id)
    FROM step_student
)

SELECT st_n_c AS Студент, ROUND(count_correct / (count_all) * 100) AS Прогресс, 
CASE 
    WHEN ROUND(count_correct / (count_all) * 100) = 100 THEN "Сертификат с отличием"
    WHEN ROUND(count_correct / (count_all) * 100) >= 80 THEN "Сертификат"
    ELSE ""
END AS Результат
FROM get_count_correct 
    CROSS JOIN get_count_all
ORDER BY 2 DESC, 1 ;
