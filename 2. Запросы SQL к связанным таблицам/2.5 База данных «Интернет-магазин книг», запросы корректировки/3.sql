/*В таблицу buy_book добавить заказ с номером 5. Этот
 заказ должен содержать книгу Пастернака «Лирика» в 
 количестве двух экземпляров и книгу Булгакова «Белая гвардия» в одном экземпляре.*/
INSERT INTO buy_book (buy_id, book_id, amount)
SELECT 5, book_id, 2
FROM author INNER JOIN book ON author.author_id = book.author_id
WHERE name_author = "Пастернак Б.Л." and book.title = "Лирика";

INSERT INTO buy_book (buy_id, book_id, amount)
SELECT 5, book_id, 1
FROM author INNER JOIN book ON author.author_id = book.author_id
WHERE name_author = "Булгаков М.А." and book.title = "Белая гвардия";

SELECT * FROM buy_book;