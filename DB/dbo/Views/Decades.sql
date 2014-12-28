﻿CREATE VIEW Decades
AS 
SELECT CAST(1950 AS SMALLINT) AS [Number], '1950s' AS [Slug]
UNION SELECT CAST(1960 AS SMALLINT), '1960s' AS [Slug]
UNION SELECT CAST(1970 AS SMALLINT), '1970s' AS [Slug]
UNION SELECT CAST(1980 AS SMALLINT), '1980s' AS [Slug]
UNION SELECT CAST(1990 AS SMALLINT), '1990s' AS [Slug]
UNION SELECT CAST(2000 AS SMALLINT), '2000s' AS [Slug]
UNION SELECT CAST(2010 AS SMALLINT), '2010s' AS [Slug]