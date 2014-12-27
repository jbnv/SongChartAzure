CREATE FUNCTION [dbo].[ParseRanks] (@ranks VARCHAR(1000))
RETURNS TABLE
WITH SCHEMABINDING
AS
RETURN
(
    SELECT	[ranks].[Ordinal]-1 AS [Ordinal],
			[ranks].[Item] AS [Rank]
    FROM	[dbo].[Split](REPLACE(REPLACE(@ranks,'[',''),']',''),',') ranks
	CROSS APPLY (SELECT CAST(ranks.Item AS DECIMAL(4,2)) AS [Rank]) rankFn
	WHERE	CAST(ranks.Item AS FLOAT) < 25.00

);
