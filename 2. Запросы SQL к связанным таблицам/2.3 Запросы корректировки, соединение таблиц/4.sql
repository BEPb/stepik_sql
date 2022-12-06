/* Занести для книги «Стихотворения и поэмы» Лермонтова жанр «Поэзия», 
а для книги «Остров сокровищ» Стивенсона - «Приключения». (Использовать два запроса)..*/
UPDATE book SET genre_id = 
	(SELECT genre_id 
    FROM genre 
    WHERE name_genre = "Поэзия") 
WHERE title = "Стихотворения и поэмы" AND author_id = 5;
UPDATE book SET genre_id = 
	(SELECT genre_id 
    FROM genre 
    WHERE name_genre = "Приключения") 
WHERE title = "Остров сокровищ" AND author_id = 6;