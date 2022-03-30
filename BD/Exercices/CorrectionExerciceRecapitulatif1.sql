ATTENTION : AVANT D’ÉDITER VOS REQUÊTES ASSUREZ-VOUS QUE LA TABLE LIVRES NE CONTIENNE PLUS LE CHAMP « EMPRUNTÉ ». POUR CELA EXÉCUTER LA REQUÊTE SUIVANTE SI NÉCESSAIRE :
 
Alter table livres drop column emprunté ;



EDITER LES REQUÊTES SUIVANTES POUR LESQUELLES ON VEUT RÉCUPÉRER :

1.	Les critiques des livres édités avant 1975.

	select distinct critique from livres where année_edit < 1975;
    
    
	
2.	La nationalité des auteurs qui n’ont pas écrit des livres édités chez Lombard, Gallimard ou Le seuil.
Attention : Cette requête doit être une requête imbriquée.

	select distinct nationalité 
    from auteurs 
    where auteur_id in(select id_auteur from livres where éditeur not in ('Lombard', 'Gallimard', 'Le seuil'));
    
    SELECT DISTINCT a.nationalité
	FROM  auteurs AS a
	JOIN  livres AS l ON a.auteur_id=l.id_auteur
	WHERE l.éditeur NOT IN ("lombard", "gallimard", "Le seuil");
	
3.	La ville des emprunteurs ayant emprunté des livres dont le nom d’auteur contient la lettre ‘a’et qui ne sont pas Français.
	
    select distinct emprunteurs.ville 
    from emprunteurs, livres_empruntés, livres, auteurs 
    where id_emprunteur= emprunteur_id and id_livre = livre_id and auteur_id = id_auteur and auteurs.nom like '%a%' and nationalité <> 'Français';
    
    
    SELECT DISTINCT ville AS 'La ville des emprunteurs' ,auteurs.nom,auteurs.nationalité
	FROM emprunteurs
	LEFT JOIN livres_empruntés ON emprunteurs.emprunteur_id=livres_empruntés.id_emprunteur
	LEFT JOIN livres ON livres_empruntés.id_livre= livres.livre_id
	RIGHT JOIN auteurs ON livres.id_auteur=auteurs.auteur_id
	WHERE auteurs.nom LIKE '%a%' AND auteurs.nationalité !="Français";



    
	
4.	La moyenne du prix de tous les livres empruntés (mais pas de tous leurs exemplaires) dont le genre est soit « scolaire » ou soit « roman » présentée par genre. 
La colonne moyenne sera renommée « prix_moyen ».

	select avg(livres.prix) as prix_moyen, genre 
    from livres, livres_empruntés 
    where id_livre = livre_id and genre in ('scolaire', 'roman') 
    group by genre;
	
5.	Le nombre de pages des livres empruntés dont les noms d’auteurs contiennent la lettre ’u’ comme deuxième caractère. Ce nombre de pages sera présenté avec un ordre décroissant.

	select distinct nb_pg from auteurs, livres, livres_empruntés, emprunteurs where auteur_id = id_auteur and livre_id = id_livre and id_emprunteur = emprunteur_id and auteurs.nom like '_u%'order by nb_pg desc;
	
6.	Le nombre total d’auteurs de nationalités différentes présenté par nationalité.
Ce nombre s’intitulera » nombre_total_auteurs ».

	select nationalité,count( nationalité) as nombre_total_auteurs from auteurs group by nationalité;
	
7.	L’affichage des titres des livres et du prix de ceux-ci diminué de 20% pour tous les livres qui contiennent un nombre de pages compris entre 200 et 500 inclus.
La colonne des prix devra être renommée en prix_promotionnel.

	select titre, prix * 0.80 as prix_promotionnel from livres where nb_pg between 200 and 500;
	
	
8.	Les éditeurs des livres empruntés dont les auteurs sont soit de nationalité belge ou française.

	select distinct livres.éditeur from livres, livres_empruntés, auteurs where id_livre= livre_id and id_auteur=auteur_id and auteurs.nationalité in ('Belge', 'Français');
	
9.	Les titres, les critiques et les noms d’auteurs des livres empruntés dont le genre est « traité » ou « roman ». Les noms d’auteurs seront présentés avec un ordre croissant.

	select distinct titre, critique, auteurs.nom from auteurs,livres,livres_empruntés,emprunteurs where auteur_id = id_auteur and livre_id = id_livre and id_emprunteur = emprunteur_id and genre in ('Traité', 'Roman') order by auteurs.nom asc;
	
10.	Le genre et la moyenne du nombre de pages de tous les livres et de tous les exemplaires des auteurs qui ne sont pas de nationalité française, présentée par genre et ce pour les livres dont le prix est de minimum 500.
Renommer la colonne en  présentant la moyenne en nombre_de_pages_moyen.

	select distinct genre, avg(nb_pg*nb_exempl) as nombre_de_pages_moyen from livres, auteurs where auteur_id = id_auteur and auteurs.nationalité not in ('Français') and livres.prix >=500 group by genre ;

EDITER ÉGALEMENT LES REQUÊTES DE MANIPULATION DES DONNÉES ET DE CRÉATION SUIVANTES :

1.	Une requête permettant l’insertion de 2 nouveaux emprunteurs de votre choix au sein de la table emprunteurs.

	insert into emprunteurs(nom,prénom,adresse,cp,ville,tél) values
     ('nom1','prenom1','adresse1',1,'ville1',1000),
     ('nom2','prenom2','adresse2',2,'ville2',2000);
	 
2.	Une requête permettant de modifier le genre des livres « essai » en « roman ».

	 UPDATE livres set genre = 'roman'where genre = 'essai';
	 
3.	Une requête permettant de créer la base de données Etudes.

	CREATE DATABASE Etudes;
	
4.	Une requête permettant de créer la table Etudiants et la table Ecoles.
La table Etudiants contiendra les champs suivant : Nom, Nationalité, AnnéeEtude, Téléphone.
La table Ecoles contiendra les champs suivant : Type, NbMaxEtudiants, RepasChaud et PrixInscription.
A vous de définir le type le plus adapté pour chaque champ ainsi que de définir les clés permettant le lien entre ces 2 tables.
Vous ne devez pas prévoir d’insertions d’enregistrements. 

	CREATE TABLE Etudiants (
	étudiant_id INT(10) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	id_ecole INT NOT NULL,
	nom VARCHAR(30) NOT NULL,
	nationalité VARCHAR(30) NOT NULL,
	année_étude SMALLINT NOT NULL,
	téléphone decimal(10,0)NOT NULL
	);

	CREATE TABLE Ecoles (
	ecole_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	type VARCHAR(30),
	nbmaxetudiants int not null,
	repaschaud tinyint not null,
	prix_inscription decimal(7,2) NOT NULL
	);

	ALTER TABLE `Etudiants`
	ADD CONSTRAINT `Etudiants` FOREIGN KEY (`id_ecole`) REFERENCES `Ecoles` (`ecole_id`); 
