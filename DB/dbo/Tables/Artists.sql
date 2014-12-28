CREATE TABLE [dbo].[Artists] (
    [Fullname]      VARCHAR (32)   NOT NULL,
    [Title]         VARCHAR (256)  NULL,
    [Score]         DECIMAL (6, 2) NULL,
    [Id] INT NOT NULL IDENTITY(1,1), 
    [GenreID] INT NULL, 
    CONSTRAINT [PK_Artists] PRIMARY KEY CLUSTERED ([Id]), 
    CONSTRAINT [FK_Artists_Genres] FOREIGN KEY ([GenreID]) REFERENCES [Genres]([Id])
);

