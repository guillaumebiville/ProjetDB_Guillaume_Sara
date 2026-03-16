ALTER TABLE JOUEUR
ADD CONSTRAINT ck_valeur_marchande
CHECK (valeur_marchande >= 0);

ALTER TABLE STADE
ADD CONSTRAINT ck_capacite
CHECK (capacite > 0);

ALTER TABLE PARTIE
ADD CONSTRAINT ck_score_domicile
CHECK (score_eq_domicile >= 0);

ALTER TABLE PARTIE
ADD CONSTRAINT ck_score_exterieur
CHECK (score_eq_exterieur >= 0);

ALTER TABLE CONTRAT
ADD CONSTRAINT ck_dates_contrat
CHECK (date_fin_contrat > date_debut_contrat);

ALTER TABLE CONTRAT
ADD CONSTRAINT ck_statut_contrat
CHECK (statut_contrat IN ('sous contrat', 'pret', 'libre'));

ALTER TABLE COMPOSE
ADD CONSTRAINT ck_statut_joueur_match
CHECK (statut_joueur_match IN ('titulaire', 'remplacant', 'non_inscrit'));
