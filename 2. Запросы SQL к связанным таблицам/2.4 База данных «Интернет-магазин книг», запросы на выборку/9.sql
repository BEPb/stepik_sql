SELECT                                                              /* выбрать данные */
    buy_id,                                                         /* столбец */
    DATEDIFF(date_step_end, date_step_beg) AS Количество_дней,      /* вычислить и назвать столбец */
    GREATEST(DATEDIFF(date_step_end, date_step_beg) - days_delivery, 0) AS Опоздание    /* вычислить и назвать столбец */
FROM buy                                                            /* из таблицы */
    INNER JOIN buy_step USING(buy_id)                               /* объединить с таблицей */
    INNER JOIN step     USING(step_id)                              /* объединить с таблицей */
    INNER JOIN client   USING(client_id)                            /* объединить с таблицей */
    INNER JOIN city     USING(city_id)                              /* объединить с таблицей */
WHERE                                                               /* где */
    name_step = 'Транспортировка' AND                               /* условие 1 и*/
    date_step_end IS NOT NULL                                       /* условие 2 */
ORDER BY buy_id;                                                    /* отсортировать по номеру заказа */
