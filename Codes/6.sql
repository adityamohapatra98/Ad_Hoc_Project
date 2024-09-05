select c.customer_code,c.customer,round( avg(pre_invoice_discount_pct),4  ds) *100 as average_discount_percentage
from fact_pre_invoice_deductions P
join dim_customer c
on p.customer_code = c.customer_code
where fiscal_year = 2021 and market = "India"
group by c.customer_code,customer
order by average_discount_percentage desc limit 5
