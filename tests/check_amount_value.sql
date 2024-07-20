{% test check_amount_value(model, column) %}
    select * 
    from {{model}}
    where {{column}} <= 5
{% endtest %}