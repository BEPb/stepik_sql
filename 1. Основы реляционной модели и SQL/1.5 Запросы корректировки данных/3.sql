INSERT INTO book (title, author, price, amount)             /*Добавить в таблицу book */
SELECT title, author, price, amount                         /*выбрать столбцы */
FROM supply                                                 /*из таблицы */
WHERE author NOT IN ("Достоевский Ф.М.", "Булгаков М.А.");  /*где автор не из списка */
