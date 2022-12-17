SELECT title, name_genre, price         /* Вывести столбцы .*/
FROM genre INNER JOIN book              /* из таблицы соединенной с таблицей .*/
     ON genre.genre_id = book.genre_id  /* при условии .*/
WHERE amount > 8                        /* где количество больше 8 .*/
ORDER BY price DESC;                    /* отсортировать по цене в обратном порядке .*/
