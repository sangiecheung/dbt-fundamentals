{% snapshot mock_orders %}

{% set new_schema = target.schema + '_snapshot' %}

{{
    config(
      target_project='assignment3-348004',
      target_dataset=new_schema,
      unique_key='order_id',

      strategy='timestamp',
      updated_at='updated_at',
    )
}}

select * from assignment3-348004.{{target.schema}}.mock_orders

{% endsnapshot %}