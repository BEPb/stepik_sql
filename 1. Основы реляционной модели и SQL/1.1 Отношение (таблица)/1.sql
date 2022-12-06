CREATE TABLE book(                              /*Создать таблицу с именем book*/
    book_id INT PRIMARY KEY AUTO_INCREMENT,     /*Столбец book_id целое число атоматическое заполнение*/
    title VARCHAR(50),                          /*Столбец title строка до 50 символов*/
    author VARCHAR(30),                         /*Столбец author строка до 30 символов*/
    price DECIMAL(8, 2),                        /*Столбец price число до 8 символов 2 из них дробь*/
    amount INT);                                /*Столбец amount целое число*/