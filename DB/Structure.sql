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
    '<p><br/>Le Centre de recherche pour l''inclusion des personnes en situation de handicap (CRISPESH) est un centre coll�gial de transfert de technologie en pratiques sociales novatrices (CCTT-PSN), n� d''un partenariat entre le <a href="http://www.cvm.qc.ca/Pages/index.aspx" target="_blank">C�gep du Vieux Montr�al </a> et le <a href="http://www.dawsoncollege.qc.ca/french/" target="_blank">Coll�ge Dawson</a>. Le Centre a �t� reconnu en octobre 2010 par le <a href="http://www.education.gouv.qc.ca/" target="_blank">Minist�re de l''�ducation et de l''Enseignement Sup�rieur.</a></p><p>En juillet 2015, le c�gep du Vieux Montr�al et le coll�ge Dawson confiaient la gestion du CRISPESH � un organisme<br> � but non lucratif du m�me nom cr�� dans le but de r�aliser le mandat du Centre.</p>'
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
    'Roch Ducharme',
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
    'Enseignant au C�gep du Vieux Montr�al',
    'pturcotte@cvm.qc.ca',
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
            nom = '�tudiants (Assistants de recherche et stagiaires)'
    ),
    '�tudiante � l''universit� de Concordia',
    '�tudes des peuples autochtones et biologie'
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
            nom = '�tudiants (Assistants de recherche et stagiaires)'
    ),
    '�tudiante au Coll�ge Dawson',
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
            nom = 'Chercheuses et chercheurs affili�s'
    ),
    'Enseignante au Coll�ge Dawson',
    'Professeure associ�e � l''Universit� McGill D�partement de psychologie',
    'Codirectrice du R�seau de Recherche Adaptech (www.adaptech.org)'
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
            nom = 'Chercheuses et chercheurs affili�s'
    ),
    'Retrait�e du Coll�ge Dawson',
    'Coordonnatrice du AccessAbility Centre',
    'Chercheuse associ�e au R�seau de Recherche Adaptech'
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
            nom = 'Chercheuses et chercheurs affili�s'
    ),
    'Professeure Associ�e � l''Universit� McGill',
    'D�partement d''Educational and Counselling Psychology'
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
            nom = 'Chercheuses et chercheurs affili�s'
    ),
    'Professeure de formation pratique adjointe � l''Universit� de Montr�al',
    'D�partement de psychop�dagogie et d''andragogie'
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
    'Pr�sident',
    'Directeur g�n�ral du Coll�ge Dawson'
);

INSERT INTO employes (
    nom,
    id_departement,
    poste,
    info_sup1
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
    'Vice-pr�sidente',
    'Directrice g�n�rale au C�gep du Vieux Montr�al'
);

INSERT INTO employes (
    nom,
    id_departement,
    poste,
    info_sup1
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
    'Secr�taire et tr�sorier',
    'Directeur adjoint des �tudes au C�gep du Vieux Montr�al'
);

INSERT INTO projets (
    nom,
    contenu
) VALUES (
    'La photographie comme moyen d''expression, de participation sociale, d''autod�termination et d''inclusion des �tudiants en situation de handicap au coll�gial (2015-2016)'
,
    ' <p>Gr�ce � une subvention de l''Office des personnes handicap�es du Qu�bec (OPHQ) le CRISPESH favorise la participation sociale des �tudiants en situation de handicap du coll�gial. En utilisant la photographie comme moyen d''expression, les �tudiants qui participent au projet ont l''occasion de partager leurs perspectives sur leur exp�rience au sein de la communaut� coll�giale.</p><p>Les cadres autour desquels s''articule ce projet sont l''autod�termination et la photographie participative. En favorisant le d�veloppement de l''autod�termination, ce projet permet � chacun des participants d''�tre le principal agent d''am�lioration de sa qualit� de vie et d''avoir un impact positif sur son milieu d''�tudes. La photographie participative g�n�re quant � elle un pouvoir d''expression par l''image qui se fonde sur l''id�e que toute personne est la mieux plac�e pour communiquer son point de vue � une communaut�.</p><p>Divis� en deux volets distincts (Cr�ation et Sensibilisation), ce projet se d�roule tout au long de l''ann�e 2016. Le volet Cr�ation, qui a eu lieu durant la session d''hiver 2016, vise � ce que les �tudiants d�veloppent une perspective critique de leur propre exp�rience et qu''ils soient en mesure d''ext�rioriser un point de vue personnel en utilisant une d�marche de cr�ation. Le volet Sensibilisation, qui a lieu au cours de la session d''automne 2016, a pour objectif le partage du point de vue d�velopp�, afin de sensibiliser la communaut� coll�giale � la diversit� des exp�riences et des perspectives sur le handicap.</p><p>Tout au long de ce projet, les �tudiants sont accompagn�s par un photographe professionnel qui les soutient dans la d�marche de cr�ation et la r�alisation des aspects techniques de la production des images.  L''offre du support technique n�cessaire � la r�alisation de l''�uvre constitue une force de cette approche. Ce soutien technique r�duit consid�rablement le risque que le cr�ateur �choue suite � un trop grand �cart s�parant l''id�e initiale du r�sultat final. De cette fa�on, les �tudiants pourront s''exprimer librement tout en b�n�ficiant du large potentiel cr�atif de la photographie.</p>'
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
            nom = 'La photographie comme moyen d''expression, de participation sociale, d''autod�termination et d''inclusion des �tudiants en situation de handicap au coll�gial (2015-2016)'
    ),
    'Charg�e de projet',
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
            nom = 'La photographie comme moyen d''expression, de participation sociale, d''autod�termination et d''inclusion des �tudiants en situation de handicap au coll�gial (2015-2016)'
    ),
    'Coordonnatrice des activit�s',
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
            nom = 'La photographie comme moyen d''expression, de participation sociale, d''autod�termination et d''inclusion des �tudiants en situation de handicap au coll�gial (2015-2016)'
    ),
    'Coordonnateur des activit�s photographiques',
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
            nom = 'La photographie comme moyen d''expression, de participation sociale, d''autod�termination et d''inclusion des �tudiants en situation de handicap au coll�gial (2015-2016)'
    ),
    'Coordonnateur des activit�s photographiques',
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
            nom = 'La photographie comme moyen d''expression, de participation sociale, d''autod�termination et d''inclusion des �tudiants en situation de handicap au coll�gial (2015-2016)'
    ),
    'Partenaires',
    'Centre coll�gial de soutien � l''int�gration (CCSI) de l''Ouest<br>L''association qu�b�coise des �tudiants ayant des incapacit�s au postsecondaire (AQEIPS)'
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
            nom = 'La photographie comme moyen d''expression, de participation sociale, d''autod�termination et d''inclusion des �tudiants en situation de handicap au coll�gial (2015-2016)'
    ),
    'Partenaire financier',
    'Office des personnes handicap�es du Qu�bec'
);

