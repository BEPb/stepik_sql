SELECT                                  /* вывести информацию */
    author, title                       /* столбцы */
    FROM book                           /* таблицы book */
    WHERE amount between 2 and 14       /* где значения amount в диапазоне от 2 до 14 */
    order by author desc, title         /* отсортировать */