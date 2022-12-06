/*Необходимо:
в таблицу fine занести дату оплаты соответствующего штрафа из таблицы payment; 
уменьшить начисленный штраф в таблице fine в два раза  (только для новых штрафов, 
дата оплаты которых занесена в payment) , если оплата произведена не более, 
чем за 20 дней со дня нарушения.*/
UPDATE fine f, payment p 
SET f.date_payment = p.date_payment, f.sum_fine = 
IF((DATEDIFF(p.date_payment, f.date_violation) + 1) <= 20, f.sum_fine / 2, f.sum_fine) 
WHERE f.name = p.name AND f.number_plate = p.number_plate AND f.violation = p.violation AND f.date_violation = p.date_violation;