INSERT INTO projets (
    nom,
    contenu
) VALUES (
    'Am�liorer les conditions de sommeil de l''enfant vivant avec un trouble du spectre de l''autisme gr�ce � un design r�fl�chi et personnalis� de sa chambre (2016-2017)'
,
    '<p>La F�d�ration qu�b�coise de l''autisme estime la pr�valence du trouble du spectre de l''autisme (TSA) � pr�s de 1% de la population canadienne, mais des recherches d�montrent que cette donn�e sous-�value le nombre r�el d''individus touch�s par ce trouble. Les probl�mes de sommeil sont fr�quents chez les enfants qui ont un TSA. Les raisons de ces probl�mes de sommeil sont vari�es et peuvent �tre, par exemple, d''ordre physiologique, cognitif, sensoriel ou une combinaison de facteurs. Quelles qu''en soient les causes, le manque de sommeil aura in�vitablement des cons�quences sur la qualit� de vie de l''enfant et de sa famille. Bien que l''am�nagement de la chambre figure au premier rang des solutions que les parents peuvent apporter, la chambre des enfants ayant un TSA demeure un lieu bien peu �tudi� en design d''int�rieur. De plus, il est d�montr� que le TSA se manifeste par des r�actions inhabituelles � des exp�riences sensorielles. En effet, les personnes touch�es par le TSA ont souvent de la difficult� � traiter et � r�pondre aux diff�rents stimuli sensoriels, tels que l''ou�e, la vue et le toucher. Elles peuvent �tre hypo ou hypersensibles. Plusieurs chercheurs sugg�rent que l''hypersensibilit� peut provoquer des r�actions sensorielles � l''origine des difficult�s de sommeil. Pourtant, bien que le risque que le sommeil soit perturb� pour des raisons sensorielles chez les enfants ayant un TSA soit particuli�rement �lev�, cette composante est peu document�e. Ce projet propose de s''int�resser � l''am�nagement de la chambre de l''enfant de 2 � 12 ans ayant un TSA en se basant sur les perceptions sensorielles de celui-ci. Pour ce faire, le projet fera le pont entre les �tudes sur l''am�nagement d''environnements conviviaux pour les personnes ayant un TSA et transf�rera ces connaissances vers l''am�nagement de la chambre.</p><p>L''objectif g�n�ral de ce projet est de d�velopper un cadre g�n�ral, adaptable aux besoins individuels, d''am�nagement de chambre pour enfants  de 2 � 12 ans vivant avec un TSA, qui se base sur les perceptions sensorielles. Les objectifs particuliers sont : 1) consolider et r�pertorier les connaissances sur les besoins sensoriels des enfants vivant avec un TSA (ex : toucher, sentir, go�ter, voir, entendre, mouvement); 2) �tablir les param�tres � prendre en consid�ration pour un design r�fl�chi et personnalis�; 3) proposer un ensemble flexible de directives qui puisse guider vers une r�ponse personnalis�e et bas�e sur les profils de perception sensorielle (hypo/hypersensibilit�).</p><p>Gr�ce � la r�alisation de ce projet, le CRISPESH pourra consolider ses connaissances et d�velopper un cr�neau d''expertise peu �tudi�. Les programmes de Techniques de design d''int�rieur du C�gep du Vieux Montr�al et du Coll�ge Dawson pourront b�n�ficier de nouveaux apprentissages visant � concevoir des am�nagements r�fl�chis et personnalis�s. Cela permettra au CRISPESH et � ses deux coll�ges affili�s de d�velopper davantage leur capacit� de recherche. L''originalit� et la pertinence de ce projet r�sident dans une consolidation de connaissances qui n''ont jamais �t� regroup�es � cette fin, mais aussi dans la prise en compte de l''exp�rience des personnes et des milieux concern�s. Aucun effort n''a �t� d�ploy� auparavant pour r�unir toutes ces connaissances en vue d''apporter du soutien dans ce grand d�fi qui peut para�tre banal pour toute personne qui n''est pas famili�re avec le sujet. Les ergoth�rapeutes peuvent certes aider dans cette entreprise et les informations obtenues gr�ce � l''�valuation sensorielle des enfants sont �galement utiles, mais aucun cadre de r�f�rence d''am�nagement de la chambre de l''enfant ayant un trouble du spectre de l''autisme n''existe � l''heure actuelle. De fa�on g�n�rale, ce projet pourra am�liorer la qualit� de vie de plusieurs enfants et de leurs familles en contribuant � satisfaire ce besoin vital qu''est le sommeil.</p>'
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
            nom = 'Am�liorer les conditions de sommeil de l''enfant vivant avec un trouble du spectre de l''autisme gr�ce � un design r�fl�chi et personnalis� de sa chambre (2016-2017)'
    ),
    'Charg�e de projet et chercheuse',
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
            nom = 'Am�liorer les conditions de sommeil de l''enfant vivant avec un trouble du spectre de l''autisme gr�ce � un design r�fl�chi et personnalis� de sa chambre (2016-2017)'
    ),
    'Professionnelle de recherche et coordonnatrice des activit�s',
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
            nom = 'Am�liorer les conditions de sommeil de l''enfant vivant avec un trouble du spectre de l''autisme gr�ce � un design r�fl�chi et personnalis� de sa chambre (2016-2017)'
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
            nom = 'Am�liorer les conditions de sommeil de l''enfant vivant avec un trouble du spectre de l''autisme gr�ce � un design r�fl�chi et personnalis� de sa chambre (2016-2017)'
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
            nom = 'Am�liorer les conditions de sommeil de l''enfant vivant avec un trouble du spectre de l''autisme gr�ce � un design r�fl�chi et personnalis� de sa chambre (2016-2017)'
    ),
    'Assistantes de recherche',
    'Charlotte Leroux<p>�tudiante en Techniques de design d''int�rieur au C�gep du Vieux Montr�al</p>Tess Perron-Laurin<p>�tudiante en Techniques de design d''int�rieur au C�gep du Vieux Montr�al</p>'
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
            nom = 'Am�liorer les conditions de sommeil de l''enfant vivant avec un trouble du spectre de l''autisme gr�ce � un design r�fl�chi et personnalis� de sa chambre (2016-2017)'
    ),
    'Organisme subventionnaire',
    'Minist�re de l''�ducation et de l''enseignement sup�rieur'
);

