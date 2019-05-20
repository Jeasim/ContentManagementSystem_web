-- DROP TABLES --
DROP TABLE accueil;

DROP TABLE employes CASCADE CONSTRAINTS;

DROP TABLE departements;

DROP TABLE projets CASCADE CONSTRAINTS;

DROP TABLE infos_projets CASCADE CONSTRAINTS;

SET DEFINE OFF;

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
    id_departement   NUMBER NOT NULL,
    nom              VARCHAR2(40) NOT NULL,
    poste            VARCHAR2(100) NOT NULL,
    courriel         VARCHAR2(50) DEFAULT '',
    numtel           VARCHAR2(25) DEFAULT '',
    info_sup1        VARCHAR2(100) DEFAULT '',
    info_sup2        VARCHAR2(100) DEFAULT '',
    CONSTRAINT pk_employes PRIMARY KEY ( id ),
    FOREIGN KEY ( id_departement )
        REFERENCES departements ( id )
            ON DELETE CASCADE
);

CREATE TABLE projets (
    id        NUMBER
        GENERATED ALWAYS AS IDENTITY,
    nom       VARCHAR2(200) NOT NULL,
    contenu   VARCHAR2(4000) NOT NULL,
    statut    NUMBER(1) DEFAULT 0 NOT NULL,
    --chemin_img      VARCHAR2(50),
    CONSTRAINT pk_projets PRIMARY KEY ( id )
);

CREATE TABLE infos_projets (
    id          NUMBER
        GENERATED ALWAYS AS IDENTITY,
    id_projet   NUMBER,
    champ       VARCHAR2(150) NOT NULL,
    info        VARCHAR2(4000) NOT NULL,
    CONSTRAINT pk_infosprojet PRIMARY KEY ( id ),
    FOREIGN KEY ( id_projet )
        REFERENCES projets ( id )
            ON DELETE CASCADE
);


-- INSERTS --

INSERT INTO accueil (
    contenu,
    section
) VALUES (
    '<h1><p>INNOVER POUR FAVORISER LA PARTICIPATION SOCIALE</p><p>DES PERSONNES EN SITUATION DE HANDICAP</p></h1>',
    'entete'
);

