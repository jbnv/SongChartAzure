CREATE VIEW [dbo].[YearSummaries]
AS 
SELECT [YearNumber], COUNT(*) AS [SongCount]
FROM [dbo].[Songs_Detailed] s
INNER JOIN [YearFullnames] yfn ON [DebutDateFullname] = yfn.[Fullname]
GROUP BY [YearNumber]