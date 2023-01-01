WITH                                            /* создадим табличное выражение */
    get_count_correct (st_n_c, count_correct)   /* запрос первого шага, имя выражения (название столбца 1, название столбца 2) */
  -- ниже встроенный запрос №1, результат которого будет использоваться в табличном выражении
  AS (
    SELECT step_name, count(*)                  /* выбрать данные столбцы */
    FROM step                                   /* из таблицы */
        INNER JOIN step_student USING (step_id) /* объединенной с таблицей по (столбцу) */
    WHERE result = "correct"                    /* где условие */
    GROUP BY step_name                          /* сгруппировать по столбцу */
   ),
  -- конец встроенного запроса №1
  get_count_wrong (st_n_w, count_wrong)         /* запрос второго шага, имя выражения (название столбца 1, название столбца 2) */
  -- ниже встроенный запрос №2, результат которого будет использоваться в табличном выражении
  AS (
    SELECT step_name, count(*)                  /* выбрать данные столбцы */
    FROM step                                   /* из таблицы */
        INNER JOIN step_student USING (step_id) /* объединенной с таблицей по (столбцу) */
    WHERE result = "wrong"                      /* где условие */
    GROUP BY step_name                          /* сгруппировать по столбцу */
   )
   -- конец встроенного запроса №2

-- полученное табличное выражение и его шаги используем при подготовке результата
-- используем первый шаг
SELECT st_n_c AS Шаг,                                                            /* выбрать данные столбца */
    IF((ROUND(count_correct / (count_correct + count_wrong) * 100)) IS NOT NULL, /* если верно */
       (ROUND(count_correct / (count_correct + count_wrong) * 100)),             /* то вычислить значение */
       100) AS Успешность                                                        /* иначе результат, имя столбца */
FROM  get_count_correct                                                          /* из таблицы */
    LEFT JOIN get_count_wrong ON st_n_c = st_n_w                                 /* объединенной с таблицей по условию */
UNION                                                                            /* объединяем */
-- используем второй шаг
SELECT st_n_w AS Шаг,                                                            /* выбрать данные столбца */
    IF((ROUND(count_correct / (count_correct + count_wrong) * 100)) IS NOT NULL, /* если верно */
       (ROUND(count_correct / (count_correct + count_wrong) * 100)),             /* то вычислить значение */
       0) AS Успешность                                                          /* иначе результат, имя столбца */
FROM                                                /* из */
    get_count_correct                               /* таблицы первого шага */
    RIGHT JOIN get_count_wrong ON st_n_c = st_n_w   /* объединенной с таблицей второго шага по условию */
ORDER BY 2, 1 ;                                     /* отсортировать по столбцам */
