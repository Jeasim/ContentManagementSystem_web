-- DROP TABLES --
DROP TABLE accueil;

DROP TABLE employes CASCADE CONSTRAINTS;

DROP TABLE departements;

DROP TABLE infos_sup;


-- CREATE TABLES --

CREATE TABLE accueil (
    id        NUMBER
        GENERATED ALWAYS AS IDENTITY,
    contenu   VARCHAR(4000) NOT NULL,
    section   VARCHAR2(20) NOT NULL,
    CONSTRAINT pk_accueil PRIMARY KEY ( id )
);

CREATE TABLE departements (
    id    NUMBER
        GENERATED ALWAYS AS IDENTITY,
    nom   VARCHAR2(400) NOT NULL,
    CONSTRAINT pk_departments PRIMARY KEY ( id )
);

CREATE TABLE infos_sup (
    id           NUMBER
        GENERATED ALWAYS AS IDENTITY,
    id_employe   NUMBER,
    info         VARCHAR2(100) NOT NULL,
    CONSTRAINT pk_infos_sup PRIMARY KEY ( id )
);

CREATE TABLE employes (
    id               NUMBER
        GENERATED ALWAYS AS IDENTITY,
    id_departement   NUMBER NOT NULL,
    nom              VARCHAR2(40) NOT NULL,
    poste            VARCHAR2(100) NOT NULL,
    courriel         VARCHAR2(50),
    numtel           VARCHAR2(25),
    CONSTRAINT pk_employes PRIMARY KEY ( id ),
    FOREIGN KEY ( id_departement )
        REFERENCES departements ( id )
);


-- INSERTS --

INSERT INTO accueil (
    contenu,
    section
) VALUES (
    'INNOVER POUR FAVORISER LA PARTICIPATION SOCIALE

DES PERSONNES EN SITUATION DE HANDICAP',
    'entete'
);

INSERT INTO accueil (
    contenu,
    section
) VALUES (
    'Le Centre de recherche pour l inclusion des personnes en situation de handicap (CRISPESH) est un centre coll�gial de transfert de technologie en pratiques sociales novatrices (CCTT-PSN), n� d un partenariat entre le C�gep du Vieux Montr�al et le Coll�ge Dawson. Le Centre a �t� reconnu en octobre 2010 par le Minist�re de l �ducation et de l Enseignement Sup�rieur.

En juillet 2015, le c�gep du Vieux Montr�al et le coll�ge Dawson confiaient la gestion du CRISPESH � un organisme
� but non lucratif du m�me nom cr�� dans le but de r�aliser le mandat du Centre.'
,
    'presentation'
);

INSERT INTO departements ( nom ) VALUES ( 'Personnel administratif' );

INSERT INTO departements ( nom ) VALUES ( 'Personnel scientifique' );

INSERT INTO departements ( nom ) VALUES ( '�tudiants (Assistants de recherche et stagiaires)' );

INSERT INTO departements ( nom ) VALUES ( 'Chercheuses et chercheurs affili�s' );

INSERT INTO departements ( nom ) VALUES ( 'Conseil d''administration' );

INSERT INTO employes (
    nom,
    id_departement,
    poste,
    courriel,
    numtel
) VALUES (
    'Roc Ducharme',
    (
        SELECT
            id
        FROM
            departements
        WHERE
            nom = 'Personnel administratif'
    ),
    'Directeur g�n�ral',
    'rducharme@cvm.qc.ca',
    '514 982-3437, poste 2835'
);

INSERT INTO employes (
    nom,
    id_departement,
    poste,
    courriel,
    numtel
) VALUES (
    'Jian Wang',
    (
        SELECT
            id
        FROM
            departements
        WHERE
            nom = 'Personnel administratif'
    ),
    'Adjointe administrative',
    'jywang@cvm.qc.ca',
    '514 982-3437, poste 2836'
);

INSERT INTO employes (
    nom,
    id_departement,
    poste,
    courriel
) VALUES (
    'Paul Turcotte',
    (
        SELECT
            id
        FROM
            departements
        WHERE
            nom = 'Personnel scientifique'
    ),
    'Enseignant au C�gep du Vieux Montr�al',
    'pturcotte@cvm.qc.ca'
);

