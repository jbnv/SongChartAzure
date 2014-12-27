CREATE TABLE [dbo].[Artists] (
    [Fullname]      VARCHAR (32)   NOT NULL,
    [Title]         VARCHAR (256)  NULL,
    [GenreFullname] VARCHAR (16)   NULL,
    [Score]         DECIMAL (6, 2) NULL,
    CONSTRAINT [PK_Artists] PRIMARY KEY CLUSTERED ([Fullname] ASC)
);

