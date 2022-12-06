/*Создать новый заказ для Попова Ильи. Его комментарий для заказа: 
«Связаться со мной по вопросу доставки».*/
INSERT INTO buy (buy_description, client_id)
SELECT "Связаться со мной по вопросу доставки", client_id
FROM client WHERE name_client = "Попов Илья";
SELECT * FROM buy;