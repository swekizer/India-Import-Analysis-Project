select 
    dc.hs2_code, 
    dc.hs4_code, 
    dc.commodity, 
    dc.description, 
    dc.import_sales_usd_commodity_millions , 
    ROUND((dc.import_sales_usd_commodity_millions * 100.0 / SUM(dc.import_sales_usd_commodity_millions) OVER ())::numeric, 2) AS percentage_share
from dim_commodity dc
order by dc.import_sales_usd_commodity_millions desc
limit 10;