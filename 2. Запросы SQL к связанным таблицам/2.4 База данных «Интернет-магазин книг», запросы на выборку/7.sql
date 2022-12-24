/*Вывести номера всех оплаченных заказов и даты, когда они были оплачены.*/
SELECT buy_book.buy_id, name_client, SUM(buy_book.amount * book.price) AS Стоимость 
FROM client 
	INNER JOIN buy USING (client_id) 
    INNER JOIN buy_book USING(buy_id) 
    INNER JOIN book USING(book_id) 
GROUP BY buy_book.buy_id 
ORDER BY buy_book.buy_id;