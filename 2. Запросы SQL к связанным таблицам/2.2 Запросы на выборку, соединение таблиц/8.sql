SELECT                                                              /* выбрать данные */
    title as Название,                                              /* столбец */
    author as Автор,                                                /* столбец */
    s.amount + b.amount as Количество                               /* столбец */
 FROM                                                               /* из */
    supply s JOIN book b USING (price, title)                       /* таблицы соединенной с таблицей */


