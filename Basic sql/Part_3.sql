-- Манипуляции с таблицами --

-- Создание таблиц
CREATE TABLE table_name
(
    column1 NUMBER NOT NULL,
    column2 varchar(50),
    CONSTRAINT ` FK_STUDENT ` PRIMARY KEY column1
);
CREATE TABLE table_name_2
(
    column1 NUMBER NOT NULL,
    city    varchar(50),
    CONSTRAINT column1_pmk2 PRIMARY KEY (column1)
);

-- Описать таблицу
DESCRIBE table_name3;

-- Вставка в таблицу одной стройки
INSERT INTO table_name3(column1, city)
VALUES (2, 'D3ZR');

-- Вставка нескольких
INSERT ALL
  INTO suppliers (supplier_id, supplier_name) VALUES (1000, 'INTEL')
  INTO suppliers (supplier_id, supplier_name) VALUES (2000, 'Linux')
  INTO suppliers (supplier_id, supplier_name) VALUES (3000, 'Google')
SELECT * FROM dual;

-- Изменить колонку (тип, имя), добавить колонку
ALTER TABLE table_name3
    MODIFY city VARCHAR (100) not null;

ALTER TABLE table_name3
    RENAME COLUMN column1 TO city_id;

ALTER TABLE table_name3
    ADD column3 VARCHAR(50);

-- Создать таблицу из селекта
CREATE table table4 AS
SELECT *
from emp;

-- Обновить поле в таблице
UPDATE table_name3
SET COLUMN3='1'
WHERE city LIKE '%D%';

-- Удалить записи
DELETE
FROM table_name3
WHERE CITY_ID > 5;

-- Удалить таблицу
DROP TABLE

-- Почистить без логов
TRUNCATE TABLE

-- Создать индекс для ускорения запросов
CREATE INDEX city_ind ON table_name3 (city)

-- Создать представление таблицы (виртульная временная) для дальнейшних манипуляций
CREATE VIEW manager_query AS
select *
from emp
where job = 'MANAGER';
SELECT *
FROM manager_query;

-- Дропнуть
DROP VIEW manager_query;

-- Сложный запросик с view, join, sub query, group by --
CREATE
    (or relace)
    VIEW super_emp AS
select *
from emp e1
         INNER JOIN
         (select store_id, max(sal) sal from emp group by store_id) e2
         ON e1.store_id = e2.store_id
             AND e1.sal = e2.sal


--- ОБъеденение нескольких SELECTов
-- UNION [ALL]  # ALL - дубликаты выводить
SELECT model, price FROM PC
UNION
SELECT model, price FROM Laptop
ORDER BY price DESC;
