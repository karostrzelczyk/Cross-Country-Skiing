-- Returns the players (how many and what awards they won)  
SELECT a.NAME_1, a.ID, b.PRIZE, count(b.PLACE) as winner
FROM ATHLETS a
LEFT JOIN SEASONWINNER b ON a.ID = b.ID_ATHLETS
WHERE b.PLACE='first'
GROUP BY b.PRIZE, a.id, a.NAME_1
ORDER BY b.PRIZE, winner desc

-- Return players who have won at least 2 large crystal globe 
SELECT a.NAME_1, a.ID, b.PRIZE, count(b.PLACE) as winner
FROM ATHLETS a
LEFT JOIN SEASONWINNER b ON a.ID = b.ID_ATHLETS
WHERE b.PLACE='first'and b.PRIZE like'%large%'
GROUP BY b.PRIZE, a.id, a.NAME_1
HAVING COUNT(b.PLACE)>=2
ORDER BY b.PRIZE, winner desc
    
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

-- Returns the players who won all the prizes (i.e., the large crystal globe, the small crystal globe, and the sprint small globe)
SELECT wl.ID, wl.NAME_1
FROM winner_largecrystalglobes wl
WHERE EXISTS (
    SELECT *
    FROM winner_sprintcrystalglobes ws
    WHERE wl.ID = ws.ID AND wl.NAME_1 = ws.NAME_1
) AND EXISTS (
SELECT *
FROM winner_sprintcrystalglobes wss
WHERE wl.ID = wss.ID AND wl.NAME_1 = wss.NAME_1);

-- Returns how many players each country has
SELECT COUNTRY, count(COUNTRY) AS NUMBER_OF_PLAYERS
FROM TEAM
GROUP BY COUNTRY
ORDER BY NUMBER_OF_PLAYERS DESC

-- Returns how many Olympic Games medals athletes have won by nationality(By changing c.TYPE_OF_COMPETITION to 'MS' we will find out how many world championship medals athletes have won or 'PS' how many World Cup wins) 
SELECT b.COUNTRY, count(b.country) AS NUMBERS_OF_MEDALS
FROM RESULTS a
JOIN ATHLETS b ON b.ID=a.ID_ATHLETS
JOIN COMPETITION c ON a.ID_COMPETITION=c.ID
WHERE a.PLACE='FIRST' AND c.TYPE_OF_COMPETITION='IO'
GROUP BY b.COUNTRY 
ORDER BY NUMBERS_OF_MEDALS DESC

--Using the MostWinsByCountry view, returns how many wins a country has and who among its representatives has achieved the most wins
SELECT *
FROM MostWinsByCountry
ORDER BY [Total Country Wins] DESC

--Returns how many gold(first), silver(second) and bronze(third) medals were won by representatives of the countries
SELECT COUNT(a.PLACE) AS TOTAL_VICTORIES, a.PLACE, b.COUNTRY, c.TYPE_OF_COMPETITION
FROM RESULTS a
JOIN ATHLETS b ON a.ID_ATHLETS=b.ID
JOIN COMPETITION c ON c.ID=a.ID_COMPETITION
WHERE c.TYPE_OF_COMPETITION='MS'
GROUP BY a.PLACE, b.COUNTRY,c.TYPE_OF_COMPETITION
ORDER BY a.PLACE ASC, TOTAL_VICTORIES DESC

--Using the MostDistanceVictories views, returns which athlete had the most victories in a type of distance
SELECT *
FROM MostDistanceVictories
ORDER BY [DISTANCE]

--Returns information about the region from which the player is from, whether the player is from Scandinavia or another region. 
SELECT a.NAME_1, b.PLACE, a.COUNTRY,
CASE
	WHEN a.COUNTRY = 'NOR' OR a.COUNTRY = 'SWE' OR a.COUNTRY = 'FIN' THEN 'SCANDINAVIA'
	ELSE 'REST OF THE WORLD '
END AS REGION
FROM ATHLETS a
JOIN RESULTS b ON a.ID=b.ID_ATHLETS
JOIN TEAM C ON A.ID=C.ID_ATHLETS
WHERE b.PLACE='FIRST' 
ORDER BY REGION


