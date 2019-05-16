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

INSERT INTO accueil(contenu, section) VALUES('Le Centre de recherche pour l inclusion des personnes en situation de handicap (CRISPESH) est un centre collégial de transfert de technologie en pratiques sociales novatrices (CCTT-PSN), né d un partenariat entre le Cégep du Vieux Montréal et le Collège Dawson. Le Centre a été reconnu en octobre 2010 par le Ministère de l Éducation et de l Enseignement Supérieur.

En juillet 2015, le cégep du Vieux Montréal et le collège Dawson confiaient la gestion du CRISPESH à un organisme
à but non lucratif du même nom créé dans le but de réaliser le mandat du Centre.', 'presentation');

INSERT INTO departements (nom) VALUES ('Personnel administratif');
INSERT INTO departements (nom) VALUES ('Personnel scientifique');
INSERT INTO departements (nom) VALUES ('Étudiants (Assistants de recherche et stagiaires)');
INSERT INTO departements (nom) VALUES ('Chercheuses et chercheurs affiliés');
INSERT INTO departements (nom) VALUES ('Conseil d''administration');


commit;




















