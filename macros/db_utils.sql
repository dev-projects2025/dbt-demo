{% macro get_season(date_) %}

    CASE
        WHEN MONTH(to_timestamp({{date_}})) in (12, 1, 2) THEN 'WINTER'
        WHEN MONTH(to_timestamp({{date_}})) in (3, 4, 5) THEN 'SPRING'
        WHEN MONTH(to_timestamp({{date_}})) in (6, 7, 8) THEN 'SUMMER'
        ELSE 'AUTUMN'
    END

{%  endmacro %}

{% macro get_day_type(date_) %}

    CASE
        WHEN DAYNAME(to_timestamp({{date_}})) in ('Sat', 'Sun') THEN 'WEEKEND'
        ELSE 'BUSINESSDAY'
    END

{%  endmacro %}