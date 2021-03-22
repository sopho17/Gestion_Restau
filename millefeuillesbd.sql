
create database millefeuilles;


use millefeuilles;



----------------table category----------------------
-- categoryPlat enum('BBQ','Dessert','Salade','Burger'),

create table categoryPlat(
    idCategory int primary key AUTO_INCREMENT,
    Category_Name varchar(50) unique,
    Description varchar(255)
);


-- ///////////////////////////////table plat//////////////////////////////////////////

CREATE TABLE Plat( 
idplat int AUTO_INCREMENT, 
nomPlat varchar(255) not null unique,
pricePlat double not null,
Epice boolean,
Sale boolean,
pays_Origine varchar(200) default 'Haiti',
remarques varchar(255),
livraison_charge double,
typePlat ENUM('Simple','Moyen','Complexe') default 'Simple',
constraint fkcategoryPlat foreign key(idCategory)references categoryPlat(idCategory),
PRIMARY KEY (idplat)
);







-- ///////////////////////////////table supplement//////////////////////////////////////////

create table Supplement(
    idSupplement int AUTO_INCREMENT,
    nomSupplement varchar(255) not null unique,
    idplat int not null,
    remarques varchar(255),
    supplementPrice double not null,
    constraint fkidplat foreign key(idplat)references Plat(idplat),
    PRIMARY KEY (idSupplement)

);





-- ///////////////////////////////table boissons//////////////////////////////////////////
create table boissons(
idboisson int AUTO_INCREMENT, 
nomBoisson varchar(255) not null unique,
Sucre boolean default 'true',
remarques varchar(200),
quantite_En_stock int default 0,
priceboisson double not null,
typeboisson ENUM('Simple','Luxe'),
livraison_charge double,
PRIMARY KEY (idboisson)
);








-- ///////////////////////////////table personnel//////////////////////////////////////////
create table personnel(
idPerso int AUTO_INCREMENT,
nom varchar(255),
prenom varchar(255),
autrePrenom varchar(255),
dateNaissance date,
cinPerso varchar(20) unique,
typePersonnel enum('Cuisinier','A. Securite','Comptable','Caissier',
'Secretaire','Livreur','Chauffeur','Autre'),
detail_Type_Personnel_Autre varchar(255),
sexeP enum('Masculin','Feminin'),
groupeSanguin varchar(3),
constraint chkgroupeSanguin check(groupeSanguin in
 ('A+','AB+','O+','O-','B+','A-','AB-','B-')),
dateembauche date,
numeroTel int(8),
numeroTel2 int(8),
email varchar(100) not null,
adresse varchar(255) not null,
dateResiliationContrat date,
constraint chkresiliation check(dateembauche < dateResiliationContrat),
constraint chkmail check email like('%@%'),
constraint datenaisdatem check (dateNaissance<dateembauche),
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
datePayroll datetime not null,
salairebrut double not null,
check (salairebrut > 200),
taxes double not null,
quantiteVersee double not null,
quantiteDue double default 0,
bonus double,
banque varchar(30) not null,
noCompte varchar(30) not null,
date_derniere_modif timestamp not null,
devise varchar(20) default 'HTG' not null,
constraint fkuserpayroll foreign key(idPerso)references personnel(idPerso),
primary key(idPerso,idPayroll) 
);






-- ///////////////////////////////table Users//////////////////////////////////////////

create table users(
     username varchar(200),
     passwordU varchar(255) not null,
     infoPerso varchar(200) not null,
     date_creation_compte date not null,
     denier_modif_mot_de_passe date not null,
     statusLog boolean default 'false',
     idperson int,
     constraint fkuser foreign key(idperson)references personnel(idPerso),
     primary key(username)
);



-- ///////////////////////////////table fournisseurs//////////////////////////////////////////

create table Fournisseurs(
nomCompagnie varchar(200),
nomFournisseur varchar(255),
prenomFournisseur varchar(255),
typeFournisseur enum('O.Client','O.Cuisine','Autres'),
detail_Type_Fournisseur_Autre varchar(255),
date_Signature_Contrat date,
numero_Tel int(8) not null unique,
numero_Tel2 int(8) not null unique,
email varchar(100) not null,
siteWeb varchar(100),
adresse varchar(255) not null,
adresse2 varchar(255),
date_Resiliation_Contrat date not null,
primary key(idFournisseur,nomCompagnie)
);







-- ///////////////////////////////table Outil cuisine//////////////////////////////////////////

create table CookingTool(
idCooker int AUTO_INCREMENT,
name_Cooking_Tool varchar(100),
Utilite varchar(255),
nameCompagnie varchar(200),
quantite int,
check (quantite > 0),
date_acquisition date,
etat enum('neuf','usage','defectueux'),
price double,
constraint fkidfournisseur foreign key nameCompagnie references Fournisseurs(nomCompagnie),
primary key(idCooker)
);



-- ///////////////////////////////table Outil Clients//////////////////////////////////////////
create table CustomerTool(
idCustomerTool int AUTO_INCREMENT,
name_Customer_Tool varchar(100),
Utilite varchar(255),
nameFournisseur varchar(200),
quantite int,
check (quantite > 0),
date_acquisition date,
etat enum('neuf','usage','defectueux'),
price double,
constraint fkidfournisseur foreign key nameCompagnie references Fournisseurs(nomCompagnie)
primary key(idCustomerTool)
);







-- ///////////////////////////////table Clients//////////////////////////////////////////

create table Client(
idclient int AUTO_INCREMENT,
nom varchar(255),
prenom varchar(255),
autrePrenom varchar(255),
dateNaissance date,
cinPerso varchar(20) unique,
noPassport varchar(20) unique,
nolicence varchar(30) unique,
PointsFideliteClient int default '0',
sexeP enum('Masculin','Feminin'),
numeroTel int(8),
numeroTel2 int(8),
email varchar(100),
adresse varchar(255) not null,
constraint chkmailclient check email like('%@%'),
primary key(idclient)
);










-- ///////////////////////////////table Commande//////////////////////////////////////////
create table Commande(
idCommande int AUTO_INCREMENT,
idplat int,
itemQuantity int default 0,
heureCommande timestamp not null,
userLogged varchar(200),
etatFiche enum('Valide','Annule'),
categoryCommande enum('Delivery','Dine-in','Take-away'),
constraint fkUserCommande foreign key,
primary key(idCommande,heureCommande)
);



------------------Table pour commmandes-------------




---------------------------Vues waiters-----------
---------------------------Vues Caissier-----------
---------------------------Vues Depenses-----------
---------------------------Vues waiters-----------
--------- vue commande annulee-------------------



--------------Triggers anti udpdate
---------check constraint