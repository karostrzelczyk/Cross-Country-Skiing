-- Ranking of the athletes (how many and what awards they won)  
SELECT a.NAME_1, a.ID, b.PRIZE, count(b.PLACE) as winner
FROM ATHLETS a
LEFT JOIN SEASONWINNER b ON a.ID = b.ID_ATHLETS
WHERE b.PLACE='first'
GROUP BY b.PRIZE, a.id, a.NAME_1
ORDER BY b.PRIZE, winner desc

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



