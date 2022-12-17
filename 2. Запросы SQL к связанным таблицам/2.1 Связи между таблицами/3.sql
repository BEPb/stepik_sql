CREATE TABLE book (                                             /* создать таблицу */
      book_id INT PRIMARY KEY AUTO_INCREMENT,                   /* столбец целое число */
      title VARCHAR(50),                                        /* столбец строка 50 символов */
      author_id INT NOT NULL,                                   /* столбец целое число не ноль */
      genre_id INT,                                             /* столбец целое число */
      price DECIMAL(8,2),                                       /* столбец дробное число */
      amount INT,                                               /* столбец целое число */
      FOREIGN KEY (author_id)  REFERENCES author (author_id),   /* указываем внешний ключ */
      FOREIGN KEY (genre_id)  REFERENCES genre (genre_id)       /* указываем внешний ключ */
);

DESCRIBE book;                                                  /* информации о столбцах таблицы (тип значений, является ключом или нет и т.д.) */