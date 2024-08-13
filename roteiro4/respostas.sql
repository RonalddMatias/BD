-- 1. Retornar todos os elementos da tabela department
SELECT * FROM department;

-- 2. Retornar todos os elementos da tabela dependent
SELECT * FROM dependent;

-- 3. Retornar todos os elementos da tabela dept_locations
SELECT * FROM dept_locations;

-- 4. Retornar todos os elementos da tabela employee
SELECT * FROM employee;

-- 5. Retornar todos os elementos da tabela project
SELECT * FROM project;

-- 6. Retornar todos os elementos da tabela works_on
SELECT * FROM works_on;

-- 7. Retornar os nomes (primeiro e último) dos funcionários homens
SELECT fname, lname FROM employee WHERE (sex = 'M');

-- 8. Retornar os nomes (primeiro e último) dos funcionários homens que não possuem supervisores
SELECT fname, lname FROM employee WHERE (sex = 'M') AND (superssn IS NULL);

-- 9. Retornar os nomes (primeiro) e o nome (primeiro) do seu supervisor, apenas para os funcionários que possuem supervisores.
SELECT e1.fname, e2.fname FROM employee e1, employee e2  WHERE (e1.ssn = e2.superssn);

-- 10. Retornar os nomes (primeiro) dos funcionários cujos supervisor se chama Franklin
SELECT e1.fname FROM employee e1, employee e2 WHERE (e1.superssn = e2.ssn) AND (e2.fname = 'Franklin');

-- 11. Retornar os departamento e a sua localização.
SELECT d1.dname, d2.dlocation FROM department d1, dept_locations d2 WHERE (d1.dnumber = d2.dnumber);

-- 12. Retornar os nomes dos departamentos localizados em cidades que começam com a letra 'S'.
SELECT d1.dname FROM department d1, dept_locations d2 WHERE (d1.dnumber = d2.dnumber) AND (d2.dlocation LIKE 'S%');

-- 13. Retornar os nomes (primeiro e ultimo) dos funcionários e seus dependentes (apenas para os funcionários que possuem dependentes).
SELECT e1.fname, e1.lname, d1.dependent_name FROM employee e1, dependent d1 WHERE (e1.ssn = d1.essn);

-- 14. Retornar o nome completo e o salário dos funcionarios que possuem salatrio maior do que 500000. A relação de retorno deve ter apenas duas colunas: "full_name" e "salary". O nome completo deve ser formado pela concatenção dos valores das 3 colunas com dados sobrenome. Use o operador || para concatenar os valores.
SELECT e1.fname || ' ' || e1.lname AS full_name,  e1.salary FROM employee e1 WHERE (salary > 50000);  


-- 15. Retornar os projetos (nome) e os departamentos responsáveis (nome)
SELECT p.pname, d.dname FROM project p, department d WHERE (p.dnum = d.dnumber);

-- 16. Retornar os projetos(nome) e os gerentes dos departamentos responsáveis (primeiro nome). Retornar resultados apenas para os projetos com com codigo maior do que 30.

SELECT p.pname, e.fname FROM project p, employee e, department d WHERE (e.ssn = d.mgrssn) AND (d.dnumber = p.dnum) AND (p.pnumber > 30);

-- 17. Retornar os projetos (nome) e ps funcionários que trabalham neles (primeiro nome).
SELECT p.pname, e.fname FROM project p, employee e, works_on w WHERE (w.pno = p.pnumber) AND (w.essn = e.ssn);

--18. Retornar os nomes dos dependesntes dos funcionários que trabalham no projeto com código 91. Retornar também o nome (primeiro) do funcionario e o relacionamento entre eles.
SELECT  e.fname, d.dependent_name, d.relationship FROM dependent d, employee e, works_on w, project p  WHERE(e.ssn = d.essn) AND (e.ssn = w.essn) AND (w.pno = p.pnumber) AND (p.pnumber = 91);

