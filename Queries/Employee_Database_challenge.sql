-- MODULE 7 CHALLENGE
-- DELIVERABLE 1: NUMBER OF RETIRING EMPLOYEES BY TITLE

--Create a table that includes retirees and titles
SELECT e.emp_no,
	e.first_name,
e.last_name,
	t.title,
	t.from_date,
	t.to_date
-- INTO retirement_titles
FROM employees as e
LEFT JOIN titles as t
	ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
	rt.first_name,
	rt.last_name,
	rt.title,
	rt.from_date,
	rt.to_date
-- INTO unique_titles
FROM retirement_titles as rt
ORDER BY rt.emp_no ASC, rt.to_date DESC;

-- Retiring by Title
SELECT COUNT(ut.title), ut.title
-- INTO retiring_titles
FROM unique_titles as ut
GROUP BY (ut.title)
ORDER BY COUNT(ut.title) DESC;

-- DELIVERABLE 2: EMPLOYEES ELIGIBLE FOR THE MENTORSHIP PROGRAM
-- Create a mentorship eligibility table
SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name,
e.last_name,
	de.from_date,
de.to_date,
	t.title
-- INTO mentorship_eligibility
FROM employees as e
	LEFT JOIN dept_emp as de
		ON (e.emp_no = de.emp_no)
	LEFT JOIN titles as t
		ON (e.emp_no = t.emp_no)
WHERE (de.to_date = '9999-01-01')
	AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY (e.emp_no);

