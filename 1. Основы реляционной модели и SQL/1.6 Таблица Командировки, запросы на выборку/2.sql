/*Вывести в алфавитном порядке фамилии и инициалы тех сотрудников, 
которые были в командировке в Москве.*/
SELECT name FROM trip WHERE city = "Москва" GROUP BY name ORDER BY name;
