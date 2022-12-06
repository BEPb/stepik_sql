/*Для тех книг в таблице book , которые есть в таблице supply, 
не только увеличить их количество в таблице book( 
увеличить их количество на значение столбца amountтаблицы supply), 
но и пересчитать их цену (для каждой книги найти сумму цен из 
таблиц book и supply и разделить на 2).*/
UPDATE book, supply 
SET book.amount = book.amount + supply.amount, book.price = (book.price + supply.price) / 2 
WHERE book.title = supply.title AND book.author = supply.author;
SELECT * FROM book;
