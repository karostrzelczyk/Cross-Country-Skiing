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


