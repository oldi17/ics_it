if OBJECT_ID('dbo.SKU') IS NOT NULL
    drop table dbo.SKU;
go

create table dbo.SKU(
    ID int NOT NULL IDENTITY PRIMARY KEY
    ,Code as 's' + cast(ID as nvarchar)
    ,Name nvarchar(40) NOT NULL
    ,CONSTRAINT UNQ_SKU_Code UNIQUE(Code)
);
go

if OBJECT_ID('dbo.Family') IS NOT NULL
    drop table dbo.Family;
go

create table dbo.Family(
    ID int NOT NULL IDENTITY PRIMARY KEY
    ,SurName nvarchar(40) NOT NULL
    ,BudgetValue money NOT NULL
);
go

if OBJECT_ID('dbo.Basket') IS NOT NULL
    drop table dbo.Basket;
go

create table dbo.Basket(
    ID int NOT NULL IDENTITY PRIMARY KEY
    ,ID_SKU int NOT NULL
    ,ID_Family int NOT NULL
    ,Quantity int NOT NULL
    ,Value money NOT NULL
    ,PurchaseDate datetime NOT NULL DEFAULT(SYSDATETIME())
    ,DiscountValue numeric(4,3) NOT NULL
    ,CONSTRAINT CHK_Basket_Quantity CHECK(Quantity >= 0)
    ,CONSTRAINT CHK_Basket_Value CHECK(Value >= 0.00)
    ,CONSTRAINT FK_Basket_SKU FOREIGN KEY(ID_SKU)
        REFERENCES dbo.SKU(ID)
    ,CONSTRAINT FK_Basket_Family FOREIGN KEY(ID_Family)
        REFERENCES dbo.Family(ID)
);
go