SELECT                                          /* выбрать данные */
    subject.name_subject,                       /* таблица.столбец */
    COUNT(attempt.attempt_id) AS Количество,    /* столбец количество */
    ROUND(AVG(attempt.result), 2) AS Среднее    /* столбец среднее */
FROM                                            /* из */
    attempt                                     /* таблицы */
    RIGHT JOIN subject USING(subject_id)        /* объединенной с таблицей по столбцу */
GROUP BY                                        /* сгруппировать */
    subject_id                                  /* по столбцу */
ORDER BY                                        /* отсортировать */
    Среднее DESC;                               /* по столбцу среднее в обратном порядке */