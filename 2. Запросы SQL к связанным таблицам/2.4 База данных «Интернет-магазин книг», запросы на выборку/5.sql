/*Вывести города, в которых живут клиенты, оформлявшие заказы 
в интернет-магазине. Указать количество заказов в каждый город. 
Информацию вывести по убыванию количества заказов, а затем в
 алфавитном порядке по названию городов.*/
SELECT name_city, COUNT(buy_id) AS Количество 
FROM city 
	INNER JOIN client ON city.city_id = client.city_id 
    INNER JOIN buy ON client.client_id = buy.client_id 
GROUP BY name_city 
ORDER BY COUNT(buy_id) DESC, name_city;