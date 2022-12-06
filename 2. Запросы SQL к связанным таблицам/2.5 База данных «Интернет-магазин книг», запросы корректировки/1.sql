/* Включить нового человека в таблицу с клиентами. 
Его имя Попов Илья, его email popov@test, проживает он в Москве.*/
INSERT INTO client (name_client, city_id, email)
SELECT "Попов Илья", city_id, "popov@test"
FROM city WHERE name_city = "Москва";
SELECT * FROM client;