Prompt Utilisé : 

Donne les requêtes d’insertion permettant de remplir la base de données dont le modèle relationnel est le suivant :

JOUEUR(id_joueur, nom_joueur, date_naissance, nationalite, poste, valeur_marchande)
Clé primaire : id_joueur

CLUB(id_club, nom_club, ville_club, pays_club)
Clé primaire : id_club

SAISON(id_saison, nom_saison, date_debut_saison, date_fin_saison)
Clé primaire : id_saison

STADE(id_stade, nom_stade, ville_stade, capacite)
Clé primaire : id_stade

EQUIPE(id_equipe, categorie_niveau, #id_club)
Clé primaire : id_equipe

COMPETITION(id_identifiant, nom_competition, type_competition, #id_saison)
Clé primaire : id_identifiant

PARTIE(id_match, date_heure_coup_envoi, score_eq_domicile, score_eq_exterieur, phase_competition, #id_identifiant, #id_stade)
Clé primaire : id_match

CONTRAT(id_contrat, date_debut_contrat, date_fin_contrat, statut_contrat, #id_joueur)
Clé primaire : id_contrat

COMPOSE(#id_joueur, #id_equipe, #id_match, statut_joueur_match, tactique)
Clé primaire composé : (id_joueur, id_equipe, id_match)

Les clés primaires correspondent aux id, sauf si autre chose est précisé. Les clés étrangères sont identifiées par les #, et ont le même nom que les clés primaires auxquelles elles font référence.

Je souhaite les volumes de données suivants :
- JOUEUR : 22 lignes
- CLUB : 5 lignes
- SAISON : 2 lignes
- STADE : 4 lignes
- EQUIPE : 7 lignes
- COMPETITION : 5 lignes
- PARTIE : 10 lignes
- CONTRAT : 15 lignes
- COMPOSE : 40 lignes

les données doivent être cohérente avec le domaine de la gestion d’un club de football professionnel.
Utiliser des noms réalistes de clubs, de stades et compétitions et joueurs.
Utiliser des saisons du type 2024/2025 et 2025/2026 par exemple.
Les statuts de contrat doivent être uniquement parmis : 'sous contrat', 'pret', 'libre'.
Les statuts de joueur dans un match doivent être uniquement parmi : 'titulaire', 'remplacant', 'non_inscrit'.
Les tactiques peuvent être par exemple : '4-3-3', '4-4-2', '3-5-2'.

Respecter les contraintes suivantes :
- valeur_marchande >= 0
- capacite > 0
- score_eq_domicile >= 0
- score_eq_exterieur >= 0
- date_fin_contrat > date_debut_contrat
- les clés étrangères doivent toujours faire référence à des clés primaires existantes

Les clés étrangères doivent faire référence aux clés primaires existantes : donne les lignes en commençant par remplir les tables dans lesquelles il n'y a pas de clés étrangères, puis les tables dans lesquelles les clés étrangères font référence à des clés primaires des tables déjà remplies.

Fournis l’ensemble sous la forme d’un script SQL prêt à être exécuté.


Réponse de l'IA : 

-- ============================================================
-- SCRIPT D'INSERTION DE DONNÉES - GESTION CLUB DE FOOTBALL
-- ============================================================

-- 1. Tables sans clés étrangères
-- ------------------------------------------------------------

-- Table SAISON (2 lignes)
INSERT INTO SAISON (id_saison, nom_saison, date_debut_saison, date_fin_saison) VALUES
(1, '2024/2025', '2024-08-01', '2025-06-30'),
(2, '2025/2026', '2025-08-01', '2026-06-30');

-- Table STADE (4 lignes)
INSERT INTO STADE (id_stade, nom_stade, ville_stade, capacite) VALUES
(1, 'Parc des Princes', 'Paris', 47929),
(2, 'Stade Vélodrome', 'Marseille', 67394),
(3, 'Santiago Bernabéu', 'Madrid', 81044),
(4, 'Groupama Stadium', 'Lyon', 59186);

-- Table CLUB (5 lignes)
INSERT INTO CLUB (id_club, nom_club, ville_club, pays_club) VALUES
(1, 'Paris Saint-Germain', 'Paris', 'France'),
(2, 'Olympique de Marseille', 'Marseille', 'France'),
(3, 'Real Madrid', 'Madrid', 'Espagne'),
(4, 'Olympique Lyonnais', 'Lyon', 'France'),
(5, 'AS Monaco', 'Monaco', 'France');

-- Table JOUEUR (22 lignes)
INSERT INTO JOUEUR (id_joueur, nom_joueur, date_naissance, nationalite, poste, valeur_marchande) VALUES
(1, 'Kylian Mbappé', '1998-12-20', 'Française', 'Attaquant', 180000000),
(2, 'Ousmane Dembélé', '1997-05-15', 'Française', 'Ailier', 60000000),
(3, 'Bradley Barcola', '2002-09-02', 'Française', 'Ailier', 40000000),
(4, 'Warren Zaïre-Emery', '2006-03-08', 'Française', 'Milieu', 60000000),
(5, 'Vitinha', '2000-02-13', 'Portugaise', 'Milieu', 45000000),
(6, 'Marquinhos', '1994-05-14', 'Brésilienne', 'Défenseur', 50000000),
(7, 'Achraf Hakimi', '1998-11-04', 'Marocaine', 'Défenseur', 65000000),
(8, 'Gianluigi Donnarumma', '1999-02-25', 'Italienne', 'Gardien', 40000000),
(9, 'Vinícius Júnior', '2000-07-12', 'Brésilienne', 'Attaquant', 150000000),
(10, 'Jude Bellingham', '2003-06-29', 'Anglaise', 'Milieu', 150000000),
(11, 'Luka Modric', '1985-09-09', 'Croate', 'Milieu', 10000000),
(12, 'Antonio Rüdiger', '1993-03-03', 'Allemande', 'Défenseur', 25000000),
(13, 'Thibaut Courtois', '1992-05-11', 'Belge', 'Gardien', 30000000),
(14, 'Pierre-Emerick Aubameyang', '1989-06-18', 'Gabonaise', 'Attaquant', 40000000),
(15, 'Amine Harit', '1997-06-18', 'Marocaine', 'Milieu', 15000000),
(16, 'Leonardo Balerdi', '1999-01-26', 'Argentine', 'Défenseur', 20000000),
(17, 'Alexandre Lacazette', '1991-05-28', 'Française', 'Attaquant', 10000000),
(18, 'Corentin Tolisso', '1994-08-03', 'Française', 'Milieu', 5000000),
(19, 'Rayan Cherki', '2003-08-17', 'Française', 'Milieu', 25000000),
(20, 'Anthony Lopes', '1990-10-01', 'Portugaise', 'Gardien', 4000000),
(21, 'Wissam Ben Yedder', '1990-08-12', 'Française', 'Attaquant', 8000000),
(22, 'Aleksandr Golovin', '1996-05-30', 'Russe', 'Milieu', 30000000);

-- 2. Tables avec clés étrangères de niveau 1
-- ------------------------------------------------------------

-- Table EQUIPE (7 lignes)
-- id_club : 1-PSG, 2-OM, 3-Real, 4-OL, 5-ASM
INSERT INTO EQUIPE (id_equipe, categorie_niveau, id_club) VALUES
(1, 'Professionnel', 1),
(2, 'Reserve', 1),
(3, 'Professionnel', 2),
(4, 'Professionnel', 3),
(5, 'Professionnel', 4),
(6, 'Reserve', 4),
(7, 'Professionnel', 5);

-- Table COMPETITION (5 lignes)
-- id_saison : 1 (24/25) ou 2 (25/26)
INSERT INTO COMPETITION (id_identifiant, nom_competition, type_competition, id_saison) VALUES
(1, 'Ligue 1 McDonald''s', 'Championnat National', 1),
(2, 'UEFA Champions League', 'Coupe Continentale', 1),
(3, 'Coupe de France', 'Coupe Nationale', 1),
(4, 'La Liga', 'Championnat National', 1),
(5, 'Ligue 1 McDonald''s', 'Championnat National', 2);

-- Table CONTRAT (15 lignes)
-- Statuts : 'sous contrat', 'pret', 'libre'
INSERT INTO CONTRAT (id_contrat, date_debut_contrat, date_fin_contrat, statut_contrat, id_joueur) VALUES
(1, '2022-07-01', '2025-06-30', 'sous contrat', 1),
(2, '2023-08-01', '2028-06-30', 'sous contrat', 2),
(3, '2023-09-01', '2028-06-30', 'sous contrat', 3),
(4, '2023-07-01', '2029-06-30', 'sous contrat', 4),
(5, '2022-07-01', '2027-06-30', 'sous contrat', 6),
(6, '2023-07-01', '2028-06-30', 'sous contrat', 9),
(7, '2023-07-01', '2029-06-30', 'sous contrat', 10),
(8, '2023-07-01', '2025-06-30', 'sous contrat', 11),
(9, '2023-07-01', '2026-06-30', 'sous contrat', 14),
(10, '2022-07-01', '2025-06-30', 'sous contrat', 17),
(11, '2024-01-01', '2025-06-30', 'pret', 19),
(12, '2021-07-01', '2024-06-30', 'libre', 21),
(13, '2023-07-01', '2028-06-30', 'sous contrat', 7),
(14, '2022-07-01', '2027-06-30', 'sous contrat', 15),
(15, '2022-07-01', '2026-06-30', 'sous contrat', 22);

-- 3. Tables avec clés étrangères de niveau 2+
-- ------------------------------------------------------------

-- Table PARTIE (10 lignes)
-- id_identifiant (competition), id_stade
INSERT INTO PARTIE (id_match, date_heure_coup_envoi, score_eq_domicile, score_eq_exterieur, phase_competition, id_identifiant, id_stade) VALUES
(1, '2024-08-15 21:00:00', 2, 1, 'Journée 1', 1, 1),
(2, '2024-08-22 21:00:00', 0, 0, 'Journée 2', 1, 2),
(3, '2024-09-15 21:00:00', 3, 0, 'Phase de Groupe', 2, 3),
(4, '2024-10-20 21:00:00', 1, 2, 'Journée 8', 1, 4),
(5, '2025-01-10 18:00:00', 5, 0, '32ème de finale', 3, 1),
(6, '2024-09-01 20:00:00', 4, 1, 'Journée 3', 4, 3),
(7, '2025-03-12 21:00:00', 1, 1, 'Quart de finale', 2, 2),
(8, '2025-05-20 21:00:00', 2, 2, 'Journée 34', 1, 1),
(9, '2025-08-16 21:00:00', 0, 1, 'Journée 1', 5, 4),
(10, '2024-11-05 21:00:00', 2, 3, 'Phase de Groupe', 2, 1);

-- Table COMPOSE (40 lignes)
-- id_joueur, id_equipe, id_match, statut_joueur_match, tactique
-- Statuts : 'titulaire', 'remplacant', 'non_inscrit'
INSERT INTO COMPOSE (id_joueur, id_equipe, id_match, statut_joueur_match, tactique) VALUES
-- Match 1 (PSG vs Autre)
(1, 1, 1, 'titulaire', '4-3-3'), (2, 1, 1, 'titulaire', '4-3-3'), (3, 1, 1, 'remplacant', '4-3-3'), (4, 1, 1, 'titulaire', '4-3-3'), (5, 1, 1, 'titulaire', '4-3-3'), (6, 1, 1, 'titulaire', '4-3-3'), (8, 1, 1, 'titulaire', '4-3-3'),
-- Match 2 (OM vs Autre)
(14, 3, 2, 'titulaire', '4-4-2'), (15, 3, 2, 'titulaire', '4-4-2'), (16, 3, 2, 'titulaire', '4-4-2'),
-- Match 3 (Real Madrid vs Autre)
(9, 4, 3, 'titulaire', '4-3-3'), (10, 4, 3, 'titulaire', '4-3-3'), (11, 4, 3, 'remplacant', '4-3-3'), (12, 4, 3, 'titulaire', '4-3-3'), (13, 4, 3, 'titulaire', '4-3-3'),
-- Match 4 (OL vs Autre)
(17, 5, 4, 'titulaire', '3-5-2'), (18, 5, 4, 'titulaire', '3-5-2'), (19, 5, 4, 'remplacant', '3-5-2'), (20, 5, 4, 'titulaire', '3-5-2'),
-- Match 6 (Real Madrid)
(9, 4, 6, 'titulaire', '4-3-3'), (10, 4, 6, 'titulaire', '4-3-3'), (11, 4, 6, 'titulaire', '4-3-3'), (12, 4, 6, 'titulaire', '4-3-3'),
-- Match 10 (PSG en Champions League)
(1, 1, 10, 'titulaire', '4-3-3'), (2, 1, 10, 'titulaire', '4-3-3'), (3, 1, 10, 'titulaire', '4-3-3'), (4, 1, 10, 'titulaire', '4-3-3'), (5, 1, 10, 'titulaire', '4-3-3'), (6, 1, 10, 'titulaire', '4-3-3'), (7, 1, 10, 'titulaire', '4-3-3'), (8, 1, 10, 'titulaire', '4-3-3'),
-- Remplaçants et divers pour atteindre 40
(22, 7, 1, 'non_inscrit', '4-4-2'), (21, 7, 1, 'non_inscrit', '4-4-2'),
(1, 1, 5, 'remplacant', '4-3-3'), (4, 1, 5, 'titulaire', '4-3-3'), (6, 1, 5, 'titulaire', '4-3-3'), (8, 1, 5, 'titulaire', '4-3-3'),
(14, 3, 7, 'titulaire', '4-4-2'), (16, 3, 7, 'titulaire', '4-4-2'), (15, 3, 7, 'remplacant', '4-4-2');