INSERT INTO infos_sup (
    id_employe,
    info
) VALUES (
    (
        SELECT
            id
        FROM
            employes
        WHERE
            nom = 'Paul Turcotte'
    ),
    'D�partement de Philosophie'
);

INSERT INTO employes (
    nom,
    id_departement,
    poste,
    courriel
) VALUES (
    'Audrey Bigras',
    (
        SELECT
            id
        FROM
            departements
        WHERE
            nom = 'Personnel scientifique'
    ),
    'Professionnelle de recherche',
    'abigras@cvm.qc.ca'
);

INSERT INTO employes (
    nom,
    id_departement,
    poste,
    courriel
) VALUES (
    'Shannahn McInnis',
    (
        SELECT
            id
        FROM
            departements
        WHERE
            nom = 'Personnel scientifique'
    ),
    'Charg�e de projet',
    'smcinnis@cvm.qc.ca'
);

INSERT INTO employes (
    nom,
    id_departement,
    poste,
    courriel
) VALUES (
    'L�a Lefevre-Radelli',
    (
        SELECT
            id
        FROM
            departements
        WHERE
            nom = 'Personnel scientifique'
    ),
    'Coordonnatrice de projet et Assistante de recherche',
    'llefevreRadelli@cvm.qc.ca'
);

INSERT INTO employes (
    nom,
    id_departement,
    poste,
    courriel
) VALUES (
    'Joseph Darrous',
    (
        SELECT
            id
        FROM
            departements
        WHERE
            nom = 'Personnel scientifique'
    ),
    'Technicien en �ducation sp�cialis�e au Coll�ge Dawson',
    'jdarrous@dawsoncollege.qc.ca'
);

INSERT INTO employes (
    nom,
    id_departement,
    poste
) VALUES (
    'Rola Helou',
    (
        SELECT
            id
        FROM
            departements
        WHERE
            nom = 'Personnel scientifique'
    ),
    'Directrice du Conseil scolaire des Premi�res Nations en �ducation aux adultes'
);

INSERT INTO employes (
    nom,
    id_departement,
    poste
) VALUES (
    'Amanda Shawayahamish',
    (
        SELECT
            id
        FROM
            departements
        WHERE
            nom = '�tudiants (Assistants de recherche et stagiaires)'
    ),
    '�tudiante � l''universit� de Concordia'
);

INSERT INTO infos_sup (
    id_employe,
    info
) VALUES (
    (
        SELECT
            id
        FROM
            employes
        WHERE
            nom = 'Amanda Shawayahamish'
    ),
    '�tudes des peuples autochtones et biologie'
);

INSERT INTO employes (
    nom,
    id_departement,
    poste
) VALUES (
    'Celeste Awashish',
    (
        SELECT
            id
        FROM
            departements
        WHERE
            nom = '�tudiants (Assistants de recherche et stagiaires)'
    ),
    '�tudiante au Coll�ge Dawson'
);

INSERT INTO infos_sup (
    id_employe,
    info
) VALUES (
    (
        SELECT
            id
        FROM
            employes
        WHERE
            nom = 'Celeste Awashish'
    ),
    'Sciences sociales'
);

INSERT INTO employes (
    nom,
    id_departement,
    poste
) VALUES (
    'Catherine Fichten',
    (
        SELECT
            id
        FROM
            departements
        WHERE
            nom = 'Chercheuses et chercheurs affili�s'
    ),
    'Enseignante au Coll�ge Dawson'
);

INSERT INTO infos_sup (
    id_employe,
    info
) VALUES (
    (
        SELECT
            id
        FROM
            employes
        WHERE
            nom = 'Catherine Fichten'
    ),
    'Professeure associ�e � l''Universit� McGill D�partement de psychologie'
);

INSERT INTO infos_sup (
    id_employe,
    info
) VALUES (
    (
        SELECT
            id
        FROM
            employes
        WHERE
            nom = 'Catherine Fichten'
    ),
    'Codirectrice du R�seau de Recherche Adaptech (www.adaptech.org)'
);

