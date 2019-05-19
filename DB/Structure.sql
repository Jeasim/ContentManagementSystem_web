-- DROP TABLES --
DROP TABLE accueil;

DROP TABLE employes CASCADE CONSTRAINTS;

DROP TABLE departements;


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


CREATE TABLE employes (
    id               NUMBER
        GENERATED ALWAYS AS IDENTITY,
    id_departement   NUMBER          NOT NULL,
    nom              VARCHAR2(40)    NOT NULL,
    poste            VARCHAR2(100)   NOT NULL,
    courriel         VARCHAR2(50)    DEFAULT '',
    numtel           VARCHAR2(25)    DEFAULT '',
    info_sup1        VARCHAR2(100)   DEFAULT '',
    info_sup2        VARCHAR2(100)   DEFAULT '',
    CONSTRAINT pk_employes           PRIMARY KEY ( id ),
    FOREIGN KEY ( id_departement )   REFERENCES departements ( id )
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
    'Le Centre de recherche pour l inclusion des personnes en situation de handicap (CRISPESH) est un centre collégial de transfert de technologie en pratiques sociales novatrices (CCTT-PSN), né d un partenariat entre le Cégep du Vieux Montréal et le Collège Dawson. Le Centre a été reconnu en octobre 2010 par le Ministère de l Éducation et de l Enseignement Supérieur.

En juillet 2015, le cégep du Vieux Montréal et le collège Dawson confiaient la gestion du CRISPESH à un organisme
à but non lucratif du même nom créé dans le but de réaliser le mandat du Centre.'
,
    'presentation'
);

INSERT INTO departements ( nom ) VALUES ( 'Personnel administratif' );

INSERT INTO departements ( nom ) VALUES ( 'Personnel scientifique' );

INSERT INTO departements ( nom ) VALUES ( 'Étudiants (Assistants de recherche et stagiaires)' );

INSERT INTO departements ( nom ) VALUES ( 'Chercheuses et chercheurs affiliés' );

INSERT INTO departements ( nom ) VALUES ( 'Conseil d''administration' );

INSERT INTO employes (
    nom,
    id_departement,
    poste,
    courriel,
    numtel
) VALUES (
    'Roch Ducharme',
    (
        SELECT
            id
        FROM
            departements
        WHERE
            nom = 'Personnel administratif'
    ),
    'Directeur général',
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
    courriel,
    info_sup1
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
    'Enseignant au Cégep du Vieux Montréal',
    'pturcotte@cvm.qc.ca',
    'Département de Philosophie'
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
    'Chargée de projet',
    'smcinnis@cvm.qc.ca'
);

INSERT INTO employes (
    nom,
    id_departement,
    poste,
    courriel
) VALUES (
    'Léa Lefevre-Radelli',
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
    'Technicien en éducation spécialisée au Collège Dawson',
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
    'Directrice du Conseil scolaire des Premières Nations en éducation aux adultes'
);

INSERT INTO employes (
    nom,
    id_departement,
    poste,
    info_sup1
) VALUES (
    'Amanda Shawayahamish',
    (
        SELECT
            id
        FROM
            departements
        WHERE
            nom = 'Étudiants (Assistants de recherche et stagiaires)'
    ),
    'Étudiante à l''université de Concordia',
    'Études des peuples autochtones et biologie'
);


INSERT INTO employes (
    nom,
    id_departement,
    poste,
    info_sup1
) VALUES (
    'Celeste Awashish',
    (
        SELECT
            id
        FROM
            departements
        WHERE
            nom = 'Étudiants (Assistants de recherche et stagiaires)'
    ),
    'Étudiante au Collège Dawson',
    'Sciences sociales'
);

INSERT INTO employes (
    nom,
    id_departement,
    poste,
    info_sup1,
    info_sup2
) VALUES (
    'Catherine Fichten',
    (
        SELECT
            id
        FROM
            departements
        WHERE
            nom = 'Chercheuses et chercheurs affiliés'
    ),
    'Enseignante au Collège Dawson',
    'Professeure associée à l''Université McGill Département de psychologie',
    'Codirectrice du Réseau de Recherche Adaptech (www.adaptech.org)'
);

INSERT INTO employes (
    nom,
    id_departement,
    poste,
    info_sup1,
    info_sup2
) VALUES (
    'Alice Havel',
    (
        SELECT
            id
        FROM
            departements
        WHERE
            nom = 'Chercheuses et chercheurs affiliés'
    ),
    'Retraitée du Collège Dawson',
    'Coordonnatrice du AccessAbility Centre',
    'Chercheuse associée au Réseau de Recherche Adaptech'
);


INSERT INTO employes (
    nom,
    id_departement,
    poste,
    info_sup1
) VALUES (
    'Tara Flanagan
',
    (
        SELECT
            id
        FROM
            departements
        WHERE
            nom = 'Chercheuses et chercheurs affiliés'
    ),
    'Professeure Associée à l''Université McGill',
    'Département d''Educational and Counselling Psychology'
);


INSERT INTO employes (
    nom,
    id_departement,
    poste,
    info_sup1
) VALUES (
    'Josianne Robert',
    (
        SELECT
            id
        FROM
            departements
        WHERE
            nom = 'Chercheuses et chercheurs affiliés'
    ),
    'Professeure de formation pratique adjointe à l''Université de Montréal',
    'Département de psychopédagogie et d''andragogie'
);


INSERT INTO employes (
    nom,
    id_departement,
    poste,
    info_sup1
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
    'Président',
    'Directeur général du Collège Dawson'
);


INSERT INTO employes (
    nom,
    id_departement,
    poste,
    info_sup1
) VALUES (
    'Mylène Boisclair',
    (
        SELECT
            id
        FROM
            departements
        WHERE
            nom = 'Conseil d''administration'
    ),
    'Vice-présidente',
    'Directrice générale au Cégep du Vieux Montréal'
);


INSERT INTO employes (
    nom,
    id_departement,
    poste,
    info_sup1
) VALUES (
    'Martin Prévost',
    (
        SELECT
            id
        FROM
            departements
        WHERE
            nom = 'Conseil d''administration'
    ),
    'Secrétaire et trésorier',
    'Directeur adjoint des études au Cégep du Vieux Montréal'
);



COMMIT;