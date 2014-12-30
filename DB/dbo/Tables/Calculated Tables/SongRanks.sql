CREATE TABLE [dbo].[SongRanks] (
    [SongId] INT   NOT NULL,
    [WeekId]       INT            NULL,
	[WeekOrdinal] TINYINT NOT NULL,
    [Rank]         DECIMAL (4, 2) NULL,
    CONSTRAINT [PK_SongRanks] PRIMARY KEY CLUSTERED ([SongId] ASC, [WeekOrdinal] ASC)
);

