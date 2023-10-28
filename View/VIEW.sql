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
