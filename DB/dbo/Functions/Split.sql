
CREATE FUNCTION [dbo].[Split] (  
	@List nvarchar(MAX),
	@Delimiter nvarchar(3)
)    
RETURNS TABLE
WITH SCHEMABINDING
AS
RETURN (
	SELECT	ROW_NUMBER() OVER(ORDER BY N) AS [Ordinal],
			SUBSTRING(@List, N, CHARINDEX(@Delimiter, @List + @Delimiter, N) - N) AS [Item]
	FROM	dbo.Numbers
	WHERE	N <= CONVERT(INT, LEN(@List))
		AND SUBSTRING(@Delimiter + @List, N, LEN(@Delimiter)) = @Delimiter
);
