/*Добавить из таблицы supply в таблицу book, все книги, 
кроме книг, написанных Булгаковым М.А. и Достоевским Ф.М.*/
INSERT INTO book (title, author, price, amount) 
SELECT title, author, price, amount 
FROM supply 
WHERE author NOT IN ("Достоевский Ф.М.", "Булгаков М.А.");
