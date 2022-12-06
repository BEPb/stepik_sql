/*В таблицу buy_step занести дату 12.04.2020 выставления счета на оплату заказа с номером 5.*/
UPDATE buy_step SET date_step_beg = "2020-04-12"
WHERE buy_id = 5 AND step_id = (SELECT step_id FROM step WHERE name_step = "Оплата");
SELECT * FROM buy_step;