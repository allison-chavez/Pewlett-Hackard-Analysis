
-- DELIVERABLE 1
-- RETIREMENT TITLES QUERY
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	tt.title, 
	tt.from_date,
	tt.to_date
INTO retirement_titles
FROM employees AS e
	INNER JOIN titles AS tt
		ON (e.emp_no = tt.emp_no)
	WHERE (e.birth_date BETWEEN '2052-01-01' AND '2055-12-31')
	ORDER BY e.emp_no;



-- UNIQUE TITLES QUERY
SELECT DISTINCT ON (rt.emp_no) 
	rt.emp_no,
	rt.first_name,
	rt.last_name,
	rt.title
INTO unique_titles
FROM retirement_titles AS rt
ORDER BY rt.emp_no, rt.to_date DESC;

-- RETIRING TITLES QUERY
SELECT COUNT(ut.title),
	ut.title
INTO retiring_titles
FROM unique_titles AS ut
GROUP BY ut.title
ORDER BY COUNT(ut.title) DESC;

-- DELIVERABLE 2
-- Mentorship Eligibility 
SELECT DISTINCT ON (e.emp_no) 
	e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	tt.title
INTO mentorship_eligibility 
FROM employees AS e
	INNER JOIN dept_emp AS de
		ON (e.emp_no = de.emp_no)
	INNER JOIN titles AS tt
		ON (tt.emp_no = e.emp_no)
WHERE (e.birth_date BETWEEN '2065-01-01' AND '2065-12-31')
	AND (de.to_date = '1999-01-01')
ORDER BY e.emp_no;

SELECT * FROM mentorship_eligibility;