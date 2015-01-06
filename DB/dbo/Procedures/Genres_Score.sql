CREATE PROCEDURE [dbo].[Genres_Score]
AS
	UPDATE [Genres] 
	SET [SongCount] = (
		SELECT COUNT(*)
		FROM [Songs] 
		WHERE [GenreID]=[Genres].[Id]
	), [Score] = (
		SELECT SUM([Score]) 
		FROM [Songs] 
		WHERE [GenreID]=[Genres].[Id]
	)
RETURN 0
