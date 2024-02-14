-- 6 Sa se afiseze toate tranzactiile care au fost introduse in perioada (01.01.2010-01.06.2010) 
SELECT *
FROM Tranzactii T
WHERE DataTranzactie between '2010-01-01' and  '2010-06-01';