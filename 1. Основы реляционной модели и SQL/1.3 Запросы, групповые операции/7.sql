SELECT                                                      /* выбрать */
    author,                                                 /* столбец author */
    SUM(price * amount) AS Стоимость                        /* столбец стоимость всех экземпляров */
    FROM book                                               /* из таблицы book */
    WHERE title <> "Идиот" AND title <> "Белая гвардия"     /* без учета книг (не равно) «Идиот» и «Белая гвардия» */
    GROUP BY author                                         /* сгруппированных по авторам */
    HAVING SUM(price * amount) > 5000                       /* суммарная стоимость книг более 5000 */
    ORDER BY Стоимость DESC;                                /* отсортировать по убыванию стоимости */
