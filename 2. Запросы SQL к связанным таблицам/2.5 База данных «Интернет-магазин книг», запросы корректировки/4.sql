/*Количество тех книг на складе, которые были включены в
 заказ с номером 5, уменьшить на то количество, которое в заказе с номером 5  указано.*/
UPDATE book 
    INNER JOIN buy_book USING (book_id)
SET book.amount = book.amount - buy_book.amount
WHERE book.book_id = buy_book.book_id AND buy_book.buy_id = 5;
SELECT * FROM book;