/*Посчитать, сколько дополнительных баллов получит каждый абитуриент. 
Информацию вывести в отсортированном по фамилиям виде.*/
SELECT name_enrollee, IF(SUM(bonus) IS NULL, 0, SUM(bonus)) AS Бонус 
FROM achievement
    INNER JOIN enrollee_achievement USING (achievement_id)
    RIGHT JOIN enrollee USING (enrollee_id)
GROUP BY enrollee_id
ORDER BY name_enrollee;