CREATE DATABASE homework3;
USE homework3;

-- ДОМАШНЯЯ РАБОТА К СЕМИНАРУ 3

-- Задание №2.

CREATE TABLE emploies
(
id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50) NOT NULL,
surname VARCHAR(50) NOT NULL,
specialty VARCHAR(50) NOT NULL,
seniority INT NOT NULL,
salary INT NOT NULL,
age INT NOT NULL
);

INSERT  emploies (name, surname, specialty, seniority, salary, age)
VALUES 
('Вася',	'Васькин',	'Начальник',	40,	100000,	60),
('Петя',	'Петькин',	'Начальник',	8,	70000,	30),
('Катя',	'Катькина',	'Инженер',	2,	70000,	25),
('Саша',	'Сашкин',	'Инженер',	12,	50000,	35),
('Иван',	'Иванов',	'Рабочий',	40,	30000,	59),
('Юра',	'Юркин',	'Рабочий',	5,	15000,	25),
('Максим',	'Воронин',	'Рабочий',	2,	11000,	22);

SELECT * FROM emploies;

-- 2.1 Отсортируйте поле “сумма” в порядке убывания и возрастания

SELECT * FROM emploies
ORDER BY salary;

SELECT * FROM emploies
ORDER BY salary DESC;

-- 2.2 Отсортируйте по возрастанию поле “Зарплата” и выведите 5 строк с наибольшей заработной платой

SELECT * FROM emploies
ORDER BY salary
LIMIT 5;

-- 2.3 Выполните группировку всех сотрудников по специальности “рабочий”, зарплата которых превышает 20000

SELECT specialty, salary FROM emploies
WHERE specialty = 'Рабочий'  AND salary > 20000;

-- Задание №1.
-- 1.1  Напишите запрос, который сосчитал бы все суммы заказов, выполненных 1 января 2016 года.

 CREATE TABLE Orders (
  idOrders int PRIMARY KEY AUTO_INCREMENT,
  ordersName varchar(50) NOT NULL,
  ordersPrice int NOT NULL,
  dataOrder date NOT NULL,
  customers varchar (30) NOT NULL,
  city varchar (40)
  );
  
  INSERT Orders(ordersName, ordersPrice, dataOrder, customers, city)
  VALUES ('Заказ1', 1000, '2016-01-01', 'ИвановИИ', 'Москва'),
         ('Заказ2', 2000, '2016-01-01', 'ПетровИИ', 'Москва'),
         ('Заказ3', 3000, '2016-01-02', 'СидоровИИ', 'Вологда'),
         ('Заказ4', 1000, '2016-01-01', 'СмирновИИ', 'Уфа'),
         ('Заказ5', 6000, '2016-01-03', 'ИвановИИ', 'Москва'),
         ('Заказ6', 1500, '2016-01-04', 'ВасечкинИИ', 'Питер'),
         ('Заказ7', 5000, '2016-01-05', 'КозявкинИИ', 'Арангельск');
         
SELECT * FROM Orders;      
   
SELECT dataOrder, SUM(ordersPrice) as sumOrders
FROM Orders
WHERE dataOrder = '2016-01-01';

-- 1.2 Напишите запрос, который сосчитал бы число различных, отличных от NULL значений поля city в таблице заказчиков

SELECT COUNT(DISTINCT city) as numberСities
FROM Orders;

-- 1.3 Напишите запрос, который выбрал бы наименьшую сумму для каждого заказчика.

SELECT MIN(ordersPrice) as minPrice, customers
FROM Orders
GROUP BY customers;

-- 1.4 Напишите запрос, который бы выбирал заказчиков чьи имена начинаются с буквы Г (C). Используется оператор "LIKE"

SELECT customers
FROM Orders
WHERE customers LIKE 'С%'
ORDER BY customers;




