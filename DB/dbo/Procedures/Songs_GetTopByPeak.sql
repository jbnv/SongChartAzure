CREATE PROCEDURE [dbo].[Songs_GetTopByPeak]
AS
SELECT		s.*,
			ROW_NUMBER() OVER(ORDER BY [PeakRank] ASC, [Score] DESC) AS [ChartRank]
FROM		[dbo].[Songs_Detailed] s
INNER JOIN [DecadeFullnames] dfn ON [DebutDateFullname] = dfn.[Fullname]
WHERE [PeakRank] < 1.5
ORDER BY [PeakRank] ASC, [Score] DESC