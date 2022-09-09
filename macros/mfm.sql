{# this is my first macro #}

{% macro mfm( var ) -%}

    case {{ var }}
        when 1 then 'c_card'
        when 2 then 'cash'
        else 'not_1_2'
    end

{%- endmacro %}