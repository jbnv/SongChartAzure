CREATE VIEW [dbo].[DecadeSummaries]
AS 
SELECT [DecadeNumber], COUNT(*) AS [SongCount]
FROM [dbo].[Songs_Detailed] s
INNER JOIN [DecadeFullnames] dfn ON [DebutDateFullname] = dfn.[Fullname]
GROUP BY [DecadeNumber]