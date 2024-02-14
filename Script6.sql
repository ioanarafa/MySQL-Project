--   10. Sa se afiseze contul care apare in cele mai multe tranzactii precum si numarul de tranzactii in care el apare. 
SELECT ContDebitor AS NumarCont, COUNT(*) AS NumarTranzactii
FROM DetaliiTranzactii
GROUP BY ContDebitor -- calc. nr. de tranzatii pt fiecare cont debitor

UNION  -- combina rezultatele pentru conturile debitoare si creditoare

SELECT ContCreditor AS NumarCont, COUNT(*) AS NumarTranzactii
FROM DetaliiTranzactii
GROUP BY ContCreditor -- calc. nr. de tranzatii pt fiecare cont creditor

ORDER BY NumarTranzactii DESC -- sorteaza rezultatele in ordine descrescatoare dupa numarul de tranzactii
LIMIT 1; -- limita 1