FinTech Credit Risk Analysis
Project Overview
This project analyses loan portfolio data to identify credit risk patterns in a fintech lending
environment. Using SQL, I explored borrower characteristics and loan outcomes to answer
key business questions about default risk and what lenders can do about it.
This is a self-directed portfolio project built to demonstrate practical SQL skills for data
analyst roles in the financial services sector.

Business Problem
FinTech lenders face significant financial exposure from loan defaults. Without data-driven
insight into which borrower segments carry the most risk, lenders are making approval
decisions blind. This analysis identifies high-risk borrower profiles and provides actionable
recommendations to reduce default rates.

Tools & Skills Used
Tool Purpose
SQL Server Database querying and analysis
GitHub Version control and project hosting

SQL concepts demonstrated:
Aggregate functions ( COUNT , SUM , ROUND )
Conditional aggregation using CASE WHEN / THEN / ELSE
Percentage calculations across grouped data
GROUP BY and ORDER BY for segmentation analysis
Exploratory data analysis with SELECT queries

Dataset
The dataset contains loan records from a fintech lending portfolio. Each record includes:
Note: This dataset is sourced from publicly available lending data used for analytical
practice.
Column Description
loan_status Outcome — Fully Paid or Charged Off
grade Credit grade assigned to the borrower (A–G)
annual_inc Borrower’s annual income
purpose Stated reason for the loan
loan_amnt Total loan amount requested
dti Debt-to-income ratio
emp_length Borrower’s employment length

Key Business Questions
1. What is the overall default rate of the loan portfolio?
2. Which credit grades carry the highest default risk?
3. How does borrower income relate to loan default?
4. Which loan purposes show the highest default rates?
Analysis & SQL Queries
1. Overall Default Rate
SELECT
COUNT(*) AS total_loans,
SUM(CASE WHEN loan_status = 'Charged Off' THEN 1 ELSE 0 END) AS risky_loans,
ROUND(
SUM(CASE WHEN loan_status = 'Charged Off' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
2
) AS risk_rate_pct
FROM loans;
2. Default Rate by Credit Grade
SELECT
grade,
COUNT(*) AS total_loans,
SUM(CASE WHEN loan_status = 'Charged Off' THEN 1 ELSE 0 END) AS risky_loans
FROM loans
GROUP BY grade
ORDER BY risky_loans DESC;
3. Income vs Loan Status
SELECT annual_inc, loan_status
FROM loans
ORDER BY annual_inc;
4. Default Rate by Loan Purpose
SELECT
purpose,
COUNT(*) AS total_loans,
SUM(CASE WHEN loan_status = 'Charged Off' THEN 1 ELSE 0 END) AS risky_loans
FROM loans
GROUP BY purpose
ORDER BY risky_loans DESC;
Key Findings
Finding Detail
Overall default rate 50% of loans in the portfolio were charged off
Highest risk grade Grade C borrowers represent the largest share of defaults
Income pattern Lower income borrowers show a higher tendency toward default
Riskiest loan
purpose
Personal loans account for the highest number of charged-off
loans

Strategic Recommendations
Based on the analysis, FinTech lenders could reduce portfolio risk by:
1. Tightening Grade C approval criteria  Grade C represents a disproportionate share
of defaults. Stricter income verification or lower loan limits for this segment could
reduce exposure.
2. Introducing minimum income thresholds — The data suggests lower-income
borrowers default more frequently. A minimum income requirement or adjusted interest
rates for this segment would reduce risk.
3. Limiting personal loan amounts — Personal loans show the highest default volume.
Capping loan amounts or requiring additional documentation for this purpose could
improve outcomes.
4. Building a risk scoring model — Combining grade, income, DTI, and purpose into a
weighted risk score would allow more nuanced lending decisions beyond single-variable
analysis.

What I Learned
How to use conditional aggregation ( CASE WHEN ) to calculate default rates without
needing a subquery
How to segment risk across multiple borrower dimensions using GROUP BY
How to frame SQL output as business insight rather than just raw numbers
