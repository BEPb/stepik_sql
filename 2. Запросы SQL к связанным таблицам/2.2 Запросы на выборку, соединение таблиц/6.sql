/*Вывести в алфавитном порядке всех авторов, которые пишут только 
в одном жанре. Поскольку у нас в таблицах так занесены данные, 
что у каждого автора книги только в одном жанре,  для этого запроса
 внесем изменения в таблицу book. Пусть у нас  книга Есенина «Черный 
 человек» относится к жанру «Роман», а книга Булгакова «Белая гвардия» 
 к «Приключениям» (эти изменения в таблицы уже внесены).*/
SELECT name_author 
FROM 
	(SELECT name_author, name_genre  
    FROM genre 
		INNER JOIN book ON genre.genre_id = book.genre_id 
        INNER JOIN author ON author.author_id = book.author_id) buff 
GROUP BY name_author 
HAVING COUNT(DISTINCT name_genre) = 1
 ORDER BY name_author; 