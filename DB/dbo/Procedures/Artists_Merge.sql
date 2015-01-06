CREATE PROCEDURE [dbo].[Artists_Merge]
    @Fullname       VARCHAR(32),
    @Title          VARCHAR(256),
    @GenreFullname  VARCHAR(32),
	@Tags			VARCHAR(MAX)
AS
BEGIN
	MERGE [dbo].[Artists] AS tgt
    USING (SELECT @Fullname,@Title,@GenreFullname,@Tags) 
		AS src ([Fullname],[Title],[GenreFullname],[Tags])
    ON (tgt.[Fullname] = src.[Fullname])
    WHEN MATCHED THEN
        UPDATE	SET [Title] = src.[Title],
				[GenreID] = (SELECT [Id] FROM [Genres] WHERE [Fullname]=src.[GenreFullname]),
				[Tags] = src.[Tags]
	WHEN NOT MATCHED THEN
		INSERT ([Fullname],[Title],[GenreId],[Tags])
		VALUES (src.[Fullname],src.[Title],(SELECT [Id] FROM [Genres] WHERE [Fullname]=src.[GenreFullname]),src.[Tags])
	;
END;
