SELECT                          /* выбрать информацию */
    author, title, price        /* столбцы */
    FROM book                   /* из таблицы */
    WHERE price < ANY           /* где цена меньше любого из */
        (SELECT MIN(price)      /* минимальной цены */
        FROM book               /* таблицы */
        GROUP BY author)        /* сгруппированной по авторам */
