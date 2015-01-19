CREATE VIEW [dbo].[Songs_LongestTitles]
AS 
SELECT TOP 10 PERCENT *
FROM [Songs_Detailed]
ORDER BY [Title_CharacterCount] DESC

