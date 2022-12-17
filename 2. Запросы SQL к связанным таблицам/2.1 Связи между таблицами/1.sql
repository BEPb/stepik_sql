CREATE TABLE author(                /* создать таблицу */
    author_id INT AUTO_INCREMENT,   /* столбец автозаполнение */
    name_author VARCHAR(50),        /* столбец строка до 50 символов */
    PRIMARY KEY (author_id)         /* столбец главный ключ PK */
);