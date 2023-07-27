if OBJECT_ID('dbo.vw_SKUPrice') IS NOT NULL
    drop view dbo.vw_SKUPrice;
go

create view dbo.vw_SKUPrice
as
select
    ID
    ,Name
    ,dbo.udf_GetSKUPrice(ID) as UnitPrice
from dbo.SKU;
go