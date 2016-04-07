DROP DATABASE IF EXISTS PROJET ;
CREATE DATABASE PROJET ;
USE PROJET

DROP TABLE IF EXISTS ZONE ;
CREATE TABLE ZONE(
code_zone INT NOT NULL AUTO_INCREMENT,
id INT NOT NULL,
alpha2 varchar(2) NOT NULL,
alpha3 varchar(3) NOT NULL,
nom_en_gb varchar(20) NOT NULL,
nom_en_fr varchar(20) NOT NULL,
type_zone VARCHAR(20),
libellé_capitale VARCHAR(20),
nom_zone VARCHAR(20),
population_zone INT,
superficie_zone VARCHAR(20),
trois_plus_grande_agglo VARCHAR(40),
densité_zone DECIMAL,
chef_detats_zone VARCHAR(20),
PIB_zone DECIMAL,
taux_chomage_zone DECIMAL,
position_géographique_zone VARCHAR(20),
indicatif_telephonique_zone VARCHAR(20),
domaine_internet_zone VARCHAR(20),
gastronomie_zone VARCHAR(20),
hymne_zone VARCHAR(20),
gentillé_zone VARCHAR(20),
sport_populaire VARCHAR(20),
code_idh INT NULL,
code_devise INT NULL,
code_langue INT NULL,
CONSTRAINT PK_zone PRIMARY KEY (code_zone),
CONSTRAINT FK_idh_zone FOREIGN KEY(code_idh) REFERENCES idh(code_idh),
CONSTRAINT FK_devise_zone FOREIGN KEY(code_devise) REFERENCES devise(code_devise),
CONSTRAINT FK_langue_zone FOREIGN KEY(code_langue) REFERENCES langue(code_langue),
UNIQUE KEY alpha2(alpha2),
UNIQUE KEY alpha3(alpha3)
);
				

DROP TABLE IF EXISTS DEVISE;
CREATE TABLE DEVISE(
code_devise INT NOT NULL AUTO_INCREMENT,
libellé_devise VARCHAR(20),
CONSTRAINT PK_devise PRIMARY KEY (code_devise));


DROP TABLE IF EXISTS FUSEAU_HORAIRE;
CREATE TABLE FUSEAU_HORAIRE(
code_fuseau_horaire INT NOT NULL AUTO_INCREMENT,
libellé_fuseau_horaire VARCHAR(20),
CONSTRAINT PK_fuseauhoraire PRIMARY KEY (code_fuseau_horaire));

DROP TABLE IF EXISTS ORGANISATION_INTERNATIONALE;
CREATE TABLE ORGANISATION_INTERNATIONALE(
code_organisation_internationales INT NOT NULL AUTO_INCREMENT,
libellé_organisation_internationale VARCHAR(20),
siege_organisation_internationale VARCHAR(20),
date_creation_organisation_internationale DATE,
CONSTRAINT PK_organisationInternationale PRIMARY KEY (code_organisation_internationales));


DROP TABLE IF EXISTS LANGUE ;
CREATE TABLE LANGUE (
code_langue INT NOT NULL AUTO_INCREMENT,
libellé_langue VARCHAR(20),
CONSTRAINT PK_langue PRIMARY KEY (code_langue));



DROP TABLE IF EXISTS IDH ;
CREATE TABLE IDH (
code_idh INT NOT NULL AUTO_INCREMENT,
libellé_IDH VARCHAR(20),
CONSTRAINT PK_idh PRIMARY KEY (code_idh));

DROP TABLE IF EXISTS RELIGION;
CREATE TABLE RELIGION (
code_religion INT NOT NULL AUTO_INCREMENT,
libellé_religion VARCHAR(20),
CONSTRAINT PK_religion PRIMARY KEY (code_religion));


DROP TABLE IF EXISTS CHAINE_DE_MONTAGNE ;
CREATE TABLE CHAINE_DE_MONTAGNES (
code_chaine_de_montagnes INT NOT NULL AUTO_INCREMENT,
libellé_chaîne_de_montagnes VARCHAR(20),
CONSTRAINT PK_chaineDeMontagne PRIMARY KEY (code_chaine_de_montagnes));

