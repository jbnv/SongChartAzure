CREATE PROCEDURE [dbo].[Songs_Score]
AS
	UPDATE [Songs] SET [Score] = (
		SELECT SUM([dbo].[RankToScore]([Rank]))	
		FROM [SongRanks] 
		WHERE [SongId]=[Songs].[Id]
	)
RETURN 0
