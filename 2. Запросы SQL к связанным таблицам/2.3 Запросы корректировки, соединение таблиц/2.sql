/*Включить новых авторов в таблицу author с помощью запроса 
на добавление, а затем вывести все данные из таблицы author. 
 Новыми считаются авторы, которые есть в таблице supply, но нет в таблице author.*/
INSERT INTO author (name_author) 
	(SELECT supply.author 
    FROM author 
		RIGHT JOIN supply ON supply.author = author.name_author 
	WHERE author.name_author IS NULL);