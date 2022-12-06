/*Сформулируйте SQL запрос для создания таблицы book,
занесите  его в окно кода (расположено ниже)  и отправьте на
проверку (кнопка Отправить). Структура таблицы book:*/

CREATE TABLE book(book_id INT PRIMARY KEY AUTO_INCREMENT, 
title VARCHAR(50), author VARCHAR(30), price DECIMAL(8, 2), amount INT);