{% macro limit_data_in_dev(column_name, dev_days_of_data=3) %}
 
{% if target.name == 'default' %}
where {{column_name}} >= date_add(current_date(), INTERVAL -{{dev_days_of_data}} DAY)

{% endif %}
 
{% endmacro %}
