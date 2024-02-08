create schema epicode_esercizio_w6d2;

create table prodotto (
id_prodotto integer primary key not null unique,
nome_prodotto varchar (100),
prezzo double
)
;

insert into prodotto values
(1, 'Tablet',	300.00),
(2, 'Mouse',	20.00),
(3, 'Tastiera',	25.00),
(4, 'Monitor',	180.00),
(5, 'HHD',	90.00),
(6, 'SSD',	200.00),
(7, 'RAM',	100.00),
(8, 'Router',	80.00),
(9, 'Webcam',	45.00),
(10, 'GPU',	1250.00),
(11,	'Trackpad',	500.00),
(12,	'Techmagazine',	5.00),
(13,	'Martech',	50.00)
;
select * from prodotto;

create table cliente (
id_cliente integer not null primary key unique,
nome varchar (50),
email varchar (100)
)
;
insert into cliente values
(1,	'Antonio', null),
(2,	'Battista',	'battista@mailmail.it'),
(3,	'Maria',	'maria@posta.it'),
(4,	'Franca',	'franca@lettere.it'),
(5,	'Ettore', null),
(6,	'Arianna',	'arianna@posta.it'),
(7,	'Piero', 'piero@lavoro.it')
;

select * from cliente;

create table ordine (
id_ordine integer not null primary key unique,
id_prodotto integer,
id_cliente integer,
quantità integer,
foreign key (id_prodotto) references prodotto (id_prodotto),
foreign key (id_cliente) references cliente (id_cliente)
)
;
/*  manca id_cliente e lo popolo a caso */
insert into ordine values
( 1, 2, 1, 10),
( 2, 6,	2, 2),
( 3, 5,	3, 3),
( 4, 1,	3, 1),
( 5, 9, 7, 1),
( 6, 4, 6, 2),
( 7, 11, 7, 6),
( 8, 10, 1, 2),
( 9, 3,	5, 3),
( 10, 3, 3,	1),
( 11, 2, 2,	1)
;
select * from ordine;

create table dettaglio_ordine (
id_ordine integer not null,
id_prodotto integer not null,
id_cliente integer not null,
prezzo_totale double,
primary key (id_ordine, id_prodotto, id_cliente), 
foreign key (id_ordine) references ordine (id_ordine),
foreign key (id_prodotto) references prodotto (id_prodotto),
foreign key (id_cliente) references cliente (id_cliente)
)
;
select * from dettaglio_ordine;

/* join ordine con prodotto per avere il prezzo */
select *
from ordine
join prodotto on ordine.id_prodotto=prodotto.id_prodotto;

/* join ordine con prodotto per avere il prezzo totale */
select
ordine.id_ordine,
ordine.id_prodotto,
ordine.id_cliente,
ordine.quantità*prodotto.prezzo
from
ordine
join 
prodotto on ordine.id_prodotto=prodotto.id_prodotto;
