CREATE TABLE JOUEUR (
    id_joueur INT,
    nom_joueur VARCHAR(80) NOT NULL,
    date_naissance DATE NOT NULL,
    nationalite VARCHAR(40) NOT NULL,
    poste VARCHAR(30) NOT NULL,
    valeur_marchande DECIMAL(12,2),
    PRIMARY KEY (id_joueur)
);

CREATE TABLE CLUB (
    id_club INT,
    nom_club VARCHAR(80) NOT NULL,
    ville_club VARCHAR(50) NOT NULL,
    pays_club VARCHAR(40) NOT NULL,
    PRIMARY KEY (id_club)
);

CREATE TABLE SAISON (
    id_saison INT,
    nom_saison VARCHAR(9) NOT NULL,
    date_debut_saison DATE NOT NULL,
    date_fin_saison DATE NOT NULL,
    PRIMARY KEY (id_saison)
);

CREATE TABLE STADE (
    id_stade INT,
    nom_stade VARCHAR(80) NOT NULL,
    ville_stade VARCHAR(50) NOT NULL,
    capacite INT NOT NULL,
    PRIMARY KEY (id_stade)
);

CREATE TABLE EQUIPE (
    id_equipe INT,
    categorie_niveau VARCHAR(15) NOT NULL,
    id_club INT NOT NULL,
    PRIMARY KEY (id_equipe),
    FOREIGN KEY (id_club) REFERENCES CLUB(id_club)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE COMPETITION (
    id_identifiant INT,
    nom_competition VARCHAR(60) NOT NULL,
    type_competition VARCHAR(20) NOT NULL,
    id_saison INT NOT NULL,
    PRIMARY KEY (id_identifiant),
    FOREIGN KEY (id_saison) REFERENCES SAISON(id_saison)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE PARTIE (
    id_match INT,
    date_heure_coup_envoi DATETIME NOT NULL,
    score_eq_domicile INT,
    score_eq_exterieur INT,
    phase_competition VARCHAR(30),
    id_identifiant INT NOT NULL,
    id_stade INT NOT NULL,
    PRIMARY KEY (id_match),
    FOREIGN KEY (id_identifiant) REFERENCES COMPETITION(id_identifiant)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (id_stade) REFERENCES STADE(id_stade)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE CONTRAT (
    id_contrat INT,
    date_debut_contrat DATE NOT NULL,
    date_fin_contrat DATE NOT NULL,
    statut_contrat VARCHAR(20) NOT NULL,
    id_joueur INT NOT NULL,
    PRIMARY KEY (id_contrat),
    FOREIGN KEY (id_joueur) REFERENCES JOUEUR(id_joueur)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE COMPOSE (
    id_joueur INT NOT NULL,
    id_equipe INT NOT NULL,
    id_match INT NOT NULL,
    statut_joueur_match VARCHAR(20) NOT NULL,
    tactique VARCHAR(10),
    PRIMARY KEY (id_joueur, id_equipe, id_match),
    FOREIGN KEY (id_joueur) REFERENCES JOUEUR(id_joueur)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (id_equipe) REFERENCES EQUIPE(id_equipe)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (id_match) REFERENCES PARTIE(id_match)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
