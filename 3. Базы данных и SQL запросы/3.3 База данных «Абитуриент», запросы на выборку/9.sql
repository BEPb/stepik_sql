SELECT                                                  /* выбрать данные */
    name_program,                                       /* столбец */
    name_enrollee,                                      /* столбец */
    SUM(result) AS itog                                 /* столбец */
FROM enrollee                                           /* из таблицы */
    INNER JOIN program_enrollee USING(enrollee_id)      /* объединенной с таблицей по столбцу */
    INNER JOIN program USING(program_id)                /* объединенной с таблицей по столбцу */
    INNER JOIN program_subject USING(program_id)        /* объединенной с таблицей по столбцу */
    INNER JOIN subject USING(subject_id)                /* объединенной с таблицей по столбцу */
    INNER JOIN enrollee_subject ON subject.subject_id = enrollee_subject.subject_id /* объединенной с таблицей по условию1 и */
        and enrollee_subject.enrollee_id = enrollee.enrollee_id                     /* условию 2 */
GROUP BY name_program, name_enrollee                    /* сгруппировать по столбцам */
ORDER BY name_program, itog DESC;                       /* отсортировать по столбцу в обратном порядке */
