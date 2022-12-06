/*Создать счет (таблицу buy_pay) на оплату заказа с номером 5, 
в который включить название книг, их автора, цену, количество
 заказанных книг и  стоимость. Информацию в таблицу занести в
 отсортированном по названиям книг виде.*/
CREATE TABLE buy_pay AS
SELECT title, name_author, price, buy_book.amount, (price * buy_book.amount) AS Стоимость
FROM author 
    INNER JOIN book USING(author_id)
    INNER JOIN buy_book USING(book_id)
WHERE buy_id = 5;
SELECT * FROM buy_pay
ORDER BY title;