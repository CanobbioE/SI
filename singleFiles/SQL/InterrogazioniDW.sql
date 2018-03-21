
-- Stabilire il costo medio e massimo delle missioni svoltesi in Italia negli ultimi 6 mesi da personale strutturato:

SELECT AVG(M.costo) as costoMedio, MAX(M.costo) as costoMassimo
FROM MissioniFT as M, LuogoDT as L, RichiedenteDT as R, DataFT as D
WHERE L.luogoID = M.luogoID AND L.stato = "italia"
AND D.dataID = M.dataID AND D.anno BETWEEN EXTRACT(year FROM CURRENT_DATE)::int-1 AND EXTRACT(year FROM CURRENT_DATE)::int
AND D.month BETWEEN mod(12+(EXTRACT(month FROM CURRENT_DATE)::int-6), 12) AND EXTRACT(month FROM CURRENT_DATE)::int
AND R.richiedenteID = M.richiedenteID AND R.categoria = "strutturato"


-- Stabilire il costo medio e massimo delle missioni su progetti europei, fatte all’estero, nell’ultimo anno

SELECT AVG(M.costo) as costoMedio, MAX(M.costo) as costoMassimo
FROM MissioniFT as M, LuogoDT as L, DataFT as D, ProgettoDT AS P
WHERE P.progettoID = M.progettoID AND P.tipo = "europeo"
AND L.luogoID = m.luogoID AND L.stato <> "italia"
AND D.dataID = M.dataID AND D.anno = EXTRACT(year FROM CURRENT_DATE)::int-1


-- Elencare i progetti europei che hanno speso più di 3000 euro in missioni per studenti di dottorato nell’ultimo anno

SELECT P.progettoID, SUM(M.costo)
FROM MissioniFT AS M, ProgettoDT AS P, RichiedenteDT AS R
WHERE P.progettoID = M.progettoID AND P.tipo = "europeo"
AND R.richiedenteID = M.richiedenteID AND R.ruolo = "dottorato"
GROUP BY P.progettoID
HAVING SUM(M.costo) > 3000
