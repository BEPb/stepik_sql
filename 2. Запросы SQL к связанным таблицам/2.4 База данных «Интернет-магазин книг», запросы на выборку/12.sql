SELECT                                  /* выбрать данные */
    YEAR(ba.date_payment) Год,          /* столбец год */
    MONTHNAME(ba.date_payment) Месяц,   /* столбец месяц */
    SUM(ba.price * ba.amount) Сумма     /* столбец сумма */
FROM                                    /* из */
    buy_archive ba                      /* таблицы с псевдонимом */
GROUP BY                                /* сгруппировать */
    MONTHNAME(ba.date_payment),         /* по месяцам */
    YEAR(ba.date_payment)               /* по годам */

UNION ALL                               /* объединить все */

SELECT                                  /* выбрать данные */
    YEAR(bs.date_step_end),             /* столбец год */
    MONTHNAME(bs.date_step_end),        /* столбец месяц */
    SUM(book.price * bb.amount)         /* столбец сумма */
FROM                                    /* из */
    buy                                 /* таблицы */
    JOIN buy_step bs USING (buy_id)     /* объединенной с таблицей по столбцу */
    JOIN buy_book bb USING (buy_id)     /* объединенной с таблицей по столбцу */
    JOIN book USING (book_id)           /* объединенной с таблицей по столбцу */
WHERE                                   /* где */
    bs.date_step_end IS NOT NULL &&     /* в столбец данные внесены и */
    bs.step_id = 1                      /* и значения столбца равны 1 */
GROUP BY                                /* сгруппировать */
    MONTHNAME(bs.date_step_end),        /* по месяцу */
    YEAR(bs.date_step_end)              /* по году */
ORDER BY                                /* отсортировать */
    Месяц,                              /* сначала по месяцу */
    Год;                                /* затем по году */
