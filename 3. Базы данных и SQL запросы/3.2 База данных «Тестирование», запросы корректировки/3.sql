UPDATE attempt                                  /* обновить таблицу */
SET result =                                    /* значение = встроенный запрос */
    (SELECT CEILING(SUM(is_correct) / 3 * 100)  /* выбрать данные вычисления */
    FROM testing                                /* из таблицы */
        INNER JOIN answer USING (answer_id)     /* объединенной с таблицей */
    WHERE attempt_id = 8)                       /* где условие */
WHERE attempt_id = 8;                           /* где условие */