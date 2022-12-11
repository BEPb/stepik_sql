SELECT                          /*  выбрать информацию */
    author, title, amount       /* столбцы */
    FROM book                   /* из таблицы */
    WHERE amount IN             /* где количество книг */
        (SELECT amount FROM book GROUP BY amount HAVING COUNT(amount) = 1);  /* не повторяется */
