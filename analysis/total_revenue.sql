with payments as (
    select * from {{ ref('stg_payments') }}
),

succesful_payments as (
    select
    {% for payment_status in ['success'] %}
        sum (case when status = '{{payment_status}}' then amount else 0 end) as {{payment_status}}_total {{',' if not loop.last}}
    {% endfor %}
    from payments
)

select * from succesful_payments