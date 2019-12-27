punkt 1.

CREATE TABLE pracownik (
id INT AUTO_INCREMENT PRIMARY KEY,
imie VARCHAR(20),
nazwisko VARCHAR (30) not null,
wyplata DECIMAL(10,2),
data_urodzenia DATE,
stanowisko VARCHAR(30));

punkt 2.

INSERT INTO pracownik(imie, nazwisko, wyplata, data_urodzenia, stanowisko)
VALUES ('Maja','Kijowska',6000, '1982-03-12', 'Kasjerka'),
	   ('Kaja','Nowakowska',4000,'1983-04-20','Kierownik sprzedaży'),
       ('Anna','Kowalska','5000','1981-09-13','Sprzedawca'),
       ('Krystian','Garsztecki','7500', '2001-01-20','Ochroniarz'),
       ('Piotr','Kruszynski',6500,'1979-08-25','Sprzedawca'),
       ('Izabela','Kijańska',4500,'1989-11-02','Księgowa');

punkt 3. Pobiera wszystkich pracowników i wyświetla ich w kolejności alfabetycznej po nazwisku

select * from pracownik order by nazwisko;

punkt 4. Pobiera pracowników na wybranym stanowisku

select * from pracownik where stanowisko='Kasjerka';

punkt 5. Pobiera pracowników, którzy mają co najmniej 30 lat

select * from pracownik where ABS(DATEDIFF(data_urodzenia, CURDATE()))>=30*365;

punkt 6. Zwiększa wypłatę pracowników na wybranym stanowisku o 10%

select id, imie, nazwisko, wyplata+(wyplata*0.1), data_urodzenia, stanowisko from pracownik where stanowisko='Pielęgniarka';

punkt 7. Usuwa najmłodszego pracownika

-- tu mi nie działa. Select mi działa a delete po zagnieżdźonym selekcie nie.
Dopiero jak wyciągnę delektem pracownika i usunę go po id działa.

  select data_urodzenia from pracownik where data_urodzenia=(select MAX(data_urodzenia) from pracownik);

  delete from pracownik where id='4';

  delete from pracownik where id=(select id from pracownik where data_urodzenia=(select MAX(data_urodzenia) from pracownik));

punkt 8. Usuwa tabelę pracownik

drop table pracownik;

punkt 9. Tworzy tabelę stanowisko (nazwa stanowiska, opis, wypłata na danym stanowisku)

CREATE TABLE stanowisko(
nazwa_stanowiska VARCHAR(20),
opis VARCHAR(50),
wypłata DECIMAL(10,2));

punkt 10. Tworzy tabelę adres (ulica+numer domu/mieszkania, kod pocztowy, miejscowość)

CREATE TABLE adres(
ulica_numer VARCHAR(30),
kod_pocztowy VARCHAR(10),
miejscowość VARCHAR(30));

punkt 11. Tworzy tabelę pracownik (imię, nazwisko) + relacje do tabeli stanowisko i adres

CREATE TABLE pracownik(
prac_id INT,
imie VARCHAR(10),
nazwisko VARCHAR(20));

ALTER TABLE adres
ADD COLUMN prac_id INT;

ALTER TABLE stanowisko
ADD COLUMN prac_id INT;


punkt 12. Dodaje dane testowe (w taki sposób, aby powstały pomiędzy nimi sensowne powiązania)

INSERT INTO pracownik(prac_id, imie, nazwisko)
VALUES(1, 'Maja','Kijowska'),
      (2, 'Kaja','Nowakowska'),
      (3, 'Anna','Zawada');


INSERT INTO adres (ulica_numer, kod_pocztowy, miejscowość,prac_id)
VALUES('Mickiewicza 12/5', '51-160','Wrocław',1),
      ('Słowackiego 5/6','12-120','Kraków',2),
      ('Bolka i Lolka 32','01-300','Warszawa',3);

 INSERT INTO stanowisko(nazwa_stanowiska,opis,wypłata,prac_id)
VALUES('Kierownik','Zarządzanie zasobami i projektem',15000,1),
       ('Sprzedawca','Kontakt z klientem, sprzedaz bezposlrednia', 5000,1),
       ('Księgowa','Prowadzenie księgowości',7000,3);

punkt 13. Pobiera pełne informacje o pracowniku (imię, nazwisko, adres, stanowisko)

select imie, nazwisko, adres.ulica_numer, adres.kod_pocztowy, adres.miejscowość, stanowisko.nazwa_stanowiska as stanowisko from pracownik
INNER JOIN adres ON pracownik.prac_id=adres.prac_id
INNER JOIN stanowisko ON pracownik.prac_id=stanowisko.prac_id;

punkt 14. Oblicza sumę wypłat dla wszystkich pracowników w firmie

select sum(wypłata)as SUMA_WYPŁAT from stanowisko;

punkt15. Pobiera pracowników mieszkających w lokalizacji z kodem pocztowym 90210 (albo innym, który będzie miał sens dla Twoich danych testowych)

select imie, nazwisko, a.ulica_numer, a.kod_pocztowy, a.miejscowość, s.nazwa_stanowiska from pracownik p
INNER JOIN adres a ON p.prac_id=a.prac_id
INNER JOIN stanowisko s ON p.prac_id=s.prac_id
where a.kod_pocztowy='01-300';