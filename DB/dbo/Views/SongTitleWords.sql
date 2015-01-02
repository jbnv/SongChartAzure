CREATE VIEW [dbo].[SongTitleWords]
AS 
SELECT words.Item AS [Word],COUNT(*) AS [InstanceCount]
FROM [Songs]
--TODO Massage title.
--TODO BUG! Losing first letter.
CROSS APPLY [dbo].[Split]([Title],' ') words
GROUP BY words.Item
