/**/
INSERT INTO supply (title, author, price, amount) VALUES 
("Золотой жук", "По Э.А.", 515.30, 6), 
("Копи царя Соломона", "Хаггард Г.Р.", 480.00, 8);
INSERT INTO author (name_author) 
	(SELECT author 
    FROM author 
		RIGHT JOIN supply ON supply.author = author.name_author 
	WHERE name_author IS NULL);
INSERT INTO book (title, author_id, price, amount) 
	(SELECT title, author_id, price, amount 
    FROM supply 
		INNER JOIN author ON supply.author = author.name_author 
	WHERE title IN 
		(SELECT supply.title 
        FROM book 
			RIGHT JOIN supply ON book.title = supply.title 
		WHERE book.title IS NULL));
UPDATE book SET genre_id = 
	(SELECT genre_id 
    FROM genre 
    WHERE name_genre = "Приключения")
WHERE title = "Золотой жук";
UPDATE book SET genre_id = 
	(SELECT genre_id 
    FROM genre 
    WHERE name_genre = "Приключения") 
WHERE title = "Копи царя Соломона";
UPDATE book 
	INNER JOIN 
		(SELECT genre_id, ROUND(AVG(price), 2) AS avg_price 
        FROM book 
        GROUP BY (genre_id)) AS buff ON buff.genre_id = book.genre_id 
SET price = buff.avg_price;