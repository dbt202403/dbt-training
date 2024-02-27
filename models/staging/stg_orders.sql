select
-- from raw orders
    o.orderid,
    o.orderdate,
    o.shipdate,
    o.shipmode,
    c.customername,
    -- from raw customer
    c.customerid,
    c.segment,
    c.country,
    p.category,
    --from raw product
    p.productid,
    p.productname,
    p.subcategory,
    o.ordercostprice,
    o.ordersellingprice,
    o.ordersellingprice - o.ordercostprice as orderprofit,
{{ markup('ordersellingprice', 'ordercostprice') }} as markup
from {{ ref('raw_orders') }} as o
left join {{ ref('raw_customer') }} as c
    on o.customerid = c.customerid
left join {{ ref('raw_product') }} as p
    on o.productid = p.productid
{{ limit_data_in_dev('orderdate') }}
