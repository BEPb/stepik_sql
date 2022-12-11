UPDATE book, supply                                                          /* обновить значения таблиц */
    SET book.amount = book.amount + supply.amount, book.price = (book.price + supply.price) / 2     /* столбцы */
    WHERE book.title = supply.title AND book.author = supply.author;        /* условия */



