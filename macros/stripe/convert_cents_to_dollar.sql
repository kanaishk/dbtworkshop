{% macro convert_cents_to_dollar(column_name, decimal_places=3) %}
    cast(round(1.{%for i in range(decimal_places)%}0{% endfor %}*{{column_name}}/100.{%for i in range(decimal_places)%}0{% endfor %}, {{decimal_places}}) as decimal(18,{{decimal_places}}))
{% endmacro %}