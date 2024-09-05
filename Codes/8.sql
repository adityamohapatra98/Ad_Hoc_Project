SELECT  
   CASE 
        WHEN MONTH(date) IN (9, 10, 11) THEN 'Q1'
        WHEN MONTH(date) IN (12, 1, 2) THEN 'Q2'
        WHEN MONTH(date) IN (3, 4, 5) THEN 'Q3'
        WHEN MONTH(date) IN (6, 7, 8) THEN 'Q4'
    END AS Quarter,
	sum(sold_quantity) as Total_Quantity 
from gdb023.fact_sales_monthly
where fiscal_year = 2020
group by Quarter
