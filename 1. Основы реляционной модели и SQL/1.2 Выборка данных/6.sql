SELECT                                                              /* вывести */
    author, title,                                                  /* столбцы title, amount */
    ROUND(IF(author = "Булгаков М.А.", price * 1.1,                 /* столбец price * 1.1 если автор Булгаков*/
          IF(author = "Есенин С.А.", price * 1.05, price)), 2)      /* столбец price * 1.05 если автор Есенин */ 
          AS new_price                                              /* под псевдонином new_price */
    FROM book;                                                      /* таблицы book */