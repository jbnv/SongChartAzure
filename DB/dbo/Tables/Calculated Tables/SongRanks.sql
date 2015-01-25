CREATE TABLE [dbo].[SongRanks] (
    [SongId] INT   NOT NULL,
    [WeekId]       INT            NULL,
	[WeekOrdinal] TINYINT NOT NULL,
    [Rank]         DECIMAL (4, 2) NULL,
    [Score] AS CAST(CASE WHEN [Rank] < 1 THEN 0 WHEN LOG([Rank]) > 3 THEN 0 ELSE 3-LOG([Rank]) END AS DECIMAL(4, 3)), 
    [IsCalculated] BIT NOT NULL DEFAULT 0, 
    CONSTRAINT [PK_SongRanks] PRIMARY KEY CLUSTERED ([SongId] ASC, [WeekOrdinal] ASC)
);

