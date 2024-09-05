with cte as (
    select 
		division,
		p.product_code,
		concat(product,'(',variant,')') as Product,
		sum(sold_quantity) as total_sold_quantity,
        row_number() over (partition by division order by sum(sold_quantity) desc) as rnk
	from fact_sales_monthly a
	join dim_product p
	on a.product_code = p.product_code
	where a.fiscal_year= 2021
	group by p.product_code,division,product,variant )
select *
from cte
where rnk <=3