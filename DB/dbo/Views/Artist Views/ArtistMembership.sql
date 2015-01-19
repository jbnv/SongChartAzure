CREATE VIEW [dbo].[ArtistMembership]
AS 
SELECT 'a:miami-sound-machine' AS [ArtistFullname], 'a:gloria-estefan' AS [MemberFullname], CAST(0.50 AS DECIMAL) AS [CreditRatio]
UNION SELECT 'a:beatles','a:paul-mccartney', CAST(0.25 AS DECIMAL)
UNION SELECT 'a:beatles','a:john-lennon', CAST(0.25 AS DECIMAL)
UNION SELECT 'a:beatles','a:george-harrison', CAST(0.25 AS DECIMAL)
UNION SELECT 'a:beatles','a:ringo-starr', CAST(0.25 AS DECIMAL)
UNION SELECT 'a:eagles','a:don-henley', CAST(0.20 AS DECIMAL)
UNION SELECT 'a:eagles','a:glenn-frey', CAST(0.20 AS DECIMAL)
UNION SELECT 'a:eagles','a:joe-walsh', CAST(0.20 AS DECIMAL)
UNION SELECT 'a:genesis','a:phil-collins', CAST(0.50 AS DECIMAL)
UNION SELECT 'a:dionne-friends','a:dionne-warwick', CAST(0.25 AS DECIMAL)
UNION SELECT 'a:dionne-friends','a:stevie-wonder', CAST(0.25 AS DECIMAL)
UNION SELECT 'a:dionne-friends','a:gladys-knight', CAST(0.25 AS DECIMAL)
UNION SELECT 'a:dionne-friends','a:elton-john', CAST(0.25 AS DECIMAL)
UNION SELECT 'a:power-station','a:robert-palmer', CAST(0.50 AS DECIMAL)
UNION SELECT 'a:journey','a:steve-perry', CAST(0.50 AS DECIMAL)
UNION SELECT 'a:foreigner','a:lou-gramm', CAST(0.50 AS DECIMAL)
