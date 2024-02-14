-- 9. Sterge un cont daca nu exista tranzactii pentru el
DELETE FROM Conturi
WHERE NOT EXISTS (
    SELECT 1 -- sa vedem daca exista
    FROM DetaliiTranzactii dt
    WHERE dt.ContDebitor = Conturi.NumarCont OR dt.ContCreditor = Conturi.NumarCont
);