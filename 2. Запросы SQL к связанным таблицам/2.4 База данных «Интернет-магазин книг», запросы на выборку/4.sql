/*Посчитать, сколько раз была заказана каждая книга,
 для книги вывести ее автора (нужно посчитать,
 в каком количестве заказов фигурирует каждая книга). 
 Результат отсортировать сначала  по фамилиям авторов,
 а потом по названиям книг. Последний столбец назвать Количество.*/
SELECT name_author, title, COUNT(buy_book.book_id) AS Количество 
FROM author 
	INNER JOIN book ON author.author_id = book.author_id 
	LEFT JOIN buy_book ON book.book_id = buy_book.book_id 
GROUP BY name_author, title 
ORDER BY author.name_author, book.title;