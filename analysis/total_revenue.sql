with payments as (
    select * from {{ ref('stg_payments') }}
),

aggregated as (
    select
    {% for order_status in ['success'] %}
        sum (case when status = '{{order_status}}' then amount else 0 end) as {{order_status}}_total {{',' if not loop.last}}
    {% endfor %}
    from payments
)

select * from aggregated