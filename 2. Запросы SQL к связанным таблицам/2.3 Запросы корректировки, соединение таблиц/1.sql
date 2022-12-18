UPDATE book                                                                                 /* обновить таблицу */
	INNER JOIN author ON book.author_id = author.author_id                                  /* связать с таблицей */
    INNER JOIN supply ON book.title = supply.title AND author.name_author = supply.author   /* связать с таблицей*/
SET supply.amount = 0,                                                                      /* внести изменения в столбец*/
	book.amount = book.amount + supply.amount,                                              /* внести изменения в столбец*/
    book.price = ((book.price * book.amount) + (supply.amount * supply.price)) / (book.amount + supply.amount)      /* внести изменения в столбец */
WHERE book.price <> supply.price;                                                           /* где цена не равна */
SELECT * FROM book;                                                                         /* вывести таблицу */
SELECT * FROM supply;                                                                       /* вывести таблицу */



