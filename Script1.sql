-- CREATE DATABASE Bilant_contabil ;

 USE Bilant_contabil;

-- Tabelul Conturi
CREATE TABLE IF NOT EXISTS Conturi (
	NumarCont INT(5) PRIMARY KEY ,
    Descriere VARCHAR(50) NOT NULL,
    TipCont CHAR(2) CHECK(TipCont IN ('ca', 'pa', 'ac')),
    SoldInitial DECIMAL(10,2) NOT NULL,
    SoldCurent DECIMAL(10,2) NOT NULL
);

-- Tabelul Tranzactii
CREATE TABLE IF NOT EXISTS Tranzactii (
    NumarTranzactie INT(5) PRIMARY KEY CHECK(NumarTranzactie <= 10000),
    DataTranzactie DATE,
    SumaTranzactionata DECIMAL(10,2) CHECK(SumaTranzactionata <= 10000.00),
    DescriereTranzactie VARCHAR(10) NOT NULL CHECK( DescriereTranzactie< 10)
);

-- Tabelul DetaliiTranzactii
CREATE TABLE IF NOT EXISTS DetaliiTranzactii (
    IDDetaliuTranzactie INT PRIMARY KEY,
    NumarTranzactie INT(5),
    ContDebitor INT(5),
    ContCreditor INT(5),
    FOREIGN KEY (NumarTranzactie) REFERENCES Tranzactii(NumarTranzactie),
    FOREIGN KEY (ContDebitor) REFERENCES Conturi(NumarCont),
    FOREIGN KEY (ContCreditor) REFERENCES Conturi(NumarCont)
);

CREATE TABLE IF NOT EXISTS Utilizatori (
    UserID INT PRIMARY KEY,
    NumeUtilizator VARCHAR(50) NOT NULL,
    Parola VARCHAR(255) NOT NULL,
    Rol VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS LogTranzactii (
    IDLog INT PRIMARY KEY,
    UserID INT,
    NumarTranzactie INT(5),
    FOREIGN KEY (UserID) REFERENCES Utilizatori(UserID),
    FOREIGN KEY (NumarTranzactie) REFERENCES Tranzactii(NumarTranzactie)
);

-- 2
INSERT ignore INTO Conturi VALUES
    (10001, 'Cont Capital', 'ca', 100000.00, 100000.00),
    (10002, 'Cont Pasiv', 'pa', 50000.00, 55000.00),
    (10003, 'Cont Activ', 'ac', 20000.00, 25000.00),
    (10004, 'Cont Capital 2', 'ca', 80000.00, 80000.00),
    (10005, 'Cont Pasiv 2', 'pa', 75000.00, 80000.00);

INSERT ignore Tranzactii VALUES
    (1, '2023-01-15', 200.00, 'Vanzare'),
    (2, '2023-03-01', 1000.00, 'Cumparare'),
    (3, '2023-04-10', 500.00, 'Salariu'),
    (4, '2010-05-01', 300.00, 'Invest'),
    (5, '2023-06-30', 80.00, 'Fam');

INSERT ignore INTO DetaliiTranzactii VALUES
    (1, 1, 10001, 10002),
    (2, 2, 10002, 10003),
    (3, 3, 10002, 10001),
    (4, 4, 10004, 10005),
    (5, 5, 10005, 10004);

INSERT IGNORE INTO Utilizatori (UserID, NumeUtilizator, Parola, Rol)
VALUES
	(6, 'User6', 'password6', 'Admin'),
    (7, 'User7', 'password7', 'User'),
    (8, 'User8', 'password8', 'User'),
    (9, 'User9', 'password9', 'User'),
    (10, 'User10', 'password10', 'Admin');

INSERT IGNORE INTO LogTranzactii (IDLog, UserID, NumarTranzactie)
VALUES
    (11, 6, 1),
    (12, 7, 2),
    (13, 8, 3),
    (14, 9, 4),
    (15, 10, 5);
    
-- 3
DROP PROCEDURE IF EXISTS RealizareTranzactie;

DELIMITER //
CREATE PROCEDURE  RealizareTranzactie(
    IN pNumarTranzactie INT,
    IN pContDebitor INT,
	IN pContCreditor INT,
    IN pSumaTranzactionata DECIMAL(10,2),
    IN pDescriereTranzactie VARCHAR(10)
)
BEGIN
    DECLARE soldDebitor DECIMAL(10,2);
    DECLARE soldCreditor DECIMAL(10,2);

    -- Verificare dacă conturile există
    SELECT SoldCurent INTO soldDebitor FROM Conturi WHERE NumarCont = pContDebitor;
    SELECT SoldCurent INTO soldCreditor FROM Conturi WHERE NumarCont = pContCreditor;

    IF soldDebitor IS NULL OR soldCreditor IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Unul dintre conturi nu exista.';
    END IF;

    -- Verificare daca suma tranzactionata este mai mica sau egala cu soldul debitorului
    IF pSumaTranzactionata > soldDebitor THEN
        SIGNAL SQLSTATE '45000' -- genereaza o exceptie
        SET MESSAGE_TEXT = 'Suma tranzactionata depaseste soldul contului debitor.';
    END IF;

    -- Actualizare sold pentru contul debitor/creditor
    UPDATE Conturi SET SoldCurent = soldDebitor - pSumaTranzactionata WHERE NumarCont = pContDebitor;
    UPDATE Conturi SET SoldCurent = soldCreditor + pSumaTranzactionata WHERE NumarCont = pContCreditor;

    -- Inregistrare tranzactie
    INSERT INTO Tranzactii(NumarTranzactie, DataTranzactie, SumaTranzactionata, DescriereTranzactie)
    VALUES (pNumarTranzactie, CURDATE(), pSumaTranzactionata, pDescriereTranzactie);
END;
//
DELIMITER ;

-- 5	Sa se afiseze toate tranzactiile in care este folosit un anumit cont.
SELECT T.*
FROM Tranzactii T
JOIN DetaliiTranzactii DT ON T.NumarTranzactie = DT.NumarTranzactie
WHERE DT.ContDebitor = 10001 OR DT.ContCreditor = 10001;