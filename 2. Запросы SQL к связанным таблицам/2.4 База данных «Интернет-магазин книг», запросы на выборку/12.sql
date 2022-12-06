/* ~~~ 1.Вывести лучших клиентов (по общей сумме заказов)
2.То же для городов (из каких городов идут самые крупные заказы)
3.Таргетированная реклама. Рекомендации для заказчиков:
а)вывести другие книги заказанных вами авторов;
б)вывести другие книги заказанных вами жанров.*/
SELECT ANY_VALUE(name_client) AS name_client, ANY_VALUE(SUM(price * buy_book.amount)) AS Сумма_заказов_клиента 
FROM book 
    INNER JOIN buy_book USING (book_id)
    INNER JOIN buy USING (buy_id)
    INNER JOIN client USING (client_id)
GROUP BY name_client;

SELECT ANY_VALUE(name_city) AS name_city, ANY_VALUE(SUM(price * buy_book.amount)) AS Сумма_заказов_из_города 
FROM book 
    INNER JOIN buy_book USING (book_id)
    INNER JOIN buy USING (buy_id)
    INNER JOIN client USING (client_id)
    INNER JOIN city USING (city_id)
GROUP BY name_city;

SELECT ANY_VALUE(name_client) AS name_city, ANY_VALUE(name_author) AS name_author, ANY_VALUE(book.title) AS Заказывал
FROM author
    INNER JOIN book USING (author_id)
    INNER JOIN buy_book USING (book_id)
    INNER JOIN buy USING (buy_id)
    INNER JOIN client USING (client_id)
    INNER JOIN city USING (city_id)
ORDER BY name_client, name_author;

SELECT name_author, title 
FROM author INNER JOIN book USING (author_id)
WHERE title NOT IN 
(SELECT ANY_VALUE(book.title) AS title
FROM author
    INNER JOIN book USING (author_id)
    INNER JOIN buy_book USING (book_id)
    INNER JOIN buy USING (buy_id)
    INNER JOIN client USING (client_id)
ORDER BY name_author, title);

(SELECT DISTINCT ANY_VALUE(book.title) AS title
FROM author
    INNER JOIN book USING (author_id)
    INNER JOIN buy_book USING (book_id)
    INNER JOIN buy USING (buy_id)
    INNER JOIN client USING (client_id)
ORDER BY title);
