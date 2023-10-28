-- ranking zawodniczek  (ile i jakie zdobyly nagrody) 
SELECT a.NAME_1, a.ID, b.PRIZE, count(b.PLACE) as winner
FROM ATHLETS a
LEFT JOIN SEASONWINNER b ON a.ID = b.ID_ATHLETS
WHERE b.PLACE='first'
GROUP BY b.PRIZE, a.id, a.NAME_1
ORDER BY b.PRIZE, winner desc

-- które zawodniczki wygrały wszystkie nagrody (czyli dużą, małą kryształowoą kule oraz kula za sprint)
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

-- ile reprezentantów posiada każda narodowość 
SELECT COUNTRY, count(COUNTRY) AS NUMBER_OF_PLAYERS
FROM TEAM
GROUP BY COUNTRY
ORDER BY NUMBER_OF_PLAYERS DESC

-- ile medali IO zdobyli sportowcy patrząc pod względem narodowości (zmieniając c.TYPE_OF_COMPETITION na 'MS' dowiemy się ile medali mistrzostw świata zdobyli sportowcy lub 'PS' ile zwyciestw w Pucharze Świata 
SELECT b.COUNTRY, count(b.country) AS NUMBERS_OF_MEDALS
FROM RESULTS a
JOIN ATHLETS b ON b.ID=a.ID_ATHLETS
JOIN COMPETITION c ON a.ID_COMPETITION=c.ID
WHERE a.PLACE='FIRST' AND c.TYPE_OF_COMPETITION='IO'
GROUP BY b.COUNTRY 
ORDER BY NUMBERS_OF_MEDALS DESC

--korzystając z widoku MostWinsByCountry, pokaż ile dany kraj ma najwięcej zwycięstw i kto z jego reprezentantów najwięcej osiągnął zwycięstw
SELECT *
FROM MostWinsByCountry
ORDER BY [Total Country Wins] DESC



