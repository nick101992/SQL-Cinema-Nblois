create table attori(
    codAttore int primary key,
    nome varchar(40),
    annoNascita int,
    nazionalita varchar(20)
);

insert into attori values(35, 'Kate Winslet', 1975, 'statunitense');
insert into attori values(15, 'Mitsuha Miyamizu', 1995, 'Giapponese');
insert into attori values(30, 'Jeff Bridges', 1949, 'statunitense');
insert into attori values(31, 'Brad Pitt', 1963, 'Statunitense');
insert into attori values(49, 'Robert De Niro', 1943, 'Americana');
insert into attori values(29, 'Amy Adams', 1974,'Americana');
insert into attori values(39, 'Abbie Jacobson', 1984, 'Americana');
insert into attori values(41, 'Liam Neeson', 1952, 'Nord-Irlandese');
insert into attori values(33, 'Guy Pearce', 1967, 'Statunitense');
insert into attori values(45,' Mark Hamill', 1951, 'Americana' );
insert into attori values(40, 'Benicio del Toro', 1967, 'Portoricano');
insert into attori values(32, 'John David Washington', 1984, 'Statunitense');
insert into attori values(65,'Carrie Fisher', 1956, 'Americana');
insert into attori values(50, 'Garrett Hedlund', 1984, 'Statunitense');
insert into attori values(48,'Iván Massagué',1976,'spagnola');
insert into attori values(59,'Danny McBride', 1976, 'Americana');
insert into attori values(53,'Carrie-Anne Moss', 1967, 'Canadese');
insert into attori values(54,'Edward Norton',1969,'Americana');
insert into attori values(51, 'Christoph Waltz', 1956, 'Austriaco');
insert into attori values(38, 'Nicole Kidman', 1967, 'Australiana');
insert into attori values(80, 'Tachibana Taki', 1998, 'Giapponese');
insert into attori values(52, 'Robert Pattinson', 1986, 'Americana');
insert into attori values(61, 'Ben Kingsley', 1943, 'Britannico');
insert into attori values(37,'Jhonny olky',1987,'Italiana');
insert into attori values(55,'Leonardo DiCaprio', 1974, 'Statunitense');
insert into attori values(56,'Anne Hathaway', 1982, 'Americana');
insert into attori values(57,'Pippo Rat', 1949, 'Americana');
insert into attori values(42,'Alexander Skarsgard', 1976, 'Svedese');
insert into attori values(62,'Anya Taylor-Joy', 1996, 'Statunitense');
insert into attori values(58,'Stellan Skarsgård', 1951, 'Svedese');
insert into attori values(73,'Uma Thurman', 1970, 'Statunitense');
insert into attori values(93,'Michael Madsen',  1957, 'Statunitense');
insert into attori values(68,'Zorion Egileor',1946,'spagnola');
insert into attori values(100,'Suraj Sharma', 1993, 'indiana');
insert into attori values(101,'Irrfan Khan', 1967, 'indiana');

create table film(
    codFilm char(4) primary key, 
    titolo varchar(50),
    annoProduzione int,
    nazionalita varchar(20),
    regista varchar(30),
    genere varchar(40)
);

insert into film values('seho', 'Arrival', 2016, 'Americana', 'Denis Villeneuve', 'fantascienza');
insert into film values('ReDo','Tron:Legacy',2010,'USA','Joseph Kosinski','Fantascienza/Azione');
insert into film values('MaBi', 'Inglourious Basterds', 2009, 'USA', 'Quentin Tarantino', 'Guerra');
insert into film values('cama', 'Tenet', 2020, 'USA', 'Christopher Nolan', 'Azione');
insert into film values('DoGr', 'Memento', 2000, 'USA', 'Christopher Nolan', 'Thriller') ;
insert into film values('STSI','Fight Club',1999,'USA','David Fincher','drammatico');
insert into film values('ALBU', 'Titanic', 1997, 'USA', 'James Cameron', 'Romantico, Drammatico');
insert into film values('ALEL','LA VITA DI PIE',2010,'Indiano','MrNonSo','Drammatico');
insert into film values('AnVr','Confusione',2022,'italiana','Myself','Documentario');
insert into film values('MaFr', 'Dogville', 2003, 'danese','Lars von Trier','drammatico' );
insert into film values('GIBR', 'The Mitchell VS the Machines', 2021, 'Americana', 'Mike Rianda, Jeff Rowe', 'Animazione, commedia, fantascienza');
insert into film values('DaZa', 'The Snatch', 2000, 'Inglese', 'Guy Ritchie', 'Noir' );
insert into film values('LoSc', 'Schindler s list', 1994, 'americano', 'Steven Spielberg', 'Guerra, Storico');
insert into film values('DaCa', 'The Northman', 2022, 'Islandese', 'Robert Eggers', 'Storico-Drammatico');
insert into film values('AnPl', 'Your Name', 2016, 'Giapponese',  'Makoto Shinkai', 'Animazione');
insert into film values('Cata', 'Kill Bill: volume 1',  2003, 'USA', 'Quentin Tarantino', 'drama-action');
insert into film values('MaMa', 'Star Wars ', 1977, 'USA', 'George Lucas', 'Fantascienza, Avventura');
insert into film values('nisa','Il buco',2019,'spagnola','Galder Gaztelu-Urrutia','thriller,dramma');
insert into film values ('ChMi', 'Lo Stagista Inaspettato', 2015, 'Americana', 'Nancy Meyers', 'Commedia-Drammatico');

