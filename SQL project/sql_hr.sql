USE sql_hr;
SELECT *
FROM employees;

-- retrieve customer with salary below 50000
SELECT *
FROM employees
WHERE salary < 50000;

-- which employee receive the highest paid salary
SELECT *
FROM employees
ORDER BY salary desc
LIMIT 1;

-- which employee recieve the lowest paid salary
SELECT *
FROM employees
ORDER BY salary 
LIMIT 1;

-- Retrieve the salary paid to the General Manager
SELECT *
FROM employees
WHERE job_title = 'General Manager';

-- retrieve the 5 highest paid salary
SELECT *
FROM employees
ORDER BY salary desc
LIMIT 5;

SELECT max(salary)
FROM employees;

-- where is office_id 5 located and who are in that office. also whats their job_title
select *
from offices o 
join employees e 
on o.office_id = e.office_id
where o.office_id = 5;

-- where is the office of the Executive Secretary located and what his name
select o.office_id, address, city, state, first_name, last_name
from offices o 
join employees e 
on o.office_id = e.office_id
where job_title = 'Executive Secretary';

-- who did each staff report to in the office
select a.employee_id, a.first_name, a.last_name, a.job_title,
		b.first_name, b.last_name
from employees a 
join employees b
on a.reports_to = b.employee_id;