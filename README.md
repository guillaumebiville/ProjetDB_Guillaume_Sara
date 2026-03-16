# ProjetDB_Guillaume_Sara

Présentation du projet

On a décidé afin de réaliser ce mini-projet, de porter notre attention sur la gestion d'un club de football professionnel. A l'aide de l'IAG, qui nous as fournit les règles du métier et le dictionnaire de donnée de ce domaine, nous avons organisé notre MCD à l'aide de données clés tel que :

      -Les joueurs et leurs contrats
      -Les équipes (réserve, U19...)
      -Les compétitions 
      -Les saisons
      -Les différents matchs 
      -Les stades
      ...

La conception est réalisée selon la méthode MERISE, avec l'analyse de besoins et la construction du MCD
Nous avons ainsi intérrogé l'IAG en suiavnt un prompt bien précis afin de nous aiguiller sur notre MCD.


Voici le prompt que nous avons utilisé : 


"Tu travailles dans le domaine de la gestion d’un club de football professionnel. Ton organisation a comme activité de gérer des joueurs, des équipes, des matchs, des entraîneurs et des compétitions sportives. C’est une organisation comme le Paris Saint-Germain, le FC Barcelone ou le Bayern Munich. Les données ont été collectées à partir d’informations sur les joueurs, des compositions d’équipes d’anciens matchs disputés, des performances et les statistiques des joueurs…
Inspire-toi des sites web comme transfermkt, ou les istes de l’uefa et de la fifa… https://www.transfermarkt.com, https://www.fifa.com, https://www.uefa.com.
Ton organisation veut appliquer MERISE pour concevoir un système d'information. Tu es chargé de la partie analyse, c’est-à-dire de collecter les besoins auprès de l’organisation. Elle a fait appel à un étudiant en ingénierie informatique pour réaliser ce projet, tu dois lui fournir les informations nécessaires pour qu’il applique ensuite lui-même les étapes suivantes de conception et développement de la base de données.
D’abord, établis les règles de gestions des données de ton organisation, sous la forme d'une liste à puce. Elle doit correspondre aux informations que fournit quelqu’un qui connaît le fonctionnement de l’organisation, mais pas comment se construit un système d’information. Ensuite, à partir de ces règles, fournis un dictionnaire de données brutes avec les colonnes suivantes, regroupées dans un tableau : signification de la donnée, type, taille en nombre de caractères ou de chiffres. Il doit y avoir entre 25 et 35 données. Il sert à fournir des informations supplémentaires sur chaque donnée (taille et type) mais sans a priori sur comment les données vont être modélisées ensuite. Fournis donc les règles de gestion et le dictionnaire de données."




Et voici la réponse que l'IAG nous as fournit : 



