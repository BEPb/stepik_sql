SELECT name_program, plan               /* выбрать данные столбцы */
FROM program                            /* из таблицы */
WHERE plan =                            /* где условие = встроенному запросу */
    (SELECT MAX(plan) FROM program);    /* встроенный запрос */