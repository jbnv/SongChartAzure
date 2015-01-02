CREATE VIEW [dbo].[Songs_ShortestTitles]
AS 
SELECT TOP 100 PERCENT *
FROM [Songs_Detailed]
WHERE [Title_CharacterCount] <= 5
ORDER BY [Title_CharacterCount],[Title]

