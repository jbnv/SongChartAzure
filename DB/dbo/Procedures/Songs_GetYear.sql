CREATE PROCEDURE [dbo].[Songs_GetYear]
	@year SMALLINT
AS
SELECT		s.*,
			ROW_NUMBER() OVER(ORDER BY [Score] DESC) AS [ChartRank]
FROM		[dbo].[Songs_Detailed] s
INNER JOIN (
	SELECT 'calendar:'+[Slug] AS [Fullname]
	FROM [Years]
	WHERE [Number] = @year
	UNION
	SELECT 'calendar:'+[Slug]
	FROM [Months]
	WHERE [Year] = @year
) fltr ON [DebutDateFullname] = fltr.[Fullname]
ORDER BY [Score] DESC