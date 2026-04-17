with correlation as (
    select  *
      from  {{ ref('trip_fact') }} as t
      left join {{ ref('daily_weather') }} as w on (t.trip_date = w.date_weather)
)
select *
  from correlation