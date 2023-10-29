-- Returns an athlete who has won a gold medal in the Olympic Games and won a gold medal in the World Championships
SELECT DISTINCT b.ID_ATHLETS, b.NAME_1, c.COUNTRY, c.FIS_CODE
FROM dbo.COMPETITION AS a 
INNER JOIN dbo.RESULTS AS b ON a.ID = b.ID_COMPETITION
INNER JOIN dbo.ATHLETS AS c ON b.ID_ATHLETS = c.ID
WHERE  (a.TYPE_OF_COMPETITION = 'MS') AND (b.ID_ATHLETS IS NOT NULL) AND (b.PLACE = 'FIRST') AND EXISTS
                      (SELECT 1 AS Expr1
                       FROM  dbo.COMPETITION AS a INNER JOIN
                             dbo.RESULTS AS b ON a.ID = b.ID_COMPETITION
                       WHERE (a.TYPE_OF_COMPETITION = 'IO'))