DROP TABLE IF EXISTS UTILISATEUR ;
CREATE TABLE UTILISATEUR (
code_utilisateur INT NOT NULL AUTO_INCREMENT,
utilisateur_nom VARCHAR(20),
utilisateur_age INTEGER,
utilisateur_civilité VARCHAR(20),
utilisateur_mail VARCHAR(30),
CONSTRAINT PK_codeUtilisateur PRIMARY KEY (code_utilisateur),
UNIQUE KEY utilisateur_mail(utilisateur_mail));



DROP TABLE IF EXISTS CONTINENT;
CREATE TABLE CONTINENT (
code_continent INT NOT NULL AUTO_INCREMENT,
libellé_continent VARCHAR(20),
CONSTRAINT PK_continent PRIMARY KEY (code_continent));


DROP TABLE IF EXISTS TYPE_CLIMAT ;
CREATE TABLE TYPE_CLIMAT (
code_climat INT NOT NULL AUTO_INCREMENT,
libellé_climat VARCHAR(20),
CONSTRAINT PK_typeClimat PRIMARY KEY (code_climat));

DROP TABLE IF EXISTS AREA ;
CREATE TABLE AREA (
code_area INT NOT NULL AUTO_INCREMENT,
CONSTRAINT PK_area PRIMARY KEY (code_area));



DROP TABLE IF EXISTS appartient;
CREATE TABLE appartient (
code_zone INT NOT NULL AUTO_INCREMENT,
code_organisation_internationales INT NOT NULL,
CONSTRAINT PK_appartient PRIMARY KEY (code_zone,code_organisation_internationales));


DROP TABLE IF EXISTS visitePays ;
CREATE TABLE visitePays (
code_utilisateur INT NOT NULL AUTO_INCREMENT,
code_zone INT NOT NULL,
CONSTRAINT PK_visitePays PRIMARY KEY (code_utilisateur,code_zone));

DROP TABLE IF EXISTS parcours ;
CREATE TABLE parcours (
code_chaine_de_montagnes INT NOT NULL AUTO_INCREMENT,
code_zone INT NOT NULL,
CONSTRAINT PK_parcours PRIMARY KEY (code_chaine_de_montagnes,code_zone)); 

DROP TABLE IF EXISTS pratique ;
CREATE TABLE pratique (
code_zone INT NOT NULL AUTO_INCREMENT,
code_religion INT NOT NULL,
CONSTRAINT PK_pratique PRIMARY KEY (code_zone,code_religion));

DROP TABLE IF EXISTS a_pour ;
CREATE TABLE a_pour (
code_fuseau_horaire INT NOT NULL AUTO_INCREMENT,
code_zone INT NOT NULL,
CONSTRAINT PK_apour PRIMARY KEY (code_fuseau_horaire,code_zone));


DROP TABLE IF EXISTS visiteCont ;
CREATE TABLE visiteCont (
code_utilisateur INT NOT NULL AUTO_INCREMENT,
code_continent INT NOT NULL,
CONSTRAINT PK_codeArea PRIMARY KEY (code_utilisateur,code_continent));

DROP TABLE IF EXISTS Constitue ;
CREATE TABLE Constitue (
code_zone INT NOT NULL AUTO_INCREMENT,
code_continent INT NOT NULL,
CONSTRAINT PK_constitue PRIMARY KEY (code_zone,code_continent));


DROP TABLE IF EXISTS AreaZone ;
CREATE TABLE AreaZone (
code_area INT NOT NULL AUTO_INCREMENT,
code_zone INT NOT NULL,
CONSTRAINT PK_AreaZone PRIMARY KEY (code_area,code_zone));

DROP TABLE IF EXISTS AreaHoraire ;
CREATE TABLE AreaHoraire (
code_area INT NOT NULL AUTO_INCREMENT,
code_fuseau_horaire INT NOT NULL,
CONSTRAINT PK_AreaHorraire PRIMARY KEY (code_area,code_fuseau_horaire));

