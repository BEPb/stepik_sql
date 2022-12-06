/*Повысить итоговые баллы абитуриентов в таблице applicant на 
значения дополнительных баллов (использовать запрос из предыдущего урока).*/
UPDATE applicant INNER JOIN 
    (SELECT enrollee_id, IF(SUM(bonus) IS NULL, 0, SUM(bonus)) AS Бонус 
    FROM achievement
        INNER JOIN enrollee_achievement USING (achievement_id)
        RIGHT JOIN enrollee USING (enrollee_id)
    GROUP BY enrollee_id
    ORDER BY enrollee_id) AS buff
    ON applicant.enrollee_id = buff.enrollee_id
SET itog = itog + buff.Бонус;
SELECT * FROM applicant;