INSERT INTO projets (
    nom,
    contenu
) VALUES (
    'Soutien � l''int�gration des �tudiants en situation de handicap: d�veloppement d''un instrument d''�valuation des besoins de l''apprenant (2015-2017)'
,
    '<p>L''objectif de ce projet est de d�velopper un instrument d''�valuation � l''intention des intervenants des services adapt�s pour soutenir les �tudiants en situation de handicap dans leur r�ussite �ducative. Le nombre d''�tudiants en situation de handicap (ESH) au coll�gial s''est accru de mani�re remarquable au cours de la derni�re d�cennie et leur profil s''est largement transform�. Les coll�ges disposent de services adapt�s (SA) qui ont pour mandat l''accompagnement des ESH vers la r�ussite �ducative. Ces SA ont d�montr�, depuis leur implantation, qu''ils favorisent la r�ussite des ESH qui les utilisent. Or, l''accompagnement des ESH se complexifie. Le constat actuel sur les pratiques d''accompagnement bas�es sur le mod�le m�dical qui pr�vaut au sein des SA des coll�ges permet de conclure que ces pratiques ne sont pas � la hauteur des d�fis d''aujourd''hui. Le manque d''outils d''�valuation et de suivi des ESH est �tabli et met en �vidence la limite actuelle des pratiques en accompagnement vers la r�ussite des ESH. Ce projet permettra, � terme, de d�passer cette limite.</p><p>Au  terme de ce projet, nous d�velopperons un instrument d''�valuation du profil d''apprenant des ESH en milieu coll�gial qui, en plus de g�n�rer un profil personnalis�, proposera diverses ressources (humaines et mat�rielles) encourageant la r�ussite �ducative des ESH. De plus, cet outil de travail permettra le d�veloppement de comportements d''autod�termination chez les ESH, ce qui favorisa �galement leur r�ussite �ducative. En plus d''offrir des r�ponses aux besoins des ESH de mani�re plus pointue et syst�matique, cet outil servira aux conseillers en services adapt�s de tous les �tablissements de niveau coll�gial (priv�s et publics) de la province et favorisera une harmonisation des pratiques en la mati�re.</p><p>La r�ussite �ducative des �tudiants est au c�ur de la mission et des pr�occupations de tous les �tablissements de niveau coll�gial de la province. Ce projet rev�t une importance capitale pour le partenaire (CCSI), les coll�ges du Qu�bec et leurs diff�rents acteurs (personnel de direction, conseillers en services adapt�s, aides p�dagogiques individuels, enseignants, ESH), mais aussi la soci�t� dans son ensemble. En effet, une plus grande r�ussite �ducative des ESH est un facteur d�terminant d''une meilleure int�gration future au march� de l''emploi et, ainsi, � la pleine valorisation et participation des ESH au sein de la soci�t�.</p>'
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
            nom = 'Soutien � l''int�gration des �tudiants en situation de handicap: d�veloppement d''un instrument d''�valuation des besoins de l''apprenant (2015-2017)'
    ),
    'Charg�e de projet et chercheuse',
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
            nom = 'Soutien � l''int�gration des �tudiants en situation de handicap: d�veloppement d''un instrument d''�valuation des besoins de l''apprenant (2015-2017)'
    ),
    'Professionnelle de recherche',
    'Dani�le Paquet'
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
            nom = 'Soutien � l''int�gration des �tudiants en situation de handicap: d�veloppement d''un instrument d''�valuation des besoins de l''apprenant (2015-2017)'
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
            nom = 'Soutien � l''int�gration des �tudiants en situation de handicap: d�veloppement d''un instrument d''�valuation des besoins de l''apprenant (2015-2017)'
    ),
    'Chercheuse associ�e',
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
            nom = 'Soutien � l''int�gration des �tudiants en situation de handicap: d�veloppement d''un instrument d''�valuation des besoins de l''apprenant (2015-2017)'
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
            nom = 'Soutien � l''int�gration des �tudiants en situation de handicap: d�veloppement d''un instrument d''�valuation des besoins de l''apprenant (2015-2017)'
    ),
    'Assistantes de recherche',
    'M�lissa Miller<p>�tudiante en Histoire et civilisation au C�gep du Vieux Montr�al</p>Odile Trudeau-Richard<p>�tudiante en Histoire et civilisation au C�gep du Vieux Montr�al</p>'
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
            nom = 'Soutien � l''int�gration des �tudiants en situation de handicap: d�veloppement d''un instrument d''�valuation des besoins de l''apprenant (2015-2017)'
    ),
    'Organisme partenaire',
    'Centre coll�gial de soutien � l''int�gration (CCSI)'
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
            nom = 'Soutien � l''int�gration des �tudiants en situation de handicap: d�veloppement d''un instrument d''�valuation des besoins de l''apprenant (2015-2017)'
    ),
    'Organisme subventionnaire',
    'Minist�re de l''�ducation et de l''enseignement sup�rieur'
);

