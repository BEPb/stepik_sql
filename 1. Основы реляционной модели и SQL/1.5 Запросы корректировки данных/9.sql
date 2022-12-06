/*Создать таблицу заказ (ordering), куда включить авторов и 
названия тех книг, количество экземпляров которых в таблице 
book меньше среднего количества экземпляров книг в таблице
book. В таблицу включить столбец   amount, в котором для всех 
книг указать одинаковое значение - среднее количество экземпляров книг в таблице book.*/
CREATE TABLE ordering AS SELECT author, title, (SELECT ROUND(AVG(amount)) FROM book) AS amount 
FROM book 
WHERE amount < (SELECT AVG(amount) FROM book);
SELECT * FROM ordering;
