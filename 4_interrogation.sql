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
