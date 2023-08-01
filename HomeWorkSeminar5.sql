-- ДОМАШНЯЯ РАБОТА К СЕМИНАРУ 5

-- Задание 1

CREATE DATABASE lesson5;
USE lesson5;

create table if not exists auto (
	id_auto int auto_increment primary key,
    name varchar(50) not null,
    cost decimal (10, 2) check (cost > 0)
);

insert into auto (name, cost) values
('Audi', 52642.00),
('Mersedes', 57127.00),
('Skoda', 9000.00),
('Volvo', 29000.00),
('Bently', 350000.00),
('Citroen', 21000.00),
('Hummer', 41400.00),
('Volkswagen', 21600.00);

select * from auto;

-- 1.1	Создайте представление, в которое попадут автомобили стоимостью  до 25 000 долларов
create or replace view car_cost as
(select * from auto where cost < 25000.00);

select * from car_cost;

-- 1.2	Изменить в существующем представлении порог для стоимости:
--      пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW)

alter view car_cost as
(select * from auto where cost < 30000.00);

select * from car_cost;

-- 1.3 	Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”

create or replace view car_model as
(select * from auto where name in ('Skoda', 'Audi'));

select * from car_model;

-- Задание 2

-- Вывести название и цену для всех анализов, которые продавались 5 февраля 2020 и всю следующую неделю. 
-- Есть таблица анализов Analysis: an_id — ID анализа; an_name — название анализа; an_cost — себестоимость анализа; an_price — розничная цена анализа; an_group — группа анализов. 
-- Есть таблица групп анализов Groups: gr_id — ID группы; gr_name — название группы; gr_temp — температурный режим хранения. 
-- Есть таблица заказов Orders: ord_id — ID заказа; ord_datetime — дата и время заказа; ord_an — ID анализа.

-- 1
CREATE TABLE if not exists Groupses
(
    gr_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    gr_name VARCHAR(100) NOT NULL,
    gr_temp FLOAT
);

INSERT INTO Groupses (gr_name, gr_temp)
VALUES ('Группа анализов №1', -18.5),
       ('Группа анализов №2', -15),
       ('Группа анализов №3', -1.5);

SELECT * FROM Groupses;

-- 2
CREATE TABLE if not exists Analysis 
(
    an_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    an_name VARCHAR(100) NOT NULL,
    an_cost DECIMAL (10,2),
    an_price DECIMAL (10,2) CHECK (an_price > 0),
    an_group INT,
    FOREIGN KEY (an_group) REFERENCES Groupses(gr_id) ON DELETE CASCADE
);

INSERT INTO Analysis (an_name, an_cost, an_price, an_group) 
VALUES ('Анализ №1', 1000.00, 3300.00, 1),
       ('Анализ №2', 3000.00, 6000.00, 1),
       ('Анализ №3', 1500.00, 4500.00, 2),
       ('Анализ №4', 5500.00, 2125.00, 2),
       ('Анализ №5', 1500.00, 4000.00, 3),
       ('Анализ №6', 5000.00, 13000.00, 3);

SELECT * FROM Analysis;

-- 3
CREATE TABLE if not exists Orders
(
    ord_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ord_datetime TIMESTAMP,
    ord_an INT,
    FOREIGN KEY (ord_an) REFERENCES Analysis(an_id) ON DELETE CASCADE
);

INSERT INTO Orders (ord_datetime, ord_an) 
VALUES ('2020-01-30 09:00:00', 1),
       ('2020-02-06 14:00:00', 2),
       ('2020-02-06 13:30:00', 3),
       ('2020-02-07 15:30:00', 4),
       ('2020-02-09 12:00:00', 5),
       ('2020-02-10 11:30:00', 6),
       ('2020-02-05 14:30:00', 3),
       ('2020-02-08 12:30:00', 2),
       ('2020-02-14 11:00:00', 1);

SELECT * FROM Orders;

-- Запрос
WITH date_ord AS
(SELECT * FROM Orders
WHERE ord_datetime REGEXP '2020-02-([0][5-9]|[1][0-2])')
SELECT an_name 'Название анализа', an_price 'Стоимость анализа', ord_datetime 'Дата проведения'
FROM Analysis JOIN date_ord ON an_id = ord_an ORDER BY ord_datetime;

