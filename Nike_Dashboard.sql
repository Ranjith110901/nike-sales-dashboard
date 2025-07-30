-- Create database for Nike dashboard project
create database nike_dashboard
use nike_dashboard

-- View the raw cleaned dataset
select * from nike_clean_project

-- Monthly analysis: total units sold and revenue by month
select
date_format(str_to_date(Order_Date, '%d-%m-%Y'), '%Y-%m') AS Month,
sum(Units_Sold) AS Total_Units_Sold,
sum(Units_Sold * MRP) AS Total_Revenue
from nike_clean_project
group by Month
order by Month;

-- Top 5 products by revenue
select
Product_name,
sum(Units_Sold * MRP) AS total_revenue
from nike_clean_project
group by Product_name
order by total_revenue desc
limit 5;

-- Top 5 regions by revenue
select 
Region,
sum(Units_Sold) as total_units_sold,
sum(Units_Sold * MRP) as total_revenue
from nike_clean_project
group by Region
order by total_revenue desc
Limit 5;

-- Regional revenue trend by month
select 
Region,
date_format(str_to_date(Order_Date, '%d-%m-%Y'), '%Y-%m') as Month,
sum(Units_Sold * MRP) as total_revenue
from nike_clean_project
group by Region, Month
order by Region, Month;



