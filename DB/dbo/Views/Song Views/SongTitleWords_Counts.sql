CREATE VIEW [dbo].[SongTitleWords_Counts]
AS 
SELECT [Word],COUNT(*) AS [InstanceCount]
FROM [SongTitleWords]
GROUP BY [Word]
