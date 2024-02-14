-- interogare1: Selecteaza toate conturile de tip capital (ca)
-- SELECT * FROM Conturi WHERE TipCont = 'ca';

-- interogare2: Afiseaza toate tranzactiile efectuate intr-o anumita zi
-- SELECT * FROM Tranzactii WHERE DataTranzactie = '2023-01-15';

-- interogare3: Calculeaza soldul curent al unui anumit cont
-- SELECT NumarCont, SoldCurent FROM Conturi WHERE NumarCont = 10001;

-- interogare4: Afiseaza detaliile unei tranzactii specifice
-- SELECT * FROM DetaliiTranzactii WHERE NumarTranzactie = 1;

-- interogare5: Listeaza toate tranzactiile efectuate de un anumit utilizator
-- SELECT T.* FROM Tranzactii T
-- JOIN LogTranzactii LT ON T.NumarTranzactie = LT.NumarTranzactie
-- WHERE LT.UserID = 6;

-- interogare6: Afiseaza toate tranzactiile dintr-o anumita perioada
-- SELECT * FROM Tranzactii WHERE DataTranzactie BETWEEN '2010-01-01' AND '2010-06-01';

-- interogare7: Calculeaza soldul total curent al fiecarui tip de cont
-- SELECT TipCont, SUM(SoldCurent) AS SoldTotal FROM Conturi GROUP BY TipCont;

-- interogare8: Afiseaza toate tranzactiile care au implicat un cont cu un anumit număr
-- SELECT T.* FROM Tranzactii T
-- JOIN DetaliiTranzactii DT ON T.NumarTranzactie = DT.NumarTranzactie
-- WHERE DT.ContDebitor = 10001 OR DT.ContCreditor = 10001;

-- interogare9: Afiseaza toate tranzactiile in care un anumit cont a fost debitor
-- SELECT * FROM DetaliiTranzactii WHERE ContDebitor = 10001;


-- interogare10: Afiseaza toate tranzactiile care au o suma mai mare de 500
-- SELECT * FROM Tranzactii WHERE SumaTranzactionata > 500.00;

-- interogare11: Afiseaza toate tranzactiile care au avut loc într-o anumita perioada de timp si implica un anumit cont:
-- SELECT T.*, DT.*
-- FROM Tranzactii T
-- JOIN DetaliiTranzactii DT ON T.NumarTranzactie = DT.NumarTranzactie
-- WHERE T.DataTranzactie BETWEEN '2022-01-01' AND '2023-12-31'
-- AND (DT.ContDebitor = 10001 OR DT.ContCreditor = 10001);

-- interogare12: Afiseaza toate tranzactiile cu o anumita descriere
-- SELECT * FROM Tranzactii WHERE DescriereTranzactie = 'Vanzare';

-- interogare13: Afiseaza toate tranzactiile realizate de utilizatori cu rolul 'Admin'
-- SELECT T.*
-- FROM Tranzactii T
-- JOIN LogTranzactii LT ON T.NumarTranzactie = LT.NumarTranzactie
-- JOIN Utilizatori U ON LT.UserID = U.UserID
-- WHERE U.Rol = 'Admin';

-- interogare14:Afiseaza toate tranzactiile ordonate descrescator dupa suma tranzactionata
-- SELECT * FROM Tranzactii ORDER BY SumaTranzactionata DESC;

-- interogare15: Afiseaza toate tranzactiile efectuate inainte de o anumita data
-- SELECT * FROM Tranzactii WHERE DataTranzactie < '2023-01-15';

-- interogare16:Afiseaza bilantul initial si suma totala debitoare si creditoare pentru toate conturile
-- SELECT
    -- NumarCont,
    -- SoldInitial,
    -- SoldCurent,
    -- CASE WHEN TipCont IN ('ca', 'ac') THEN SoldInitial ELSE 0 END AS SoldDebit,
    -- CASE WHEN TipCont = 'pa' THEN SoldInitial ELSE 0 END AS SoldCredit
-- FROM Conturi;

-- interogare17:Afiseaza toate tranzactiile care au o anumita suma tranzactionata
-- SELECT * FROM Tranzactii WHERE SumaTranzactionata = 200.00;

-- interogare18:Afiseaza toate tranzactiile realizate de utilizatorul cu un anumit nume
-- SELECT T.*
-- FROM Tranzactii T
-- JOIN LogTranzactii LT ON T.NumarTranzactie = LT.NumarTranzactie
-- JOIN Utilizatori U ON LT.UserID = U.UserID
-- WHERE U.NumeUtilizator = 'User6';

-- interogare19:Afiseaza conturile care nu au avut nicio tranzactie
-- SELECT C.*
-- FROM Conturi C
-- LEFT JOIN DetaliiTranzactii DT ON C.NumarCont = DT.ContDebitor OR C.NumarCont = DT.ContCreditor
-- WHERE DT.NumarTranzactie IS NULL;

-- interogare20:Afiseaza toate tranzactiile care au fost introduse în ultima saptamana
-- SELECT * FROM Tranzactii WHERE DataTranzactie >= CURDATE() - INTERVAL 7 DAY;
