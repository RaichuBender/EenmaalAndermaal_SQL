use iproject48
GO

create table Verkoper (
    gebruiker varchar(25) not null,
    bank varchar(10) null,
    bankrekening varchar(20) null,
    controleOptie varchar(16) not null,
    creditcard char(19) null,
    aanmaaktijdCode datetime null,
    codeViaPost char(8) null,
    codeVerzonden bit not null,

    CONSTRAINT pk_verkoper_gebruiker PRIMARY KEY(gebruiker),
    CONSTRAINT fk_verkoper FOREIGN KEY (gebruiker) REFERENCES
        Gebruiker(gebruikersnaam)
)
GO

create table Voorwerp (
    voorwerpnummer numeric(10,0) not null,
    titel varchar(100) not null,
--titels varieren zeer in lengte. Het gemiddelde van een titel
--ligt rond de 50 tekens. daarom lijkt 100 ons een goed getal
    beschrijving nvarchar(max) not null,
--sommige ebay producten hebben niet-ascii tekens
-- zoals een ringel-s daarom de volledige unicode nvarchar
    startprijs numeric(5,2) not null,
    betalingswijze varchar(10) not null,
    betalingsinstructie varchar(50) null,
    plaatsnaam varchar(28) not null,
    land varchar(25) not null,
    looptijd numeric(2,0) not null,
    looptijdbeginTijdstip datetime not null,
    verzendkosten numeric(5,2) null,
    verzendinstructies varchar(50) null,
    verkoper varchar(25) not null,
    koper varchar(25) null,
    looptijdeindeTijdstip datetime not null,
    veilinggesloten char(3) not null,
    verkoopprijs numeric(5,2) null,

--Er is 1 standaard aangehouden dat de 1e letter geen hoofdletter is
--bedragen hebben een numeric van 5,2 dit zal de bedragen op veilingen
--wel houden, van 0,01 tot 99999,99

--de langste plaatsnaam van nederland heeft 28 karakters

    CONSTRAINT pk_voorwerp PRIMARY KEY(voorwerpnummer),
    CONSTRAINT fk_voorwerp_verkoper FOREIGN KEY (verkoper) REFERENCES
        Verkoper(Gebruiker),
    CONSTRAINT fk_voorwerp_koper FOREIGN KEY (koper) REFERENCES 
        Gebruiker(gebruikersnaam)
)
GO

CREATE TABLE Bestand (
	filenaam VARCHAR(512) not null, -- TODO mag dit?
	--filenaam CHAR(13) not null, -- Dit is hoe het in het voorbeeld staat
	voorwerpnummer numeric(10,0) not null,

	CONSTRAINT pk_bestand   PRIMARY KEY(filenaam),
	CONSTRAINT fk_voorwerp  FOREIGN KEY(voorwerpnummer) REFERENCES Voorwerp(voorwerpnummer)
)
GO

create table rubriek (
    rubrieknummer int not null,
    rubrieknaam varchar(50) not null,
    rubriek int null,
--zelfde data type als oorspronkelijke kolom
    volgnr int not null,

    CONSTRAINT pk_rubriek PRIMARY KEY(rubrieknummer),
    CONSTRAINT fk_rubriek FOREIGN KEY (rubriek) REFERENCES
        rubriek(rubrieknummer)
)
go

create table voorwerpInRubriek(
    voorwerp numeric(10,0) not null,
    rubriekoplaagsteniveau int not null,

--voorwerp moet zelfde lengte zijn als refererende kolom
--dit geldt ook voor rubriekoplaagsteniveau

    CONSTRAINT pk_voorwerpinrubriek_rubriek PRIMARY KEY(voorwerp, rubriekoplaagsteniveau),
    CONSTRAINT fk_voorwerpinrubriek_voorwerp FOREIGN KEY (voorwerp) REFERENCES
        Voorwerp(voorwerpnummer),
    CONSTRAINT fk_laagsteniveau FOREIGN KEY (rubriekoplaagsteniveau) REFERENCES
        Rubriek(rubrieknummer)
)
GO

CREATE TABLE bod (
    voorwerp numeric(10,0) not null,
    bodbedrag numeric(5,2) not null,
--een numeric waarde bij een bod is beter dan een char(5) bij char 5 is 99,99 het hoogste getal.
--dit is te laag voor een veilings site.
    gebruiker varchar(25) not null,
    bodtijdstip datetime not null,

    CONSTRAINT pk_bod_voorwerp_bodbedrag PRIMARY KEY (voorwerp, bodbedrag),
    CONSTRAINT fk_bod_voorwerp FOREIGN KEY (voorwerp) REFERENCES
        Voorwerp(voorwerpnummer),
    CONSTRAINT fk_bod_gebruiker FOREIGN KEY (gebruiker) REFERENCES
        Gebruiker(gebruikersnaam)
)
GO
