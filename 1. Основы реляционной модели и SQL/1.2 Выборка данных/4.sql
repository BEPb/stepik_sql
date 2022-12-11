SELECT                          /* вывести  */
    title, amount,              /* столбцы title, amount */
    1.65 * amount AS pack       /* столбец amount умноженный на 1.65 под псевдонином pack */
FROM book;                      /* из таблицы book */