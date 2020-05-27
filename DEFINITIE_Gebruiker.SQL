use iproject48
GO

create table vraag (
    vraagnummer numeric(1,0)  not null,
    tekst_vraag varchar(30) not null

    CONSTRAINT PK_vraagnummer PRIMARY KEY (vraagnummer)
)
--Vragen zullen gemmiddeld gezien ongeveer 30 karakters lang zijn. Daarom is kiezen we voor een varchar van 30. 
GO

create table Gebruiker (
    gebruikersnaam varchar(25) not null,
    voornaam varchar(8) not null,
    achternaam varchar(50) not null,
    adresregel_1 varchar(20) not null,
    adresregel_2 varchar(20) null,
    postcode char(7) not null,
    plaatsnaam varchar(20) not null,
    Land varchar(25) not null,
    GeboorteDag varchar(12) not null,
    Mailbox varchar(255) not null,
-- een wachtwoord wordt gehashed in een database gezet dus zal het een groter bestand worden dan normale mail adressen
    wachtwoord varchar(255) not null,
    Vraag numeric(1,0) not null,
    antwoordtekst varchar(255) not null,
    Verkoper bit not null default 0,
    WachtwoordVergetenCode varchar(255) null,
    aanmaakTijdAccount datetime not null, 

    constraint pk_gebruiker PRIMARY KEY(gebruikersnaam),
    constraint ch_mail_apenstaartje CHECK (Mailbox like '%@%'),
    constraint ch_geboortedatum_voor_huidige_datum CHECK (GeboorteDag<= getDate())
);

-- voor en achternamen zijn niet altijd even lang dus is het efficienter om een varchar te gebruiken.
-- Dit geldt ook voor adresregels, plaatsnamen, Land namen, Geboortedagen, Mail adressen, wachtwoorden en antwoorden op de vraag.
-- Ook is de check gemaakt of een datum niet in de toekomst is gekozen.
GO


alter table Gebruiker
    ADD FOREIGN KEY (Vraag) REFERENCES vraag(vraagnummer)
GO

alter table Gebruiker
    ADD CONSTRAINT UC_unieke_mail UNIQUE (Mailbox)
-- bij bedrijven als bol.com en marktplaats kun je maar 1 mail adress gebruiken. Dit gebeurt zodat een verkoper
-- niet op zijn eigen veiling gaat bieden en zo de prijs gaat verhogen.
GO

create table gebruikerstelefoon (
--volgnr numeric(4,0) not null,
    volgnr INT IDENTITY NOT NULL,
    Gebruiker varchar(25) not null,
    telefoonnummer varchar(11) not null,
--niet in elk land is het telefoon nummer even lang
--in belgië is het 9 en nederland 10
    constraint pk_gebruikerstelefoon PRIMARY KEY(volgnr, Gebruiker),
    CONSTRAINT fk_Gebruiker FOREIGN KEY (Gebruiker) REFERENCES 
        Gebruiker(gebruikersnaam)
)
--ALTER TABLE gebruikerstelefoon AUTO_INCREMENT=100; 
GO

insert into vraag values(1, 'Hoe gaat het?')
GO

CREATE OR ALTER FUNCTION [dbo].[EmailAdresBestaatNogNiet](@email char(255))
RETURNS bit
AS
	begin
		return (
			select CASE WHEN COUNT(*) > 0 THEN 0 ELSE 1 END
			from Gebruiker 
			where Mailbox = @email
		)
	end
go



CREATE TABLE EmailVerificatie(
    MailBox char(255) NOT NULL,
    VerificatieCode char(255) NOT NULL,
    GemaaktOp datetime NOT NULL

    constraint pk_EmailVerificatie PRIMARY KEY(MailBox),
);
go

ALTER TABLE EmailVerificatie
    add CONSTRAINT Ck_checkOfAccountNietAlGeverifieerdIs 
    check 
    (dbo.EmailAdresBestaatNogNiet(MailBox) = 1)
go
