UPDATE book                                                 /* обновить таблицу */
INNER JOIN author                                           /* объединенной с таблицей */
ON book.author_id = author.author_id                        /* где номер автора одинаков */
SET genre_id =                                              /* столбец жанр */
	(SELECT genre_id                                        /* выбрать данные столбца */
    FROM genre                                              /* из таблицы */
    WHERE name_genre = "Поэзия")                            /* где жанр =, это же значение и внести в таблицу */
WHERE                                                       /* где */
    title = "Стихотворения и поэмы" AND                     /* название произведения = */
    name_author LIKE "%Лермонтов%";                         /* имя автора = */

UPDATE book                                                 /* обновить таблицу */
INNER JOIN author                                           /* объединенной с таблицей */
ON book.author_id = author.author_id                        /* где номер автора одинаков */
SET genre_id =                                              /* столбец жанр */
	(SELECT genre_id                                        /* выбрать данные столбца */
    FROM genre                                              /* из таблицы */
    WHERE name_genre = "Приключения")                       /* где жанр =, это же значение и внести в таблицу */
WHERE                                                       /* где */
    title = "Остров сокровищ" AND                           /* название произведения = */
    name_author LIKE "%Стивенсон%";                         /* имя автора = */