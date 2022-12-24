/*Сравнить ежемесячную выручку от продажи книг за текущий
 и предыдущий годы. Для этого вывести год, месяц, сумму 
 выручки в отсортированном сначала по возрастанию месяцев,
 затем по возрастанию лет виде. Название столбцов: Год, Месяц, Сумма.*/
SELECT ANY_VALUE(YEAR(date_payment)) AS Год, ANY_VALUE(MONTHNAME(date_payment)) AS Месяц, ANY_VALUE(SUM(price * amount)) AS Сумма
FROM buy_archive GROUP BY MONTH(date_payment)
UNION ALL
SELECT ANY_VALUE(YEAR(date_step_end)) AS Год, ANY_VALUE(MONTHNAME(date_step_end)) AS Месяц, ANY_VALUE(SUM(book.price * buy_book.amount))
FROM book INNER JOIN buy_book USING(book_id)
          INNER JOIN buy USING(buy_id)
          INNER JOIN buy_step USING(buy_id)
WHERE date_step_end IS NOT NULL AND step_id = 1
GROUP BY MONTH(date_step_end)
ORDER BY Месяц, Год;
