CREATE PROCEDURE [dbo].[Songs_GetDecade]
	@decade SMALLINT
AS
SELECT		s.*,
			ROW_NUMBER() OVER(ORDER BY [Score] DESC) AS [ChartRank]
FROM		[dbo].[Songs_Detailed] s
INNER JOIN [DecadeFullnames] dfn ON [DebutDateFullname] = dfn.[Fullname]
WHERE dfn.DecadeNumber = @decade
ORDER BY [Score] DESC