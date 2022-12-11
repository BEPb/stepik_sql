DELETE FROM supply                  /* удалить из таблицы */
    WHERE author IN                 /* где автор в списке */
        (SELECT author              /* выбрать авторов */
        FROM book                   /* из таблицы */
        GROUP by author             /* сгруппировать по столбцу автор */
        HAVING SUM(amount) > 10);   /* где сумма больше 10 */


