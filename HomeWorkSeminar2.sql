-- ДОМАШНЕЕ ЗАДАНИЕ К СЕМИНАРУ 2. SQL – создание объектов, простые запросы выборки
-- 1. Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными

CREATE DATABASE HomeWork2;
USE HomeWork2;

CREATE TABLE sales
(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    order_date DATE NOT NULL,
    bucket VARCHAR(70) NOT NULL
);

INSERT sales (order_date, bucket)
VALUES ('2021-01-01', '101 to 300'),
       ('2021-01-02', '101 to 300'),
       ('2021-01-02', 'less than equal to 100'),
	   ('2021-01-04', '101 to 300'),
	   ('2021-01-05', 'greater than 300');
       
SELECT * FROM sales;       

-- 2. Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300.

SELECT
CASE
    WHEN bucket = '101 to 300' THEN 'Average order'
    WHEN bucket = 'less than equal to 100' THEN 'Small order'
    ELSE 'Large order'
END  Order_value

FROM sales

-- 4. Создайте таблицу “orders”, заполните ее значениями. Покажите “полный” статус заказа, используя оператор CASE

CREATE TABLE orders
(
	orderid INT PRIMARY KEY AUTO_INCREMENT,
    employeeid CHAR(3) NOT NULL,
    amount INT NOT NULL,
    orderstatus VARCHAR(30) NOT NULL
);

INSERT orders (employeeid, amount, orderstatus)
VALUES ('e03', 15.00,'OPEN'),
       ('e01', 25.50,'OPEN'),
	   ('e05', 100.70,'CLOSED'),
       ('e02', 22.18,'OPEN'),
       ('e04', 9.50,'CANCELLED'),
       ('e04', 99.99,'OPEN');
       
SELECT * FROM orders; 

SELECT
CASE
    WHEN ORDERSTATUS = 'OPEN' THEN 'Order is in open state'
	WHEN ORDERSTATUS = 'CLOSED' THEN 'Order is closed'
    ELSE 'Order is cancelled'
END Full_order_status

FROM orders

-- 4. Чем NULL отличается от 0?
/*
0 - это конкретное числовое значение, которое обозначает ноль или отсутствие какого-либо 
количества или величины. Оно может быть использовано в вычислениях и операциях с числами.
NULL - это специальное значение, которое указывает на отсутствие значения или неизвестное значение. 
Оно не является числовым значением и не может быть использовано в вычислениях или операциях с числами.
 NULL может быть присвоено столбцу, чтобы указать, что для данной строки значение отсутствует или неизвестно.
 */



