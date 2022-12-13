CREATE TABLE fine                               /*Создать таблицу fine*/
    (fine_id INT PRIMARY KEY AUTO_INCREMENT,    /* столбец  автозаполнение */
    name VARCHAR(30),                           /* столбец строка до 30 символов */
    number_plate VARCHAR(6),                    /* столбец строка до 6 символов */
    violation VARCHAR(50),                      /* столбец строка до 50 символов */
    sum_fine DECIMAL(8, 2),                     /* столбец дробное число */
    date_violation DATE,                        /* столбец дата */
    date_payment DATE);                         /* столбец дата */

