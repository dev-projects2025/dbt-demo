WITH date_dim AS (
    select  to_timestamp(started_at) as started_at,
            DATE(to_timestamp(started_at)) date_started_at,
            DAY(to_timestamp(started_at)) day,
            YEAR(to_timestamp(started_at)) year,
            EXTRACT(HOUR FROM to_timestamp(started_at)) hour,
            {{ get_day_type('started_at') }}  DAY_TYPE,
            {{ get_season('started_at') }} SEASON
      from  {{ source('src_demo', 'src_bike') }}
     where started_at <> 'started_at'
)
select *
  from date_dim