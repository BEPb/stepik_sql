SELECT                                                                      /* выбрать данные */
    name_student,                                                           /* столбец */
    ANY_VALUE(name_subject) AS name_subject,                                /* столбец */
    ANY_VALUE(DATEDIFF(MAX(date_attempt), MIN(date_attempt))) AS Интервал   /* столбец */
FROM student                                                                /* из таблицы */
    INNER JOIN attempt USING (student_id)                                   /* объединенной с таблицей по стобцу */
    INNER JOIN subject USING (subject_id)                                   /* объединенной с таблицей по стобцу */
WHERE name_student IN                                                       /* где имя студента в встроенном запросе */
    -- встроенный запрос
    (SELECT ANY_VALUE(name_student)             /* выбрать данные столбец */
    FROM student                                /* из таблицы */
        INNER JOIN attempt USING (student_id)   /* объединенной с таблицей по стобцу */
        INNER JOIN subject USING (subject_id)   /* объединенной с таблицей по стобцу */
    GROUP BY name_student                       /* сгруппировать по имени студента */
    HAVING COUNT(DISTINCT name_subject) = 1)    /* количество уникальных значений = 1 */
GROUP BY name_student                                                       /* сгруппировать по имени */
ORDER BY Интервал;                                                          /* отсортировать по столбцу */