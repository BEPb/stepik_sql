SELECT name_genre                       /* вывести данные столбца жанры */
FROM genre                              /* из таблицы */
	LEFT JOIN book                      /* соединенного с таблицей */
	ON genre.genre_id = book.genre_id   /* при условии */
    WHERE title IS NULL;                /* где названия книг отсутвуют */