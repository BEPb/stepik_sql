/*Отобрать все шаги, в которых рассматриваются вложенные запросы. 
Указать к какому уроку и модулю они относятся. Для этого вывести 3 поля:
	в поле Модуль указать номер модуля и его название через пробел;
	в поле Урок указать номер модуля, порядковый номер урока (lesson_position) 
через точку и название урока через пробел;
	в поле Шаг указать номер модуля, порядковый номер урока (lesson_position) 
через точку, порядковый номер шага (step_position) через точку и название шага через пробел.
Длину полей Модуль и Урок ограничить 19 символами, при этом слишком длинные 
надписи обозначить многоточием в конце (16 символов - это номер модуля или 
урока, пробел и  название Урока или Модуля,к ним присоединить "..."). 
Информацию отсортировать по возрастанию номеров модулей, порядковых 
номеров уроков и порядковых номеров шагов.*/
SELECT CONCAT(LEFT(CONCAT(CONCAT(module_id, " "), module_name), 16), "...") AS Модуль, 
    CONCAT(LEFT(CONCAT(CONCAT(CONCAT(module_id, "."), CONCAT(lesson_position, " ")), lesson_name), 16), "...") AS Урок,
    CONCAT(CONCAT(CONCAT(CONCAT(module_id, "."), CONCAT(lesson_position, ".")), CONCAT(step_position, " ")), step_name) AS Шаг
FROM module
    INNER JOIN lesson USING (module_id)
    INNER JOIN step USING (lesson_id)
WHERE step_name LIKE "%вложен%запрос%"
ORDER BY module_id, lesson_id, step_id;
