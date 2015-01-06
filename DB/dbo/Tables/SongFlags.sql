CREATE TABLE [dbo].[SongFlags]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [SongId] INT NOT NULL, 
    [FlagSlug] VARCHAR(10) NOT NULL, 
    CONSTRAINT [FK_SongFlags_Songs] FOREIGN KEY ([SongId]) REFERENCES [Songs]([Id])
)
