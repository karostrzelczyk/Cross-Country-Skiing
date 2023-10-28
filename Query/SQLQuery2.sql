-- ranking zawodniczek  (ile i jakich zdobyly nagród) 
SELECT a.NAME_1, a.ID, b.PRIZE, count(b.PLACE) as winner
FROM ATHLETS a
LEFT JOIN SEASONWINNER b ON a.ID = b.ID_ATHLETS
where b.PLACE='first'
group by b.PRIZE, a.id, a.NAME_1
order by b.PRIZE, winner desc

-- które zawodniczki wygrały wszystkie nagrody (czyli dużą, małą kryształowoą kule oraz kula za sprint)
SELECT wl.ID, wl.NAME_1
FROM winner_largecrystalglobes wl
WHERE EXISTS (
    SELECT *
    FROM winner_sprintcrystalglobes ws
    WHERE wl.ID = ws.ID AND wl.NAME_1 = ws.NAME_1
) and exists (
select *
from winner_sprintcrystalglobes wss
 WHERE wl.ID = wss.ID AND wl.NAME_1 = wss.NAME_1);


