
{% macro fill_null(column) %}

    case

        when {{ column }} is null then 'ej specificerad'

        {# when {{ column }} = '-' then 'ej specificerad' #}

        else {{ column }}

    end

{% endmacro %}

 
{# {% macro capitalize_first_letter(column) %}
CASE 
    WHEN {{column}} IS NULL THEN NULL
    ELSE UPPER(substr({{column}}, 1, 1)) || LOWER(substr({{column}}, 2))
END
  
{% endmacro %} #}