
create database millefeuilles;


use millefeuilles;




-- ///////////////////////////////table plat//////////////////////////////////////////

CREATE TABLE Plat( 
idplat int AUTO_INCREMENT, 
nomPlat varchar(255) not null,
pricePlat double not null,
Epice boolean,
Sale boolean,
pays_Origine varchar(200) default 'Haiti',
remarques varchar(255),
typePlat ENUM('Simple','Moyen','Complexe') default 'Simple',
PRIMARY KEY (idplat)
);




-- ///////////////////////////////table supplement//////////////////////////////////////////

create table Supplement(
    idSupplement int AUTO_INCREMENT,
    nomSupplement varchar(255),
    idplat int not null,
    remarques varchar(255),
    supplementPrice double not null,
    constraint fkidplat foreign key(idplat)references Plat(idplat),
    PRIMARY KEY (idSupplement)

);





-- ///////////////////////////////table boissons//////////////////////////////////////////
create table boissons(
idboisson int AUTO_INCREMENT, 
nomBoisson varchar(255),
Sucre boolean ,
remarques varchar(200),
quantite int default 0,
priceboisson double not null,
typeboisson ENUM('Simple','Luxe'),
PRIMARY KEY (idboisson)
);








-- ///////////////////////////////table personnel//////////////////////////////////////////
create table personnel(
idPerso int AUTO_INCREMENT,
nom varchar(255),
prenom varchar(255),
autrePrenom varchar(255),
dateNaissance date,
cinPerso varchar(20),
typePersonnel enum('Cuisinier','A. Securite','Comptable','Caissier',
'Secretaire','Livreur','Chauffeur','Autre'),
detail_Type_Personnel_Autre varchar(255),
sexeP enum('Masculin','Feminin'),
groupeSanguin varchar(3),
dateembauche date,
numeroTel int(8),
numeroTel2 int(8),
email varchar(100) not null,
adresse varchar(255) not null,
dateResiliationContrat date,
----------------------------------------
name_Personne_de_reference varchar(255),
numero_Personne_reference int(8),
lien_de_parente varchar(50),
primary key(idPerso,cinPerso)
);






-- ///////////////////////////////table Payroll//////////////////////////////////////////
create table Payroll(
idPayroll int AUTO_INCREMENT,
idPerso int,
datePayroll datetime,
salairebrut double,
taxes double,
quantiteVersee double not null default 0,
quantiteDue double,
bonus double,
banque varchar(30),
noCompte varchar(30),
date_derniere_modif timestamp,
devise varchar(20) default 'HTG',
primary key(idPerso,idPayroll) 
);






-- ///////////////////////////////table Users//////////////////////////////////////////

create table users(
     username varchar(200) not null unique,
     passwordU varchar(255) not null,
     infoPerso varchar(200) not null,
     date_creation_compte date not null,
     denier_modif_mot_de_passe date not null,
     statusLog boolean default 'false',
     idperson int,
     constraint fkuser foreign key(idperson)references personnel(idPerso)
);





---------------Outils cuisine
------------------------Outils Clients
------------Fournisseurs------------------
-----------------Client---------------------





--------------Triggers anti udpdate
---------check constraint