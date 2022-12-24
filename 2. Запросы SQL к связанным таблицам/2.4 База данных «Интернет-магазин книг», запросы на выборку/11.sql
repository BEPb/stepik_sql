/*Вывести жанр (или жанры), в котором было заказано больше всего
 экземпляров книг, указать это количество .*/
SELECT ANY_VALUE(name_genre) AS name_genre, MAX(Количество) AS Количество 
FROM 
	(SELECT name_genre, SUM(buy_book.amount) AS Количество 
    FROM genre 
		INNER JOIN book USING(genre_id) 
        INNER JOIN buy_book USING (book_id) 
	GROUP BY name_genre) buff;