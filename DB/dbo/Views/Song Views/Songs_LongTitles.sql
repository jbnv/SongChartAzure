CREATE VIEW [dbo].[Songs_LongTitles]
AS 
SELECT * 
FROM [Songs_Detailed]
WHERE [Title] LIKE '% % % % % %'
