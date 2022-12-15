SELECT name, number_plate, violation        /* вывести столбцы */
    FROM fine                               /* таблицы */
    GROUP BY name, number_plate, violation  /* сгруппированные по */
    HAVING COUNT(*) >= 2                    /* имеющих повторения более или равных 2 */
    ORDER BY name, number_plate, violation  /* отосритировать сначала по фамилии, потом по номеру машины и, наконец, по нарушению */
