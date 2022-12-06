/*Вывести все жанры, которые не представлены в книгах на складе.*/
SELECT name_genre 
FROM genre 
	LEFT JOIN book ON genre.genre_id = book.genre_id 
WHERE title IS NULL;