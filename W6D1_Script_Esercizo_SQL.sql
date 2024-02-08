create table store (
codice_store integer not null unique, 
indirizzo_fisico varchar(255),
numero_telefono varchar(255)
);

insert into store values 
(1,	'Via Roma 123, Milano',	'+39021234567'),
(2,	'Corso Italia 456, Roma',	'+39067654321'),
(3,	'Piazza San Marco 789, Venezia',	'+390419876543'),
(4,	'Viale degli Ulivi 234, Napoli', '+390813456789'),
(5, 'Via Torino 567, Torino',	'+390118765432'),
(6,	'Corso Vittorio Emanuele 890, Firenze',	'+390552345678'),
(7,	'Piazza del Duomo 123, Bologna',	'+390518765432'),
(8,	'Via Garibaldi 456, Genova',	'+390102345678'),
(9,	'Lungarno Mediceo 789, Pisa',	'+390508765432'),    
(10, 'Corso Cavour 101, Palermo', '+390912345678')
;

create table impiegato (
codice_fiscale varchar(255) not null unique,
nome varchar(255),
titolo_studio varchar(255),
recapito varchar(255)
);

insert into impiegato values
('ABC12345XYZ67890', 'Mario	Rossi',	'Laurea	in	Economia',	'mario.rossi@email.com'),
('DEF67890XYZ12345', 'Anna	Verdi',	'Diploma	di	Ragioneria',	'anna.verdi@email.com'),
('GHI12345XYZ67890', 'Luigi	Bianchi',	'Laurea	in	Informatica',	'luigi.bianchi@email.com'),
('JKL67890XYZ12345', 'Laura	Neri',	'Laurea	in	Lingue',	'laura.neri@email.com'),
('MNO12345XYZ67890', 'Andrea	Moretti',	'Diploma	di	Geometra', 'andrea.moretti@email.com'),
('PQR67890XYZ12345', 'Giulia	Ferrara',	'Laurea	in	Psicologia',	'giulia.ferrara@email.com'),
('STU12345XYZ67890', 'Marco	Esposito',	'Diploma	di	Elettronica',	'marco.esposito@email.com'),
('VWX67890XYZ12345', 'Sara	Romano',	'Laurea	in	Giurisprudenza',	'sara.romano@email.com'),
('YZA12345XYZ67890', 'Roberto	De Luca',	'Diploma	di	Informatica',	'roberto.deluca@email.com'),
('BCD67890XYZ12345', 'Elena	Santoro',	'Laurea	in	Lettere',	'elena.santoro@email.com')
;

create table servizio_impiegato (
codice_fiscale varchar(255) not null,
codice_store integer,
data_inizio date,
data_fine date,
carica varchar(255),
unique (codice_fiscale, codice_store, data_inizio),
primary key (codice_fiscale, codice_store, data_inizio)
);

insert into servizio_impiegato value
('ABC12345XYZ67890',	1,	'2023-01-01',	'2023-12-31',	'Cassiere'),
('DEF67890XYZ12345',	2,	'2023-02-01',	'2023-11-30',	'Commesso'),
('GHI12345XYZ67890',	3,	'2023-03-01',	'2023-10-31',	'Magazziniere'),
('JKL67890XYZ12345',	4,	'2023-04-01',	'2023-09-30',	'Addetto alle vendite'),
('MNO12345XYZ67890',	5,	'2023-05-01',	'2023-08-31',	'Addetto alle pulizie'),
('PQR67890XYZ12345',	6,	'2023-06-01',	'2023-07-31',	'Commesso'),
('STU12345XYZ67890',	7,	'2023-07-01',	'2023-06-30',	'Commesso'),
('VWX67890XYZ12345',	8,	'2023-08-01',	'2023-05-31',	'Cassiere'),
('YZA12345XYZ67890',	9,	'2023-09-01',	'2023-04-30',	'Cassiere'),
('BCD67890XYZ12345',	10,	'2023-10-01', '2023-03-31',	'Cassiere')
;

