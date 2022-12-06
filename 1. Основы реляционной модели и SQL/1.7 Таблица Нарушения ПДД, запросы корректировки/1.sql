/*Создать таблицу fine*/
CREATE TABLE fine 
(fine_id INT PRIMARY KEY AUTO_INCREMENT, name VARCHAR(30), number_plate VARCHAR(6), 
violation VARCHAR(50), sum_fine DECIMAL(8, 2), date_violation DATE, date_payment DATE);

