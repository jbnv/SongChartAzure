CREATE PROCEDURE [dbo].[Songs_Score]
AS
	UPDATE [Songs] SET [Score] = (
		SELECT SUM([Score])	
		FROM [SongRanks] 
		WHERE [SongId]=[Songs].[Id]
	)
RETURN 0
