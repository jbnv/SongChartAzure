CREATE PROCEDURE [MergeSongData] (
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
				[ArtistFullname] = src.[ArtistFullname],
				[DebutDateFullname] = src.[DebutDateFullname],
				[GenreFullname] = src.[GenreFullname],
				[Ranks] = src.[Ranks],
				[Tags] = src.[Tags]
	WHEN NOT MATCHED THEN
		INSERT ([Fullname],[Title],[ArtistFullname],[DebutDateFullname],[GenreFullname],[Ranks],[Tags])
		VALUES (src.[Fullname],src.[Title],src.[ArtistFullname],src.[DebutDateFullname],src.[GenreFullname],src.[Ranks],src.[Tags])
	;
END;
