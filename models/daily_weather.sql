WITH daily_weather as (
    select  clouds,
            humidity,
            pressuare as preassure,
            temp,
            weather,
            to_date(time) as created_at,
      from  {{ source('src_demo', 'src_weather') }}
),
daily_weather_agg as (
    select created_at,
           weather,
           round( avg(clouds) , 2) avg_clouds,
           round( avg(humidity) , 2) avg_humidity,
           round( avg(preassure) , 2) avg_preassure,
           round( avg(temp) , 2) avg_temp
      from daily_weather
    group by created_at, weather
    qualify row_number() over (partition by created_at order by count(weather) desc) = 1
)
select *
  from daily_weather_agg