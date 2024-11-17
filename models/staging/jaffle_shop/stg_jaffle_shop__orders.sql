select
    id as order_id,
    customer as customer_id,
     ordered_at order_date,
     order_total as amount
   

from {{ source('jaffle_shop', 'raw_orders') }}



