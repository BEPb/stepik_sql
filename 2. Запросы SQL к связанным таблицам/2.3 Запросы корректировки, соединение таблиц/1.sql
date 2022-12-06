/*Для книг, которые уже есть на складе (в таблице book),
 но по другой цене, чем в поставке (supply),  
 необходимо в таблице book увеличить количество 
 на значение, указанное в поставке,  и пересчитать
 цену. А в таблице  supply обнулить количество этих книг.*/
UPDATE book 
	INNER JOIN author ON book.author_id = author.author_id 
    INNER JOIN supply ON book.title = supply.title AND author.name_author = supply.author 
SET supply.amount = 0, 
	book.amount = book.amount + supply.amount, 
    book.price = ((book.price * book.amount) + (supply.amount * supply.price)) / (book.amount + supply.amount) 
WHERE book.price <> supply.price;
SELECT * FROM book;
SELECT * FROM supply;