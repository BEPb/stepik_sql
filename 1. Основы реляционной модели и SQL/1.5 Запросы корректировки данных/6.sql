/*В таблице book необходимо скорректировать значение 
для покупателя в столбце buy таким образом, 
чтобы оно не превышало допустимый остаток в 
столбце amount. А цену тех книг, которые покупатель не заказывал, снизить на 10%.*/
UPDATE book SET buy = IF(amount - buy < 0, amount, buy);    /* В таблице book изменить значение столбца buy */
UPDATE book SET price = price * 0.9 WHERE buy = 0;          /* В таблице book изменить значение столбца price */


update book set buy = if(buy > amount, amount, buy),        /* В таблице book изменить значение столбца buy */
                price = if(buy = 0, price * 0.9, price);    /* изменить значение столбца price */
