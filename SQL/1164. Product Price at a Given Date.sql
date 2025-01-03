# Write your MySQL query statement below
WITH CTE AS(
    SELECT 
        product_id,
        new_price,
        change_date,
        ROW_NUMBER() OVER(PARTITION BY product_id ORDER BY change_date DESC) AS rn
    FROM Products
    WHERE change_date <= '2019-08-16'
), CTE2 AS(
    SELECT 
        product_id,
        new_price
    FROM CTE
    WHERE rn = 1
    UNION 
    SELECT
        p.product_id,
        10 AS new_price
    FROM Products p
    LEFT JOIN CTE c
    ON p.product_id = c.product_id
    WHERE c.product_id IS NULL) 

SELECT
    product_id,
    new_price AS price
FROM CTE2;