INSERT INTO projets (
    nom,
    contenu
) VALUES (
    'D�veloppement d''un mod�le d''incubateur d''entreprises inclusif destin� aux Autochtones (2016-2018)',
    '<p>Les in�galit�s salariales et d''acc�s � l''emploi persistent entre les Autochtones et le reste de la population canadienne. Par ailleurs, les membres des Premi�res Nations qui se retrouvent en situation de handicap (troubles de sant� mentale, handicap physique, sensoriel ou moteur, trouble ou difficult� d''apprentissage, etc.) peuvent facilement �tre sujets � une double discrimination sur le march� de l''emploi, de par leur appartenance culturelle et leurs besoins particuliers. Ces facteurs freinent leur �panouissement professionnel et emp�chent le march� du travail de b�n�ficier de travailleurs qualifi�s qui pourraient contribuer au maintien d''une �conomie locale prosp�re.</p<p>L''entrepreneuriat repr�sente une voie qui peut faciliter l''inclusion sociale et �conomique de personnes marginalis�es en misant sur leurs int�r�ts et leurs comp�tences. Cette avenue est flexible, facilement adaptable aux besoins particuliers des individus qui s''y engagent et respectueuse des conceptions sociales et culturelles sp�cifiques de l''�conomie locale. Toutefois, du soutien et de l''accompagnement sont essentiels afin de rendre cette voie possible et durable. En ce sens, l''incubateur d''entreprises est une structure d''accompagnement adapt�e qui offre diff�rents services afin de faciliter le passage de l''id�e � la mise en place d''un projet d''entreprise.</p><p>Ce projet permettra de d�velopper un mod�le d''incubateur d''entreprises inclusif qui r�pondrait aux besoins et aux aspirations des membres des Premi�res Nations du Qu�bec. Celui-ci sera inclusif puisqu''il sera adapt� d''embl�e pour les personnes en situation de handicap.</p>'
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
            nom = 'D�veloppement d''un mod�le d''incubateur d''entreprises inclusif destin� aux Autochtones (2016-2018)'
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
            nom = 'D�veloppement d''un mod�le d''incubateur d''entreprises inclusif destin� aux Autochtones (2016-2018)'
    ),
    'Coordonnatrice de projet et Assistante de recherche',
    'L�a Lefevre-Radelli'
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
            nom = 'D�veloppement d''un mod�le d''incubateur d''entreprises inclusif destin� aux Autochtones (2016-2018)'
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
            nom = 'D�veloppement d''un mod�le d''incubateur d''entreprises inclusif destin� aux Autochtones (2016-2018)'
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
            nom = 'D�veloppement d''un mod�le d''incubateur d''entreprises inclusif destin� aux Autochtones (2016-2018)'
    ),
    'Organismes partenaires',
    'Conseil scolaire des Premi�res Nations en �ducation aux adultes (CSPNEA)<br>Commission de d�veloppement des ressources humaines des Premi�res Nations du Qu�bec (CDRHPNQ)<br>Commission de d�veloppement �conomique des Premi�res Nations du Qu�bec et du Labrador (CDEPNQL)<br>Tewatonhnhi''saktha<br>Fondation Martin<br>C�gep du Vieux Montr�al<br>Coll�ge Dawson'
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
            nom = 'D�veloppement d''un mod�le d''incubateur d''entreprises inclusif destin� aux Autochtones (2016-2018)'
    ),
    'Organisme subventionnaire',
    'Conseil de recherches en sciences humaines du Canada (CRSH)'
);

