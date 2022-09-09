{{ config(materialized='table') }}

select *
from {{ ref('csv_file_test') }}