if OBJECT_ID('dbo.udf_GetSKUPrice') IS NOT NULL
    drop function dbo.udf_GetSKUPrice;
go

create function dbo.udf_GetSKUPrice(
    @ID_SKU as int
)
returns decimal(18, 2)
as
    begin
        return (
            select
                sum(Value) / sum(Quantity)
            from dbo.Basket as B
            where ID_SKU = @ID_SKU
        ) 
    end;
go