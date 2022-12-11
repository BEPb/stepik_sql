INSERT INTO book (title, author, price, amount)         /* вставить в таблицу */
SELECT title, author, price, amount                     /* выбрать столбцы */
FROM supply                                             /* из таблицы */
WHERE author NOT IN (SELECT author FROM book);          /* где автор не в списке авторов таблицы */
