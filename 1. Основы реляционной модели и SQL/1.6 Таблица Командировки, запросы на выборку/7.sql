SELECT                                          /* выбрать данные */
    name, city, date_first, date_last           /* столбцы */
    FROM trip                                   /* из таблицы */
    WHERE MONTH(date_first) = MONTH(date_last)  /* где месяц начала равен месяцу конца командировки */
    ORDER BY city, name;                        /* отсортировать сначала по городам потом по именам в алф. порядке */

