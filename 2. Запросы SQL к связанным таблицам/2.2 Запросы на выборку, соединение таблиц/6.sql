SELECT name_author                          /* выбрать данные столбца */
FROM author                                 /* из таблицы */
  LEFT JOIN book                            /* соединенной с таблицей */
  ON author.author_id = book.author_id      /* при условии */
GROUP BY author.author_id                   /* сгруппировать по авторам */
HAVING COUNT(DISTINCT genre_id) = 1         /* при условии */
ORDER BY name_author;                       /* отсортировать по имени */



