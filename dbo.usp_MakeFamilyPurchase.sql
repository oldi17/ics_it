if OBJECT_ID('dbo.usp_MakeFamilyPurchase') IS NOT NULL
    drop proc dbo.usp_MakeFamilyPurchase;
go

create proc dbo.usp_MakeFamilyPurchase
    @FamilySurName as varchar(255)
as
set NOCOUNT ON;

declare @Curr_ID_Family as int;
-- SurName is not unique, so there can be a bug without throwing error
select 
    @Curr_ID_Family = ID
from dbo.Family
where SurName = @FamilySurName;

if @Curr_ID_Family IS NULL
    return cast(N'Такой семьи нет' as int);

declare @BasketFullValue as money;
select
    @BasketFullValue = sum(Value)
from dbo.Basket
where ID_Family = @Curr_ID_Family
group by ID_Family;

update dbo.Family
set
    BudgetValue -= @BasketFullValue
where ID = @Curr_ID_Family;
go