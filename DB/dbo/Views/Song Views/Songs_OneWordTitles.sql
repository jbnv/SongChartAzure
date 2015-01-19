CREATE VIEW [dbo].[Songs_OneWordTitles]
AS 
SELECT * 
FROM [Songs_Detailed]
WHERE [Title] NOT LIKE '% %'
