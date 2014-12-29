CREATE TABLE [dbo].[Artists] (
    [Fullname]      VARCHAR (32)   NOT NULL,
    [Title]         VARCHAR (256)  NULL,
    [Score]         DECIMAL (6, 2) NOT NULL DEFAULT(0),
    [Id] INT NOT NULL IDENTITY(1,1), 
    [GenreID] INT NULL, 
    [Tags]              VARCHAR (MAX)  NULL,
    [SongCount] SMALLINT NOT NULL DEFAULT(0),
    CONSTRAINT [PK_Artists] PRIMARY KEY CLUSTERED ([Id]), 
    CONSTRAINT [FK_Artists_Genres] FOREIGN KEY ([GenreID]) REFERENCES [Genres]([Id])
);

