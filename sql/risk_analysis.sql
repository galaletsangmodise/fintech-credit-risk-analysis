--Check dataset
SELECT *
FROM loans;

-- Overall defalt rate
SELECT 
	COUNT (*) AS total_loans,
	SUM(CASE WHEN loan_status = 'Charged Off' THEN 1 ELSE 0 END) AS risky_loans,
	ROUND (
			SUM(CASE WHEN loan_status = 'Charged Off' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
			2
			)
			AS risk_rate_pct 
FROM loans;

-- Risk by credit grade
SELECT grade,
	COUNT(*) AS total_loans,
	SUM(CASE WHEN loan_status = 'Charged Off' THEN 1 ELSE 0 END) AS risky_loans
	FROM loans
	GROUP BY grade
	ORDER BY risky_loans DESC;


-- Risk by income
SELECT annual_inc,loan_status
FROM loans
ORDER BY annual_inc;

-- Risk by loan purpose
SELECT
	purpose,
	COUNT(*) AS total_loans,
	SUM (CASE WHEN loan_status = 'Charged Off' THEN 1 ELSE 0 END)AS risky_loans
FROM loans
GROUP BY purpose
ORDER BY risky_loans DESC;
