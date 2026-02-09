with source as (
    select * from {{ source('staging', 'fhv_tripdata') }}
),

renamed as (
    select
        -- identifiers
        cast(dispatching_base_num as string) as dispatching_base_num,
        cast(PUlocationID as integer) as pickup_location_id,
        cast(DOlocationID as integer) as dropoff_location_id,

        -- timestamps
        cast(pickup_datetime as timestamp) as pickup_datetime,  
        cast(dropOff_datetime as timestamp) as dropoff_datetime,

        -- info
        cast(SR_Flag as string) as SR_Flag,
        cast(Affiliated_base_number as string) as Affiliated_base_number
    from source
    -- Filter out records with null 
    where dispatching_base_num is not null
)

select count(*) from renamed