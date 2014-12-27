CREATE TABLE [dbo].[Playlists] (
    [ID]    INT           IDENTITY (1, 1) NOT NULL,
    [Title] VARCHAR (128) NULL,
    [Tag]   VARCHAR (16)  NULL,
    CONSTRAINT [PK_Playlists] PRIMARY KEY CLUSTERED ([ID] ASC)
);

