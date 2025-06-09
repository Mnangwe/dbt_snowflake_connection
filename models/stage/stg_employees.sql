with s as (
    select * from {{ source("northwind","employees") }}
),
emt as (
    select * from {{ source("northwind","employeeterritories") }}
),
t as (
    select * from {{ source("northwind", "territories") }}
),
r as (
    select * from {{ source("northwind","region") }}
)
select
    s."EmployeeID" as employee_id,
    s."LastName" as last_name,
    s."FirstName" as first_name,
    s."Title" as title,
    s."TitleOfCourtesy" as title_of_courtesy,
    s."BirthDate" as birthdate,
    s."HireDate" as hiredate,
    s."Address" as address,
    s."City" as city,
    s."Region" as region,
    s."PostalCode" as post_code,
    s."Country" as country,
    s."HomePhone" as homephone,
    s."Extension" as extension,
    s."Notes" as notes,
    s."ReportsTo" as reports_to,
    s."PhotoPath" as photo_path,
    t."TerritoryID" as territory_id,
    t."TerritoryDescription" as territory_description,
    r."RegionID" as region_id,
    r."RegionDescription" as region_description
from s
left join emt
on s."EmployeeID" = emt."EmployeeID"
left join t
on t."TerritoryID" = emt."TerritoryID"
left join r
on r."RegionID" = t."RegionID"