/*Создать таблицу поставка (supply), которая имеет ту же структуру, что и таблица book.*/
CREATE TABLE supply (supply_id INT PRIMARY KEY AUTO_INCREMENT, title VARCHAR(50), author VARCHAR(30), price DECIMAL(8, 2), amount INT);
