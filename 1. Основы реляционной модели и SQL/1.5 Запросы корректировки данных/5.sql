/*Уменьшить на 10% цену тех книг в таблице book, количество которых
принадлежит интервалу от 5 до 10 включительно.*/
UPDATE book SET price = price * 0.9 WHERE amount BETWEEN 5 AND 10;
