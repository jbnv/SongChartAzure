CREATE TABLE [dbo].[Songs] (
    [Fullname]          VARCHAR (10)   NOT NULL,
    [Title]             VARCHAR (128)  NOT NULL,
    [ArtistFullname]    VARCHAR (48)   NOT NULL,
    [DebutDateFullname] VARCHAR (16)   NULL,
    [GenreFullname]     VARCHAR (24)   NULL,
    [Ranks]             VARCHAR (256)  NULL,
    [Tags]              VARCHAR (MAX)  NULL,
    [Score]             DECIMAL (6, 2) NULL,
    [Id] INT NOT NULL IDENTITY(1,1), 
    CONSTRAINT [PK_Songs] PRIMARY KEY CLUSTERED ([Id])
);

