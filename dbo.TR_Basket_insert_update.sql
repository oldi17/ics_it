if OBJECT_ID('dbo.TR_Basket_insert_update') IS NOT NULL
    drop trigger dbo.TR_Basket_insert_update;
go

-- chose 'after' beacause of situation when dbo.Basket structure changed 
create trigger dbo.TR_Basket_insert_update on dbo.Basket
    after insert
as
set NOCOUNT ON;

update dbo.Basket
set
    DiscountValue = Value * 0.05 * case
        when ID_SKU in (select ID_SKU 
            from inserted
            group by ID_SKU
            having count(*) >= 2
        ) then 1
        else 0
        end
where ID in (select ID from inserted)