" Règles de gestion (métier) des données du club
•	Un joueur est identifié de manière unique dans l’organisation et possède un état contractuel (sous contrat, prêté, libre, etc.).
•	Un joueur peut être rattaché à un seul club à un instant donné, mais peut changer de club au fil des saisons via transfert, fin de contrat ou prêt.
•	Un joueur peut être prêté : pendant un prêt, son club “propriétaire” et son club “actuel” peuvent être différents.
•	Un joueur a un poste principal (ex : Gardien, Défenseur central, Milieu, Attaquant) et peut avoir des postes secondaires.
•	Un joueur possède des caractéristiques stables (date de naissance, nationalité, taille, pied préféré) et des valeurs évolutives (valeur marchande, statut dans l’effectif).
•	Le club gère une ou plusieurs équipes (ex : équipe première, réserve, U19, U17), chacune avec une catégorie et un niveau.
•	Une équipe a un effectif : la liste des joueurs rattachés à l’équipe pour une période (saison), avec un numéro de maillot pouvant changer d’une saison à l’autre.
•	Une saison sportive structure les activités (ex : 2025/2026) et fixe les périodes de compétitions et les dates des matchs.
•	Une compétition (Ligue, Coupe, compétition UEFA, etc.) se déroule sur une saison et est composée de phases (championnat, groupes, élimination directe).
•	Un match appartient à une compétition et à une saison, et se joue à une date et une heure précises.
•	Un match oppose exactement deux équipes : une équipe à domicile et une équipe à l’extérieur.
•	Un match se joue dans un stade (généralement celui de l’équipe à domicile, mais pas obligatoirement : terrain neutre possible).
•	Un stade a des informations d’identification (nom, ville, pays) et une capacité ; sa capacité peut évoluer dans le temps.
•	Un match peut avoir un score à la fin du temps réglementaire, et si nécessaire un score après prolongation et/ou une séance de tirs au but.
•	Un match est arbitré et rattaché à des informations d’organisation (journée/round, phase, statut : programmé, joué, annulé, reporté).
•	Une équipe a un ou plusieurs entraîneurs au cours du temps ; à un instant donné, un match est associé à un entraîneur principal par équipe.
•	Pour chaque match, chaque équipe fournit une composition : titulaires, remplaçants, dispositif tactique (ex : 4-3-3).
•	Un joueur peut être titulaire, remplaçant, ou non inscrit sur la feuille de match ; un joueur ne peut pas être à la fois titulaire et remplaçant dans le même match.
•	Les entrées en jeu (remplacements) sont enregistrées avec le joueur sortant, le joueur entrant et la minute.
•	Les événements de match (buts, passes décisives, cartons, blessures, etc.) sont attribués à un joueur (quand applicable) et à une minute de jeu.
•	Les statistiques individuelles (minutes jouées, tirs, passes, fautes, etc.) sont enregistrées par joueur et par match.
•	Les statistiques cumulées (buts sur la saison, minutes sur la compétition, etc.) sont déduites des matchs mais peuvent aussi être conservées pour accélérer les analyses.
•	Les joueurs ont des performances suivies sur différentes granularités : par match, par compétition, par saison.
•	Les données doivent permettre de produire des vues “type Transfermarkt/UEFA/FIFA” : fiche joueur, historique club, calendrier, feuille de match, classement/phase, statistiques.
•	Une même compétition peut inclure des équipes de plusieurs clubs ; l’organisation doit pouvoir stocker des clubs adverses (pas seulement le club interne).
•	Les identifiants externes (ex : identifiant Transfermarkt) peuvent être stockés pour faciliter le rapprochement des données.
•	Les règles de cohérence importantes : dates (un match ne peut pas être dans une saison incohérente), unicité des identifiants, et validité des minutes (0–130 environ selon prolongations).
________________________________________
Dictionnaire de données brutes (25–35 données)
Types proposés : Texte, Entier, Décimal, Date, DateHeure, Booléen.
La “taille” est en nombre de caractères (Texte/Date/DateHeure) ou nombre de chiffres (Entier/Décimal, avec précision indiquée).
Signification de la donnée	Type	Taille
Identifiant interne unique du joueur	Entier	10
Nom complet affiché du joueur	Texte	80
Date de naissance du joueur	Date	10
Nationalité principale du joueur (pays)	Texte	40
Taille du joueur (en cm)	Entier	3
Pied préféré (gauche/droit/les deux)	Texte	10
Poste principal du joueur	Texte	30
Valeur marchande estimée du joueur	Décimal	12,2
Date de début de contrat du joueur	Date	10
Date de fin de contrat du joueur	Date	10
Statut contractuel (sous contrat, prêt, libre…)	Texte	20
Identifiant interne unique du club	Entier	10
Nom officiel du club	Texte	80
Pays du club	Texte	40
Identifiant interne unique de l’équipe (A, réserve, U19…)	Entier	10
Libellé de l’équipe (ex : “Équipe première”)	Texte	40
Catégorie/niveau de l’équipe (A, Réserve, U19…)	Texte	15
Identifiant interne unique de la saison	Entier	6
Libellé de saison (ex : “2025/2026”)	Texte	9
Date de début de saison	Date	10
Date de fin de saison	Date	10
Identifiant interne unique de la compétition	Entier	10
Nom de la compétition (Ligue 1, UCL, Coupe…)	Texte	60
Type de compétition (championnat, coupe…)	Texte	20
Phase/round (groupe, 1/8, journée 12…)	Texte	30
Identifiant interne unique du stade	Entier	10
Nom du stade	Texte	80
Ville du stade	Texte	50
Capacité officielle du stade	Entier	6
Identifiant interne unique du match	Entier	12
Date et heure de coup d’envoi	DateHeure	19
Statut du match (programmé, joué, reporté…)	Texte	15
Score domicile (temps réglementaire)	Entier	2
Score extérieur (temps réglementaire)	Entier	2
Dispositif tactique de l’équipe (ex : 4-3-3)	Texte	10 "



On a alors faconner notre MCD selon des règles précises tel que :

