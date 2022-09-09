{{ config(materialized = 'view') }}

select 
    {{ dbt_utils.surrogate_key(['VendorID', 'tpep_pickup_datetime']) }} as tripid,
    {{ mfm('VendorID') }} as id_desc
from {{ source('staging', 'yellow_tripdata')}}
where VendorID is not null

-- dbt build --m <model.sql> --var 'is_test_run : false'
{% if var('is_test_run', default=true) %}
    
    limit 100
    
{% endif %}