{%- set paymentmethod=['bank_transfer','coupon','credit_card','gift_card'] -%}
 
 
with payments as
(select * from {{ ref('stg_jaffle_shop__payments') }})

,pivot as 
(
select 
orderid,
sum(case when paymentmethod='bank_transfer' then amount else 0 end) as bank_tx_amount,
sum(case when paymentmethod='coupon' then amount else 0 end) as coupon_amount,
sum(case when paymentmethod='credit_card' then amount else 0 end) as credit_card_amount,
sum(case when paymentmethod='gift_card' then amount else 0 end) as gift_card_amount
from payments
where status='success'
group by 1
)
, using_jinja as
(
select 
    orderid,



    {%- for payment in paymentmethod -%}

    sum(case when paymentmethod='{{payment}}' then amount else 0 end) as {{payment}}_amount
    
    {%- if not loop.last -%}
    ,
    {%endif%}
    {%endfor%}

from payments
where status='success'
group by 1
)

select * from using_jinja 