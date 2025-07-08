CREATE OR REPLACE TABLE `sales-project-465303.retailsales.sales_summary` AS
SELECT
  `Product Category` AS product_category,
  COUNT(`Transaction ID`) AS total_transactions,
  SUM(`Quantity`) AS total_quantity,
  SUM(`Total Amount`) AS total_sales,
  ROUND(AVG(`Total Amount`),2) AS avg_transaction_value
FROM `sales-project-465303.retailsales.sales`
GROUP BY `Product Category`;


CREATE OR REPLACE TABLE `sales-project-465303.retailsales.sales_by_gender` AS
SELECT
  Gender,
  `Product Category` AS product_category,
  SUM(`Total Amount`) AS total_sales,
  SUM(`Quantity`) AS total_quantity
FROM `sales-project-465303.retailsales.sales`
GROUP BY Gender, `Product Category`;


CREATE OR REPLACE TABLE `sales-project-465303.retailsales.sales_by_age_group` AS
SELECT
  CASE
    WHEN Age < 20 THEN 'Teen'
    WHEN Age BETWEEN 20 AND 29 THEN '20s'
    WHEN Age BETWEEN 30 AND 39 THEN '30s'
    WHEN Age BETWEEN 40 AND 49 THEN '40s'
    ELSE '50+'
  END AS age_group,
  `Product Category` AS product_category,
  SUM(`Total Amount`) AS total_sales
FROM `sales-project-465303.retailsales.sales`
GROUP BY age_group, `Product Category`;


CREATE OR REPLACE TABLE `sales-project-465303.retailsales.monthly_sales` AS
SELECT
  FORMAT_DATE('%Y-%m', `Date`) AS month,
  SUM(`Total Amount`) AS monthly_sales,
  COUNT(`Transaction ID`) AS total_transactions
FROM `sales-project-465303.retailsales.sales`
GROUP BY month
ORDER BY month;





