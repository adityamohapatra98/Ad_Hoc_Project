select segment,count(distinct product_code) as product_count
from dim_product 
group by segment