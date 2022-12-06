/*Добавить новые книги из таблицы supply в таблицу book 
на основе сформированного выше запроса. Затем вывести для просмотра таблицу book.*/
INSERT INTO book (genre_id, title, author_id, price, amount) 
	(SELECT NULL, title, author_id, price, amount 
    FROM author 
		INNER JOIN supply ON author.name_author = supply.author 
	WHERE amount <> 0);