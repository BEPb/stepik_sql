/*Для каждой отдельной книги необходимо вывести информацию о 
количестве проданных экземпляров и их стоимости за текущий и 
предыдущий год . Столбцы назвать КоличествоиСумма. Информацию
 отсортировать по убыванию стоимости.*/
SELECT ANY_VALUE(title) AS title, ANY_VALUE(SUM(Количество)) AS Количество, ANY_VALUE(SUM(Сумма)) AS Сумма
FROM 
    (SELECT title, buy_archive.amount AS Количество, (buy_archive.amount * buy_archive.price) AS Сумма,             YEAR(date_payment)
    FROM buy_archive INNER JOIN book USING(book_id)
    UNION ALL
    SELECT book.title, buy_book.amount, (buy_book.amount * book.price), YEAR(date_step_end)
    FROM 
    book INNER JOIN buy_book USING(book_id)
        INNER JOIN buy USING(buy_id)
        INNER JOIN buy_step USING(buy_id)
    WHERE date_step_end IS NOT NULL AND step_id = 1) buff
GROUP BY title
ORDER BY Сумма DESC;
