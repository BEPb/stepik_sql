SELECT                              /* выбрать данные */
    city.name_city,                 /* столбец */
    author.name_author,             /* столбец */
    DATE_ADD('2020-01-01',INTERVAL FLOOR(RAND() * 365) DAY) AS Дата /* столбец дата случайная в течении года */
FROM                                /* из */
    author CROSS JOIN city          /* соединенных таблиц */
ORDER BY                            /* отсортированных */
    city.name_city,                 /* по названию города */
    Дата DESC;                      /* а затем по дате по убыванию */
