/*Вывести из таблицы trip информацию о командировках тех сотрудников, 
фамилия которых заканчивается на букву «а», в отсортированном по 
убыванию даты последнего дня командировки виде. В результат 
включить столбцы name, city, per_diem, date_first, date_last.*/
SELECT name, city, per_diem, date_first, date_last 
FROM trip 
WHERE name LIKE "%а _._." 
ORDER BY date_last DESC;
