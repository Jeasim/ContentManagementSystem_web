-- DROP TABLES --

DROP TABLE accueil;
DROP TABLE employes CASCADE CONSTRAINTS;
DROP TABLE departements;


-- CREATE TABLES --

CREATE TABLE accueil (
    id      NUMBER GENERATED ALWAYS AS IDENTITY,
    contenu VARCHAR(4000),
    section VARCHAR2(20),
    
    CONSTRAINT pk_accueil PRIMARY KEY (id)
);

CREATE TABLE departements(
    id      NUMBER GENERATED ALWAYS AS IDENTITY,
    nom     VARCHAR2(400) NOT NULL,
    
    CONSTRAINT pk_departments PRIMARY KEY (id)
);

CREATE TABLE employes (
    id              NUMBER GENERATED ALWAYS AS IDENTITY,
    nom             VARCHAR2(40),
    id_departement  NUMBER,
    description     VARCHAR2(4000),
    
    CONSTRAINT pk_employes          PRIMARY KEY (id),
    FOREIGN KEY (id_departement)    REFERENCES departements(id)
);


-- INSERTS --

INSERT INTO accueil(contenu, section) VALUES('INNOVER POUR FAVORISER LA PARTICIPATION SOCIALE

DES PERSONNES EN SITUATION DE HANDICAP', 'entete');

INSERT INTO accueil(contenu, section) VALUES('Le Centre de recherche pour l inclusion des personnes en situation de handicap (CRISPESH) est un centre coll�gial de transfert de technologie en pratiques sociales novatrices (CCTT-PSN), n� d un partenariat entre le C�gep du Vieux Montr�al et le Coll�ge Dawson. Le Centre a �t� reconnu en octobre 2010 par le Minist�re de l �ducation et de l Enseignement Sup�rieur.

En juillet 2015, le c�gep du Vieux Montr�al et le coll�ge Dawson confiaient la gestion du CRISPESH � un organisme
� but non lucratif du m�me nom cr�� dans le but de r�aliser le mandat du Centre.', 'presentation');

INSERT INTO departements (nom) VALUES ('Personnel administratif');
INSERT INTO departements (nom) VALUES ('Personnel scientifique');
INSERT INTO departements (nom) VALUES ('�tudiants (Assistants de recherche et stagiaires)');
INSERT INTO departements (nom) VALUES ('Chercheuses et chercheurs affili�s');
INSERT INTO departements (nom) VALUES ('Conseil d''administration');


commit;




















