/*Перепишите запрос на создание таблицы book , чтобы ее структура 
соответствовала рисунку ниже  (Связать таблицы book и genre) . 
В качестве главной таблицы для описания поля  genre_idиспользовать таблицу genre*/
CREATE TABLE book2 (book_id INT PRIMARY KEY AUTO_INCREMENT, title VARCHAR(50), author_id INT, 
genre_id INT, price DECIMAL(8, 2), amount INT, FOREIGN KEY (author_id) 
REFERENCES author (author_id), FOREIGN KEY (genre_id) REFERENCES genre (genre_id));