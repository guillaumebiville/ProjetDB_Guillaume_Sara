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










