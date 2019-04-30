CREATE TABLE usagers (
    id NUMBER GENERATED ALWAYS AS IDENTITY,
    nom_usager VARCHAR2(30),
    motDePasse VARCHAR2(60),
    
    CONSTRAINT pk_usagers PRIMARY KEY (id)
);