DROP TABLE IF EXISTS AreaContinent ;
CREATE TABLE AreaContinent (
code_area INT NOT NULL AUTO_INCREMENT,
code_continent INT NOT NULL,
CONSTRAINT PK_AreaContinent PRIMARY KEY (code_area,code_continent));
DROP TABLE IF EXISTS AreaClimat ;
CREATE TABLE AreaClimat (
code_area INT NOT NULL AUTO_INCREMENT,
code_climat INT NOT NULL,
CONSTRAINT PK_AreaClimat PRIMARY KEY (code_area,code_climat));

DROP TABLE IF EXISTS AreaOganisation ;
CREATE TABLE AreaOganisation (
code_organisation_internationales INT NOT NULL AUTO_INCREMENT,
code_area INT NOT NULL,
CONSTRAINT PK_AreaOrganisation PRIMARY KEY (code_organisation_internationales,code_area));

DROP TABLE IF EXISTS AreaLangue ;
CREATE TABLE AreaLangue (
code_langue INT NOT NULL AUTO_INCREMENT,
code_area INT NOT NULL,
CONSTRAINT PK_AreaLangue PRIMARY KEY (code_langue,code_area));

DROP TABLE IF EXISTS a_pour_climat ;
CREATE TABLE a_pour_climat (
	code_zone INT NOT NULL AUTO_INCREMENT,
	code_climat INT NOT NULL,
CONSTRAINT PK_apourclimat PRIMARY KEY (code_zone,code_climat));

DROP TABLE IF EXISTS parle;
CREATE TABLE parle(
	code_zone INT NOT NULL AUTO_INCREMENT,
	code_langue INT NOT NULL,
	CONSTRAINT PK_parle PRIMARY KEY (code_zone,code_langue));
	
ALTER TABLE ZONE ADD CONSTRAINT FK_ZONE_IDH FOREIGN KEY (code_idh) REFERENCES IDH (code_idh);

ALTER TABLE ZONE ADD CONSTRAINT FK_ZONE_DEVISE FOREIGN KEY (code_devise) REFERENCES DEVISE (code_devise);

ALTER TABLE ZONE ADD CONSTRAINT FK_ZONE_LANGUE FOREIGN KEY (code_langue) REFERENCES LANGUE (code_langue);

ALTER TABLE appartient ADD CONSTRAINT FK_appartient_ZONE FOREIGN KEY (code_zone) REFERENCES ZONE (code_zone);

ALTER TABLE appartient ADD CONSTRAINT FK_appartient_Organisation_Internationales FOREIGN KEY (code_organisation_internationales) REFERENCES ORGANISATION_INTERNATIONALE (code_organisation_internationales);

ALTER TABLE Parle ADD CONSTRAINT FK_Parle_AutreLANGUE FOREIGN KEY (code_autre_langue) REFERENCES LANGUE_AUTRE (code_autre_langue);

ALTER TABLE Parle ADD CONSTRAINT FK_Parle_ZONE FOREIGN KEY (code_zone) REFERENCES ZONE (code_zone);

ALTER TABLE visitePays ADD CONSTRAINT FK_visitePays_UTILISATEUR FOREIGN KEY (code_utilisateur) REFERENCES UTILISATEUR (code_utilisateur);

ALTER TABLE visitePays ADD CONSTRAINT FK_visitePays_ZONE FOREIGN KEY (code_zone) REFERENCES ZONE (code_zone);

ALTER TABLE parcours ADD CONSTRAINT FK_parcours_CHAINEDEMONTAGNE FOREIGN KEY (code_chaine_de_montagnes) REFERENCES CHAINE_DE_MONTAGNES (code_chaine_de_montagnes);

ALTER TABLE parcours ADD CONSTRAINT FK_parcours_ZONE FOREIGN KEY (code_zone) REFERENCES ZONE (code_zone);

ALTER TABLE pratique ADD CONSTRAINT FK_pratique_ZONE FOREIGN KEY (code_zone) REFERENCES ZONE (code_zone);

