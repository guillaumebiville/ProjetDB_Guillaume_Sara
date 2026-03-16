-- requete pour afficher le nom et le poste de tous les joueurs
SELECT nom_joueur, poste
FROM JOUEUR;

-- requete pour afficher les joueurs français triés par nom
SELECT nom_joueur, nationalite
FROM JOUEUR
WHERE nationalite = 'Française'
ORDER BY nom_joueur;

-- requete pour afficher les nationalités différentes présentes dans la table JOUEUR
SELECT DISTINCT nationalite
FROM JOUEUR;

-- afficher les postes ayant plus de 3 joueurs
SELECT poste, COUNT(*) AS nombre_joueurs
FROM JOUEUR
GROUP BY poste
HAVING COUNT(*) > 3;

-- calculer la moyenne de la valeur marchande par poste
SELECT poste, AVG(valeur_marchande) AS moyenne_valeur
FROM JOUEUR
GROUP BY poste;

-- compter le nombre de matchs par competition
SELECT id_identifiant, COUNT(*) AS nb_matchs
FROM PARTIE
GROUP BY id_identifiant;

-- compter le nombre de joueurs par nationalite
SELECT nationalite, COUNT(*) AS nb_joueurs
FROM JOUEUR
GROUP BY nationalite;

-- compter le nombre de joueurs par poste
SELECT poste, COUNT(*) AS nb_joueurs
FROM JOUEUR
GROUP BY poste;


-- afficher les equipes avec le nom du club
SELECT e.id_equipe, e.categorie_niveau, c.nom_club
FROM EQUIPE e
JOIN CLUB c ON e.id_club = c.id_club;

-- afficher les joueurs avec le nom du club auquel ils appartiennent
SELECT j.nom_joueur, c.nom_club
FROM JOUEUR j
JOIN COMPOSE cp ON j.id_joueur = cp.id_joueur
JOIN EQUIPE e ON cp.id_equipe = e.id_equipe
JOIN CLUB c ON e.id_club = c.id_club;

-- afficher les joueurs avec leur contrat
SELECT j.nom_joueur, c.statut_contrat, c.date_fin_contrat
FROM JOUEUR j
JOIN CONTRAT c ON j.id_joueur = c.id_joueur;

-- afficher les joueurs qui ont participe a un match
SELECT j.nom_joueur, cp.id_match, cp.statut_joueur_match
FROM COMPOSE cp
JOIN JOUEUR j ON cp.id_joueur = j.id_joueur;

- afficher les matchs avec le nom du stade
SELECT p.id_match, p.phase_competition, s.nom_stade
FROM PARTIE p
JOIN STADE s ON p.id_stade = s.id_stade;

