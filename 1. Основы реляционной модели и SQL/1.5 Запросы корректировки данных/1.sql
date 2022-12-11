CREATE TABLE supply                                 /* Создать таблицу поставка (supply)  */
    (supply_id INT PRIMARY KEY AUTO_INCREMENT,      /* столбец supply_id целое число автозаполнение */
    title VARCHAR(50),                              /* столбец title текст до 50 символов */
    author VARCHAR(30),                             /* столбец author текст до 30 символов */
    price DECIMAL(8, 2),                            /* столбец price дробное число */
    amount INT);                                    /* столбец amount целое число */
