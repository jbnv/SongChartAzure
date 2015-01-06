CREATE VIEW [dbo].[SongTitleWords_Unique]
AS 
SELECT [Word] FROM [SongTitleWords_Counts] WHERE [InstanceCount] = 1
