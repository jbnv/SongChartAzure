CREATE TABLE [dbo].[SongTitleWords]
(
    [SongId] INT NOT NULL, 
    [Word] NVARCHAR(30) NOT NULL, 
	CONSTRAINT [PK_SongTitleWords] PRIMARY KEY CLUSTERED ([SongId],[Word]),
    CONSTRAINT [FK_SongTitleWords_Songs] FOREIGN KEY ([SongId]) REFERENCES [Songs]([Id])
)
