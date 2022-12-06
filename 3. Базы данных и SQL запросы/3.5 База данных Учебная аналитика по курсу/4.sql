/*Посчитать, сколько студентов относится к каждой группе. Указать границы интервала.*/
SELECT Группа, 
    CASE
        WHEN Группа = "I" THEN "от 0 до 10"
        WHEN Группа = "II" THEN "от 11 до 15"
        WHEN Группа = "III" THEN "от 16 до 27"
        ELSE "больше 27"
    END AS Интервал
    , COUNT(student_name) AS Количество FROM 
(SELECT student_name, rate, 
    CASE
        WHEN rate <= 10 THEN "I"
        WHEN rate <= 15 THEN "II"
        WHEN rate <= 27 THEN "III"
        ELSE "IV"
    END AS Группа
FROM      
    (
     SELECT student_name, count(*) as rate
     FROM 
         (
          SELECT student_name, step_id
          FROM 
              student 
              INNER JOIN step_student USING(student_id)
          WHERE result = "correct"
          GROUP BY student_name, step_id
         ) query_in
     GROUP BY student_name 
     ORDER BY 2
    ) query_in_1 ) query_in_2 
GROUP BY Группа;
