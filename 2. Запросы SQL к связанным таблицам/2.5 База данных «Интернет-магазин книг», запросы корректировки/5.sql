CREATE TABLE                                    /* создать таблицу */
    buy_pay AS                                  /* имя таблицы как, далее указываем содержимое таблицы */
SELECT                                          /* выбрать данные */
    title,                                      /* столбец */
    name_author,                                /* столбец */
    book.price,                                 /* столбец */
    buy_book.amount,                            /* столбец */
    (buy_book.amount * book.price) AS Стоимость /* столбец */
FROM                                            /* из */
    buy_book  JOIN book   USING(book_id)        /* таблицы объединенной с таблицей (по столбцу) */
              JOIN author USING(author_id)      /* объединенной с таблицей (по столбцу) */
WHERE                                           /* где */
    buy_id = 5                                  /* условие */
ORDER BY                                        /* отсортировать */
    title;                                      /* по названию */