•  Un joueur est identifié de manière unique dans le club.
•  Un joueur peut signer plusieurs contrats au cours du temps.
•  Un contrat appartient obligatoirement à un seul joueur.
•  Un club possède une ou plusieurs équipes.
•  Une équipe appartient à un seul club.
•  Une saison structure les compétitions.
•  Une compétition se déroule sur une seule saison.
•  Une saison peut contenir plusieurs compétitions.
•  Une compétition contient plusieurs matchs.
•  Un match appartient à une seule compétition.
•  Un match se joue à une date et une heure précises.
•  Un match se joue dans un stade.
•  Un stade peut accueillir plusieurs matchs.
•  Un match oppose des équipes.
•  Pour chaque match, chaque équipe dispose d’une composition.
•  Un joueur peut être titulaire, remplaçant ou non inscrit dans un match.
•  Les scores sont enregistrés pour chaque match.


Explication des cardinalités et associations :

Nous avons crée une entitée Contrat dépendante de l'entité Joueur.
L'entité contrat est donc faible car un contrat ne peu tpas exister sans joueur.

Un conrat concerne 1 seule joueur d'où la cardinalité (1,1)
Un joueur peut signer plusieurs contrats dans sa carrière (0,n)

Un club possède au minimum une équipe (U19, féminine, réserve...) selon la renommée d'une équipe.
Une équipe concerne un seul club.

Une compétition se déroule sur une seule saison mais une saison peut contenir plusieurs compétitions.

Un match appartient ou se déroule lors d'une seule compétition et une compétition peut avoir un à plusieurs matchs ( supercoupe de l'uefa = 1 matchs, coupe du monde = 7 matchs )

Un match se situe dans un stade mai sun stade peut accueillir plusieurs matchs ou aucun.

Pour chaque match une équipe à une composition comprenant différents joueurs
un joueur peut participer à plusieurs matchs
une équipe peut participer à plusieurs match

<img width="1124" height="1070" alt="image" src="https://github.com/user-attachments/assets/2847bf59-170f-4df8-8edb-42d8bddb4679" />


voici le MLD obtenu à partir du nouveau MCD :

Joueur = (_id_joueur INT, nom_joueur VARCHAR(80), date_naissance DATE, nationalité VARCHAR(40), poste VARCHAR(30), valeur_marchande DECIMAL(12,2));
Saison = (_id_saison INT, nom_saison VARCHAR(10), date_debut_saison DATE, date_fin_saison DATE);
Club = (_id_club INT, nom_club VARCHAR(80), ville_club VARCHAR(50), pays_club VARCHAR(40));
Equipe = (_id_equipe INT, categorie_niveau VARCHAR(15), #_id_club);
Compétition = (_id_identifiant INT, nom_compétition VARCHAR(60), type_compétition VARCHAR(20), #_id_saison);
Stade = (_id_stade INT, nom_stade VARCHAR(80), ville_stade VARCHAR(50), capacité INT);
Partie = (_id_match INT, date_heure_coup_envoi DATETIME, score_eq_domicile INT, score_eq_exterieur INT, phase_competition VARCHAR(30), #_id_identifiant, #_id_stade);
Contrat = (_id_contrat INT, date_debut_contrat DATE, date_fin_contrat DATE, statut_contrat VARCHAR(20), #_id_joueur);
Compose = (#_id_joueur, #_id_equipe, #_id_match, statut_joueur_match VARCHAR(20), tactique VARCHAR(10));

<img width="2553" height="1212" alt="image" src="https://github.com/user-attachments/assets/f1ff2611-c335-4492-8ad3-1184cd62a454" />



Quatrième étape : insertion des données

Voici le prompt utilisé, inspiré du prompt utilisé lors du TP1 : 

"Donne les requêtes d’insertion permettant de remplir la base de données dont le modèle relationnel est le suivant :

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


Concernant le scénario d'utilisation pour la BD nous avons opté pour ce scénario : 

La base de données est utilisée par un directeur sportif d’un club de football professionnel qui utiliserait les informations de la base de données concernant certains joueurs, équipes, clubs...., afin de se préparer pour le prochain mercato, période durant laquelle des transferts de joueurs entre club pourront se faire.
Son rôle est de consulter les informations principales sur les joueurs, les contrats, les équipes, les matchs, les compétitions et les compositions d’équipe.

Cette base peut lui servir par exemple à :
- Voir la liste des joueurs du club et certaines de leurs caractéristiques
- Consulter les contrats en cours ou arrivant bientôt à échéance
- Regarder les matchs joués dans une compétition ou dans un stade donné
- Analyser quelques statistiques simples sur les joueurs, les matchs et les compétitions
- Savoir quels joueurs ont participé à quels matchs et avec quel statut...
  

Les requêtes SQL réalisées dans la suite du projet ont donc pour objectif d’aider ce responsable sportif à extraire des informations utiles à partir de la base.













