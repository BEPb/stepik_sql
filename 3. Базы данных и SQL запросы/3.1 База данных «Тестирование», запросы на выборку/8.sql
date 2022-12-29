SELECT                                              /* выбрать данные */
    name_student,                                   /* столбец */
    name_subject,                                   /* столбец */
    date_attempt,                                   /* столбец */
    ROUND((SUM(is_correct)/3*100), 2) AS Результат  /* столбец */
FROM answer                                         /* из таблицы */
    INNER JOIN testing USING (answer_id)            /* объединенной с таблицей по столбцу */
    INNER JOIN attempt USING (attempt_id)           /* объединенной с таблицей по столбцу */
    INNER JOIN student USING (student_id)           /* объединенной с таблицей по столбцу */
    INNER JOIN subject USING (subject_id)           /* объединенной с таблицей по столбцу */
GROUP BY date_attempt, name_student, name_subject   /* сгруппировать по столбцам */
ORDER BY name_student, date_attempt DESC;           /* отсортировать по имени, затем по дате в обратной последовательности */