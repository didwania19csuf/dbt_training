select *
, {{cents_to_dollars('amount',3)}} as amount_indollars
 from {{ source('jaffle_shop', 'payments') }}