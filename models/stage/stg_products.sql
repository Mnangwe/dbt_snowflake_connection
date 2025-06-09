with stg_products as (
    select * from {{ source("northwind", "products") }}
),
categories as (
    select * from {{ source("northwind","categories") }}
),
suppliers as (
    select * from {{ source("northwind","suppliers") }}
)
select
    sp."ProductID" as product_id,
    sp."ProductName" as product_name,
    sp."SupplierID" as supplier_id,
    sp."CategoryID" as category_id,
    sp."QuantityPerUnit" as quantity_perunit,
    sp."UnitPrice" as unit_price,
    sp."UnitsInStock" as unit_in_stock,
    sp."UnitsOnOrder" as unit_on_order,
    sp."ReorderLevel" as reorder_level,
    sp."Discontinued" as discontinue,
    c."CategoryName" as category_name,
    c."Description" as description,
    s."CompanyName" as company_name,
    s."ContactName" as contact_name,
    s."ContactTitle" as contact_title,
    s."Address" as address,
    s."City" as city,
    s."Region" as region,
    s."PostalCode" as postal_code,
    s."Country" as country,
    s."Phone" as phone,
    s."Fax" as fax,
    s."HomePage" as home_page
from stg_products sp
left join categories c
on c."CategoryID" = sp."CategoryID"
left join suppliers s
on s."SupplierID" = sp."SupplierID"