/* первая запись */
INSERT INTO                                                         /* вставить в */
    buy_book (buy_book.book_id, buy_book.buy_id, buy_book.amount)   /* таблицу (столбцы) */
SELECT                                                              /* выбрать данные */
    book_id, 5, 2                                                   /* значения вписываемые в таблицу */
FROM                                                                /* из */
    book, author                                                    /* таблицы объединенной с таблицей */
WHERE                                                               /* где */
    author.name_author LIKE "Пастернак%"                            /* условие 1 */
    AND book.title = "Лирика";                                      /* условие 2 */
/* вторая запись */
INSERT INTO                                                         /* вставить в */
    buy_book (buy_book.book_id, buy_book.buy_id, buy_book.amount)   /* таблицу (столбцы) */
SELECT                                                              /* выбрать данные */
    book_id, 5, 1                                                   /* значения вписываемые в таблицу */
FROM                                                                /* из */
    book, author                                                    /* таблицы объединенной с таблицей */
WHERE                                                               /* где */
    author.name_author LIKE "Булгаков%"                             /* условие 1 */
    AND book.title = "Белая гвардия";                               /* условие 2 */