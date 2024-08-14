--1. Retornar quantas funcionárias estão cadastradas
SELECT COUNT(e.sex) FROM employee e WHERE (e.sex = 'F')

--2. Retornar a média de salário dos funcionários homens que moram no estado do TEXAS.
SELECT AVG(e.salary) FROM employee e WHERE RIGHT(e.address, 2) = 'TX' AND (e.sex = 'M');
--3. 
SELECT e.superssn AS ssn_supervisor, COUNT(e.ssn) AS qtd_supervisionados FROM employee e GROUP BY superssn ORDER BY qtd_supervisionados;

-- 4.
SELECT  e.fname AS nome_supervisor, COUNT(e.fname) AS qtd_supervisionados FROM employee e INNER JOIN employee s ON s.superssn = e.ssn GROUP BY nome_supervisor ORDER BY qtd_supervisionados;

SELECT  s.fname AS nome_supervisor, COUNT(e.ssn) AS qtd_supervisionados FROM employee e LEFT JOIN employee s ON s.superssn = e.ssn  GROUP BY nome_supervisor;