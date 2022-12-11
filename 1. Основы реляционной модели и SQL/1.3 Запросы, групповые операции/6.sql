SELECT                                          /* вывести */
    ROUND(AVG(price), 2) AS Средняя_цена,       /* столбец средняя цена*/
    ROUND(SUM(price * amount), 2) AS Стоимость  /* столбец стоимость */
        FROM book                               /* из таблицы book*/
        WHERE amount BETWEEN 5 AND 14;          /* где количество экземпляров в диапазоне от 5 до 14*/
