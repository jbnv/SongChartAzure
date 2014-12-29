CREATE PROCEDURE [dbo].[Genres_Merge]
    @Fullname       VARCHAR(16),
    @Title          VARCHAR(256),
	@ParentFullname  VARCHAR(16)
AS
BEGIN
	MERGE [dbo].[Genres] AS tgt
    USING (SELECT @Fullname,@Title,@ParentFullname) 
		AS src ([Fullname],[Title],[ParentFullname])
    ON (tgt.[Fullname] = src.[Fullname])
    WHEN MATCHED THEN
        UPDATE SET 
			[Title] = src.[Title],
			[ParentFullname] = src.[ParentFullname]
	WHEN NOT MATCHED THEN
		INSERT ([Fullname],[Title],[ParentFullname])
		VALUES (src.[Fullname],src.[Title],src.[ParentFullname])
	;
END;
