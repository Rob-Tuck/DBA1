-- Question 1
SELECT COUNT(*) AS total_invoices -- Counting all rows in the invoices table to get the total number of invoices
FROM ap.invoices;

-- Question 2
SELECT SUM(invoice_total) AS total_invoice_amount -- Summing up the invoice_total column to get the total amount of all invoices
FROM ap.invoices;

-- Question 3
SELECT AVG(invoice_total) AS average_invoice_total -- Calculating the average invoice total
FROM ap.invoices;

-- Question 4
SELECT MAX(invoice_total) AS highest_invoice_total, -- Finding the maximum and minimum values in the invoice_total column
       MIN(invoice_total) AS lowest_invoice_total
FROM ap.invoices;

-- Question 5
SELECT vendor_id, SUM(payment_total) AS total_amount_paid -- Summing all payments made by each vendor and creating a new ordered column for total paid
FROM ap.invoices
GROUP BY vendor_id
ORDER BY total_amount_paid DESC;

-- Question 6
SELECT vendor_id,
       COUNT(*) AS invoice_count,	-- Counting the number of invoices for each vendor
       SUM(invoice_total) AS total_invoice_amount -- Summing up the invoice_total for each vendor
FROM ap.invoices
GROUP BY vendor_id
ORDER BY total_invoice_amount DESC;

-- Question 7
SELECT account_number, SUM(line_item_amount) AS total_line_item_amount -- Summing up total line item amount for each account number
FROM ap.invoice_line_items
GROUP BY account_number
ORDER BY total_line_item_amount DESC;

-- Question 8
SELECT vendor_id, SUM(invoice_total) AS total_invoice_amount -- Calculating the sum of  invoice totals for each vendor id
FROM ap.invoices
GROUP BY vendor_id WITH ROLLUP; -- Grouping by vendor_id and using ROLLUP to include a grand total row at the end
