/* Удалить всех авторов и все их книги, общее количество книг которых меньше 20.*/
DELETE FROM author 
WHERE author_id IN 
	(SELECT author_id 
    FROM book 
    GROUP BY author_id 
    HAVING SUM(amount) < 20);
SELECT * FROM author;
SELECT * FROM book;