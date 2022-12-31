CREATE TABLE applicant_order AS     /* создать таблицу как */
SELECT * FROM applicant             /* выбрать все столбцы таблицы */
    ORDER BY program_id, itog DESC; /* отсортировать по столбцам */
DROP TABLE applicant                /* удалить таблицу */