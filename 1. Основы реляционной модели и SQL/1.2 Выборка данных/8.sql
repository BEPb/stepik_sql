SELECT                                  /* вывести */
    title, author, price, amount        /* столбцы */
    FROM book                           /* из таблицы */
    WHERE (price < 500 OR price > 600) AND price * amount > 5000;  /* соответствующие условиям */
