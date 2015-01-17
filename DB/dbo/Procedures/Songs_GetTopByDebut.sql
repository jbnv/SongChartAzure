CREATE PROCEDURE [dbo].[Songs_GetTopByDebut]
AS
SELECT		s.*,
			ROW_NUMBER() OVER(ORDER BY [DebutRank] ASC, [Score] DESC) AS [ChartRank]
FROM		[dbo].[Songs_Detailed] s
INNER JOIN [DecadeFullnames] dfn ON [DebutDateFullname] = dfn.[Fullname]
WHERE [DebutRank] <= 10
ORDER BY [DebutRank] ASC, [Score] DESC