/*Вывести информацию о книгах (жанр, книга, автор), относящихся к жанру, 
включающему слово «роман» в отсортированном по названиям книг виде.*/
SELECT name_genre, title, name_author 
FROM genre 
	INNER JOIN book ON genre.genre_id = book.genre_id 
    INNER JOIN author ON author.author_id = book.author_id 
WHERE name_genre LIKE "%роман%" 
ORDER BY title;