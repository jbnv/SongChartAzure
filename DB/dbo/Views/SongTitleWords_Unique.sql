CREATE VIEW [dbo].[SongTitleWords_Unique]
AS 
SELECT [Word] FROM [SongTitleWords] WHERE [InstanceCount] = 1
