CREATE VIEW  winner_smallcrystalglobes AS 
SELECT a.NAME_1, a.ID, b.PRIZE, COUNT(b.PLACE) AS winner
FROM  dbo.ATHLETS AS a 
LEFT OUTER JOIN dbo.SEASONWINNER AS b ON a.ID = b.ID_ATHLETS
WHERE  (b.PLACE = 'first') AND (b.PRIZE LIKE '%small%') AND (b.PRIZE NOT LIKE '%sprint%')
GROUP BY b.PRIZE, a.ID, a.NAME_1

CREATE VIEW  winner_largecrystalglobes AS  
SELECT a.NAME_1, a.ID, b.PRIZE, COUNT(b.PLACE) AS winner
FROM dbo.ATHLETS AS a 
LEFT OUTER JOIN dbo.SEASONWINNER AS b ON a.ID = b.ID_ATHLETS
WHERE  (b.PLACE = 'first') AND (b.PRIZE LIKE '%large%')
GROUP BY b.PRIZE, a.ID, a.NAME_1
  
CREATE VIEW   winner_sprintcrystalglobes AS
SELECT a.NAME_1, a.ID, b.PRIZE, COUNT(b.PLACE) AS winner
FROM dbo.ATHLETS AS a 
LEFT OUTER JOIN dbo.SEASONWINNER AS b ON a.ID = b.ID_ATHLETS
WHERE  (b.PLACE = 'first') AND (b.PRIZE LIKE '%sprint%')
GROUP BY b.PRIZE, a.ID, a.NAME_1
  
--Zwraca ile zwyciestw ma dany kraj i który jego reprezentant zdobył najwięcej zwycięstw 
CREATE VIEW MostWinsByCountry AS
WITH AthleteVictories AS (
    SELECT 
        b.COUNTRY, 
        b.NAME_1,
        COUNT(*) AS VICTORIES,
        ROW_NUMBER() OVER(PARTITION BY b.COUNTRY ORDER BY COUNT(*) DESC) AS RANK
    FROM RESULTS a
    JOIN ATHLETS b ON a.ID_ATHLETS=b.ID
    WHERE a.PLACE = 'FIRST'
    GROUP BY b.COUNTRY, b.NAME_1)

SELECT 
    av.COUNTRY,
    av.NAME_1 AS 'Most Wins Athlete',
    av.VICTORIES AS 'Wins by Athlete',
    COUNT(a.place) AS 'Total Country Wins'
FROM RESULTS a
JOIN ATHLETS b ON a.ID_ATHLETS=b.ID
JOIN AthleteVictories av ON av.COUNTRY = b.COUNTRY
WHERE a.PLACE = 'FIRST' AND av.RANK = 1
GROUP BY av.COUNTRY, av.NAME_1, av.VICTORIES
GO
