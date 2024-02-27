select
-- from raw orders
    o.orderid,
    o.orderdate,
    o.shipdate,
    o.shipmode,
    c.customername,
    -- from raw customer
    c.segment,
    c.country,
    p.category,
    --from raw product
    p.productname,
    p.subcategory,
    o.ordersellingprice - o.ordercostprice as orderprofit,
    o.ordercostprice,
    o.ordersellingprice
from {{ ref('raw_orders') }} as o
left join {{ ref('raw_customer') }} as c
on o.customerid = c.customerid
left join {{ ref('raw_product') }} as p
on o.productid = p.productid