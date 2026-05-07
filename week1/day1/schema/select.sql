-- 1.Display all employees
select * from Employee;

-- 2.Display employee names and their salaries
select name, salary from Employee;

-- 3.Display employees who belong to department_id = 1
select * from Employee where department_id = 1;

-- 4.Display all departments
select * from Department;

-- 5.Display all projects
select * from Project;
-- 6.Display employees whose age is greater than 30
select * from Employee where age > 30;

-- 7.Display employees whose salary is greater than 50000
select * from Employee where salary > 50000;

-- 8.Display employees sorted by salary (highest first)
select * from Employee order by salary desc;

-- 9.Count total number of employees
select count(*) from Employee;

-- 10.Find average salary of employees
select avg(salary) from Employee;

-- 11.Display employees whose age is between 25 and 35
select * from Employee where age between 25 and 35;

-- 12.Display employees whose salary is between 50000 and 70000
select * from Employee where salary between 50000 and 70000;

-- 13.Display employees whose name starts with 'J'
select * from Employee where name like 'J%';

-- 14.Display employees whose name contains 'e'
select * from Employee where name like '%e%';

-- 15.Display employees sorted by age (youngest first)
select * from Employee order by age asc;


-- 16.Display employees whose salary is less than 60000
select * from Employee where salary < 60000;

-- 17.Display employees hired after 2020
select * from Employee where hire_date > '2020-01-01';

-- 18.Display employees with department_id 2 or 3
select * from Employee where department_id in (2, 3);

-- 19.Display employees whose salary is not equal to 50000
select * from Employee where salary != 50000;

-- 20.Display employees sorted by name (A to Z)
select * from Employee order by name asc;

-- 21.Count number of employees in each department
select department_id, count(*) as total_employees
from Employee
group by department_id;

-- 22.Find average salary in each department
select department_id, avg(salary) as avg_salary
from Employee
group by department_id;

-- 23.Find maximum salary in each department
select department_id, max(salary) as max_salary
from Employee
group by department_id;

-- 24.Find minimum salary in each department
select department_id, min(salary) as min_salary
from Employee
group by department_id;

-- 25.Count employees hired after 2020
select count(*) 
from Employee
where hire_date > '2020-01-01';

-- 26.Display employee names with their department names
select e.name, d.name as department
from Employee e
join Department d on e.department_id = d.department_id;

-- 27.Display all employees and their departments (including those without department)
select e.name, d.name as department
from Employee e
left join Department d on e.department_id = d.department_id;

-- 28.Display all departments and their employees (including departments with no employees)
select d.name, e.name as employee
from Department d
left join Employee e on d.department_id = e.department_id;

-- 29.Display project names with their department names
select p.name, d.name as department
from Project p
join Department d on p.department_id = d.department_id;

-- 30.Display employee names and project names (based on department)
select e.name as employee, p.name as project
from Employee e
join Project p on e.department_id = p.department_id;

-- 31.Find employees who earn more than the average salary
select * from Employee
where salary > (select avg(salary) from Employee);

-- 32.Find employees who earn the maximum salary
select * from Employee
where salary = (select max(salary) from Employee);

-- 33.Find employees who earn the minimum salary
select * from Employee
where salary = (select min(salary) from Employee);

-- 34.Find employees who belong to the same department as 'John Doe'
select * from Employee
where department_id = (
    select department_id from Employee where name = 'John Doe'
);

-- 35.Find departments that have at least one employee
select * from Department
where department_id in (
    select department_id from Employee
);



-- 36.Find departments with more than 1 employee
select department_id, count(*) as total_employees
from Employee
group by department_id
having count(*) > 1;

-- 37.Find departments where average salary is greater than 55000
select department_id, avg(salary) as avg_salary
from Employee
group by department_id
having avg(salary) > 55000;

-- 38.Find employees who do not belong to any department
select * from Employee
where department_id is null;

-- 39.Find projects that do not belong to any department
select * from Project
where department_id is null;

-- 40.Find total salary of employees in each department and show only those > 100000
select department_id, sum(salary) as total_salary
from Employee
group by department_id
having sum(salary) > 100000;

-- 41.Find the second highest salary
select max(salary) 
from Employee
where salary < (select max(salary) from Employee);

-- 42.Display employees who work in departments that have projects
select * from Employee
where department_id in (
    select distinct department_id from Project
);

-- 43.Find employees whose salary is above the average salary of their department
select * from Employee e
where salary > (
    select avg(salary)
    from Employee
    where department_id = e.department_id
);

-- 44.Display departments that do not have any employees
select * from Department
where department_id not in (
    select department_id from Employee where department_id is not null
);

-- 45.Find employees hired before the average hire date
select * from Employee
where hire_date < (select avg(hire_date) from Employee);

-- 46.Find the highest paid employee in each department
select department_id, max(salary) as highest_salary
from Employee
group by department_id;

-- 47.Display employee names along with number of projects in their department
select e.name, count(p.project_id) as total_projects
from Employee e
left join Project p on e.department_id = p.department_id
group by e.name;

-- 48.Find departments that have more than 1 project
select department_id, count(*) as total_projects
from Project
group by department_id
having count(*) > 1;

-- 49.Display employees whose name has exactly 4 characters
select * from Employee
where length(name) = 4;

-- 50.Display employees ordered by hire date (newest first)
select * from Employee
order by hire_date desc;


-- 51.Find employees whose salary is the same as at least one other employee
select * from Employee
where salary in (
    select salary from Employee group by salary having count(*) > 1
);

-- 52.Display employees who are the youngest in the company
select * from Employee
where age = (select min(age) from Employee);

-- 53.Find employees working in departments with no projects
select * from Employee
where department_id not in (
    select distinct department_id from Project where department_id is not null
);

-- 54.Display total number of projects in each department (including departments with zero projects)
select d.name, count(p.project_id) as total_projects
from Department d
left join Project p on d.department_id = p.department_id
group by d.name;

-- 55.Find employees whose hire date is the earliest
select * from Employee
where hire_date = (select min(hire_date) from Employee);


-- 56.Display employees whose salary is above the overall average salary
select * from Employee
where salary > (select avg(salary) from Employee);

-- 57.Find the total number of employees in the company
select count(*) as total_employees from Employee;

-- 58.Display department names along with total salary of employees in each department
select d.name, sum(e.salary) as total_salary
from Department d
left join Employee e on d.department_id = e.department_id
group by d.name;

-- 59.Find employees who work in the same department as 'Jane Smith'
select * from Employee
where department_id = (
    select department_id from Employee where name = 'Jane Smith'
);

-- 60.Display all projects sorted by name
select * from Project
order by name asc;

-- 61.Find employees whose salary is greater than all employees in HR department
select * from Employee
where salary > all (
    select salary from Employee
    where department_id = (
        select department_id from Department where name = 'HR'
    )
);

-- 62.Display employees who are not working in any project (based on department)
select * from Employee
where department_id not in (
    select distinct department_id from Project where department_id is not null
);

-- 63.Find departments with no projects
select * from Department
where department_id not in (
    select distinct department_id from Project where department_id is not null
);

-- 64.Display employees whose age is above average age
select * from Employee
where age > (select avg(age) from Employee);

-- 65.Find the department with highest total salary
select d.name, sum(e.salary) as total_salary
from Department d
join Employee e on d.department_id = e.department_id
group by d.name
order by total_salary desc
limit 1;
