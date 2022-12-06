/*1. Исправить фамилии клиентов, которые заказывали Булгакова, 
так что если указанного автора заказал Иванов, его фамилия отразилась бы как Бул-Иванов.
2. В таблицу genre добавить новый жанр - "Экстремизм". 
3. Везде, где автор "Булгаков"  поменять жанр на "Экстремизм" 
и поднять цену в 10 раз из-за возросшего спроса.*/
SELECT client_id, IF(name_client IN 
    (SELECT DISTINCT name_client
    FROM author
        INNER JOIN book USING (author_id)
        INNER JOIN buy_book USING (book_id)
        INNER JOIN buy USING (buy_id)
        INNER JOIN client USING (client_id)
    WHERE name_author = "Булгаков М.А.")
, CONCAT("Бул-", name_client), name_client) AS name_client, city_id, email 
FROM client;

INSERT INTO genre (name_genre) VALUES ("Экстремизм");
SELECT * FROM genre;

UPDATE book SET genre_id = (SELECT genre_id FROM genre WHERE name_genre = "Экстремизм"), price = price * 10
WHERE author_id = (SELECT author_id FROM author WHERE name_author = "Булгаков М.А.");
SELECT * FROM book;