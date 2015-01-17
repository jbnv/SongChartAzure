CREATE PROCEDURE [dbo].[Songs_GetTopByDuration]
AS
SELECT		TOP 40 s.*,
			ROW_NUMBER() OVER(ORDER BY [Duration] DESC, [Score] DESC) AS [ChartRank]
FROM		[dbo].[Songs_Detailed] s
INNER JOIN [DecadeFullnames] dfn ON [DebutDateFullname] = dfn.[Fullname]
ORDER BY [Duration] DESC, [Score] DESC