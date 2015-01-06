CREATE TABLE [dbo].[Songs] (
    [Fullname]          VARCHAR (10)   NOT NULL,
    [Title]             VARCHAR (128)  NOT NULL,
	[ArtistID]	INT NULL,
	[GenreID] INT NULL,
    [DebutDateFullname] VARCHAR (16)   NULL,
    [Ranks]             VARCHAR (256)  NULL,
    [Tags]              VARCHAR (MAX)  NULL,
    [Score]             DECIMAL (6, 2) NULL,
    [Id] INT NOT NULL IDENTITY(1,1), 
    CONSTRAINT [PK_Songs] PRIMARY KEY CLUSTERED ([Id]), 
    CONSTRAINT [FK_Songs_Artists] FOREIGN KEY ([ArtistID]) REFERENCES [Artists]([Id]), 
    CONSTRAINT [FK_Songs_Genres] FOREIGN KEY ([GenreID]) REFERENCES [Genres]([Id])
);

