CREATE TABLE back_payment AS                                        /* Создать новую таблицу back_payment как ...*/
SELECT name, number_plate, violation, sum_fine, date_violation      /* выбрать столбцы */
FROM fine                                                           /* из таблицы */
WHERE date_payment IS NULL;                                         /* где даты оплаты не указана */



