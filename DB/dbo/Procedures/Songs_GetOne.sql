CREATE PROCEDURE [dbo].[Songs_GetOne]
	@id INT
AS
SELECT		s.*
FROM		[dbo].[Songs_Detailed] s
WHERE		[Id] = @id
RETURN 0
