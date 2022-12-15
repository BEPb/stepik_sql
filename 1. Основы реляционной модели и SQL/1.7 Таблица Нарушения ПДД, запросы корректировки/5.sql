UPDATE fine f,                                  /* обновить таблицу под псевдонимом f */
	(SELECT name, number_plate, violation       /* обновить таблицу под псевдонимом query_in в которой выбрать столбцы */
    FROM fine                                   /* из таблицы */
    GROUP BY name, violation, number_plate      /* сгруппировать по элементам столбцов */
    HAVING COUNT(violation) >= 2) query_in      /* имеющих нарушения больше 1-го */
SET f.sum_fine = f.sum_fine * 2                 /* обновить столбец sum_fine таблицы f */
WHERE f.date_payment IS NULL                    /* где дата оплаты отсутствует */
    AND f.name = query_in.name                  /* и имя равны в другой таблице, т.е. >=2 нарушения */
    AND f.number_plate = query_in.number_plate  /* и номер равны в другой таблице, т.е. >=2 нарушения */
    AND f.violation = query_in.violation;       /* и нарушения равны в другой таблице, т.е. >=2 нарушения */


