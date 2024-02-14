-- 7. Bilantul Initial, Suma Debitoare, si Suma Creditoare
SELECT
    NumarCont,
    Descriere,
    TipCont,
    SoldInitial,
    SoldCurent,
    CASE
        WHEN TipCont IN ('ca', 'ac') THEN 'Debit'
        WHEN TipCont = 'pa' THEN 'Credit'
    END AS TipSold,
    CASE
        WHEN TipCont IN ('ca', 'ac') THEN SoldInitial
        ELSE 0
    END AS SoldDebit,
    CASE
        WHEN TipCont = 'pa' THEN SoldInitial
        ELSE 0
    END AS SoldCredit
FROM Conturi;

-- Suma Debitoare si Suma Creditoare
SELECT
    'Suma Debitoare' AS TipSold,
    SUM(CASE WHEN TipCont IN ('ca', 'ac') THEN SoldInitial ELSE 0 END) AS Suma
FROM Conturi

UNION ALL

SELECT
    'Suma Creditoare' AS TipSold,
    SUM(CASE WHEN TipCont = 'pa' THEN SoldInitial ELSE 0 END) AS Suma
FROM Conturi

UNION ALL

SELECT
	'Bilant initial' as TipSold,
    sum(SoldInitial) from Conturi;