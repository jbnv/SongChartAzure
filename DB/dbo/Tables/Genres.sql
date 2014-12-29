CREATE TABLE [dbo].[Genres] (
    [Fullname] VARCHAR (16)   NOT NULL,
    [Title]    VARCHAR (256)  NOT NULL,
    [Score]    DECIMAL (6, 2) NOT NULL DEFAULT(0),
    [Id] INT NOT NULL IDENTITY(1,1), 
	[SongCount] SMALLINT NOT NULL DEFAULT(0),
    [ParentFullname] VARCHAR(16) NULL, 
    CONSTRAINT [PK_Genres] PRIMARY KEY CLUSTERED ([Id])
);

