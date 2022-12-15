UPDATE fine AS f, traffic_violation AS tv                   /* обновляем таблицу fine, используя как источник таблицу traffic_violation */
SET f.sum_fine = tv.sum_fine                                /* обновляем поле sum_fine в таблице fine данными из такого же поля таблицы tv */
WHERE tv.violation = f.violation and f.sum_fine IS Null;    /* где значения уже заполнены скопировать их */
                                                            /* если не указать where то код заменит все значения во всей таблице и тогда у первого ФИО поменяется штраф)*/
