1.
SELECT * from employees WHERE hire_date > '1990-01-01'  order by hire_date ;

2.
SELECT count(emp_no) FROM employees WHERE gender='F';

3.
SELECT e.first_name, e.last_name,de.dept_name FROM employees e
JOIN dept_emp d ON e.emp_no=d.emp_no
JOIN departments de ON d.dept_no = de.dept_no;

4.
SELECT first_name, last_name, max(birth_date) FROM employees WHERE gender ='F';
SELECT first_name, last_name, birth_date FROM employees WHERE gender ='F' order by birth_date DESC LIMIT 1;

5.
SELECT e.first_name, e.last_name, t.title FROM employees e JOIN titles t ON e.emp_no=t.emp_no and t.emp_no='10009 ';

6.
SELECT e.first_name, e.last_name, t.title FROM employees e JOIN titles t ON e.emp_no=t.emp_no and t.to_date> curdate();

7.
SELECT e.first_name, e.last_name, s.salary FROM salaries s JOIN employees e ON s.emp_no=e.emp_no WHERE salary =  (SELECT MAX(salary) FROM salaries);

8.
SELECT e.first_name, e.last_name, salary FROM salaries s JOIN employees e ON s.emp_no=e.emp_no WHERE salary = (SELECT MAX(salary) FROM salaries)
or salary = (SELECT MIN(salary) FROM salaries);

SELECT e.first_name, e.last_name, salary FROM salaries s JOIN employees e ON s.emp_no=e.emp_no WHERE salary in (SELECT MAX(salary) FROM salaries)
or salary in (SELECT MIN(salary) FROM salaries);

9.
wyświetlam managerów

  SELECT m.emp_no, m.dept_no, e.first_name as manager_name, e.last_name as manager_mast_name FROM dept_manager m
    JOIN employees e ON m.emp_no=e.emp_no
    WHERE m.to_date> curdate();

wyświetlam pracowników z id departamentu

  SELECT a.first_name, a.last_name ,a.emp_no , b.dept_no FROM employees a
     JOIN dept_emp b ON a.emp_no = b.emp_no order by emp_no

10.
SELECT distinct title FROM titles ;