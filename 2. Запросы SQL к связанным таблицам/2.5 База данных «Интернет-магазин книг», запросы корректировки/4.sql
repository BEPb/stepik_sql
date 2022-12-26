UPDATE                                              /* обновить */
    book                                            /* таблицу */
    JOIN buy_book                                   /* объединенную с таблицей */
    ON buy_book.book_id = book.book_id              /* по столбцу */
SET                                                 /* заменить */
    book.amount = book.amount - buy_book.amount     /* количество по формуле */
WHERE                                               /* где */
    buy_book.buy_id = 5;                            /* номер заказа = 5 */