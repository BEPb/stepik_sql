/*Создать таблицу book той же структуры, что и на предыдущем шаге. 
Будем считать, что при удалении автора из таблицы author, должны 
удаляться все записи о книгах из таблицы book, написанные этим автором.
 А при удалении жанра из таблицы genre для соответствующей записи 
 book установить значение Null в столбце genre_id. */
CREATE TABLE book (book_id INT PRIMARY KEY AUTO_INCREMENT, title VARCHAR(50), 
author_id INT, genre_id INT, price DECIMAL(8, 2), amount INT, 
FOREIGN KEY (author_id) REFERENCES author (author_id) 
ON DELETE CASCADE, FOREIGN KEY (genre_id) REFERENCES 
genre (genre_id) ON DELETE SET NULL);