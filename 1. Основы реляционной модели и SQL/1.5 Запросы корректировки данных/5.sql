UPDATE book                         /* обновить таблицу */
    SET price = price * 0.9         /* значения столбца перезаписать уменьшив на 10% */
    WHERE amount BETWEEN 5 AND 10;  /* где количество от 5 до 10 */
