use bank_loan_analysis;

Select count(id) as Total_Loan_Application from financial_loan;

select count(id) as PMTD_Total_Loan_Application from financial_loan
where 
Month(issue_date) = 11 AND year(issue_date)= 2021 ;

SELECT sum(loan_amount) AS MTD_Total_Funded_Amount from financial_loan
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

SELECT sum(loan_amount) AS PMTD_Total_Funded_Amount from financial_loan
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021
;

# Total received amount ?

select sum(total_payment) AS PMTD_Total_Amt_Received from financial_loan
WHERE 
issue_date = 11  ;


select round((int_rate), 4)*100 AS Total_Avg_Intrestrate from financial_loan
where Month(issue_date)= 11 ;

select AVG(dti)*100 AS Total_AVG_DTI from financial_loan;

SELECT * FROM financial_loan;

Select
 (count(case WHEN loan_status = "charged off" THEN id END)*100)
/
COUNT(id) AS BAD_Loan_Percentage
from financial_loan;


#Good Loan Application?

Select
 count(id) AS BAD_loan_funded_amt from financial_loan
 WHERE loan_status = "charged off" ;
 
 # Bad loan amount received ?
 Select
 sum(total_payment) AS Bad_loan_amount_received from financial_loan
 WHERE loan_status = "charged off" ;
 
 #Loan Status 
 
 select 
 loan_status,
 count(id)AS LoanCount,
 sum(total_payment)AS Total_payment_received,
 sum(loan_amount) AS Loan_funded,
 avg(int_rate*100)
AS intrest_Rate,
avg(dti*100) AS DTI
FROM financial_loan
group by loan_status;

SELECT 
	loan_status, 
	SUM(total_payment) AS MTD_Total_Amount_Received, 
	SUM(loan_amount) AS MTD_Total_Funded_Amount 
FROM financial_loan
WHERE Month(issue_date) = 11
GROUP BY loan_status;

SELECT 
	emp_length AS Employee_Length, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY emp_length
ORDER BY emp_length;

#TERM
SELECT 
	term AS Term, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY term
ORDER BY term;
#STATE
SELECT 
	address_state AS State, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY address_state
ORDER BY address_state;

#PURPOSE
SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY purpose
ORDER BY purpose;

#HOME OWNERSHIP
SELECT 
	home_ownership AS Home_Ownership, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY home_ownership
ORDER BY home_ownership;

#See the results when we hit the Grade A in the filters for dashboards.
SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
WHERE grade = 'A'
GROUP BY purpose
ORDER BY purpose;

#Dashboard 2

#Monthly Trends 

select 
date_format(MONTH, issue_date),
count(id) AS Total_Loan_Applicatio, 
sum(loan_amount) AS Total_funded_amount,
sum(total_payment) AS Total_received_amount
from financial_loan
group by date_format(MONTH, issue_date)
order by date_format(MONTH, issue_date);



