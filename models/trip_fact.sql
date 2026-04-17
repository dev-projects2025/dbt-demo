with trips as (
    select  ride_id,
            rideable_type,
            to_date(to_timestamp(started_at)) as started_at,
            to_date(to_timestamp(ended_at)) as ended_at,
            start_station_id,
            end_station_id,
            member_casual,
            datediff(second, to_timestamp(started_at), to_timestamp(ended_at)) as trip_duration_sec
      from  {{ source('src_demo', 'src_bike') }}
     where ride_id <> 'ride_id'
)
select *
  from trips