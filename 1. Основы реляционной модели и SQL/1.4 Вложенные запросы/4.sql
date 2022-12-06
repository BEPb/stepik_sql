/*Вывести информацию о книгах(автор, название, цена), 
цена которых меньше самой большой из минимальных цен, 
вычисленной для каждого автора.*/
SELECT author, title, price 
FROM book 
WHERE author = ANY 
	(SELECT author FROM book GROUP BY author HAVING AVG(price) >= (SELECT AVG(price) FROM book));
