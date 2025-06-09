with stg_customers as (
    select * from {{ source("northwind","customers") }}
)

select * from stg_customers