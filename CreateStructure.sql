create table dbo.SKU(
    ID int NOT NULL IDENTITY
    ,Code as 's' + cast(ID as nvarchar)
    ,Name nvarchar(40) NOT NULL
    ,CONSTRAINT UNQ_SKU_Code UNIQUE(Code)
);

create table dbo.Family(
    ID int NOT NULL IDENTITY
    ,SurName nvarchar NOT NULL
    ,BudgetValue money NOT NULL
);

