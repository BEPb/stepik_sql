/*Удалить все жанры, число книг с различными названиями у которых
 меньше 3. В таблицу book для этих жанров установить значение Null (None).*/
DELETE FROM genre 
WHERE genre_id IN 
	(SELECT genre_id 
    FROM book 
    GROUP BY book.genre_id 
    HAVING COUNT(title) < 3);
SELECT * FROM genre;
SELECT * FROM book;