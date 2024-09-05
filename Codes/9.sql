with cte as(
	select channel,round(sum(s.sold_quantity*g.gross_price)/1000000,2) as gross_sales_mln
	from fact_sales_monthly s
	join dim_customer c
	on s.customer_code= c.customer_code
	join fact_gross_price g
	on s.product_code = g.product_code and s.fiscal_year = g.fiscal_year
	where s.fiscal_year = 2021
	group by channel
)
select channel,gross_sales_mln,
ROUND((gross_sales_mln / SUM(gross_sales_mln) OVER ()) * 100, 2) as percentage
from cte
