CREATE TABLE [dbo].[Calendar] (
    [WeekId]       INT      IDENTITY (1, 1) NOT NULL,
    [Decade]       SMALLINT NULL,
    [Year]         SMALLINT NULL,
    [MonthOrdinal] TINYINT  NULL,
    [WeekOrdinal]  TINYINT  NULL,
    PRIMARY KEY CLUSTERED ([WeekId] ASC)
);

