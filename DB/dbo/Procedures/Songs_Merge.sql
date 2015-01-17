CREATE PROCEDURE [Songs_Merge] (
	@Fullname [varchar](10),
	@Title [varchar](128),
	@ArtistFullname [varchar](48),
	@Artist2Fullname [varchar](48),
	@Artist2RoleSlug [varchar](8),
	@Artist3Fullname [varchar](48),
	@Artist3RoleSlug [varchar](8),
	@DebutDateFullname [varchar](16),
	@GenreFullname [varchar](24),
	@Ranks [varchar](256),
	@Tags [varchar](max)	
)
AS
BEGIN
	MERGE [dbo].[Songs] AS tgt
    USING (SELECT @Fullname,@Title,@DebutDateFullname,@GenreFullname,@Ranks,@Tags) 
		AS src ([Fullname],[Title],[DebutDateFullname],[GenreFullname],[Ranks],[Tags])
    ON (tgt.[Fullname] = src.[Fullname])
    WHEN MATCHED THEN
        UPDATE	SET [Title] = src.[Title],
				[DebutDateFullname] = src.[DebutDateFullname],
				[GenreId] = (SELECT [Id] FROM [Genres] WHERE [Fullname] = src.[GenreFullname]),
				[Ranks] = src.[Ranks],
				[Tags] = src.[Tags]
	WHEN NOT MATCHED THEN
		INSERT ([Fullname],[Title],[DebutDateFullname],[GenreID],[Ranks],[Tags])
		VALUES (src.[Fullname],src.[Title],
				src.[DebutDateFullname],
				(SELECT [Id] FROM [Genres] WHERE [Fullname] = src.[GenreFullname]),
				src.[Ranks],
				src.[Tags])
	;
	DELETE FROM SongArtists WHERE [SongId] = (SELECT [Id] FROM [Songs] WHERE [Fullname] = @Fullname);

	INSERT INTO SongArtists ([SongId],[ArtistId],[RoleSlug])
	SELECT		(SELECT [Id] FROM [Songs] WHERE [Fullname] = @Fullname),
				(SELECT [Id] FROM [Artists] WHERE [Fullname] = @ArtistFullname),
				'primary'
	;
	IF @Artist2Fullname <> ''
		INSERT INTO SongArtists ([SongId],[ArtistId],[RoleSlug])
		SELECT		(SELECT [Id] FROM [Songs] WHERE [Fullname] = @Fullname),
					(SELECT [Id] FROM [Artists] WHERE [Fullname] = @Artist2Fullname),
					COALESCE(NULLIF(@Artist2RoleSlug,''),'co')
	;
	IF @Artist3Fullname <> ''
		INSERT INTO SongArtists ([SongId],[ArtistId],[RoleSlug])
		SELECT		(SELECT [Id] FROM [Songs] WHERE [Fullname] = @Fullname),
					(SELECT [Id] FROM [Artists] WHERE [Fullname] = @Artist3Fullname),
					COALESCE(NULLIF(@Artist3RoleSlug,''),'co')
	;

END;
