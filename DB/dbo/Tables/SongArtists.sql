CREATE TABLE [dbo].[SongArtists]
(
	[SongId] INT NOT NULL , 
    [ArtistId] INT NOT NULL, 
    [RoleSlug] VARCHAR(8) NOT NULL, 
    PRIMARY KEY ([SongId], [ArtistId]), 
    CONSTRAINT [FK_SongArtists_Songs] FOREIGN KEY ([SongId]) REFERENCES [Songs]([Id]), 
    CONSTRAINT [FK_SongArtists_Artists] FOREIGN KEY ([ArtistId]) REFERENCES [Artists]([Id])
)
