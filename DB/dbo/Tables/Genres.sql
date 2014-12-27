CREATE TABLE [dbo].[Genres] (
    [Fullname] VARCHAR (16)   NOT NULL,
    [Title]    VARCHAR (256)  NULL,
    [Score]    DECIMAL (6, 2) NULL,
    CONSTRAINT [PK_Genres] PRIMARY KEY CLUSTERED ([Fullname] ASC)
);

