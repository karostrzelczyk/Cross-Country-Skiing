# Cross-Country-Skiing
## Opis projektu
Projekt "Cross-Country-Skiing" został stworzony w celu umożliwienia analizy wyników sportowych w dyscyplinie biegów narciarskich z różnych prestiżowych zawodów,
takich jak Igrzyska Olimpijskie, Mistrzostwa Świata oraz Puchar Świata.
W bazie danych SQL projektu znajdują się szczegółowe informacje na temat trzech najlepszych zawodniczek z każdej konkurencji.
W celu ułatwienia korzystania z projektu, dostępne są również przygotowane widoki, które pozwalają na bardziej czytelną prezentację danych.
Dodatkowo, w repozytorium znajdują się przykładowe zapytania, które można wykorzystać do pobierania konkretnych informacji z bazy danych. 
Każde zapytanie jest opatrzone komentarzem, który wyjaśnia, jakie dane są zwracane przez dane zapytanie.

### Struktura bazy danych 
Struktura bazy danych została stworzona w oparciu o dane pozyskane z różnych źródeł w internecie. Następnie dokonano jej podziału oraz przekształceń w celu osiągnięcia normalizacji. Normalizacja polegała na tworzeniu odpowiednich tabel i ustalaniu relacji między nimi. W ten sposób zredukowano nadmiarowość danych oraz usunięto wszelkie niespójne zależności. Wykorzystano do tego narzędzia takie jak: EXCEL, PYTHON oraz SQL;
Struktura bazy danych:
* tabele - ATHLETS.txt, COMPETITION.txt, RESULTS.txt, SEASONWINNER.txt oraz TEAM.txt;
* widoki umożliwiające bardziej zaawansowane analizy danych;
* zapytania SQL pozwalające na pobieranie konkretnych informacji z bazy danych;
####  Relacje bazy danych 
Tabele:
ATHLETS.txt - zawiera dane odnośnie zawodników, którzy brali udział w zawodach. Znajdują się takie informacje jak: Imię i nazwisko (Name_1), kraj który reprezentują (COUNTRY), Płeć (Gender) oraz kod zawodnika (FIS_CODE). Posiada klucz gówny - ID;
COMPETITION.txt - zawiera dane odnośnie czasu (DATE), miejsca(CITY, COUNTRY) oraz rodzaj(TYP_OF_COMPETITION) i  konkurencji zawodów (DISTANCE). Posiada klucz gówny - ID;
RESULTS.txt - zawiera dane odnośnie wyników w danej konkurencji (PLACE, NAME_1). Posiada klucz gówny - ID oraz klucze obce: ID_COMPETITION oraz ID_ATHLETS;
SEASONWINNER.txt - zawiera dane odnośnie nagród (PRIZE), które otrzymuję się na koniec każdego sezonu za miejsce w top3 (PLACE). Wskazują też w jakim sezonie zawodnik osiągnął daną nagrodę (SEASON). Posiada klucz gówny - ID oraz klucz obcy ID_ATHLETS;
TEAM.txt - zawiera informację odnośnie narodowości(COUNTRY), którą dany zawodnik reprezentuję i należy. Posiada klucz gówny - ID oraz klucz obcy ID_ATHLETS;

##### Cel projektu
Celem tego projektu jest umożliwienie analizy i zrozumienia wyników sportowych w biegach narciarskich.Widoki i zapytania pozwalają na szybkie i precyzyjne wyszukiwanie danych oraz generowanie raportów.

###### Instrukcja użycie
Zaimportuj wszystkie tabele do swojej bazy danych, a następnie  przygotuj widoki i zapytania SQL, które pomogą Ci uzyskać interesujące informacje z bazy danych. Wykonuj zapytania SQL, aby uzyskiwać interesujące Cię informacje.
