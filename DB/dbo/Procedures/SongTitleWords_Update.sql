CREATE PROCEDURE [dbo].[SongTitleWords_Update]
AS
	TRUNCATE TABLE [SongTitleWords];

	INSERT INTO [dbo].[SongTitleWords] ([SongId],[Word])
	SELECT DISTINCT [Id],LOWER(words.Item)
	FROM [Songs]
	--TODO Massage title. Map related words together.
	CROSS APPLY (SELECT REPLACE(REPLACE(REPLACE([Title],' ','_'),'(',''),')','') AS [TitleM]) massage
	CROSS APPLY [dbo].[Split]([TitleM],'_') words
	ORDER BY [Id]

RETURN 0
