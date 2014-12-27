CREATE TABLE [dbo].[SongRanks] (
    [SongFullname] VARCHAR (10)   NOT NULL,
    [WeekId]       INT            NOT NULL,
    [Rank]         DECIMAL (4, 2) NULL,
    CONSTRAINT [PK_SongRanks] PRIMARY KEY CLUSTERED ([SongFullname] ASC, [WeekId] ASC)
);

