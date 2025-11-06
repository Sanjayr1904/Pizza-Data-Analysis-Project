Select * from Sales

-- KPI

SELECT SUM(total_price) AS Total_Revenue from Sales

SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value from Sales

SELECT SUM(quantity) AS Total_pizza_sold from Sales

SELECT COUNT(DISTINCT order_id) AS Total_Orders from Sales

SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM sales
 
-- Daily Trend from Total Orders

SELECT DATENAME(DW, Order_Date) as order_day, COUNT(Distinct ORDER_ID) as Total_Orders
from sales
Group by DATENAME(DW, Order_Date)

Select DATENAME(MONTH, order_date) as Month_Name, COUNT(DISTINCT order_id) as Total_orders
from sales
GROUP BY DATENAME(MONTH, order_date)
order by total_orders desc

select pizza_category ,sum(total_price) as Total_Sales, sum(Total_price) *100 / 
(Select sum(total_price) from sales where month(order_date) = 1) as PCT
from sales
where month(order_date) = 1
group by pizza_category

select pizza_size ,cast(sum(total_price) as decimal(10,2)) as Total_Sales, cast(sum(Total_price) *100 / 
(Select sum(total_price) from sales where DATEPART(quarter, order_date)=1) as decimal(10,2)) as PCT
from sales 
where DATEPART(quarter, order_date)=1
group by pizza_size
order by PCT desc

Select top 5 pizza_name, sum(total_price) as total_revenue from sales
group by pizza_name
order by total_revenue desc  

Select top 5 pizza_name, sum(total_price) as total_revenue from sales
group by pizza_name
order by total_revenue asc

Select top 5 pizza_name, sum(quantity) as total_quantity from sales
group by pizza_name
order by total_quantity desc

Select top 5 pizza_name, sum(quantity) as total_quantity from sales
group by pizza_name
order by total_quantity asc

Select top 5 pizza_name, count(distinct order_id) as total_orders from sales
group by pizza_name
order by total_orders asc
