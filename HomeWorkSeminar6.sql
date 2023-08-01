
-- ДОМАШНЯЯ РАБОТА К СЕМИНАРУ 6

-- Задание 1
-- Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов.
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

DROP FUNCTION IF EXISTS secconvert;
DELIMITER //
CREATE FUNCTION secconvert(sec INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
	DECLARE res VARCHAR(100);
    IF (sec >= 0) THEN
		SET res = CONCAT(sec % 60, ' seconds');
		SET sec = sec DIV 60;
	ELSE
		SET res = 'отрицательное значение';
        RETURN res;
	END IF;
    IF (sec > 0) THEN
		SET res = CONCAT(sec % 60, ' minutes ', res);
		SET sec = sec DIV 60;
	END IF;
    IF (sec > 0) THEN
		SET res = CONCAT(sec % 24, ' hours ', res);
        SET sec = sec DIV 24;
	END IF;
    IF (sec > 0) THEN
		SET res = CONCAT(sec, ' days ', res);
	END IF;
    RETURN res;

END //
DELIMITER ;

SELECT secconvert(123456) AS 'Result';

-- Задание 2
-- Выведите только четные числа от 1 до 10. Пример: 2,4,6,8,10 

DROP PROCEDURE IF EXISTS even;
DELIMITER //
CREATE PROCEDURE even(IN start_number INT, IN end_number INT)
BEGIN
	DECLARE res VARCHAR(100) DEFAULT '';
	IF (start_number % 2 != 0) THEN SET start_number = start_number + 1;
	END IF;
	WHILE (start_number <= end_number) DO
		SET res = CONCAT(res, ' ', start_number);
        SET start_number = start_number + 2;
	END WHILE;
    SELECT res;
END //
DELIMITER ;

CALL even(1, 10);