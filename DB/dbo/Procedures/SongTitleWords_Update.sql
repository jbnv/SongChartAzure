CREATE PROCEDURE [dbo].[SongTitleWords_Update]
AS
	TRUNCATE TABLE [SongTitleWords];

	INSERT INTO [dbo].[SongTitleWords] ([SongId],[Word])
	SELECT DISTINCT [Id],COALESCE(reduc.[Word],s3.[Word])
	FROM [Songs]
	CROSS APPLY (
		SELECT LOWER(REPLACE([Songs].[Title],' ','-')) AS [String] 
	) s1
	CROSS APPLY (
		SELECT (
			SELECT	SUBSTRING(s1.[String], N, 1)
			FROM	dbo.Numbers
			WHERE	N > 0 AND N <= CONVERT(INT, LEN(s1.[String]))
				AND SUBSTRING(s1.[String], N, 1) NOT IN ('(',')',',','.')
			FOR XML PATH('')
		) [String]
	) s2
	CROSS APPLY (
		SELECT	SUBSTRING(s2.[String], N, CHARINDEX('-', s2.[String] + '-', N) - N) AS [Word]
		FROM	dbo.Numbers
		WHERE	N <= CONVERT(INT, LEN(s2.[String]))
			AND SUBSTRING('-' + s2.[String], N, 1) = '-'	
	) s3
	LEFT OUTER JOIN [dbo].[ReductionWords] reduc  ON reduc.[Word] = s3.[Word]
	WHERE s3.[Word] NOT IN (
		'&amp;','a','an','and','are','as','for','in','is','it','its','of','on',
		'the','then','these','those','to','was','were','with','would'
	)
	ORDER BY [Id]

RETURN 0
