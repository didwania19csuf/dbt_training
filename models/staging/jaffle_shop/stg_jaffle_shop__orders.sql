select
    id as order_id,
    customer as customer_id,
     ordered_at order_date
   

from {{ source('jaffle_shop', 'raw_orders') }}

{{limit_data_in_dev('ordered_at')}}