INSERT INTO projets (
    nom,
    contenu
) VALUES (
    'Soutenir l''employeur dans l''inclusion professionnelle des personnes vivant avec une d�ficience intellectuelle ou un trouble du spectre de l''autisme (2016-2017)'
,
    '<p>Le Centre int�gr� de sant� et de services sociaux de la Mont�r�gie-Ouest (CISSSMO) offre des services d''adaptation, de r�adaptation et d''int�gration sociale aux personnes qui vivent avec une d�ficience intellectuelle (DI) ou un trouble du spectre de l''autisme (TSA). Pour ce faire, il leur fournit une gamme de services de soutien et d''accompagnement. Dans un souci d''offrir des services bas�s sur des donn�es probantes et de faciliter l''implantation de meilleures pratiques, le CISSSMO a remis � jour son programme d''int�gration et de r�adaptation au travail. Afin de permettre � ses usagers de vivre une int�gration au travail positive et valorisante, le CISSSMO constate que le soutien � l''employeur est primordial. Toutefois, la force de son expertise r�side davantage dans l''identification des besoins et le soutien des personnes vivant avec une DI ou un TSA. Pour rem�dier � la situation, le CISSSMO b�n�ficiera de l''expertise du Centre de recherche pour l''inclusion scolaire et professionnelle des �tudiants en situation de handicap (CRISPESH) afin de mieux r�pondre aux besoins des employeurs avec lesquels il collabore. Cela facilitera la mise en place d''environnements de travail inclusifs o� les contextes qui mettraient leurs usagers en situation de handicap seraient r�duits. L''obligation l�gale d''�galit� � l''emploi au Qu�bec se fonde sur le constat d''une discrimination syst�mique � l''endroit de certaines personnes, dont les personnes en situation de handicap (PSH). Plusieurs employeurs croient que celles-ci sont moins productives, ce qui engendre des pratiques discriminatoires. Pour contrer cette tendance, le monde de la gestion s''est donn� un cadre d''op�ration vers un engagement planifi� et syst�matique � recruter et maintenir en emploi des personnes ayant des profils (exp�riences, habilet�s, etc.) diversifi�s. Sous la banni�re du concept de � gestion de la diversit� �, ce cadre vise l''�quit� et l''�galit� des chances dans le monde du travail. Il s''agit de valoriser et reconna�tre les diff�rences individuelles en partant du postulat que chaque personne a le potentiel de contribuer � la performance d''une entreprise. Toutefois, ce cadre ne s''est pas encore g�n�ralis� dans les pratiques et au Qu�bec, il comprend rarement les PSH.</p><p>Dans le cadre de ce projet, le CRISPESH et le CISSSMO uniront leurs efforts et leurs expertises pour d�velopper des strat�gies visant � favoriser la mise en place de pratiques de gestion de la diversit� inclusive pour les PSH. En s''inspirant du concept d''inclusion, tel que d�fini en �ducation, et du domaine de la gestion de la diversit�, ce projet a pour objectif g�n�ral le d�veloppement de bonnes pratiques de pr�paration et de soutien aux employeurs vers une gestion plus inclusive des personnes vivant avec une DI ou un TSA dans les milieux de travail. Les objectifs particuliers visent � �largir et � consolider les connaissances en mati�re de gestion de la diversit�, de leadership d''inclusion et de changements de pratiques de gestion, en portant une attention particuli�re au handicap. Aussi, les chercheurs documenteront le point de vue de l''employeur sur les pratiques d''inclusion et d''int�gration des personnes vivant avec une DI ou un TSA. Ce projet est novateur, puisqu''il compte d�velopper un cadre de gestion de la diversit� au Qu�bec qui s''int�resse sp�cifiquement au handicap.</p><p>De fa�on g�n�rale, ce projet favorisera l''augmentation de la participation sociale des PSH gr�ce � une plus grande inclusion dans le monde professionnel. Il permettra au CISSSMO de mieux soutenir les employeurs avec lesquels il collabore, en plus de faciliter l''int�gration des usagers. Les coll�ges et le CRISPESH innoveront et renforceront leur capacit� de recherche et de transfert des connaissances gr�ce � une nouvelle expertise.</p>'
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
            nom = 'Soutenir l''employeur dans l''inclusion professionnelle des personnes vivant avec une d�ficience intellectuelle ou un trouble du spectre de l''autisme (2016-2017)'
    ),
    'Charg�e de projet et chercheuse',
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
            nom = 'Soutenir l''employeur dans l''inclusion professionnelle des personnes vivant avec une d�ficience intellectuelle ou un trouble du spectre de l''autisme (2016-2017)'
    ),
    'Chercheur',
    'Jean-S�bastien Goulet'
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
            nom = 'Soutenir l''employeur dans l''inclusion professionnelle des personnes vivant avec une d�ficience intellectuelle ou un trouble du spectre de l''autisme (2016-2017)'
    ),
    'Assistante de recherche',
    'Aur�lie Angrignon Atkins<p>�tudiante en Techniques de gestion de commerces au C�gep du Vieux Montr�al</p>'
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
            nom = 'Soutenir l''employeur dans l''inclusion professionnelle des personnes vivant avec une d�ficience intellectuelle ou un trouble du spectre de l''autisme (2016-2017)'
    ),
    'Partenaire',
    'Centre int�gr� de sant� et de services sociaux de la Mont�r�gie-Ouest (CISSSMO)'
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
            nom = 'Soutenir l''employeur dans l''inclusion professionnelle des personnes vivant avec une d�ficience intellectuelle ou un trouble du spectre de l''autisme (2016-2017)'
    ),
    'Organisme subventionnaire',
    'Minist�re de l''�ducation et de l''enseignement sup�rieur'
);

