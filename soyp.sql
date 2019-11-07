create database Soyp;
use  Soyp;

create table Praga(
	idPraga int not null,
	nomeComum varchar(100),
	nomeCientifico varchar(100),
	inicioIncidencia int,
	fimIncidencia int,
	cicloVida int,
	primary key (idPraga)
)engine innodb;

create table Fase(
	idFase int not null,
    nomeFase varchar(50),
    primary key (idFase)
)engine innodb;

-- relacionamento Fase e Praga
create table PragaFase(
	idPraga int not null,
    idFase int not null,
    primary key(idPraga, idFase),
    foreign key(idPraga) references Praga(idPraga),
    foreign key(idFase) references Fase(idFase)
)engine innodb;

create table Formato(
	idFormato int not null,
    formato varchar(50),
    coloracao varchar(100),
    tamanho double,
    localAtaque varchar(100),
    idFase int not null,
    idPraga int not null,
    primary key (idFormato),
    foreign key (idFase) references Fase(idFase),
    foreign key(idPraga) references Praga(idPraga)
)engine innodb;


create table Usuario(
	idUsuario int not null,
    nome varchar(100),
    login varchar(50),
    senha varchar(30),
    primary key(idUsuario)
)engine innodb;

create table Imagem(
	idImagem int not null,
	latitude double,
	longitude double,
	hora time,
	dataT date,
	idFormato int not null,
	idUsuario int not null,
	primary key(idImagem),
	foreign key(idFormato) references Formato(idFormato),
	foreign key(idUsuario) references Usuario(idUsuario)
)engine innodb;

-- select last_insert_id()

-- inserindo dados na tabela pragas
insert into Praga(idPraga, nomeComum, nomeCientifico, inicioIncidencia, fimIncidencia, cicloVida)
			values	(1, "Percevejo Marrom", "Euschistus heros", 11, 04, 40),
					(2, "Lagarta-da-soja", "Anticarsia gemmatalis", 11, 03, 34),
                    (3, "Coro-da-soja", "Phyllophaga cuyabana", 09, 05, 250),
                    (4, "Cupim-Subterraneo", "Procomitermes triacifer", 09, 05, null),
                    (5, "Lagarta-rosca", "Agrotis ipcilon", 11, 03, 30),
                    (6, "Centopeia", "Julus hesperus", 10, 03, null ),
                    (7, "Cascudinho-Verde", "Megascelis spp", 01, 03, null),
                    (8, "Vaquinha", "Diabrotica spciosa", 09, 05, 55),
                    (9, "Cascudinho-da-soja", "Myochrous armatus", null , null , null),
                    (10, "Grilo-pardo", "Anurogryllus muticus", 10 , 01, 365),
                    (11, "Gafanhoto (tucura)", "Rhammatocerus schistocercoides", 09, 05, 365),
                    (12, "Lagarta-Enrolasdeira" , "Omiodes indicatus" , null, null, null),
                    (13, "Percevejo-Formigão" , "Neomegalotomus parvus", 10, 03, null),
                    (14, "Bicudo-Pequeno-da-Soja ", "Promecops claviger", 06, 12, null ),
                    (15, "Percevejo-Barriga-Verde", "Dichelops furcatus", null, null, 45),
                    (16, "Percevejo-Verde", "Nezara viridula", null, null, 106);
                    

insert into Fase(idFase, nomeFase)
	values (10, "Ovo"),
		   (20, "Larva"),
		   (30, "Pupa"),
		   (40, "Ninfa"),
		   (50, "Adulto");
           

           
insert into PragaFase(idPraga, idFase)
		value(1, 50),
			 (2, 20),
             (3, 20),
             (4, 50),
             (5, 20),
             (6, 50),
             (7, 50),
             (8, 50),
             (9, 50),
             (10, 50),
             (11, 50),
             (12, 20),
             (13, 50),
             (14, 50),
             (15, 50),
             (16, 50);
             

insert into Formato(idFormato, formato, coloracao, tamanho, localAtaque, idFase, idPraga)
			values 	(101, "Percevejo", "Marrom com uma meia lua branca no dorso", 10, "Folhas", 50, 1),
					(102, "Largarta", "Verde", 15, "Folhas", 20, 2),
                    (103, "Larva", "Branco, com a cabeça marrom, amarelada ou avermelhada", 50, "Raízes", 20, 3),
					(104, "Cupim", "Amarelado ou creme", 15, "Raizes e Sementes" , 50, 4),
					(105, "Largarta", "Cinza escuro ou marrom", 50, "Raízes, Hastes e Folhas" , 20, 5),
					(106, "Centopéia", "Marrom escuro", 100, "Sementes, Cotilédones e Plântulas" , 50, 6),
					(107,  "Besouro", "Verde metálico", 5, "Brotações, Folhas e Botões florais" , 50, 7),
					(108,  "Besouro", "Verde com manchas amarelas", 10, "Folhas, Brotações, Botões florais, Flores e Bagens" , 50, 8),
					(109,  "Besouro", "Cinza escuro, marrom ou preto com manchas mais escuras ou claras", 5, "Caule, Pecíolos e Hastes" , 50, 9),
					(110, "Grilo", "Pardo e escuro", 25, "Plantulas, Sementes, Raízes, Folhas e Espigas" , 50, 10),
					(111, "Gafanhoto", "Marrom ou verde com manchas escuras nas asas", 50 , "Folhas e outras partes aéreas" , 50, 11),
                    (112, "Lagarta", "Amarelada Translúcida" , 20, "Folhas" , 20, 12),
                    (113, "Percevejo", "Marrom Escuro", 20, " vagens, caule, cotilédones das plântulas" , 50, 13),
                    (114, "Besouro", "Marrom, com manchas claras na parte medial e terminal dos élitros" , 3.5, "folhas, raízes e nódulos da soja" , 50, 14),
                    (115, "Percevejo", "Dorso marrom e abdômen verde", 10, "Hastes, brotações e vagens", 50, 15),
                    (116, "Percevejo", "Esverdeado", 20, "sugam a seiva de todos os tecidos da planta", 50, 16);
                    
		

