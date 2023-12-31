# Cross-Country-Skiing 🎿
## PROJECT DESCRIPTION / OPIS PROJEKTU
ENG 🇬🇧:
The "Cross-Country-Skiing" project was created to enable analysis of sports results in the cross-country skiing discipline from various prestigious competitions, such as the Olympic Games, World Championships and the World Cup. The project's SQL database provides detailed information on the top three athletes from each competition. To make the project easier to use, there are also prepared views that allow a clearer presentation of the data. In addition, the repository contains sample queries that can be used to retrieve specific information from the database. Each query is described with a comment that explains what data is returned by the query.


POL 🇵🇱: 
Projekt "Cross-Country-Skiing" został stworzony w celu umożliwienia analizy wyników sportowych w dyscyplinie biegów narciarskich z różnych prestiżowych zawodów, takich jak Igrzyska Olimpijskie, Mistrzostwa Świata oraz Puchar Świata. W bazie danych SQL projektu znajdują się szczegółowe informacje na temat trzech najlepszych zawodniczek z każdej konkurencji. W celu ułatwienia korzystania z projektu, dostępne są również przygotowane widoki, które pozwalają na bardziej czytelną prezentację danych. Dodatkowo, w repozytorium znajdują się przykładowe zapytania, które można wykorzystać do pobierania konkretnych informacji z bazy danych. Każde zapytanie jest opatrzone komentarzem, który wyjaśnia, jakie dane są zwracane przez dane zapytanie.

### DATABASE STRUCTURE / STRUKTURA BAZY DANYCH
ENG 🇬🇧:
The database structure was created based on data obtained from various sources on the Internet. It was then subdivided and transformed to achieve normalization. Normalization consisted of creating appropriate tables and establishing relationships between them. This reduced data redundancy and removed any inconsistent relationships. Tools used were: EXCEL, PYTHON and SQL; 
Structure of the database:
Tables - ATHLETS.txt, COMPETITION.txt, RESULTS.txt, SEASONWINNER.txt and TEAM.txt; Views to enable more advanced data analysis; SQL queries to retrieve specific information from the database;


POL 🇵🇱:
Struktura bazy danych została stworzona w oparciu o dane pozyskane z różnych źródeł w internecie. Następnie dokonano jej podziału oraz przekształceń w celu osiągnięcia normalizacji. Normalizacja polegała na tworzeniu odpowiednich tabel i ustalaniu relacji między nimi. W ten sposób zredukowano nadmiarowość danych oraz usunięto wszelkie niespójne zależności. Wykorzystano do tego narzędzia takie jak: EXCEL, PYTHON oraz SQL;
Struktura bazy danych:
Tabele - ATHLETS.txt, COMPETITION.txt, RESULTS.txt, SEASONWINNER.txt oraz TEAM.txt; Widoki umożliwiające bardziej zaawansowane analizy danych; Zapytania SQL pozwalające na pobieranie konkretnych informacji z bazy danych;

####  DATABASE RELATIONSHIPS / RELACJE BAZY DANYCH  
ENG 🇬🇧:
Tables: ATHLETS.txt  - contains data regarding the athletes who participated in the competition. It contains such information as Name (NAME_1), the country they represent (COUNTRY), Gender (GENDER) and the athlete's code (FIS_CODE). It has a primary key - ID; COMPETITION.txt - contains data regarding the date (DATE), place (CITY, COUNTRY) and type (TYPE_OF_COMPETITION) and competition of the event (DISTANCE). It has a primary key - ID; RESULTS.txt - contains data regarding the results in a given competition (PLACE, NAME_1). It has a primary key - ID and foreign keys: ID_COMPETITION and ID_ATHLETS; SEASONWINNER.txt - contains data regarding awards (PRIZE), which are received at the end of each season for a place in the top three (PLACE). They also indicate in what season the player achieved a given award (SEASON). It has a primary key - ID and a foreign key ID_ATHLETS; TEAM.txt - contains information regarding the nationality(COUNTRY) that the player represents. It has a primary key - ID and a foreign key ID_ATHLETS; 


POL 🇵🇱:
Tabele: ATHLETS.txt - zawiera dane odnośnie zawodników, którzy brali udział w zawodach. Znajdują się takie informacje jak: Imię i nazwisko (NAME_1), kraj który reprezentują (COUNTRY), Płeć (GENDER) oraz kod zawodnika (FIS_CODE). Posiada klucz gówny - ID; COMPETITION.txt - zawiera dane odnośnie daty(DATE), miejsca(CITY, COUNTRY) oraz rodzaj(TYPE_OF_COMPETITION) i  konkurencji zawodów(DISTANCE). Posiada klucz gówny - ID; RESULTS.txt - zawiera dane odnośnie wyników w danej konkurencji (PLACE, NAME_1). Posiada klucz gówny - ID oraz klucze obce: ID_COMPETITION oraz ID_ATHLETS; SEASONWINNER.txt - zawiera dane odnośnie nagród (PRIZE), które otrzymuję się na koniec każdego sezonu za miejsce w top 3 (PLACE). Wskazują też w jakim sezonie zawodnik osiągnął daną nagrodę (SEASON). Posiada klucz gówny - ID oraz klucz obcy ID_ATHLETS; TEAM.txt - zawiera informację odnośnie narodowości(COUNTRY), którą dany zawodnik reprezentuję i należy. Posiada klucz gówny - ID oraz klucz obcy ID_ATHLETS;

##### PROJECT OBJECTIVE / CEL PROJEKTU
ENG 🇬🇧:
The goal of this project is to enable analysis and understanding of sports performance in cross-country skiing. Views and queries allow quick and precise data search and report generation.


POL 🇵🇱:
Celem tego projektu jest umożliwienie analizy i zrozumienia wyników sportowych w biegach narciarskich. Widoki i zapytania pozwalają na szybkie i precyzyjne wyszukiwanie danych oraz generowanie raportów.

###### INSTRUCTIONS FOR USE / INSTRUKCJA UŻYCIA
ENG 🇬🇧:
Import all the tables into your database, then prepare views and SQL queries to get the information of interest from the database. 


POL 🇵🇱:
Zaimportuj wszystkie tabele do swojej bazy danych, a następnie  przygotuj widoki i zapytania SQL, które pomogą Ci uzyskać interesujące informacje z bazy danych. 
