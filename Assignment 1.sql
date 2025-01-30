-- Question 1
SELECT * 
FROM ap.vendors 
ORDER BY vendor_id;
 
-- Question 2
SELECT vendor_name, vendor_phone, vendor_city 
FROM ap.vendors 
WHERE vendor_state = "CA" -- Filtering for only vendors in california
ORDER BY vendor_name;

-- Question 3
SELECT invoice_id, invoice_total, invoice_date
FROM ap.invoices
ORDER BY invoice_total DESC; -- Making sure to sort in descending order

-- Question 4
SELECT invoice_id, invoice_total
FROM ap.invoices
ORDER BY invoice_total
LIMIT 7 OFFSET 2; -- Only selecting the invoices with lowest totals 3 - 9
  
-- Question 5
SELECT invoice_id, invoice_total, 
	   invoice_total - payment_total AS `Remaining Balance` -- Calculating the remaining balance
FROM ap.invoices
ORDER BY invoice_id;

-- Question 6
SELECT invoice_id, invoice_total, vendor_name, vendor_phone
FROM ap.invoices
INNER JOIN ap.vendors
		ON invoices.vendor_id = vendors.vendor_id -- Combining the vendor id's
ORDER BY invoice_id;

 -- Question 7
SELECT vendor_name, invoice_id
FROM ap.vendors
LEFT OUTER JOIN ap.invoices
	ON vendors.vendor_id = invoices.vendor_id -- Once again combining vendor id's
ORDER BY vendor_name;

-- Question 8
SELECT department_name, last_name
FROM ex.departments
RIGHT OUTER JOIN ex.employees
	ON employees.department_number = departments.department_number -- Right joining to bring in all employees whether they have a department or not
ORDER BY departments.department_number;

-- Question 9
SELECT CONCAT(first_name, ' ', last_name) AS `Combined Contact Name`, -- Setting the required alias
	vendor_name
FROM ap.vendor_contacts
INNER JOIN ap.vendors 
	ON vendors.vendor_id = vendor_contacts.vendor_id
ORDER BY CONCAT(first_name, ' ', last_name); -- Sorting with the same CONCAT used in the alias

-- Question 10
	SELECT first_name
    FROM ex.employees
UNION						-- Creating a union to find all unique first names
	SELECT rep_first_name
    FROM ex.sales_reps
ORDER BY first_name;

-- Question 11
SELECT invoice_id, invoice_total, vendor_name, terms_description
FROM ap.invoices
LEFT OUTER JOIN ap.vendors
	ON invoices.vendor_id = vendors.vendor_id		-- First bringing in vendor information
LEFT OUTER JOIN ap.terms
	ON invoices.terms_id = terms.terms_id			-- Secondly bringing in terms information both to invoices which is the core table
ORDER BY invoice_id;