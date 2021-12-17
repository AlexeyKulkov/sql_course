--- Интересные функции ---
/*
NVL(column_1, 0)  # позволяет заменить значение (берется 2-й аргумент), когда встречается NULL значение
NULLIF(value1, value2) # сравнивает value1 и value2. Если value1 = value2 функция возвращает NULL. В противном случае, она возвращает value1
*/
-- Использование
SELECT ename, NVL(comm, 0) FROM emp;
SELECT ename, NVL(to_char(comm), 'no data found') FROM emp;
SELECT ename, NVL(to_char(NULLIF(LENGTH(ename), 5)), 'hi') FROM emp;


-- Фугкции над группами
/*
max, min, sum, avg, count
*/
/*
GROUP BY -- групировка данных
HAVING <column> -- фильтр при группировки
Порядок:
1)SELECT
2)FROM
3)WHERE
4)GROUP BY
5)HAVING
6)ORDER BY
*/

-- Примеры использования max, min, sum, avg, count
SELECT max(sal) FROM emp;
SELECT min(sal) FROM emp;
SELECT sum(sal) FROM emp;
SELECT avg(sal) FROM emp;
SELECT count(sal) FROM emp;
SELECT count(comm) FROM emp;
SELECT count(*) FROM emp;

SELECT sum(sal)/count(*), avg(sal) FROM emp;
SELECT avg(sal), job FROM emp GROUP BY job;
SELECT count(*), job FROM emp GROUP BY job;

SELECT count(*), job FROM emp WHERE count(*) = 2 GROUP BY job; --!!! Такое не работает Can not use group function
SELECT count(*), job FROM emp GROUP BY job HAVING count(*) = 2;
SELECT count(*), job FROM emp GROUP BY job ORDER BY job

SELECT deptno, count(*) FROM emp GROUP BY deptno HAVING count(*) > 3;
SELECT count(*), job, deptno FROM emp GROUP BY job, deptno; -- Уникальные задачи (красный мерседес)

-- Подзапросы
SELECT * FROM dept WHERE deptno < ( SELECT deptno FROM dept WHERE deptno = 30 );
SELECT * FROM ( SELECT deptno FROM dept );
SELECT * FROM emp WHERE deptno = ( SELECT deptno FROM dept WHERE loc = 'CHICAGO' );
SELECT * FROM emp WHERE deptno in ( SELECT deptno FROM dept );
SELECT ename, ( SELECT ename, sal FROM emp WHERE sal>3000 ) FROM emp ; -- одна строка

-- Объеденения таблиц
SELECT * FROM dept, emp WHERE dept.deptno=emp.deptno;
SELECT * FROM dept, emp WHERE dept.deptno=emp.deptno and loc = 'DALLAS';
SELECT ename, job, sal, loc FROM dept, emp WHERE dept.deptno=emp.deptno and loc = 'DALLAS';
SELECT ename, job, sal, loc FROM dept d, emp e WHERE d.deptno=e.deptno and loc = 'DALLAS';

SELECT * FROM dept INNER JOIN  emp ON dept.deptno = emp.deptno;
SELECT * FROM dept LEFT OUTER JOIN emp ON dept.deptno = emp.deptno;
SELECT * FROM dept RIGHT OUTER JOIN emp ON dept.deptno = emp.deptno;
SELECT * FROM dept FULL OUTER JOIN emp ON dept.deptno = emp.deptno;

-- Оператор EXIST - true когда резульата подзапроса возвращает хотя бы что то
SELECT * FROM emp AS lap_product WHERE EXISTS (SELECT * FROM DUAL);
SELECT * FROM emp WHERE NOT EXISTS (SELECT * FROM dual);