create table videogioco (
titolo varchar(255),
sviluppatore varchar(255),
anno_distribuzione year,
costo_acquisto double,
genere varchar(255),
remake_di varchar(255),
unique (titolo, sviluppatore),
primary key (titolo, sviluppatore)
)
;

insert into videogioco (titolo, sviluppatore, anno_distribuzione, costo_acquisto, genere) values
('Fifa 2023',	'EA Sports',	'2023'	,	49.99, 'Calcio'),
("Assassin's Creed: Valhalla",	'Ubisoft',	'2020',	'59.99',	'Action'),
('Super Mario Odyssey',	'Nintendo',	'2017',	'39.99',	'Platform'),
('The Last of Us Part II',	'Naughty Dog',	'2020',	'69.99',	'Action'),
('Cyberpunk 2077',	'CD Projekt Red',	'2020', '49.99',	'RPG'),
('Animal Crossing: New Horizons',	'Nintendo',	'2020',	'54.99',	'Simulation'),
('Call of Duty: Warzone',	'Infinity Ward',	'2020',	'0.00',	'FPS'),
('The Legend of Zelda: Breath of the Wild',	'Nintendo',	'2017',	'59.99',	'Action-Adventure'),
('Fortnite',	'Epic Games',	2017	,	'0.00',	'Battle Royale'),
('Red Dead Redemption 2',	'Rockstar Games',	'2018',	'39.99',	'Action-Adventure')
;

create table collocazione_videogico (
cv_id int not null auto_increment unique,
codice_store integer,
titolo varchar(255),
sviluppatore varchar(255),
numero_copie integer,
primary key (cv_id),
foreign key (codice_store) references store (codice_store),
foreign key (titolo, sviluppatore) references videogioco (titolo, sviluppatore)
)
;

insert into collocazione_videogico (codice_store, titolo, sviluppatore, numero_copie) values
(1,'Fifa 2023',	'EA Sports',	2),	
(2,'Fifa 2023',	'EA Sports',	3),	
(3,'Fifa 2023',	'EA Sports',	1),
(4,'Fifa 2023',	'EA Sports',	2),
(5,'Fifa 2023',	'EA Sports',	3),
(6,'Fifa 2023',	'EA Sports',	2),
(7,'Fifa 2023',	'EA Sports',	1),
(8,'Fifa 2023',	'EA Sports',	3),
(9,'Fifa 2023',	'EA Sports',	1),
(10,'Fifa 2023',	'EA Sports',	1),
(1,'Super Mario Odyssey',	'Nintendo',	1),
(2,'Super Mario Odyssey',	'Nintendo',	3),
(3,'Super Mario Odyssey',	'Nintendo',	2),
(4,'Super Mario Odyssey',	'Nintendo',	1),
(5,'Super Mario Odyssey',	'Nintendo',	1),
(6,'Super Mario Odyssey',	'Nintendo',	2),
(7,'Super Mario Odyssey',	'Nintendo',	2),
(8,'Super Mario Odyssey',	'Nintendo',	3),
(9,'Super Mario Odyssey',	'Nintendo',	1),
(10,'Super Mario Odyssey',	'Nintendo',	1),
(1,'The Last of Us Part II',	'Naughty Dog',	1),
(2,'The Last of Us Part II',	'Naughty Dog',	1),
(3,'Cyberpunk 2077',	'CD Projekt Red',	1),
(4,'Cyberpunk 2077',	'CD Projekt Red',	1),
(5,'Animal Crossing: New Horizons',	'Nintendo',	2),
(6,'Animal Crossing: New Horizons',	'Nintendo',	2),
(7,'Call of Duty: Warzone',	'Infinity Ward',	1),
(8,'The Legend of Zelda: Breath of the Wild',	'Nintendo',	2),
(9,'The Legend of Zelda: Breath of the Wild',	'Nintendo',	2),
(10,'Fortnite',	'Epic Games',	1),
(1,'Red Dead Redemption 2',	'Rockstar Games',	1),
(2,"Assassin's Creed: Valhalla", 'Ubisoft', 1)
;

