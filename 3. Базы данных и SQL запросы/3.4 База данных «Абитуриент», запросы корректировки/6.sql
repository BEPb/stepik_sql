/*Занести в столбец str_id таблицы applicant_order 
нумерацию абитуриентов, которая начинается с 1 для каждой образовательной программы.*/
SET @num_pr = 0;
SET @row_num = 1;
UPDATE applicant_order 
    INNER JOIN (SELECT *, if(program_id = @num_pr, @row_num := @row_num + 1, @row_num := 1) AS str_num, @num_pr := program_id AS add_var from applicant_order) AS buff
    ON applicant_order.program_id = buff.program_id AND applicant_order.enrollee_id = buff.enrollee_id
SET applicant_order.str_id = buff.str_num;
SELECT * FROM applicant_order;