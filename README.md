# MySQL-Project

  Se considera o aplicatie online care este utilizata pentru realizarea bilantului contabil al unei firme. Aplicatia foloseste pentru stocarea datelor o baza de date  (considerata ca o colectie de tabele) care trebuie sa contina informatiile enumerate mai jos.  

  -numar cont cinci cifre,   
  -descriere 50 de caractere,   
  -tip cont 2 caractere (ca –capital, pa-pasiv, ac-activ),  
  -sold initial (suma disponibila in cont la inceputul anului curent),   
  -sold (suma disponibila in cont la momentul curent),   
  -numarul tranzactiei - nu poate fi mai mare decat 10000,   
  -data tranzactiei (trebuie sa fie din anul curent),   
  -suma tranzactionata - pentru un cont, intr-o singura tranzactie, nu poate fi mai mare decat 10000,  
  -descrierea tranzactiei (maxim 10 caractere), 
  
  Se cere:  
1)Sa se scrie comenzile de creare a tabelelor, impunand toate constrangerile care sunt considerate utile din punct de vedere functional si al integritatii datelor.  
2)Sa se scrie comenzile de populare a tabelelor cu informatii (minim 5 articole in fiecare tabela).  
3)Sa se implementeze o procedura care sa implementeze o tranzactie, stiind ca aceasta presupune 2 conturi – unul debitor (din care pleaca banii) si respectiv unul creditor (in care intra banii), procedura primeste ca si parametrii de intrare numarul tranzactiei, contul debitor, contul credtor, suma tranzactionata precum si o descriere a tranzactiei.  
4)Sa se implementeze un trigger care atunci cand este introdusa o tranzactie automat sa calculeze soldul conturilor implicate in tranzactie  
5)Să se afişeze toate tranzacţiile în care este folosit un anumit cont.  
6)Să se afişeze toate tranzactiile care au fost introduse in perioada (01.01.2010-01.06.2010)  
7)Să se calculeze şi să se afişeze bilantul initial, suma totala creditoare, respectiv debitoare, pentru toate conturile  
8)Să se afişeze toate tranzacţiile care implică conturi de un anumit tip  
9)Să se steargă un cont daca nu exista tranzactii pentru el  
10)Să se afiseze contul care apare in cele mai multe tranzactii precum si numarul de tranzactii in care el apare.  
EXTRA: 20 de interogari
