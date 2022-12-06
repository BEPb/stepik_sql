/*Для каждого автора из таблицы author вывести количество книг, 
написанных им в каждом жанре.
Вывод: ФИО автора, жанр, количество. Отсортировать по фамилии, затем 
- по убыванию количества написанных книг.*/
SELECT name_author, name_genre, COUNT(book.title) AS Количество 
FROM 
	(SELECT author_id, name_author, genre_id, name_genre 
    FROM author 
		CROSS JOIN genre) buff 
	LEFT JOIN book ON book.genre_id = buff.genre_id AND book.author_id = buff.author_id 
GROUP BY name_author, name_genre 
ORDER BY name_author, COUNT(title) DESC;