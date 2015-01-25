CREATE VIEW [RankUnrankedSongs]
AS
SELECT		s.[Fullname],
			s.Title,
			[MaxDebutRank] + 0.05 * ROW_NUMBER() OVER(PARTITION BY s.DebutDateFullname ORDER BY Title) AS [DebutRank],
			[MaxPeakRank] + 0.05 * ROW_NUMBER() OVER(PARTITION BY s.DebutDateFullname ORDER BY Title) AS [PeakRank]
FROM Songs s
INNER JOIN (
	select DebutDateFullname, MAX(DebutRank) AS [MaxDebutRank], MAX(PeakRank) AS [MaxPeakRank]
	from songs_detailed
	WHERE DebutDateFullname <> ''
	GROUP BY DebutDateFullname
) agg ON agg.DebutDateFullname = s.DebutDateFullname
WHERE [Ranks] = '' AND agg.[MaxDebutRank] IS NOT NULL AND agg.[MaxPeakRank] IS NOT NULL

