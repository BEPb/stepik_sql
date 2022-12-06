/*Выведите сколько человек подало заявление на каждую образовательную 
программу и конкурс на нее (число поданных заявлений деленное на 
количество мест по плану), округленный до 2-х знаков после запятой. 
В запросе вывести название факультета, к которому относится 
образовательная программа, название образовательной программы,
 план набора абитуриентов на образовательную программу (plan), 
 количество поданных заявлений (Количество) и Конкурс. Информацию 
 отсортировать в порядке убывания конкурса.*/
SELECT name_department, name_program, plan, COUNT(enrollee_id) AS Количество, ROUND(COUNT(enrollee_id) / plan, 2) AS Конкурс
FROM department
    INNER JOIN program USING (department_id)
    INNER JOIN program_enrollee USING (program_id)
GROUP BY name_department, name_program, plan
ORDER BY Конкурс DESC;