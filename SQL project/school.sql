-- USING THE SCHOOL_DB ANSWER THE FOLLOWING QUESTION
use school;
-- 1. Retrieve the details of courses in each department
select course_id, course_name, d.department_id, department_name
from course c
join departments d
on c.department_id = d.department_id;

-- 2. Retrieve the details of  professor that is advisor for science student
select p.professor_id, p.first_name, p.last_name, p.department_id, d.department_name, a.advisor_id
from professors p
join departments d
on p.department_id = d.department_id
join advisors a
on a.professor_id = p.professor_id
where d.department_name = 'science';

-- 3. How many students havent enrolled for the school
select *
from students s
left join enrollments e
on s.student_id = e.student_id
where enrollment_date is null;

-- 4. Retrieve the details of professors that arent advisors in the school
select *
from professors p
left join advisors a
on p.professor_id = a.professor_id
where advisor_id is null;

-- 5. What course_id is 229 and which department is taking the course
select c.course_id, c.course_name, d.department_id, d.department_name
from course c
join departments d
on c.department_id = d.department_id
where c.course_id = 229;

-- 6. which students have the highest grade, date of enrollment and what years was he born?
select s.student_id, s.first_name, s.last_name, s.dateofbirth, e.enrollment_id, e.enrollment_date, e.grade
from students s
join enrollments e
on s.student_id = e.student_id
order by grade desc;

-- 7. What is details of professor_id 2204
select *
from professors
where professor_id = 2204;

-- 8. How many student are in the class register
select count(student_id)
from students;

-- 9. what is the average grade of the student
select avg(grade)
from enrollments;

-- 10. which student are born below the year 1991
select *
from students
where dateofbirth < '1991-01-01';

-- 11. Retrieve the details of names of students in the register
select register_id, s.first_name, s.last_name, time_in
from students s
join register r
on r.student_id = s.student_id;