INSERT INTO employes (
    nom,
    id_departement,
    poste
) VALUES (
    'Alice Havel',
    (
        SELECT
            id
        FROM
            departements
        WHERE
            nom = 'Chercheuses et chercheurs affili�s'
    ),
    'Retrait�e du Coll�ge Dawson'
);

INSERT INTO infos_sup (
    id_employe,
    info
) VALUES (
    (
        SELECT
            id
        FROM
            employes
        WHERE
            nom = 'Alice Havel'
    ),
    'Coordonnatrice du AccessAbility Centre'
);

INSERT INTO infos_sup (
    id_employe,
    info
) VALUES (
    (
        SELECT
            id
        FROM
            employes
        WHERE
            nom = 'Alice Havel'
    ),
    'Chercheuse associ�e au R�seau de Recherche Adaptech'
);

INSERT INTO employes (
    nom,
    id_departement,
    poste
) VALUES (
    'Tara Flanagan
',
    (
        SELECT
            id
        FROM
            departements
        WHERE
            nom = 'Chercheuses et chercheurs affili�s'
    ),
    'Professeure Associ�e � l''Universit� McGill'
);

INSERT INTO infos_sup (
    id_employe,
    info
) VALUES (
    (
        SELECT
            id
        FROM
            employes
        WHERE
            nom = 'Tara Flanagan'
    ),
    'D�partement d''Educational and Counselling Psychology'
);

INSERT INTO infos_sup (
    id_employe,
    info
) VALUES (
    (
        SELECT
            id
        FROM
            employes
        WHERE
            nom = 'Alice Havel'
    ),
    'Chercheuse associ�e au R�seau de Recherche Adaptech'
);

INSERT INTO employes (
    nom,
    id_departement,
    poste
) VALUES (
    'Josianne Robert',
    (
        SELECT
            id
        FROM
            departements
        WHERE
            nom = 'Chercheuses et chercheurs affili�s'
    ),
    'Professeure de formation pratique adjointe � l''Universit� de Montr�al'
);

INSERT INTO infos_sup (
    id_employe,
    info
) VALUES (
    (
        SELECT
            id
        FROM
            employes
        WHERE
            nom = 'Josianne Robert'
    ),
    'D�partement de psychop�dagogie et d''andragogie'
);

INSERT INTO employes (
    nom,
    id_departement,
    poste
) VALUES (
    'Richard Filion',
    (
        SELECT
            id
        FROM
            departements
        WHERE
            nom = 'Conseil d''administration'
    ),
    'Pr�sident'
);

INSERT INTO infos_sup (
    id_employe,
    info
) VALUES (
    (
        SELECT
            id
        FROM
            employes
        WHERE
            nom = 'Richard Filion'
    ),
    'Directeur g�n�ral du Coll�ge Dawson'
);

INSERT INTO employes (
    nom,
    id_departement,
    poste
) VALUES (
    'Myl�ne Boisclair',
    (
        SELECT
            id
        FROM
            departements
        WHERE
            nom = 'Conseil d''administration'
    ),
    'Vice-pr�sidente'
);

INSERT INTO infos_sup (
    id_employe,
    info
) VALUES (
    (
        SELECT
            id
        FROM
            employes
        WHERE
            nom = 'Myl�ne Boisclair'
    ),
    'Directrice g�n�rale au C�gep du Vieux Montr�al'
);


INSERT INTO employes (
    nom,
    id_departement,
    poste
) VALUES (
    'Martin Pr�vost',
    (
        SELECT
            id
        FROM
            departements
        WHERE
            nom = 'Conseil d''administration'
    ),
    'Secr�taire et tr�sorier'
);

INSERT INTO infos_sup (
    id_employe,
    info
) VALUES (
    (
        SELECT
            id
        FROM
            employes
        WHERE
            nom = 'Martin Pr�vost'
    ),
    'Directeur adjoint des �tudes au C�gep du Vieux Montr�al'
);


COMMIT;