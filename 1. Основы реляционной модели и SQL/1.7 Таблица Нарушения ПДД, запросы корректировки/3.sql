/*Вывести фамилию, номер машины и нарушение только для тех водителей, 
которые на одной машине нарушили одно и то же правило 
два и более раз. При этом учитывать все нарушения, независимо от 
того оплачены они или нет. Информацию отсортировать в алфавитном 
порядке, сначала по фамилии водителя, потом по номеру машины и, наконец, по нарушению.*/


UPDATE fine AS f, traffic_violation AS tv
SET f.sum_fine = tv.sum_fine                                /* обновляем поле sum_fine в таблице fine данными из такого же поля таблицы tv */
WHERE tv.violation = f.violation and f.sum_fine IS Null;    /* где значения уже заполнены скопировать их */
                                                            /* если не указать where то код заменит все значения во всей таблице и тогда у первого ФИО поменяется штраф)*/


UPDATE fine AS f, traffic_violation AS tv
SET f.sum_fine = IF(f.sum_fine IS Null, tv.sum_fine, f.sum_fine)
WHERE tv.violation = f.violation;

Update fine as f, traffic_violation as tv
set f.sum_fine=tv.sum_fine
where f.violation=tv.violation and f.sum_fine is null




update fine as f
set f.sum_fine =
                (Select tv.sum_fine
                 from traffic_violation as tv
                 where f.violation = tv.violation)
where f.sum_fine is null;

