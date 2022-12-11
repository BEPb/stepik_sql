SELECT                                  /* вывести информацию */
    author, title                       /* столбцы */
    FROM book                           /* таблицы book */
    WHERE amount BETWEEN 2 AND 14       /* где значения amount в диапазоне от 2 до 14 */
    ORDER BY author DESC, title         /* отсортировать */