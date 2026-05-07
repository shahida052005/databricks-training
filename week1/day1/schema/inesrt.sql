INSERT INTO Department (department_id, name)
VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance');

INSERT INTO Employee (employee_id, name, age, salary, department_id)
VALUES
(101, 'John Doe', 30, 60000, 1),
(102, 'Jane Smith', 28, 55000, 2);

INSERT INTO Project (project_id, name, department_id)
VALUES
(1, 'Payroll System', 1),
(2, 'Website Development', 2);
