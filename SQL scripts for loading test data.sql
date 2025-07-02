SELECT * FROM Enrollment;
SELECT * FROM Session;
SELECT * FROM User;

SELECT u.username, s.session_id, c.course_name, e.enrolled_on
FROM Enrollment e
JOIN User u ON e.user_id = u.user_id
JOIN Session s ON e.session_id = s.session_id
JOIN Course c ON s.course_id = c.course_id
WHERE s.session_id = 6;

SELECT DISTINCT u.username, d.department_name
FROM Session s
JOIN Course c ON s.course_id = c.course_id
JOIN Department d ON c.department_id = d.department_id
JOIN User u ON s.instructor_id = u.user_id
WHERE d.department_name = 'Information Systems';

SELECT s.session_id, c.course_name, s.max_capacity, s.current_enrollment,
       (s.max_capacity - s.current_enrollment) AS available_slots
FROM Session s
JOIN Course c ON s.course_id = c.course_id
WHERE s.session_id = 1;

SELECT u.username, COUNT(*) AS session_count
FROM Enrollment e
JOIN User u ON e.user_id = u.user_id
GROUP BY e.user_id
HAVING COUNT(*) > 1;





















