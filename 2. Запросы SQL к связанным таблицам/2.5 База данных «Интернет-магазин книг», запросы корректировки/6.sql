/*Создать общий счет (таблицу buy_pay) на оплату заказа с 
номером 5. Куда включить номер заказа, количество книг в
 заказе и его общую стоимость. Для решения используйте ОДИН запрос.*/
CREATE TABLE buy_pay AS
SELECT buy_id, SUM(buy_book.amount) AS Количество, SUM(price * buy_book.amount) AS Итого
FROM book
    INNER JOIN buy_book USING (book_id)
WHERE buy_id = 5
GROUP BY buy_id;
SELECT * FROM buy_pay;