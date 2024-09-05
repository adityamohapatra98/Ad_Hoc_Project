with cte as
 (select count(distinct product_code) as unique_products_2020 from fact_gross_price where fiscal_year = 2020),
 cte2 as (select count(distinct product_code) as unique_products_2021 from fact_gross_price where fiscal_year = 2021)
 select  unique_products_2020,unique_products_2021 , ((unique_products_2021/unique_products_2020)-1) *100 as percentage_chg
 from cte 
 cross join cte2

