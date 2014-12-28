CREATE TABLE [dbo].[Genres] (
    [Fullname] VARCHAR (16)   NOT NULL,
    [Title]    VARCHAR (256)  NULL,
    [Score]    DECIMAL (6, 2) NULL,
    [Id] INT NOT NULL IDENTITY(1,1), 
    CONSTRAINT [PK_Genres] PRIMARY KEY CLUSTERED ([Id])
);

