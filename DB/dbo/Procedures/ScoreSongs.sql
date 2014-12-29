CREATE PROCEDURE [dbo].[ScoreSongs]
AS
	UPDATE [Songs] SET [Score] = (
		SELECT SUM([dbo].[RankToScore]([Rank]))	
		FROM [SongRanks] 
		WHERE [SongId]=[Songs].[Id]
	)
RETURN 0