INSERT INTO projets (
    nom,
    contenu,
    statut
) VALUES (
    'Conception d''un v�tement de compression adapt� pour des adolescents et de jeunes adultes vivant avec un trouble du spectre de l''autisme (2015-2016)'
,
    '<p>Dans le cadre du Programme d''aide � la recherche et au transfert (PART), Vestechpro et le CRISPESH se sont associ�es � une entreprise qu�b�coise pour concevoir un v�tement de compression adapt� pour les adolescents et les jeunes adultes atteints d''un trouble du spectre de l''autisme. En effet, les v�tements disponibles � l''heure actuelle ne r�pondent pas aux besoins de cette client�le. Les clients trouvent que ces v�tements sont volumineux, co�tent cher, ne sont pas totalement confortables et sont rarement ajustables au besoin de chacun en mati�re de pression ou compression. De plus, les produits disponibles visent surtout les jeunes enfants et permettent souvent d''identifier les personnes les portant comme �tant diff�rentes en raison de leur style particulier.</p><p>Ainsi, l''objectif principal de ce projet �tait la conception d''un v�tement adapt� pour les adolescents et les jeunes adultes atteints d''un trouble du spectre de l''autisme.</p>'
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
            nom = 'Conception d''un v�tement de compression adapt� pour des adolescents et de jeunes adultes vivant avec un trouble du spectre de l''autisme (2015-2016)'
    ),
    'Charg�e de projet et chercheuse',
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
            nom = 'Conception d''un v�tement de compression adapt� pour des adolescents et de jeunes adultes vivant avec un trouble du spectre de l''autisme (2015-2016)'
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
            nom = 'Conception d''un v�tement de compression adapt� pour des adolescents et de jeunes adultes vivant avec un trouble du spectre de l''autisme (2015-2016)'
    ),
    'Assistantes de recherche',
    'M�lissa Miller<p>�tudiante en Histoire et civilisation au C�gep du Vieux Montr�al</p>Odile Trudeau-Richard<p>�tudiante en Histoire et civilisation au C�gep du Vieux Montr�al</p>'
);

INSERT INTO projets (
    nom,
    contenu,
    statut
) VALUES (
    'Consortium de recherche sur la gestion de la diversit� en emploi (2014-2015)',
    '<p>Ce projet a regroup� trois centres coll�giaux de transfert de technologie en pratiques sociales novatrices (CCTT-PSN) en vue de promouvoir et de favoriser l''inclusion professionnelle des jeunes �g�s entre 25 et 34 ans de divers horizons, dont les immigrants et les personnes en situation de handicap. Le CRISPESH, le Centre d''�tudes des conditions de vie et des besoins de la population (�COBES) et l''Institut de recherche sur l''int�gration professionnelle des immigrants (IRIPI) ont uni leurs expertises dans le cadre de cette alliance strat�gique qui, � terme, a propos� une offre de service visant � am�liorer le taux d''emploi de cette population et � r�pondre aux besoins de main-d''�uvre des entreprises qu�b�coises.</p>'
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
            nom = 'Consortium de recherche sur la gestion de la diversit� en emploi (2014-2015)'
    ),
    'Chercheuse',
    'Marise Lachapelle'
);

INSERT INTO projets (
    nom,
    contenu,
    statut
) VALUES (
    'Formation par simulation en sant� mentale (2015-2016)',
    '<p>Gr�ce � une subvention du Minist�re de l''�conomie et des Importations du Qu�bec, le CRISPESH a d�velopp� un mod�le de formation par simulation en sant� mentale offert sur support multim�dia pour les intervenants d''une ressource communautaire �uvrant en r�gion �loign�e au sein d''une communaut� inuit.</p>'
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
            nom = 'Formation par simulation en sant� mentale (2015-2016)'
    ),
    'Charg�es de projet',
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
            nom = 'Formation par simulation en sant� mentale (2015-2016)'
    ),
    'Charg�e de projet et Chercheuse',
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
            nom = 'Formation par simulation en sant� mentale (2015-2016)'
    ),
    'Stagiaires',
    '<p>�tudiante au C�gep du Vieux Montr�al</p><p>Arts, lettres et communication, profil M�dias</p>Xavier Boss�<p>�tudiant au C�gep du Vieux Montr�al</p><p>Arts, lettres et communication, profil M�dias</p>Camille Archambault<p>�tudiante au C�gep du Vieux Montr�al</p><p>Arts, lettres et communication, profil M�dias</p>'
);

