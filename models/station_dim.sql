with bike as (
    select  distinct 
            start_station_id as station_id,
            start_station_name as station_name,
            start_lat as lat,
            start_ing as long
      from {{ source('src_demo', 'src_bike') }}
     where ride_id <> 'ride_id'
    UNION
    select  distinct 
            end_station_id as station_id,
            end_station_name as station_name,
            end_lat as lat,
            end_ing as long
      from {{ source('src_demo', 'src_bike') }}
     where ride_id <> 'ride_id'

)
select *
  from bike