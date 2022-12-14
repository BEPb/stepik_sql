SELECT                              /* вывести */
    author, title, price            /* столбцы */
    FROM book                       /* из таблицы */
    WHERE price<= (SELECT AVG(price) FROM book)     /* где цена меньше или равна средней цене из таблицы*/
    ORDER BY price DESC             /* отсортировать по цене в обратной последовательности*/