INSERT INTO projets (
    nom,
    contenu,
    statut
) VALUES (
    'L''am�lioration du fran�ais �crit des adultes ayant un trouble d''apprentissage, soutenus par les aides technologiques (2012-2014)'
,
    '<p>La probl�matique � l''origine de cette recherche est li�e � la croissance de l''utilisation des aides technologiques pour am�liorer la qualit� du fran�ais �crit des adultes ayant un trouble d''apprentissage. L''omnipr�sence de l''�criture dans notre soci�t� actuelle justifie d''ailleurs cet int�r�t marqu�. Le probl�me, par contre, est que cette utilisation est peu document�e et peu �valu�e. De plus, jusqu''� ce jour, aucune recherche n''a �valu� l''effet de l''accompagnement dans l''utilisation des aides technologiques dans une perspective d''am�lioration de l''�criture.</p><p>Donc, pr�sentement, on offre diff�rents services et fonctions d''aide de logiciels sans vraiment conna�tre l''impact r�el des technologies sur le processus d''�criture ou m�me sur la qualit� du fran�ais �crit. C''est pour pallier cette situation que, dans le cadre de cette recherche, un devis � cas unique, pour cinq sujets, a �t� retenu afin de permettre l''�valuation � la fois de l''effet de l''utilisation de certaines fonctions d''aide � l''�criture (�dition de texte, dictionnaires, r�vision-correction et r�troaction vocale) et l''effet de l''accompagnement. La volont� d''�laborer un guide d''accompagnement dans l''utilisation des aides technologiques aupr�s des adultes ayant un trouble d''apprentissage soutenait �galement ce choix.</p><p>Les sujets ont donc �t� accompagn�s dans leur processus d''�criture avec aides technologiques pendant 15 semaines � raison d''une fois par semaine. Tout au long de l''exp�rimentation, ceux-ci ont d� produire une r�daction hebdomadaire, ce qui nous a permis d''obtenir des donn�es. L''analyse des r�sultats a permis de tirer un certain nombre de recommandations permettant de moduler l''accompagnement dans les aides technologiques afin  qu''il soit plus efficace. Ainsi, il est permis de recommander l''utilisation des fonctions �dition de texte et R�vision-correction � tout adulte ayant un trouble d''apprentissage � la condition essentielle qu''y soit associ� un accompagnement sur la technique du logiciel ainsi que sur le d�veloppement de strat�gies d''�criture int�grant les diff�rentes fonctions d''aide. En contrepartie, la prudence est de mise  en ce qui concerne l''utilisation des fonctions Dictionnaires et R�troaction vocale puisque la recherche a aussi mis en lumi�re l''efficacit� moins constante de ces outils. Il devient donc n�cessaire de s''assurer que l''utilisateur r�pond bien � cette mesure d''aide et qu''il y a effectivement une am�lioration de la qualit� de son fran�ais �crit avant de lui en permettre une utilisation autonome. L''encadrement est essentiel. Le transfert de ces r�sultats au partenaire, l''Institut des troubles d''apprentissage (ITA), s''est fait et se poursuivra par une collaboration entre les personnes ressources de l''organisme et les chercheurs. En dernier lieu, il appara�t important de poursuivre la recherche dans ce domaine encore peu explor� puisqu''un trop grand d�calage subsiste entre la progression de la demande d''utilisation des aides technologiques et le d�veloppement des connaissances sur le sujet.</p><p>Gr�ce � une subvention du Minist�re de l''�conomie et des Importations du Qu�bec, le CRISPESH a d�velopp� un mod�le de formation par simulation en sant� mentale offert sur support multim�dia pour les intervenants d''une ressource communautaire �uvrant en r�gion �loign�e au sein d''une communaut� inuit.</p>'
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
            nom = 'L''am�lioration du fran�ais �crit des adultes ayant un trouble d''apprentissage, soutenus par les aides technologiques (2012-2014)'
    ),
    'Chercheuse',
    'Evelyne Pitre Enseignante au C�gep du Vieux Montr�al<p>D�partement de fran�ais</p>'
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
            nom = 'L''am�lioration du fran�ais �crit des adultes ayant un trouble d''apprentissage, soutenus par les aides technologiques (2012-2014)'
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
            nom = 'L''am�lioration du fran�ais �crit des adultes ayant un trouble d''apprentissage, soutenus par les aides technologiques (2012-2014)'
    ),
    'Assistants de recherche',
    '<p>Alexandra Cloutier</p><p>Mathieu Lauzon-Dicso</p><p>Camille Raunet</p>'
);



