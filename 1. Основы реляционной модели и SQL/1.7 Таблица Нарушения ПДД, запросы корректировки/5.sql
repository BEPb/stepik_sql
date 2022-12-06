/*В таблице fine увеличить в два раза сумму неоплаченных
штрафов для отобранных на предыдущем шаге записей. 
Пояснение к заданию
	Для всех  нарушений, по которым штраф еще не оплачен, (тех, у которых date_payment 
имеет пустое значение Null), необходимо проверить, является ли данное нарушение для 
водителя и машины повторным, если да –  увеличить штраф в два раза.
	Если водитель совершил нарушение на другой машине, ему увеличивать штраф не нужно.
	Если несколько повторных нарушений не оплачены, то штраф увеличить для всех.
	Этот запрос реализован на предыдущем шаге.*/
UPDATE fine f, 
	(SELECT name, number_plate, violation 
    FROM fine 
    GROUP BY name, violation, number_plate 
    HAVING COUNT(violation) >= 2) query_in 
SET f.sum_fine = f.sum_fine * 2 
WHERE f.date_payment IS NULL AND f.name = query_in.name AND f.number_plate = query_in.number_plate AND f.violation = query_in.violation;
SELECT * FROM fine;

