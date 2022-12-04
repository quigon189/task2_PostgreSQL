SELECT surname FROM employees WHERE salary IN (SELECT MAX(salary) FROM employees);

SELECT surname FROM employees ORDER BY surname;

SELECT grade, AVG(age(start_date)) FROM employees GROUP BY grade;

SELECT surname, name FROM employees JOIN departments ON employees.department_id = departments.id;

with department_max_salary as (
	select department_id, max(salary) as max_salary from employees e
	group by department_id 
)
select name, surname, salary from employees e 
	left join departments d on e.department_id = d.id
	where e.salary in (select max_salary from department_max_salary dms);