INSERT INTO projets (
    nom,
    contenu,
    statut
) VALUES (
    'Les applications p�dagogiques de la conception universelle de l''apprentissage (2013-2015)',
    '<p>Ce projet a conduit � l''�laboration de strat�gies p�dagogiques con�ues selon les principes de la conception universelle de l''apprentissage (CUA). L''objectif �tait de soutenir les enseignants dans la planification de cours qui r�pondent � la fois aux besoins des �tudiants en situation de handicap et � ceux de l''ensemble des �tudiants de la classe. Ce projet s''inscrivait dans une perspective proactive en proposant des solutions p�dagogiques ax�es sur la planification plut�t que sur des r�ponses r�troactives � des besoins individuels.</p><p>Gr�ce � ce projet interordres, cinq �tablissements postsecondaires ont travaill� de concert: l''Universit� de Montr�al, l''Universit� du Qu�bec � Montr�al (UQAM), le Coll�ge Montmorency, le C�gep Marie-Victorin et le C�gep du Vieux Montr�al.</p>'
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
            nom = 'Les applications p�dagogiques de la conception universelle de l''apprentissage (2013-2015)'
    ),
    'Coordination',
    'St�phanie Tremblay<p>Charg�e de projet, d''octobre 2013 � novembre 2014</p>Paul Turcotte<p>Charg� de projet, de novembre 2014 jusqu''� la fin du projet</p>Florence Lebeau<p>Charg�e de projet, de novembre 2014 � juin 2015</p>'
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
            nom = 'Les applications p�dagogiques de la conception universelle de l''apprentissage (2013-2015)'
    ),
    'Comit� de direction',
    'Marie Blain<p>Directrice adjointe aux �tudes, C�gep Marie-Victorin</p>Yves Carignan<p>Directeur des affaires �tudiantes et relations avec la communaut�, Coll�ge Montmorency, 2013-2014</p>Nathalie Gigu�re<p>Directrice des �tudes, C�gep du Vieux Montr�al, 2014-2015</p>Thomas Henderson<p>Directeur du Centre de recherche pour l''inclusion scolaire et professionnelle des �tudiants en situation de handicap (CRISPESH), 2013-2014</p>Carole Lavall�e<p>Directrice adjointe des �tudes, C�gep du Vieux Montr�al, 2013</p>Catherine Loiselle<p>Directrice g�n�rale du Centre de recherche pour l''inclusion scolaire et professionnelle des �tudiants en situation de handicap (CRISPESH), 2014-2015</p>Dolores Otero<p>Directrice, Services � la vie �tudiante � Centre des services d''accueil et de soutien socio�conomique, Universit� du Qu�bec � Montr�al</p>H�l�ne Trifiro<p>Directrice du Centre �tudiant du soutien � la r�ussite, Universit� de Montr�al</p>'
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
            nom = 'Les applications p�dagogiques de la conception universelle de l''apprentissage (2013-2015)'
    ),
    'Comit� de travail',
    'Brigitte Auclair<p>Enseignante  de fran�ais, Coll�ge Montmorency </p>V�ronique Besan�on<p>Conseill�re  p�dagogique, Universit� de Montr�al </p>Jean-Ren� Corbeil<p>Enseignant en Technologies de l''architecture, Coll�ge Montmorency</p>Antoine Coulombe<p>Enseignant en Techniques de travail social, C�gep Marie-Victorin</p>Johanne Morin<p>Enseignante en Techniques de travail social, C�gep Marie-Victorin </p>C�dric Lamathe<p>Enseignant de math�matiques, C�gep du Vieux Montr�al</p>Florence Lebeau<p>Charg�e  de cours � la Facult� de l''Am�nagement, Universit� de Montr�al </p>Paul Turcotte<p>Enseignant de philosophie, C�gep du Vieux Montr�al</p>Steve Vezeau<p>Enseignant � l''�cole de design, Universit� du Qu�bec � Montr�al</p>	'
);

INSERT INTO projets (
    nom,
    contenu,
    statut
) VALUES (
    'Int�grer les nouvelles populations �tudiantes en situation de handicap aux �tudes sup�rieures : mission possible (2011-2013)',
    '<p>Ce projet a permis l''�laboration d''un mod�le d''int�gration pour les populations dites �mergentes que nous convenons d''appeler dor�navant les nouvelles populations en situation de handicap. Par le d�veloppement d''outils g�n�raux pour les �tudiants, les intervenants, les enseignants et les �tablissements, ce projet a r�uni les efforts de quatre �tablissements d''�tudes postsecondaires: l''Universit� de Montr�al, l''Universit� du Qu�bec � Montr�al (UQAM), le Coll�ge Montmorency et le C�gep du Vieux Montr�al.</p><p>Ainsi, dans le cadre du r�investissement en enseignement sup�rieur par le Minist�re de l''�ducation, du Loisir et du Sport (MELS, maintenant MEES), une �quipe a travaill� � la mise en �uvre d''un projet intitul� : Int�grer les populations dites �mergentes aux �tudes sup�rieures: mission possible!</p><p>Les populations vis�es par ce projet sont les �tudiants ayant des troubles d''apprentissage (TA), des troubles envahissants du d�veloppement (TED), des troubles d�ficitaires de l''attention (TDA/H) et des troubles graves de sant� mentale (TGSM). Ce projet comportait trois volets auxquels �taient associ�s un ou deux groupes de travail compos�s de personnes travaillant dans les �tablissements participants, d''experts et de partenaires de l''externe pour mener � bien les huit activit�s sur une p�riode de trois ans.</p><p>Ce projet s''est d�clin� en trois volets, qui vont comme suit:</p><ul><li>Volet 1 : Favoriser la transition interordres (coll�ges-universit�s)</li><li>Volet 2 : Identifier, harmoniser et consolider les meilleures pratiques en appui � leurs �tudes</li><li>Volet 3 : D�velopper le soutien p�dagogique aux enseignants</li></ul><p>Lors de la mise en �uvre des trois volets, des outils ont �t� r�alis�s et sont disponibles pour tous.</p>'
,
    1
);


-- INDEXES --

CREATE INDEX idx_statut         ON projets(statut);
CREATE INDEX idx_idDepartement  ON employes(id_departement);
CREATE INDEX idx_idProjet       ON infos_projets(id_projet);

COMMIT;