INSERT INTO accueil (
    contenu,
    section
) VALUES (
    '<p><br/>Le Centre de recherche pour l''inclusion des personnes en situation de handicap (CRISPESH) est un centre collégial de transfert de technologie en pratiques sociales novatrices (CCTT-PSN), né d''un partenariat entre le <a href="http://www.cvm.qc.ca/Pages/index.aspx" target="_blank">Cégep du Vieux Montréal </a> et le <a href="http://www.dawsoncollege.qc.ca/french/" target="_blank">Collège Dawson</a>. Le Centre a été reconnu en octobre 2010 par le <a href="http://www.education.gouv.qc.ca/" target="_blank">Ministère de l''Éducation et de l''Enseignement Supérieur.</a></p><p>En juillet 2015, le cégep du Vieux Montréal et le collège Dawson confiaient la gestion du CRISPESH à un organisme<br> à but non lucratif du même nom créé dans le but de réaliser le mandat du Centre.</p>'
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

INSERT INTO projets (
    nom,
    contenu
) VALUES (
    'La photographie comme moyen d''expression, de participation sociale, d''autodétermination et d''inclusion des étudiants en situation de handicap au collégial (2015-2016)'
,
    ' <p>Grâce à une subvention de l''Office des personnes handicapées du Québec (OPHQ) le CRISPESH favorise la participation sociale des étudiants en situation de handicap du collégial. En utilisant la photographie comme moyen d''expression, les étudiants qui participent au projet ont l''occasion de partager leurs perspectives sur leur expérience au sein de la communauté collégiale.</p><p>Les cadres autour desquels s''articule ce projet sont l''autodétermination et la photographie participative. En favorisant le développement de l''autodétermination, ce projet permet à chacun des participants d''être le principal agent d''amélioration de sa qualité de vie et d''avoir un impact positif sur son milieu d''études. La photographie participative génère quant à elle un pouvoir d''expression par l''image qui se fonde sur l''idée que toute personne est la mieux placée pour communiquer son point de vue à une communauté.</p><p>Divisé en deux volets distincts (Création et Sensibilisation), ce projet se déroule tout au long de l''année 2016. Le volet Création, qui a eu lieu durant la session d''hiver 2016, vise à ce que les étudiants développent une perspective critique de leur propre expérience et qu''ils soient en mesure d''extérioriser un point de vue personnel en utilisant une démarche de création. Le volet Sensibilisation, qui a lieu au cours de la session d''automne 2016, a pour objectif le partage du point de vue développé, afin de sensibiliser la communauté collégiale à la diversité des expériences et des perspectives sur le handicap.</p><p>Tout au long de ce projet, les étudiants sont accompagnés par un photographe professionnel qui les soutient dans la démarche de création et la réalisation des aspects techniques de la production des images.  L''offre du support technique nécessaire à la réalisation de l''œuvre constitue une force de cette approche. Ce soutien technique réduit considérablement le risque que le créateur échoue suite à un trop grand écart séparant l''idée initiale du résultat final. De cette façon, les étudiants pourront s''exprimer librement tout en bénéficiant du large potentiel créatif de la photographie.</p>'
);

INSERT INTO infos_projets (
    id_projet,
    champ,
    info
) VALUES (
    (
        SELECT
            id
        FROM
            projets
        WHERE
            nom = 'La photographie comme moyen d''expression, de participation sociale, d''autodétermination et d''inclusion des étudiants en situation de handicap au collégial (2015-2016)'
    ),
    'Chargée de projet',
    'Marise Lachapelle'
);

INSERT INTO infos_projets (
    id_projet,
    champ,
    info
) VALUES (
    (
        SELECT
            id
        FROM
            projets
        WHERE
            nom = 'La photographie comme moyen d''expression, de participation sociale, d''autodétermination et d''inclusion des étudiants en situation de handicap au collégial (2015-2016)'
    ),
    'Coordonnatrice des activités',
    'Jian Wang'
);

INSERT INTO infos_projets (
    id_projet,
    champ,
    info
) VALUES (
    (
        SELECT
            id
        FROM
            projets
        WHERE
            nom = 'La photographie comme moyen d''expression, de participation sociale, d''autodétermination et d''inclusion des étudiants en situation de handicap au collégial (2015-2016)'
    ),
    'Coordonnateur des activités photographiques',
    'Gopesa Paquette'
);

INSERT INTO infos_projets (
    id_projet,
    champ,
    info
) VALUES (
    (
        SELECT
            id
        FROM
            projets
        WHERE
            nom = 'La photographie comme moyen d''expression, de participation sociale, d''autodétermination et d''inclusion des étudiants en situation de handicap au collégial (2015-2016)'
    ),
    'Coordonnateur des activités photographiques',
    'Gopesa Paquette'
);

INSERT INTO infos_projets (
    id_projet,
    champ,
    info
) VALUES (
    (
        SELECT
            id
        FROM
            projets
        WHERE
            nom = 'La photographie comme moyen d''expression, de participation sociale, d''autodétermination et d''inclusion des étudiants en situation de handicap au collégial (2015-2016)'
    ),
    'Partenaires',
    'Centre collégial de soutien à l''intégration (CCSI) de l''Ouest<br>L''association québécoise des étudiants ayant des incapacités au postsecondaire (AQEIPS)'
);

INSERT INTO infos_projets (
    id_projet,
    champ,
    info
) VALUES (
    (
        SELECT
            id
        FROM
            projets
        WHERE
            nom = 'La photographie comme moyen d''expression, de participation sociale, d''autodétermination et d''inclusion des étudiants en situation de handicap au collégial (2015-2016)'
    ),
    'Partenaire financier',
    'Office des personnes handicapées du Québec'
);

INSERT INTO projets (
    nom,
    contenu
) VALUES (
    'Améliorer les conditions de sommeil de l''enfant vivant avec un trouble du spectre de l''autisme grâce à un design réfléchi et personnalisé de sa chambre (2016-2017)'
,
    '<p>La Fédération québécoise de l''autisme estime la prévalence du trouble du spectre de l''autisme (TSA) à près de 1% de la population canadienne, mais des recherches démontrent que cette donnée sous-évalue le nombre réel d''individus touchés par ce trouble. Les problèmes de sommeil sont fréquents chez les enfants qui ont un TSA. Les raisons de ces problèmes de sommeil sont variées et peuvent être, par exemple, d''ordre physiologique, cognitif, sensoriel ou une combinaison de facteurs. Quelles qu''en soient les causes, le manque de sommeil aura inévitablement des conséquences sur la qualité de vie de l''enfant et de sa famille. Bien que l''aménagement de la chambre figure au premier rang des solutions que les parents peuvent apporter, la chambre des enfants ayant un TSA demeure un lieu bien peu étudié en design d''intérieur. De plus, il est démontré que le TSA se manifeste par des réactions inhabituelles à des expériences sensorielles. En effet, les personnes touchées par le TSA ont souvent de la difficulté à traiter et à répondre aux différents stimuli sensoriels, tels que l''ouïe, la vue et le toucher. Elles peuvent être hypo ou hypersensibles. Plusieurs chercheurs suggèrent que l''hypersensibilité peut provoquer des réactions sensorielles à l''origine des difficultés de sommeil. Pourtant, bien que le risque que le sommeil soit perturbé pour des raisons sensorielles chez les enfants ayant un TSA soit particulièrement élevé, cette composante est peu documentée. Ce projet propose de s''intéresser à l''aménagement de la chambre de l''enfant de 2 à 12 ans ayant un TSA en se basant sur les perceptions sensorielles de celui-ci. Pour ce faire, le projet fera le pont entre les études sur l''aménagement d''environnements conviviaux pour les personnes ayant un TSA et transférera ces connaissances vers l''aménagement de la chambre.</p><p>L''objectif général de ce projet est de développer un cadre général, adaptable aux besoins individuels, d''aménagement de chambre pour enfants  de 2 à 12 ans vivant avec un TSA, qui se base sur les perceptions sensorielles. Les objectifs particuliers sont : 1) consolider et répertorier les connaissances sur les besoins sensoriels des enfants vivant avec un TSA (ex : toucher, sentir, goûter, voir, entendre, mouvement); 2) établir les paramètres à prendre en considération pour un design réfléchi et personnalisé; 3) proposer un ensemble flexible de directives qui puisse guider vers une réponse personnalisée et basée sur les profils de perception sensorielle (hypo/hypersensibilité).</p><p>Grâce à la réalisation de ce projet, le CRISPESH pourra consolider ses connaissances et développer un créneau d''expertise peu étudié. Les programmes de Techniques de design d''intérieur du Cégep du Vieux Montréal et du Collège Dawson pourront bénéficier de nouveaux apprentissages visant à concevoir des aménagements réfléchis et personnalisés. Cela permettra au CRISPESH et à ses deux collèges affiliés de développer davantage leur capacité de recherche. L''originalité et la pertinence de ce projet résident dans une consolidation de connaissances qui n''ont jamais été regroupées à cette fin, mais aussi dans la prise en compte de l''expérience des personnes et des milieux concernés. Aucun effort n''a été déployé auparavant pour réunir toutes ces connaissances en vue d''apporter du soutien dans ce grand défi qui peut paraître banal pour toute personne qui n''est pas familière avec le sujet. Les ergothérapeutes peuvent certes aider dans cette entreprise et les informations obtenues grâce à l''évaluation sensorielle des enfants sont également utiles, mais aucun cadre de référence d''aménagement de la chambre de l''enfant ayant un trouble du spectre de l''autisme n''existe à l''heure actuelle. De façon générale, ce projet pourra améliorer la qualité de vie de plusieurs enfants et de leurs familles en contribuant à satisfaire ce besoin vital qu''est le sommeil.</p>'
);

INSERT INTO infos_projets (
    id_projet,
    champ,
    info
) VALUES (
    (
        SELECT
            id
        FROM
            projets
        WHERE
            nom = 'Améliorer les conditions de sommeil de l''enfant vivant avec un trouble du spectre de l''autisme grâce à un design réfléchi et personnalisé de sa chambre (2016-2017)'
    ),
    'Chargée de projet et chercheuse',
    'Marise Lachapelle'
);

INSERT INTO infos_projets (
    id_projet,
    champ,
    info
) VALUES (
    (
        SELECT
            id
        FROM
            projets
        WHERE
            nom = 'Améliorer les conditions de sommeil de l''enfant vivant avec un trouble du spectre de l''autisme grâce à un design réfléchi et personnalisé de sa chambre (2016-2017)'
    ),
    'Professionnelle de recherche et coordonnatrice des activités',
    'Audrey Bigras'
);

INSERT INTO infos_projets (
    id_projet,
    champ,
    info
) VALUES (
    (
        SELECT
            id
        FROM
            projets
        WHERE
            nom = 'Améliorer les conditions de sommeil de l''enfant vivant avec un trouble du spectre de l''autisme grâce à un design réfléchi et personnalisé de sa chambre (2016-2017)'
    ),
    'Chercheuse',
    'Suzanne Pitre'
);

INSERT INTO infos_projets (
    id_projet,
    champ,
    info
) VALUES (
    (
        SELECT
            id
        FROM
            projets
        WHERE
            nom = 'Améliorer les conditions de sommeil de l''enfant vivant avec un trouble du spectre de l''autisme grâce à un design réfléchi et personnalisé de sa chambre (2016-2017)'
    ),
    'Chercheur',
    'Joseph Darrous'
);

INSERT INTO infos_projets (
    id_projet,
    champ,
    info
) VALUES (
    (
        SELECT
            id
        FROM
            projets
        WHERE
            nom = 'Améliorer les conditions de sommeil de l''enfant vivant avec un trouble du spectre de l''autisme grâce à un design réfléchi et personnalisé de sa chambre (2016-2017)'
    ),
    'Assistantes de recherche',
    'Charlotte Leroux<p>Étudiante en Techniques de design d''intérieur au Cégep du Vieux Montréal</p>Tess Perron-Laurin<p>Étudiante en Techniques de design d''intérieur au Cégep du Vieux Montréal</p>'
);

INSERT INTO infos_projets (
    id_projet,
    champ,
    info
) VALUES (
    (
        SELECT
            id
        FROM
            projets
        WHERE
            nom = 'Améliorer les conditions de sommeil de l''enfant vivant avec un trouble du spectre de l''autisme grâce à un design réfléchi et personnalisé de sa chambre (2016-2017)'
    ),
    'Organisme subventionnaire',
    'Ministère de l''éducation et de l''enseignement supérieur'
);

INSERT INTO projets (
    nom,
    contenu
) VALUES (
    'Soutien à l''intégration des étudiants en situation de handicap: développement d''un instrument d''évaluation des besoins de l''apprenant (2015-2017)'
,
    '<p>L''objectif de ce projet est de développer un instrument d''évaluation à l''intention des intervenants des services adaptés pour soutenir les étudiants en situation de handicap dans leur réussite éducative. Le nombre d''étudiants en situation de handicap (ESH) au collégial s''est accru de manière remarquable au cours de la dernière décennie et leur profil s''est largement transformé. Les collèges disposent de services adaptés (SA) qui ont pour mandat l''accompagnement des ESH vers la réussite éducative. Ces SA ont démontré, depuis leur implantation, qu''ils favorisent la réussite des ESH qui les utilisent. Or, l''accompagnement des ESH se complexifie. Le constat actuel sur les pratiques d''accompagnement basées sur le modèle médical qui prévaut au sein des SA des collèges permet de conclure que ces pratiques ne sont pas à la hauteur des défis d''aujourd''hui. Le manque d''outils d''évaluation et de suivi des ESH est établi et met en évidence la limite actuelle des pratiques en accompagnement vers la réussite des ESH. Ce projet permettra, à terme, de dépasser cette limite.</p><p>Au  terme de ce projet, nous développerons un instrument d''évaluation du profil d''apprenant des ESH en milieu collégial qui, en plus de générer un profil personnalisé, proposera diverses ressources (humaines et matérielles) encourageant la réussite éducative des ESH. De plus, cet outil de travail permettra le développement de comportements d''autodétermination chez les ESH, ce qui favorisa également leur réussite éducative. En plus d''offrir des réponses aux besoins des ESH de manière plus pointue et systématique, cet outil servira aux conseillers en services adaptés de tous les établissements de niveau collégial (privés et publics) de la province et favorisera une harmonisation des pratiques en la matière.</p><p>La réussite éducative des étudiants est au cœur de la mission et des préoccupations de tous les établissements de niveau collégial de la province. Ce projet revêt une importance capitale pour le partenaire (CCSI), les collèges du Québec et leurs différents acteurs (personnel de direction, conseillers en services adaptés, aides pédagogiques individuels, enseignants, ESH), mais aussi la société dans son ensemble. En effet, une plus grande réussite éducative des ESH est un facteur déterminant d''une meilleure intégration future au marché de l''emploi et, ainsi, à la pleine valorisation et participation des ESH au sein de la société.</p>'
);

INSERT INTO infos_projets (
    id_projet,
    champ,
    info
) VALUES (
    (
        SELECT
            id
        FROM
            projets
        WHERE
            nom = 'Soutien à l''intégration des étudiants en situation de handicap: développement d''un instrument d''évaluation des besoins de l''apprenant (2015-2017)'
    ),
    'Chargée de projet et chercheuse',
    'Marise Lachapelle'
);

INSERT INTO infos_projets (
    id_projet,
    champ,
    info
) VALUES (
    (
        SELECT
            id
        FROM
            projets
        WHERE
            nom = 'Soutien à l''intégration des étudiants en situation de handicap: développement d''un instrument d''évaluation des besoins de l''apprenant (2015-2017)'
    ),
    'Professionnelle de recherche',
    'Danièle Paquet'
);

INSERT INTO infos_projets (
    id_projet,
    champ,
    info
) VALUES (
    (
        SELECT
            id
        FROM
            projets
        WHERE
            nom = 'Soutien à l''intégration des étudiants en situation de handicap: développement d''un instrument d''évaluation des besoins de l''apprenant (2015-2017)'
    ),
    'Chercheur',
    'Paul Turcotte'
);

INSERT INTO infos_projets (
    id_projet,
    champ,
    info
) VALUES (
    (
        SELECT
            id
        FROM
            projets
        WHERE
            nom = 'Soutien à l''intégration des étudiants en situation de handicap: développement d''un instrument d''évaluation des besoins de l''apprenant (2015-2017)'
    ),
    'Chercheuse associée',
    'Josianne Robert'
);

INSERT INTO infos_projets (
    id_projet,
    champ,
    info
) VALUES (
    (
        SELECT
            id
        FROM
            projets
        WHERE
            nom = 'Soutien à l''intégration des étudiants en situation de handicap: développement d''un instrument d''évaluation des besoins de l''apprenant (2015-2017)'
    ),
    'Chercheuse (2015-2016)',
    'Christine Morin'
);

INSERT INTO infos_projets (
    id_projet,
    champ,
    info
) VALUES (
    (
        SELECT
            id
        FROM
            projets
        WHERE
            nom = 'Soutien à l''intégration des étudiants en situation de handicap: développement d''un instrument d''évaluation des besoins de l''apprenant (2015-2017)'
    ),
    'Assistantes de recherche',
    'Mélissa Miller<p>Étudiante en Histoire et civilisation au Cégep du Vieux Montréal</p>Odile Trudeau-Richard<p>Étudiante en Histoire et civilisation au Cégep du Vieux Montréal</p>'
);

INSERT INTO infos_projets (
    id_projet,
    champ,
    info
) VALUES (
    (
        SELECT
            id
        FROM
            projets
        WHERE
            nom = 'Soutien à l''intégration des étudiants en situation de handicap: développement d''un instrument d''évaluation des besoins de l''apprenant (2015-2017)'
    ),
    'Organisme partenaire',
    'Centre collégial de soutien à l''intégration (CCSI)'
);

INSERT INTO infos_projets (
    id_projet,
    champ,
    info
) VALUES (
    (
        SELECT
            id
        FROM
            projets
        WHERE
            nom = 'Soutien à l''intégration des étudiants en situation de handicap: développement d''un instrument d''évaluation des besoins de l''apprenant (2015-2017)'
    ),
    'Organisme subventionnaire',
    'Ministère de l''éducation et de l''enseignement supérieur'
);

INSERT INTO projets (
    nom,
    contenu
) VALUES (
    'Développement d''un modèle d''incubateur d''entreprises inclusif destiné aux Autochtones (2016-2018)',
    '<p>Les inégalités salariales et d''accès à l''emploi persistent entre les Autochtones et le reste de la population canadienne. Par ailleurs, les membres des Premières Nations qui se retrouvent en situation de handicap (troubles de santé mentale, handicap physique, sensoriel ou moteur, trouble ou difficulté d''apprentissage, etc.) peuvent facilement être sujets à une double discrimination sur le marché de l''emploi, de par leur appartenance culturelle et leurs besoins particuliers. Ces facteurs freinent leur épanouissement professionnel et empêchent le marché du travail de bénéficier de travailleurs qualifiés qui pourraient contribuer au maintien d''une économie locale prospère.</p<p>L''entrepreneuriat représente une voie qui peut faciliter l''inclusion sociale et économique de personnes marginalisées en misant sur leurs intérêts et leurs compétences. Cette avenue est flexible, facilement adaptable aux besoins particuliers des individus qui s''y engagent et respectueuse des conceptions sociales et culturelles spécifiques de l''économie locale. Toutefois, du soutien et de l''accompagnement sont essentiels afin de rendre cette voie possible et durable. En ce sens, l''incubateur d''entreprises est une structure d''accompagnement adaptée qui offre différents services afin de faciliter le passage de l''idée à la mise en place d''un projet d''entreprise.</p><p>Ce projet permettra de développer un modèle d''incubateur d''entreprises inclusif qui répondrait aux besoins et aux aspirations des membres des Premières Nations du Québec. Celui-ci sera inclusif puisqu''il sera adapté d''emblée pour les personnes en situation de handicap.</p>'
);

INSERT INTO infos_projets (
    id_projet,
    champ,
    info
) VALUES (
    (
        SELECT
            id
        FROM
            projets
        WHERE
            nom = 'Développement d''un modèle d''incubateur d''entreprises inclusif destiné aux Autochtones (2016-2018)'
    ),
    'Directrice de projet',
    'Marise Lachapelle'
);

INSERT INTO infos_projets (
    id_projet,
    champ,
    info
) VALUES (
    (
        SELECT
            id
        FROM
            projets
        WHERE
            nom = 'Développement d''un modèle d''incubateur d''entreprises inclusif destiné aux Autochtones (2016-2018)'
    ),
    'Coordonnatrice de projet et Assistante de recherche',
    'Léa Lefevre-Radelli'
);

INSERT INTO infos_projets (
    id_projet,
    champ,
    info
) VALUES (
    (
        SELECT
            id
        FROM
            projets
        WHERE
            nom = 'Développement d''un modèle d''incubateur d''entreprises inclusif destiné aux Autochtones (2016-2018)'
    ),
    'Chercheur',
    'Paul Turcotte'
);

INSERT INTO infos_projets (
    id_projet,
    champ,
    info
) VALUES (
    (
        SELECT
            id
        FROM
            projets
        WHERE
            nom = 'Développement d''un modèle d''incubateur d''entreprises inclusif destiné aux Autochtones (2016-2018)'
    ),
    'Chercheuse',
    'Rola Helou'
);

INSERT INTO infos_projets (
    id_projet,
    champ,
    info
) VALUES (
    (
        SELECT
            id
        FROM
            projets
        WHERE
            nom = 'Développement d''un modèle d''incubateur d''entreprises inclusif destiné aux Autochtones (2016-2018)'
    ),
    'Organismes partenaires',
    'Conseil scolaire des Premières Nations en éducation aux adultes (CSPNEA)<br>Commission de développement des ressources humaines des Premières Nations du Québec (CDRHPNQ)<br>Commission de développement économique des Premières Nations du Québec et du Labrador (CDEPNQL)<br>Tewatonhnhi''saktha<br>Fondation Martin<br>Cégep du Vieux Montréal<br>Collège Dawson'
);

INSERT INTO infos_projets (
    id_projet,
    champ,
    info
) VALUES (
    (
        SELECT
            id
        FROM
            projets
        WHERE
            nom = 'Développement d''un modèle d''incubateur d''entreprises inclusif destiné aux Autochtones (2016-2018)'
    ),
    'Organisme subventionnaire',
    'Conseil de recherches en sciences humaines du Canada (CRSH)'
);

INSERT INTO projets (
    nom,
    contenu
) VALUES (
    'Soutenir l''employeur dans l''inclusion professionnelle des personnes vivant avec une déficience intellectuelle ou un trouble du spectre de l''autisme (2016-2017)'
,
    '<p>Le Centre intégré de santé et de services sociaux de la Montérégie-Ouest (CISSSMO) offre des services d''adaptation, de réadaptation et d''intégration sociale aux personnes qui vivent avec une déficience intellectuelle (DI) ou un trouble du spectre de l''autisme (TSA). Pour ce faire, il leur fournit une gamme de services de soutien et d''accompagnement. Dans un souci d''offrir des services basés sur des données probantes et de faciliter l''implantation de meilleures pratiques, le CISSSMO a remis à jour son programme d''intégration et de réadaptation au travail. Afin de permettre à ses usagers de vivre une intégration au travail positive et valorisante, le CISSSMO constate que le soutien à l''employeur est primordial. Toutefois, la force de son expertise réside davantage dans l''identification des besoins et le soutien des personnes vivant avec une DI ou un TSA. Pour remédier à la situation, le CISSSMO bénéficiera de l''expertise du Centre de recherche pour l''inclusion scolaire et professionnelle des étudiants en situation de handicap (CRISPESH) afin de mieux répondre aux besoins des employeurs avec lesquels il collabore. Cela facilitera la mise en place d''environnements de travail inclusifs où les contextes qui mettraient leurs usagers en situation de handicap seraient réduits. L''obligation légale d''égalité à l''emploi au Québec se fonde sur le constat d''une discrimination systémique à l''endroit de certaines personnes, dont les personnes en situation de handicap (PSH). Plusieurs employeurs croient que celles-ci sont moins productives, ce qui engendre des pratiques discriminatoires. Pour contrer cette tendance, le monde de la gestion s''est donné un cadre d''opération vers un engagement planifié et systématique à recruter et maintenir en emploi des personnes ayant des profils (expériences, habiletés, etc.) diversifiés. Sous la bannière du concept de « gestion de la diversité », ce cadre vise l''équité et l''égalité des chances dans le monde du travail. Il s''agit de valoriser et reconnaître les différences individuelles en partant du postulat que chaque personne a le potentiel de contribuer à la performance d''une entreprise. Toutefois, ce cadre ne s''est pas encore généralisé dans les pratiques et au Québec, il comprend rarement les PSH.</p><p>Dans le cadre de ce projet, le CRISPESH et le CISSSMO uniront leurs efforts et leurs expertises pour développer des stratégies visant à favoriser la mise en place de pratiques de gestion de la diversité inclusive pour les PSH. En s''inspirant du concept d''inclusion, tel que défini en éducation, et du domaine de la gestion de la diversité, ce projet a pour objectif général le développement de bonnes pratiques de préparation et de soutien aux employeurs vers une gestion plus inclusive des personnes vivant avec une DI ou un TSA dans les milieux de travail. Les objectifs particuliers visent à élargir et à consolider les connaissances en matière de gestion de la diversité, de leadership d''inclusion et de changements de pratiques de gestion, en portant une attention particulière au handicap. Aussi, les chercheurs documenteront le point de vue de l''employeur sur les pratiques d''inclusion et d''intégration des personnes vivant avec une DI ou un TSA. Ce projet est novateur, puisqu''il compte développer un cadre de gestion de la diversité au Québec qui s''intéresse spécifiquement au handicap.</p><p>De façon générale, ce projet favorisera l''augmentation de la participation sociale des PSH grâce à une plus grande inclusion dans le monde professionnel. Il permettra au CISSSMO de mieux soutenir les employeurs avec lesquels il collabore, en plus de faciliter l''intégration des usagers. Les collèges et le CRISPESH innoveront et renforceront leur capacité de recherche et de transfert des connaissances grâce à une nouvelle expertise.</p>'
);

INSERT INTO infos_projets (
    id_projet,
    champ,
    info
) VALUES (
    (
        SELECT
            id
        FROM
            projets
        WHERE
            nom = 'Soutenir l''employeur dans l''inclusion professionnelle des personnes vivant avec une déficience intellectuelle ou un trouble du spectre de l''autisme (2016-2017)'
    ),
    'Chargée de projet et chercheuse',
    'Marise Lachapelle'
);

INSERT INTO infos_projets (
    id_projet,
    champ,
    info
) VALUES (
    (
        SELECT
            id
        FROM
            projets
        WHERE
            nom = 'Soutenir l''employeur dans l''inclusion professionnelle des personnes vivant avec une déficience intellectuelle ou un trouble du spectre de l''autisme (2016-2017)'
    ),
    'Chercheur',
    'Jean-Sébastien Goulet'
);

INSERT INTO infos_projets (
    id_projet,
    champ,
    info
) VALUES (
    (
        SELECT
            id
        FROM
            projets
        WHERE
            nom = 'Soutenir l''employeur dans l''inclusion professionnelle des personnes vivant avec une déficience intellectuelle ou un trouble du spectre de l''autisme (2016-2017)'
    ),
    'Assistante de recherche',
    'Aurélie Angrignon Atkins<p>Étudiante en Techniques de gestion de commerces au Cégep du Vieux Montréal</p>'
);

INSERT INTO infos_projets (
    id_projet,
    champ,
    info
) VALUES (
    (
        SELECT
            id
        FROM
            projets
        WHERE
            nom = 'Soutenir l''employeur dans l''inclusion professionnelle des personnes vivant avec une déficience intellectuelle ou un trouble du spectre de l''autisme (2016-2017)'
    ),
    'Partenaire',
    'Centre intégré de santé et de services sociaux de la Montérégie-Ouest (CISSSMO)'
);

INSERT INTO infos_projets (
    id_projet,
    champ,
    info
) VALUES (
    (
        SELECT
            id
        FROM
            projets
        WHERE
            nom = 'Soutenir l''employeur dans l''inclusion professionnelle des personnes vivant avec une déficience intellectuelle ou un trouble du spectre de l''autisme (2016-2017)'
    ),
    'Organisme subventionnaire',
    'Ministère de l''éducation et de l''enseignement supérieur'
);

INSERT INTO projets (
    nom,
    contenu,
    statut
) VALUES (
    'Conception d''un vêtement de compression adapté pour des adolescents et de jeunes adultes vivant avec un trouble du spectre de l''autisme (2015-2016)'
,
    '<p>Dans le cadre du Programme d''aide à la recherche et au transfert (PART), Vestechpro et le CRISPESH se sont associées à une entreprise québécoise pour concevoir un vêtement de compression adapté pour les adolescents et les jeunes adultes atteints d''un trouble du spectre de l''autisme. En effet, les vêtements disponibles à l''heure actuelle ne répondent pas aux besoins de cette clientèle. Les clients trouvent que ces vêtements sont volumineux, coûtent cher, ne sont pas totalement confortables et sont rarement ajustables au besoin de chacun en matière de pression ou compression. De plus, les produits disponibles visent surtout les jeunes enfants et permettent souvent d''identifier les personnes les portant comme étant différentes en raison de leur style particulier.</p><p>Ainsi, l''objectif principal de ce projet était la conception d''un vêtement adapté pour les adolescents et les jeunes adultes atteints d''un trouble du spectre de l''autisme.</p>'
,
    1
);

INSERT INTO infos_projets (
    id_projet,
    champ,
    info
) VALUES (
    (
        SELECT
            id
        FROM
            projets
        WHERE
            nom = 'Conception d''un vêtement de compression adapté pour des adolescents et de jeunes adultes vivant avec un trouble du spectre de l''autisme (2015-2016)'
    ),
    'Chargée de projet et chercheuse',
    'Marise Lachapelle'
);

INSERT INTO infos_projets (
    id_projet,
    champ,
    info
) VALUES (
    (
        SELECT
            id
        FROM
            projets
        WHERE
            nom = 'Conception d''un vêtement de compression adapté pour des adolescents et de jeunes adultes vivant avec un trouble du spectre de l''autisme (2015-2016)'
    ),
    'Chercheur',
    'Joseph Darrous'
);

INSERT INTO infos_projets (
    id_projet,
    champ,
    info
) VALUES (
    (
        SELECT
            id
        FROM
            projets
        WHERE
            nom = 'Conception d''un vêtement de compression adapté pour des adolescents et de jeunes adultes vivant avec un trouble du spectre de l''autisme (2015-2016)'
    ),
    'Assistantes de recherche',
    'Mélissa Miller<p>Étudiante en Histoire et civilisation au Cégep du Vieux Montréal</p>Odile Trudeau-Richard<p>Étudiante en Histoire et civilisation au Cégep du Vieux Montréal</p>'
);

INSERT INTO projets (
    nom,
    contenu,
    statut
) VALUES (
    'Consortium de recherche sur la gestion de la diversité en emploi (2014-2015)',
    '<p>Ce projet a regroupé trois centres collégiaux de transfert de technologie en pratiques sociales novatrices (CCTT-PSN) en vue de promouvoir et de favoriser l''inclusion professionnelle des jeunes âgés entre 25 et 34 ans de divers horizons, dont les immigrants et les personnes en situation de handicap. Le CRISPESH, le Centre d''études des conditions de vie et des besoins de la population (ÉCOBES) et l''Institut de recherche sur l''intégration professionnelle des immigrants (IRIPI) ont uni leurs expertises dans le cadre de cette alliance stratégique qui, à terme, a proposé une offre de service visant à améliorer le taux d''emploi de cette population et à répondre aux besoins de main-d''œuvre des entreprises québécoises.</p>'
,
    1
);

INSERT INTO infos_projets (
    id_projet,
    champ,
    info
) VALUES (
    (
        SELECT
            id
        FROM
            projets
        WHERE
            nom = 'Consortium de recherche sur la gestion de la diversité en emploi (2014-2015)'
    ),
    'Chercheuse',
    'Marise Lachapelle'
);

INSERT INTO projets (
    nom,
    contenu,
    statut
) VALUES (
    'Formation par simulation en santé mentale (2015-2016)',
    '<p>Grâce à une subvention du Ministère de l''Économie et des Importations du Québec, le CRISPESH a développé un modèle de formation par simulation en santé mentale offert sur support multimédia pour les intervenants d''une ressource communautaire œuvrant en région éloignée au sein d''une communauté inuit.</p>'
,
    1
);

INSERT INTO infos_projets (
    id_projet,
    champ,
    info
) VALUES (
    (
        SELECT
            id
        FROM
            projets
        WHERE
            nom = 'Formation par simulation en santé mentale (2015-2016)'
    ),
    'Chargées de projet',
    'Marise Lachapelle et Jian Wang'
);

INSERT INTO infos_projets (
    id_projet,
    champ,
    info
) VALUES (
    (
        SELECT
            id
        FROM
            projets
        WHERE
            nom = 'Formation par simulation en santé mentale (2015-2016)'
    ),
    'Chargée de projet et Chercheuse',
    'Christine Morin'
);

INSERT INTO infos_projets (
    id_projet,
    champ,
    info
) VALUES (
    (
        SELECT
            id
        FROM
            projets
        WHERE
            nom = 'Formation par simulation en santé mentale (2015-2016)'
    ),
    'Stagiaires',
    '<p>Étudiante au Cégep du Vieux Montréal</p><p>Arts, lettres et communication, profil Médias</p>Xavier Bossé<p>Étudiant au Cégep du Vieux Montréal</p><p>Arts, lettres et communication, profil Médias</p>Camille Archambault<p>Étudiante au Cégep du Vieux Montréal</p><p>Arts, lettres et communication, profil Médias</p>'
);

INSERT INTO projets (
    nom,
    contenu,
    statut
) VALUES (
    'L''amélioration du français écrit des adultes ayant un trouble d''apprentissage, soutenus par les aides technologiques (2012-2014)'
,
    '<p>La problématique à l''origine de cette recherche est liée à la croissance de l''utilisation des aides technologiques pour améliorer la qualité du français écrit des adultes ayant un trouble d''apprentissage. L''omniprésence de l''écriture dans notre société actuelle justifie d''ailleurs cet intérêt marqué. Le problème, par contre, est que cette utilisation est peu documentée et peu évaluée. De plus, jusqu''à ce jour, aucune recherche n''a évalué l''effet de l''accompagnement dans l''utilisation des aides technologiques dans une perspective d''amélioration de l''écriture.</p><p>Donc, présentement, on offre différents services et fonctions d''aide de logiciels sans vraiment connaître l''impact réel des technologies sur le processus d''écriture ou même sur la qualité du français écrit. C''est pour pallier cette situation que, dans le cadre de cette recherche, un devis à cas unique, pour cinq sujets, a été retenu afin de permettre l''évaluation à la fois de l''effet de l''utilisation de certaines fonctions d''aide à l''écriture (édition de texte, dictionnaires, révision-correction et rétroaction vocale) et l''effet de l''accompagnement. La volonté d''élaborer un guide d''accompagnement dans l''utilisation des aides technologiques auprès des adultes ayant un trouble d''apprentissage soutenait également ce choix.</p><p>Les sujets ont donc été accompagnés dans leur processus d''écriture avec aides technologiques pendant 15 semaines à raison d''une fois par semaine. Tout au long de l''expérimentation, ceux-ci ont dû produire une rédaction hebdomadaire, ce qui nous a permis d''obtenir des données. L''analyse des résultats a permis de tirer un certain nombre de recommandations permettant de moduler l''accompagnement dans les aides technologiques afin  qu''il soit plus efficace. Ainsi, il est permis de recommander l''utilisation des fonctions Édition de texte et Révision-correction à tout adulte ayant un trouble d''apprentissage à la condition essentielle qu''y soit associé un accompagnement sur la technique du logiciel ainsi que sur le développement de stratégies d''écriture intégrant les différentes fonctions d''aide. En contrepartie, la prudence est de mise  en ce qui concerne l''utilisation des fonctions Dictionnaires et Rétroaction vocale puisque la recherche a aussi mis en lumière l''efficacité moins constante de ces outils. Il devient donc nécessaire de s''assurer que l''utilisateur répond bien à cette mesure d''aide et qu''il y a effectivement une amélioration de la qualité de son français écrit avant de lui en permettre une utilisation autonome. L''encadrement est essentiel. Le transfert de ces résultats au partenaire, l''Institut des troubles d''apprentissage (ITA), s''est fait et se poursuivra par une collaboration entre les personnes ressources de l''organisme et les chercheurs. En dernier lieu, il apparaît important de poursuivre la recherche dans ce domaine encore peu exploré puisqu''un trop grand décalage subsiste entre la progression de la demande d''utilisation des aides technologiques et le développement des connaissances sur le sujet.</p><p>Grâce à une subvention du Ministère de l''Économie et des Importations du Québec, le CRISPESH a développé un modèle de formation par simulation en santé mentale offert sur support multimédia pour les intervenants d''une ressource communautaire œuvrant en région éloignée au sein d''une communauté inuit.</p>'
,
    1
);

INSERT INTO infos_projets (
    id_projet,
    champ,
    info
) VALUES (
    (
        SELECT
            id
        FROM
            projets
        WHERE
            nom = 'L''amélioration du français écrit des adultes ayant un trouble d''apprentissage, soutenus par les aides technologiques (2012-2014)'
    ),
    'Chercheuse',
    'Evelyne Pitre Enseignante au Cégep du Vieux Montréal<p>Département de français</p>'
);

INSERT INTO infos_projets (
    id_projet,
    champ,
    info
) VALUES (
    (
        SELECT
            id
        FROM
            projets
        WHERE
            nom = 'L''amélioration du français écrit des adultes ayant un trouble d''apprentissage, soutenus par les aides technologiques (2012-2014)'
    ),
    'Chercheur',
    'Marc Tremblay<p>Fondateur et Coordonnateur, Solutions aides technologiques</p>'
);

INSERT INTO infos_projets (
    id_projet,
    champ,
    info
) VALUES (
    (
        SELECT
            id
        FROM
            projets
        WHERE
            nom = 'L''amélioration du français écrit des adultes ayant un trouble d''apprentissage, soutenus par les aides technologiques (2012-2014)'
    ),
    'Assistants de recherche',
    '<p>Alexandra Cloutier</p><p>Mathieu Lauzon-Dicso</p><p>Camille Raunet</p>'
);



INSERT INTO projets (
    nom,
    contenu,
    statut
) VALUES (
    'Les applications pédagogiques de la conception universelle de l''apprentissage (2013-2015)',
    '<p>Ce projet a conduit à l''élaboration de stratégies pédagogiques conçues selon les principes de la conception universelle de l''apprentissage (CUA). L''objectif était de soutenir les enseignants dans la planification de cours qui répondent à la fois aux besoins des étudiants en situation de handicap et à ceux de l''ensemble des étudiants de la classe. Ce projet s''inscrivait dans une perspective proactive en proposant des solutions pédagogiques axées sur la planification plutôt que sur des réponses rétroactives à des besoins individuels.</p><p>Grâce à ce projet interordres, cinq établissements postsecondaires ont travaillé de concert: l''Université de Montréal, l''Université du Québec à Montréal (UQAM), le Collège Montmorency, le Cégep Marie-Victorin et le Cégep du Vieux Montréal.</p>'
,
    1
);

INSERT INTO infos_projets (
    id_projet,
    champ,
    info
) VALUES (
    (
        SELECT
            id
        FROM
            projets
        WHERE
            nom = 'Les applications pédagogiques de la conception universelle de l''apprentissage (2013-2015)'
    ),
    'Coordination',
    'Stéphanie Tremblay<p>Chargée de projet, d''octobre 2013 à novembre 2014</p>Paul Turcotte<p>Chargé de projet, de novembre 2014 jusqu''à la fin du projet</p>Florence Lebeau<p>Chargée de projet, de novembre 2014 à juin 2015</p>'
);

INSERT INTO infos_projets (
    id_projet,
    champ,
    info
) VALUES (
    (
        SELECT
            id
        FROM
            projets
        WHERE
            nom = 'Les applications pédagogiques de la conception universelle de l''apprentissage (2013-2015)'
    ),
    'Comité de direction',
    'Marie Blain<p>Directrice adjointe aux études, Cégep Marie-Victorin</p>Yves Carignan<p>Directeur des affaires étudiantes et relations avec la communauté, Collège Montmorency, 2013-2014</p>Nathalie Giguère<p>Directrice des études, Cégep du Vieux Montréal, 2014-2015</p>Thomas Henderson<p>Directeur du Centre de recherche pour l''inclusion scolaire et professionnelle des étudiants en situation de handicap (CRISPESH), 2013-2014</p>Carole Lavallée<p>Directrice adjointe des études, Cégep du Vieux Montréal, 2013</p>Catherine Loiselle<p>Directrice générale du Centre de recherche pour l''inclusion scolaire et professionnelle des étudiants en situation de handicap (CRISPESH), 2014-2015</p>Dolores Otero<p>Directrice, Services à la vie étudiante – Centre des services d''accueil et de soutien socioéconomique, Université du Québec à Montréal</p>Hélène Trifiro<p>Directrice du Centre étudiant du soutien à la réussite, Université de Montréal</p>'
);

INSERT INTO infos_projets (
    id_projet,
    champ,
    info
) VALUES (
    (
        SELECT
            id
        FROM
            projets
        WHERE
            nom = 'Les applications pédagogiques de la conception universelle de l''apprentissage (2013-2015)'
    ),
    'Comité de travail',
    'Brigitte Auclair<p>Enseignante  de français, Collège Montmorency </p>Véronique Besançon<p>Conseillère  pédagogique, Université de Montréal </p>Jean-René Corbeil<p>Enseignant en Technologies de l''architecture, Collège Montmorency</p>Antoine Coulombe<p>Enseignant en Techniques de travail social, Cégep Marie-Victorin</p>Johanne Morin<p>Enseignante en Techniques de travail social, Cégep Marie-Victorin </p>Cédric Lamathe<p>Enseignant de mathématiques, Cégep du Vieux Montréal</p>Florence Lebeau<p>Chargée  de cours à la Faculté de l''Aménagement, Université de Montréal </p>Paul Turcotte<p>Enseignant de philosophie, Cégep du Vieux Montréal</p>Steve Vezeau<p>Enseignant à l''École de design, Université du Québec à Montréal</p>	'
);

INSERT INTO projets (
    nom,
    contenu,
    statut
) VALUES (
    'Intégrer les nouvelles populations étudiantes en situation de handicap aux études supérieures : mission possible (2011-2013)',
    '<p>Ce projet a permis l''élaboration d''un modèle d''intégration pour les populations dites émergentes que nous convenons d''appeler dorénavant les nouvelles populations en situation de handicap. Par le développement d''outils généraux pour les étudiants, les intervenants, les enseignants et les établissements, ce projet a réuni les efforts de quatre établissements d''études postsecondaires: l''Université de Montréal, l''Université du Québec à Montréal (UQAM), le Collège Montmorency et le Cégep du Vieux Montréal.</p><p>Ainsi, dans le cadre du réinvestissement en enseignement supérieur par le Ministère de l''Éducation, du Loisir et du Sport (MELS, maintenant MEES), une équipe a travaillé à la mise en œuvre d''un projet intitulé : Intégrer les populations dites émergentes aux études supérieures: mission possible!</p><p>Les populations visées par ce projet sont les étudiants ayant des troubles d''apprentissage (TA), des troubles envahissants du développement (TED), des troubles déficitaires de l''attention (TDA/H) et des troubles graves de santé mentale (TGSM). Ce projet comportait trois volets auxquels étaient associés un ou deux groupes de travail composés de personnes travaillant dans les établissements participants, d''experts et de partenaires de l''externe pour mener à bien les huit activités sur une période de trois ans.</p><p>Ce projet s''est décliné en trois volets, qui vont comme suit:</p><ul><li>Volet 1 : Favoriser la transition interordres (collèges-universités)</li><li>Volet 2 : Identifier, harmoniser et consolider les meilleures pratiques en appui à leurs études</li><li>Volet 3 : Développer le soutien pédagogique aux enseignants</li></ul><p>Lors de la mise en œuvre des trois volets, des outils ont été réalisés et sont disponibles pour tous.</p>'
,
    1
);


-- INDEXES --

CREATE INDEX idx_statut         ON projets(statut);
CREATE INDEX idx_idDepartement  ON employes(id_departement);
CREATE INDEX idx_idProjet       ON infos_projets(id_projet);

COMMIT;