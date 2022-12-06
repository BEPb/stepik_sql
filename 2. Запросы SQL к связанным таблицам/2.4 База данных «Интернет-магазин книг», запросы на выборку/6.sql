/*Вывести все заказы и названия этапов, на которых они в данный момент
 находятся. Если заказ доставлен –  информацию о нем не 
 выводить. Информацию отсортировать по возрастанию buy_id.*/
SELECT buy_id, name_step 
FROM step 
	INNER JOIN buy_step USING (step_id) 
WHERE date_step_end IS NULL AND date_step_beg IS NOT NULL 
ORDER BY buy_id;