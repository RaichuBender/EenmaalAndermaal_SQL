USE iproject48
GO

insert into gebruikerstelefoon values (
	'Thomas2',
	'06-12345678'
	)
GO

insert into Gebruiker values (
	'Thomas2',
	'Thomas2',
	'Thomas2',
	'Thomas2',
	'Thomas2',
	'2222 TH',
	'Thomas2',
	'Thomas2',
	'01/01/1970',
	'Thomas2@Thomas2.be',
	'Thomas2',
	1,
	'Thomas2',
	1,
	'',
	CURRENT_TIMESTAMP
)
go

insert into Verkoper values(
    'Thomas2',
    null,
    null,
    'esfc',
    null,
    null,
    null,
    1
)
go

insert into Voorwerp values (
    1,
    'Sokken',
    'Happy Socks heeft weer een nieuwe 2-peas-in-a-pod ontworpen. Dit keer met twee kleurige sokken met embroidery emblame erop in de vorm van een kers. Totaal anders, maar super gaaf en on-trend.',
    5.00,
    'Contant',
    'doe de natte pan in de kast',
    'sinttunnis',
    'Nederland',
    --'2 dagen en 28 minuten',
    8,
    '2020/05/04 15:20:00',
    3.00,
    'schipping instructions',
    'Thomas2',--'Jan',
    NULL,--'San',
    '2020/05/11 15:20:00',
    -- 0, TODO bit maken
    'Nee',
    NULL--20.00
)
go

insert into Bestand VALUES(
	'https://images-na.ssl-images-amazon.com/images/I/81fFJVO1BOL._AC_UX679_.jpg',
	1
)
GO


insert into Voorwerp values (
    2,
    'Ah basic aardbeienlimonade',
    'vers voor u bereid denk ik... koop nu',
    5.00,
    'Kont hand',--'Handje Contantje',
    'doe de natte pan in de kast',
    'sinttunnis',
    'Nederland',
    --'7 dagen',
    7,
    '2020/05/05 15:20:00',
    3.00,
    'schipping instructions',
    'Thomas2',--'Jan',
    NULL,--'Piet',
    '2020/05/11 15:20:00',
    -- 1, TODO bit maken
    'Ja',
    20.00
)
go

insert into Bestand VALUES(
    'https://static.ah.nl/image-optimization/static/product/AHI_434d50313833313031_1_LowRes_JPG.JPG',
	2
)
GO


insert into Voorwerp values (
    3,
    'Nintendo switch',
    'amper gebruikt',
    150.00,--1500.00,
    'IDEAL',
    'betaalinstructie',
    'sinttunnis',
    'Nederland',
    --'7 dagen',
    7,
    '2020/05/06 15:20:00',
    6.00,
    'schipping instructions',
    'Thomas2',--'NULL',
    NULL,--'Balkenende',
    '2020/05/11 15:20:00',
    -- 0, TODO bit maken
    'Nee',
    10.00
)
go

insert into Bestand VALUES(
    'https://i.pcmag.com/imagery/reviews/02traCY9YVrwwmniKWWEjLH-10.fit_scale.size_1028x578.v_1569480454.jpg',
	3
)
GO
