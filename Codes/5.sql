with cte as 
	(select product_code,manufacturing_cost
	from fact_manufacturing_cost
	order by manufacturing_cost desc
	limit 5),	
cte2 as
	(select product_code,manufacturing_cost
	from fact_manufacturing_cost
	order by manufacturing_cost asc
	limit 5)
select p.product_code,product,manufacturing_cost
from cte c
join dim_product p
on c.product_code = p.product_code
union
select p.product_code,product,manufacturing_cost
from cte2 c
join dim_product p
on c.product_code = p.product_code
