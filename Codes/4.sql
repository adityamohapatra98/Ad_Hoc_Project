with cte as (SELECT segment,count(distinct f.product_code) as product_count_2020
FROM fact_sales_monthly f
join dim_product d
on f.product_code= d.product_code
where fiscal_year = 2020
group by segment),
cte2 as (SELECT segment,count(distinct f.product_code) as product_count_2021
FROM fact_sales_monthly f
join dim_product d
on f.product_code= d.product_code
where fiscal_year = 2021
group by segment)
select cte.segment,product_count_2020,product_count_2021,product_count_2021-product_count_2020 as difference
from cte 
join cte2
on cte.segment = cte2.segment