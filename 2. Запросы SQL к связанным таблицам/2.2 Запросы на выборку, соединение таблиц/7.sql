/*Вывести информацию о книгах, написанных в самых популярных жанрах, 
в отсортированном в алфавитном порядке по названию книг виде.*/
SELECT title, name_author, name_genre, price, amount 
FROM author 
	INNER JOIN book ON author.author_id = book.author_id 
    INNER JOIN genre ON genre.genre_id = book.genre_id 
WHERE book.genre_id IN (
    SELECT genre_id FROM book GROUP BY genre_id HAVING SUM(amount) = 
(SELECT MAX(sums) AS max_sum FROM (SELECT SUM(amount) AS sums FROM book GROUP BY genre_id) buff)) 
ORDER BY title; 