create table sale(
    codSala int primary key,
    posti int,
    nome varchar(20),
    citta varchar(20)
);

insert into sale values(1,100,'Antares','Roma');
insert into sale values(2,150,'Odeon','Milano');
insert into sale values(3,200,'Svev','Torino');

create table proiezioni(
    codProiezione int primary key,
    codFilm char(4),
    codSala int,
    incasso int,
    dataProiezione Date, /* date '2021-04-21' */
    foreign key (codFilm)
        references film(codFilm),
    foreign key (codSala)
        references sale(codSala)
);
insert into proiezioni values(108, 'ALBU', 3, 8, '2022-05-22');
insert into proiezioni values(104, 'cama', 1, 12122, '2020-03-12');
insert into proiezioni values (111, 'MaBi', 1, 99999, '2022-05-06');
insert into proiezioni values(105, 'cama', 2, 13122, '2020-03-13');
insert into proiezioni values(121,'nisa',1,1000,'2019-05-13');                                     
insert into proiezioni values(141,'nisa',2,2000,'2019-04-21');
insert into proiezioni values(291, 'seho', 2, 200,'2016-09-10');
insert into proiezioni values(116, 'LoSc', 1, 90, '1994-03-04');
insert into proiezioni values(292, 'seho', 1, 300,'2016-09-16');
insert into proiezioni values(118, 'AnPl', 3, 567000, '2017-05-14');
insert into proiezioni values(138, 'AnPl', 2, 1500, '2017-05-15');
insert into proiezioni values(132, 'ChMi', 1, 75, '2015-08-09');
insert into proiezioni values(112, 'MaFr', 2, 666, '2004-01-24');
insert into proiezioni values (136, 'LoSc', 2, 120, '1994-03-04');
insert into proiezioni values(122, 'ChMi', 3, 75, '2015-08-09');
insert into proiezioni values (110, 'ALEL',1,12300234,'2012-01-02');
insert into proiezioni values(106, 'DoGr', 3, 397000, '2021-05-21');
insert into proiezioni values (117,'DaCa',1 , 1999999, '2022-5-19'); 
insert into proiezioni values (127,'DaCa',3 , 1999999, '2022-5-7');
insert into proiezioni values(155, 'MaFr', 3, 314, '2004-05-06');
insert into proiezioni values(114, 'GIBR', 1, 500000000, '2021-10-23');
insert into proiezioni values (130, 'ALEL',2,1100344,'2012-01-03');
insert into proiezioni values(102, 'ReDo', 2, 64000, '2021-06-04');
insert into proiezioni values (283,'STSI',1,123456,'2015-02-14');
insert into proiezioni values (119, 'Cata', 1, 350, '2004-01-12');
insert into proiezioni values (139, 'Cata', 2, 325, '2004-01-06');
insert into proiezioni values(115, 'DaZa', 1, 5000, '2000-06-19');
insert into proiezioni values (85, 'MaMa', 1, 461000000, '1977-05-25');
insert into proiezioni values (195, 'MaMa', 2, 461000001, '1977-05-26');
insert into proiezioni values(113,'AnVr',1,3600,'2022-03-19');
insert into proiezioni values(143,'AnVr',2,4600,'2022-04-17');
insert into proiezioni values (285,'STSI',3,654321,'2019-07-12');
insert into Proiezioni values(124, 'GIBR', 2, 355000000, '2021-10-23');
insert into proiezioni values(125, 'DaZa', 2, 3000, '2000-06-01');
insert into proiezioni values (211, 'MaBi', 2, 88888, '2022-05-05');

create table recita(
    codAttore int,
    codFilm char(4),
    primary key (codAttore, codFilm),
    foreign key (codAttore)
        references attori(codAttore),
    foreign key (codFilm)
        references film(codFilm)
);

insert into recita values(15,'AnPl');
insert into recita values(80,'AnPl');
insert into recita values (100,'ALEL');
insert into recita values (38, 'MaFr');
insert into recita values (58, 'MaFr');
insert into Recita values(59, 'GIBR');
insert into recita values(37,'AnVr');
insert into recita values(30,'ReDo');
insert into recita values(32, 'cama');
insert into recita values(50,'ReDo');
insert into recita values(57,'AnVr');
insert into recita values(41, 'LoSc');
insert into recita values(52, 'cama');
insert into recita values (45,'MaMa');
insert into recita values(29, 'seho');
insert into recita values(61, 'LoSc');
insert into recita values (40, 'DaZa');
insert into recita values (31, 'DaZa');
insert into recita values(49,'ChMi');
insert into recita values(33, 'DoGr');
insert into recita values (101, 'ALEL');
insert into recita values(48,'nisa');
insert into recita values(56,'ChMi');
insert into recita values(35, 'ALBU');
insert into recita values(53, 'DoGr');
insert into recita values (31, 'MaBi');
insert into recita values (65,'MaMa');
insert into Recita values(39, 'GIBR');
insert into recita values(55, 'ALBU');
insert into recita values(68,'nisa');
insert into recita values(73,'Cata');
insert into recita values (54,'STSI');
insert into recita values(93,'Cata');
insert into recita values (42,'DaCa');
insert into recita values (62,'DaCa');
insert into recita values(31,'STSI');
insert into recita values (51, 'MaBi');