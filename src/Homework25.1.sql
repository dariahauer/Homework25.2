1.
select * from employees where hire_date > '1990-01-01'  order by hire_date ;

2.
select count(emp_no) from employees where gender='F';

3.
select e.first_name, e.last_name,de.dept_name from employees e
JOIN dept_emp d on e.emp_no=d.emp_no
JOIN departments de on d.dept_no = de.dept_no;

4.
select first_name, last_name, max(birth_date) from employees where gender ='F';
select first_name, last_name, birth_date from employees where gender ='F' order by birth_date DESC LIMIT 1;

5.
select e.first_name, e.last_name, t.title from employees e join titles t on e.emp_no=t.emp_no and t.emp_no='10009 ';

6.
select e.first_name, e.last_name, t.title from employees e join titles t on e.emp_no=t.emp_no and t.to_date> curdate();

7.
select e.first_name, e.last_name, s.salary from salaries s join employees e on s.emp_no=e.emp_no where salary =  (select MAX(salary) from salaries);

8.
select e.first_name, e.last_name, salary from salaries s join employees e on s.emp_no=e.emp_no where salary = (select MAX(salary) from salaries)
or salary = (select MIN(salary) from salaries);

select e.first_name, e.last_name, salary from salaries s join employees e on s.emp_no=e.emp_no where salary in (select MAX(salary) from salaries)
or salary in (select MIN(salary) from salaries);

9.
wyświetlam managerów

  select m.emp_no, m.dept_no, e.first_name as manager_name, e.last_name as manager_mast_name from dept_manager m
    join employees e on m.emp_no=e.emp_no
    where m.to_date> curdate();

wyświetlam pracowników z id departamentu

  select a.first_name, a.last_name ,a.emp_no , b.dept_no from employees a
     join dept_emp b on a.emp_no = b.emp_no order by emp_no

10.
select distinct title from titles ;