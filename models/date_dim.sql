WITH date_dim AS (
    select  to_timestamp(started_at) as started_at,
            DATE(to_timestamp(started_at)) date_started_at,
            DAY(to_timestamp(started_at)) day,
            --MONTH(to_timestamp(started_at)) month,
            YEAR(to_timestamp(started_at)) year,
            EXTRACT(HOUR FROM to_timestamp(started_at)) hour,
            --EXTRACT(MINUTE FROM to_timestamp(started_at)) minute,
            --EXTRACT(SECOND FROM to_timestamp(started_at)) second,
            --DAYOFWEEK(to_timestamp(started_at)) day_of_week,
            --DAYNAME(to_timestamp(started_at)) day_name,
            --MONTHNAME(to_timestamp(started_at)) month_name,
            (
                CASE
                    WHEN DAYNAME(to_timestamp(started_at)) in ('Sat', 'Sun') THEN 'WEEKEND'
                    ELSE 'BUSINESSDAY'
                END
            )  DAY_TYPE,
            (
                CASE
                    WHEN MONTH(to_timestamp(started_at)) in (12, 1, 2) THEN 'WINTER'
                    WHEN MONTH(to_timestamp(started_at)) in (3, 4, 5) THEN 'SPRING'
                    WHEN MONTH(to_timestamp(started_at)) in (6, 7, 8) THEN 'SUMMER'
                    ELSE 'AUTUMN'
                END
            ) SEASON
      from  {{ source('src_demo', 'src_bike') }}
     where started_at <> 'started_at'
)
select *
  from date_dim