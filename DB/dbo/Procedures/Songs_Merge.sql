CREATE PROCEDURE [Songs_Merge] (
	@Fullname [varchar](10),
	@Title [varchar](128),
	@ArtistFullname [varchar](48),
	@DebutDateFullname [varchar](16),
	@GenreFullname [varchar](24),
	@Ranks [varchar](256),
	@Tags [varchar](max)	
)
AS
BEGIN
	MERGE [dbo].[Songs] AS tgt
    USING (SELECT @Fullname,@Title,@ArtistFullname,@DebutDateFullname,@GenreFullname,@Ranks,@Tags) 
		AS src ([Fullname],[Title],[ArtistFullname],[DebutDateFullname],[GenreFullname],[Ranks],[Tags])
    ON (tgt.[Fullname] = src.[Fullname])
    WHEN MATCHED THEN
        UPDATE	SET [Title] = src.[Title],
				[ArtistId] = (SELECT [Id] FROM [Artists] WHERE [Fullname] = src.[ArtistFullname]),
				[DebutDateFullname] = src.[DebutDateFullname],
				[GenreId] = (SELECT [Id] FROM [Genres] WHERE [Fullname] = src.[GenreFullname]),
				[Ranks] = src.[Ranks],
				[Tags] = src.[Tags]
	WHEN NOT MATCHED THEN
		INSERT ([Fullname],[Title],[ArtistId],[DebutDateFullname],[GenreId],[Ranks],[Tags])
		VALUES (src.[Fullname],src.[Title],
				(SELECT [Id] FROM [Artists] WHERE [Fullname] = src.[ArtistFullname]),
				src.[DebutDateFullname],
				(SELECT [Id] FROM [Genres] WHERE [Fullname] = src.[GenreFullname]),
				src.[Ranks],
				src.[Tags])
	;
END;
