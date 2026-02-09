{% macro get_payment_type_description(payment_type_column) %}

{% set payment_types = {
    0: 'Flex Fare trip',
    1: 'Credit card',
    2: 'Cash',
    3: 'No charge',
    4: 'Dispute',
    5: 'Unknown',
    6: 'Voided trip',
} %}

case {{ payment_type_column }}
    {% for payment_id, payment_name in payment_types.items() %}
    when {{ payment_id }} then '{{ payment_name }}'
    {% endfor %}
end

{% endmacro %}
