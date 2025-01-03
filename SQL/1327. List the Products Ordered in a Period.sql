# Write your MySQL query statement below
# Write a solution to get the names of products that have at least 100 units ordered in February 2020 and their amount.

SELECT
    p.product_name,
    SUM(o.unit) AS unit
FROM Orders o
LEFT JOIN Products p
ON o.product_id = p.product_id
WHERE MONTH(o.order_date) = 2 AND YEAR(o.order_date) = 2020
GROUP BY p.product_name
HAVING SUM(o.unit) >= 100;
