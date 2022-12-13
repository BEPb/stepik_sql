SELECT                                                              /* выбрать данные */
    name, city, date_first,                                         /* столбцы */
    ((DATEDIFF(date_last, date_first) + 1) * per_diem) AS Сумма     /* вычислить сумму командировочных в столбец Сумма*/
    FROM trip                                                       /* из таблицы */
    WHERE MONTH(date_first) IN (2, 3) AND YEAR(date_first) = 2020   /* где месяц начала февраль или март 2020 года */
    ORDER BY name, Сумма DESC;                                      /* отсортировать по фамилиям , а затем по убыванию суммы суточных*/

