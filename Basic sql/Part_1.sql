-- Запрос  на выборку данных
SELECT column_1, column_2, column_3 FROM table_name;

-- Запрос уникальных данных + выборка по столбцам
SELECT DISTINCT column_1 WHERE column_1 > 0 AND column_2 = 1 AND column_3 <> 4  OR column_4 < 100;

-- Выборка по столбцам с математикой
SELECT * FROM table_name WHERE (unit_price + commission) * tax_rate > 50;


/* Операторы:
	= # equals
	!= # not equals
	< # less then
	> # greater than
	>= #
	<= #
	<> # like !=
*/

-- Выборка один из
SELECT * FROM t WHERE column_1 IN (value1, value2, value3);
-- Не один из
SELECT * FROM t	WHERE column_1 NOT IN (value1, value2, value3);
-- Между один и два. Два > один. Значения включены
SELECT * FROM t	WHERE column_1 BETWEEN value1 AND value2;
SELECT * FROM t	WHERE column_1 NOT BETWEEN value1 AND value2;
-- Пустое и не пустое значение
SELECT * FROM t	WHERE column_1 IS NULL;
SELECT * FROM t	WHERE column_1 IS NOT NULL;
--  % - o AND more, _  - 1 symbol '% % %' - 2 spaces
SELECT * FROM t	WHERE column_1 LIKE 'S%' OR column_2 LIKE '%END';
-- NOT LIKE
-- спец символы ищем 25 процентов ( ESCAPE '|' - показывает знак того что далее ищем как есть)
SELECT * FROM t	WHERE column_1	LIKE '25|%' ESCAPE '|';

-- Алиасы для вовода колонок
SELECT ename "EMPLOYEE NAME", sal SALARY, comm FROM t;
SELECT ename AS "EMPLOYEE NAME", sal AS SALARY FROM t;

-- Склеить строку со стобцом
SELECT 'Hello, my name is '||ename FROM t;

-- Упорядочить по колонке ASC/DESC (DESC - reverse ordering  ASC - by default)
-- Значение ASC сортирует от низких значений к высоким. Значение DESC сортирует от высоких значений к низким
SELECT column_1, column_2 FROM t ORDER BY column_2 DESC;

-- Comments: /*  */
-- Интерпретация команд Interpreter -> Table -> WHERE -> SELECT


-- Базовые функции над строкой
/*
concat() # Склеить
upper()
lower()
initcap() # Первый символ большой
lenght() # Длина строки
*/

-- Использование
SELECT concat('name is ', ename) AS "Sentence" FROM emp;
SELECT upper('name is') FROM emp;
SELECT 'name is' FROM emp;
SELECT upper('name is') FROM DUAL; -- специальная таблица с одной строкой
SELECT 'pizza', 'fanta', upper('name is') AS "this is function" FROM DUAL;
SELECT concat(lower(ename), ' is the name') FROM emp;
-- Сложное
SELECT concat(concat(lower(ename), ' is the name'), concat('AND their job is: ', job)) AS "function call" FROM emp WHERE deptno = 20;
SELECT * FROM emp WHERE job = upper('manager');
SELECT initcap('hello hello world') AS sentence FROM dual;
SELECT length('hello hello world') AS sentence FROM dual;

-----------------
-----------------
---Просто примеры:
SELECT * FROM emp;
SELECT job,ename FROM emp;
SELECT DISTINCT job FROM emp;
SELECT * FROM emp WHERE job = 'MANAGER';
SELECT * FROM emp WHERE ename = 'JONES';
SELECT * FROM emp WHERE job = 'SALESMAN' AND sal = 1600 AND comm = 300;
SELECT * FROM emp WHERE job != 'SALESMAN';
SELECT * FROM emp WHERE job = 'SALESMAN' AND sal != 1500;
SELECT * FROM emp WHERE sal < 2500 ; -- 2500 > sal is also correct
SELECT * FROM emp WHERE sal < comm ;
SELECT * FROM emp WHERE job != 'MANAGER' AND  sal > 2500 AND deptno = 20;
SELECT * FROM emp WHERE job = 'SALESMAN' OR job = 'MANAGER';
SELECT * FROM emp WHERE job != 'SALESMAN' OR job != 'MANAGER'; # return all (because AS minimum one condition should be true)
SELECT * FROM emp WHERE job IN ('SALESMAN', 'MANAGER');
SELECT * FROM emp WHERE deptno IN (20, 30);
SELECT * FROM emp WHERE deptno NOT IN (20, 30);
SELECT * FROM emp WHERE hiredate BETWEEN '17.12.80' AND '17.12.81';
SELECT * FROM emp WHERE sal BETWEEN 1000 AND 2000;
SELECT * FROM emp  WHERE comm  IS NOT NULL;
SELECT * FROM emp  WHERE comm IS NULL AND sal > 1100 AND sal < 5000 AND sal <> 3000 OR comm = 0;
SELECT * FROM emp  WHERE comm IS NULL AND sal > 1100 AND sal < 5000 OR comm = 0 AND sal <> 3000 ;  -- по факту(comm IS NULL AND sal > 1100 AND sal < 5000) OR (comm = 0 AND sal <> 3000)
SELECT * FROM emp  WHERE ( comm IS NULL AND sal > 1100 AND sal < 5000 AND sal <> 3000 ) OR comm = 0;
SELECT * FROM emp  WHERE ( comm = 0 OR comm IS NULL )  AND sal > 1100 AND sal < 5000 AND sal <> 1500 ;
SELECT * FROM emp WHERE job LIKE 'SAL%';
SELECT ename "EMPLOYEE NAME",sal SALARY, comm COMMISION FROM emp;
SELECT ename AS "EMPLOYEE NAME",sal AS SALARY, comm AS COMMISION FROM emp;
SELECT 'Hello, my name is '|| ename FROM emp WHERE job = 'MANAGER';
SELECT 'Hello, my name is '||ename AS "concatenated value" FROM emp WHERE job = 'MANAGER';
SELECT ename || ' makes '|| sal || ' per month' AS "amount employee makes" FROM emp;
SELECT ename, sal FROM emp ORDER BY ename;
SELECT ename, sal FROM emp ORDER BY sal;
SELECT ename, sal FROM emp ORDER BY sal DESC;
SELECT deptno, sal, ename FROM emp ORDER BY deptno, sal;
