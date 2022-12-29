SELECT                                                                                  /* выбрать данные */
    ANY_VALUE(name_subject) AS name_subject,                                            /* столбец */
    ANY_VALUE(CONCAT(LEFT(name_question, 30), "...")) AS Вопрос,                        /* столбец */
    ANY_VALUE(COUNT(testing.question_id)) AS Всего_ответов,                             /* столбец */
    ANY_VALUE(ROUND(SUM(is_correct)/COUNT(testing.question_id) * 100, 2)) AS Успешность /* столбец */
FROM question                                       /* из таблицы */
    INNER JOIN subject USING (subject_id)           /* связанной с таблицей по столбцу */
    INNER JOIN attempt USING (subject_id)           /* связанной с таблицей по столбцу */
    RIGHT JOIN testing USING (attempt_id)           /* связанной с таблицей по столбцу */
    INNER JOIN answer USING (answer_id)             /* связанной с таблицей по столбцу */
WHERE testing.question_id = question.question_id    /* где условие */
GROUP BY answer.question_id                         /* сгруппировать по столбцу */
ORDER BY name_subject, Успешность DESC, Вопрос;     /* отсортировать по столбцам */