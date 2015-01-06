CREATE PROCEDURE [dbo].[SongTitleWords_Update]
AS
	TRUNCATE TABLE [SongTitleWords];

	INSERT INTO [dbo].[SongTitleWords] ([SongId],[Word])
	SELECT [Id],words.Item
	FROM [Songs]
	--TODO Massage title. Map related words together.
	--TODO BUG! Losing first letter.
	CROSS APPLY [dbo].[Split]([Title],' ') words

RETURN 0
