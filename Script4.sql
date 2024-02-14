-- 8. Afiseaza toate tranzactiile care implica conturi de un anumit tip
SELECT
    t.NumarTranzactie,
    t.DataTranzactie,
    t.SumaTranzactionata,
    t.DescriereTranzactie,
    dt.ContDebitor,
    dt.ContCreditor
FROM
    Tranzactii t
JOIN
    DetaliiTranzactii dt ON t.NumarTranzactie = dt.NumarTranzactie
JOIN
    Conturi cd ON dt.ContDebitor = cd.NumarCont
JOIN
    Conturi cc ON dt.ContCreditor = cc.NumarCont
WHERE
    cd.TipCont = 'pa'; -- aici schimbi cu ca, pa si ac