insert into Usuario (idUsuario, nome, login, senha)
			values (1001, "Renata", "renatinha000", "123renata"),
				   (1002, "Alessandra", "alesandra2018", "alesandrinha102030"),
                   (1003, "Bruno", "andradeBruno25", "91514565"),
                   (1004, "Kauan", "kauanArtur", "kaAr123321"),
                   (1005, "Victor", "victor159", "vicvic159"),
                   (1006, "João", "joao10", "morango"),
                   (1007, "Pedro", "pedro33", "pedrosthefs"),
                   (1008, "Sthefany", "sthefany44", "sthefanypepe"),
                   (1009, "Armando", "arm01", "478569"),
                   (1010, "Ana Cristina", "anaGobbo", "bioevida100"),
                   (1011, "Raiane", "raoli25", "olirai1021"),
                   (1012, "Daniele", "daniramos01", "12ramo20"),
                   (1013, "Dafine", "valentim38", "valendaf50"),
                   (1014, "Reinaldo", "reigomes", "25874rei"),
                   (1015, "Zulmira", "toreszu10", "zuto38"),
                   (1016, "Cauã", "cauareis", "123reiscaua"),
                   (1017, "Mariana", "mari12", "27092002"),
                   (1018, "Estela", "estela31", "es3te1la"),
                   (1019, "Nadiemi", "nadi51", "maracuja"), 
                   (1020, "Wictor", "wictorSilva", "cocoqueimado"),
                   (1021, "Fatima", "fatima99", "amolagarta"),
                   (1022, "Leonardo", "leotorres", "leopardo"),
                   (1023, "William", "will130", "bicicleta"),
                   (1024, "Geovana", "menezesGe", "menezesgege"),
                   (1025, "Jady", "jadymartins", "matinsjj"),
                   (1026, "Igor", "igor71", "oudrikandalarrai");
                   

                   
insert into Imagem(idImagem, latitude, longitude, hora, dataT, idFormato, idUsuario)
			values(1000, 12.1, 6.3,  '10:25:30', '2016-10-24', 101 , 1001),
				  (2000, 60.7, 96.8, '12:28:06', '2016-03-10', 102 , 1002),
				  (3000, 52.3, 50.6, '09:31:33', '2018-05-20', 103 , 1003),
				  (4000, 42.9, 31.4, '15:40:16', '2016-11-18', 104 , 1004), 
                  (5000, 18.0, 22.2, '11:36:38', '2018-12-30', 105 , 1005),
                  (6000, 19.0, 58.2, '14:27:31', '2018-12-30', 106 , 1026),
                  (7000, 21.7, 88.6, '21:04:08', '2017-05-03', 107 , 1017),
                  (8000, 17.5, 12.4, '16:37:28', '2018-06-10', 108 , 1008),
                  (9000, 18.0, 22.2, '11:18:48', '2018-12-30', 109 , 1009),
                  (10000, 05.0, 2.2, '10:25:30', '2015-01-23', 110 , 1010),
                  (11000, 28.0, 32.9, '13:16:58', '2018-08-07', 111, 1011),
                  (12000, 09.0, 01.2, '12:02:01', '2015-12-25', 112 , 1012),
                  (13000, 25.0, 62.12,'01:26:54', '2018-11-06', 113 , 1013),
                  (14000, 29.0, 39.2, '17:36:42', '2017-12-30', 114 , 1014),
				  (15000, 18.0, 22.2, '09:14:13', '2017-08-27', 115 , 1015),
                  (16000, 39.0, 11.5, '08:25:28', '2018-05-26', 116 , 1011),
                  (17000, 75.3, 13.5, '09:31:33', '2018-05-26', 104 , 1016),
                  (18000, 102.0, 24.7,'18:35:55', '2018-05-26', 116 , 1012),
                  (19000, 32.0, 87.5, '16:40:28', '2018-05-26', 104 , 1016),
                  (20000, 8.0, 4.5,   '07:25:20', '2018-05-26', 110 , 1011),
                  (21000, 39.0, 11.5, '08:27:28', '2018-05-26', 111, 1017);
				