ALTER TABLE pratique ADD CONSTRAINT FK_pratique_RELIGION FOREIGN KEY (code_religion) REFERENCES RELIGION (code_religion);

ALTER TABLE a_pour ADD CONSTRAINT FK_apourFUSEAUHORAIRE FOREIGN KEY (code_fuseau_horaire) REFERENCES FUSEAU_HORAIRE (code_fuseau_horaire);

ALTER TABLE a_pour ADD CONSTRAINT FK_apour_ZONE FOREIGN KEY (code_zone) REFERENCES ZONE (code_zone);


ALTER TABLE visiteCont ADD CONSTRAINT FK_visiteCont_UTILISATEUR FOREIGN KEY (code_utilisateur) REFERENCES UTILISATEUR (code_utilisateur);

ALTER TABLE visiteCont ADD CONSTRAINT FK_visiteCont_CONTINENT FOREIGN KEY (code_continent) REFERENCES CONTINENT (code_continent);

ALTER TABLE Constitue ADD CONSTRAINT FK_Constitue_ZONE FOREIGN KEY (code_zone) REFERENCES ZONE (code_zone);

ALTER TABLE Constitue ADD CONSTRAINT FK_Constitue_CONTINENT FOREIGN KEY (code_continent) REFERENCES CONTINENT (code_continent);

ALTER TABLE a_pour_climat ADD CONSTRAINT FK_a_CLIMAT FOREIGN KEY (code_climat) REFERENCES TYPE_CLIMAT (code_climat);

ALTER TABLE a_pour_climat ADD CONSTRAINT FK_a_ZONE FOREIGN KEY (code_zone) REFERENCES ZONE (code_zone);

ALTER TABLE AreaZone ADD CONSTRAINT FK_AreaZone_AREA FOREIGN KEY (code_area) REFERENCES AREA (code_area);

ALTER TABLE AreaZone ADD CONSTRAINT FK_AreaZone_ZONE FOREIGN KEY (code_zone) REFERENCES ZONE (code_zone);

ALTER TABLE AreaHoraire ADD CONSTRAINT FK_AreaHoraire_AREA FOREIGN KEY (code_area) REFERENCES AREA (code_area);

ALTER TABLE AreaHoraire ADD CONSTRAINT FK_AreaHoraire_FUSEAUHORAIRE FOREIGN KEY (code_fuseau_horaire) REFERENCES FUSEAU_HORAIRE (code_fuseau_horaire);

ALTER TABLE AreaContinent ADD CONSTRAINT FK_AreaContinent_AREA FOREIGN KEY (code_area) REFERENCES AREA (code_area);

ALTER TABLE AreaContinent ADD CONSTRAINT FK_AreaContinent_CONTINENT FOREIGN KEY (code_continent) REFERENCES CONTINENT (code_continent);

ALTER TABLE AreaClimat ADD CONSTRAINT FK_AreaClimat_AREA FOREIGN KEY (code_area) REFERENCES AREA (code_area);

ALTER TABLE AreaClimat ADD CONSTRAINT FK_AreaClimat_CLIMAT FOREIGN KEY (code_climat) REFERENCES TYPE_CLIMAT (code_climat);

ALTER TABLE AreaOganisation ADD CONSTRAINT FK_AreaOganisation_ORGANISATIONINTERNATIONALE FOREIGN KEY (code_organisation_internationales) REFERENCES ORGANISATION_INTERNATIONALE (code_organisation_internationales);

ALTER TABLE AreaOganisation ADD CONSTRAINT FK_AreaOganisation_AREA FOREIGN KEY (code_area) REFERENCES AREA (code_area);

ALTER TABLE AreaLangue ADD CONSTRAINT FK_AreaLangue_LANGUE FOREIGN KEY (code_langue) REFERENCES LANGUE (code_langue);
ALTER TABLE AreaLangue ADD CONSTRAINT FK_AreaLangue_AREA FOREIGN KEY (code_area) REFERENCES AREA (code_area);

