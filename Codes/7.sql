Select monthname(date) as month,
year(date) as Year,
s.fiscal_year,
concat(round(sum(sold_quantity* gross_price)/1000000,3), ' M')as gross_sales
from fact_sales_monthly s
join fact_gross_price g
on s.product_code = g.product_code and s.fiscal_year = g.fiscal_year
join dim_customer c
on s.customer_code= c.customer_code
where customer = "Atliq Exclusive"
group by month,Year,fiscal_year
order by year


