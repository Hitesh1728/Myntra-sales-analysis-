USE Myntra_project;
SELECT * FROM myntra_sales LIMIT 10;
DESC myntra_sales;


-- Which top 5 brands generated highest sales?
SELECT Brand_Name,
       SUM(Final_Price) AS Total_Sales
FROM myntra_sales
GROUP BY Brand_Name
ORDER BY Total_Sales DESC
LIMIT 5;

-- Which category generated highest revenue?
SELECT Category,
       SUM(Original_Price) AS Revenue
FROM myntra_sales
GROUP BY Category
ORDER BY Revenue DESC;

-- Which states have above average sales?
SELECT State,
       SUM(Final_Price) AS Sales
FROM myntra_sales
GROUP BY State
HAVING SUM(Final_Price) >
(
    SELECT AVG(Final_Price)
    FROM myntra_sales
);

-- Products with discount above 30%
SELECT Product_Name,
       Brand_Name,
       Discount_Amount
FROM myntra_sales
WHERE Discount_Amount > 30;


-- Which month had highest sales?
SELECT Month,
       SUM(Final_Price) AS Monthly_Sales
FROM myntra_sales
GROUP BY Month
ORDER BY Monthly_Sales DESC;

-- Average discount given by each brand
SELECT Brand_Name,
       AVG(Discount_Amount) AS Avg_Discount
FROM myntra_sales
GROUP BY Brand_Name;

-- Rank brands by sales
SELECT Brand_Name,
       SUM(Final_Price) AS Total_Sales,
       RANK() OVER (ORDER BY SUM(Final_Price) DESC) AS Ranking
FROM myntra_sales
GROUP BY Brand_Name;

-- Best selling products
SELECT Product_Name,
       COUNT(Order_ID) AS Orders_Count
FROM myntra_sales
GROUP BY Product_Name
ORDER BY Orders_Count DESC
LIMIT 10;

-- Sales category classification
SELECT Product_Name,
       Final_Price,
       CASE
           WHEN Final_Price > 3000 THEN 'High'
           WHEN Final_Price BETWEEN 1000 AND 3000 THEN 'Medium'
           ELSE 'Low'
       END AS Sales_Level
FROM myntra_sales;

-- Customers with more than 3 orders
SELECT Customer_ID,
       COUNT(Order_ID) AS Orders_Count
FROM myntra_sales
GROUP BY Customer_ID
HAVING COUNT(Order_ID) > 3;