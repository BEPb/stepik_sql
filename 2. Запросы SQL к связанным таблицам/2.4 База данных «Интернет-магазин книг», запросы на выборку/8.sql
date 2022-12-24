SELECT                                  /* выбрать данные */
    buy_id,                             /* столбец */
    name_step                           /* столбец */
FROM step                               /* из таблицы */
	INNER JOIN buy_step USING (step_id) /* объединить с таблицей по столбцу */
WHERE                                   /* где */
    date_step_end IS NULL AND           /* данные внесены */
    date_step_beg IS NOT NULL           /* данные отсутствуют */
ORDER BY buy_id;                        /* отсортировать по возрастанию */