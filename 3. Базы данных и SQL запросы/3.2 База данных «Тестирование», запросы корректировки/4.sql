/*Удалить из таблицы attempt все попытки, выполненные раньше 1 мая 
2020 года. Также удалить и все соответствующие этим попыткам вопросы из таблицы testing*/
DELETE FROM attempt
WHERE date_attempt < "2020-05-01";
SELECT * FROM attempt;
SELECT * FROM testing;