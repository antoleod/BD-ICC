1.	La nationalité des auteurs dont les emprunteurs habitent Bruxelles
	select distinct nationalité from auteurs join livres on auteur_id = id_auteur join livres_empruntés on id_livre = livre_id join emprunteurs on emprunteur_id = id_emprunteur 
	where ville ="bruxelles";
2.	Quelles sont les titres des livres empruntés dont le titre contient la lettre p (en ne tenant pas compte du champ "emprunté" de la table livres)
	select titre from livres join livres_empruntés on livre_id = id_livre where titre like "%p%";	
3.	Quel est le nom des emprunteurs des livres appartenant à la catégorie roman ou sexe
	select nom from livres join livres_empruntés on livre_id = id_livre join emprunteurs on emprunteur_id = id_emprunteur where genre in( "roman", "sexe");
4.	Différentes nationalités (pas de doublon) des auteurs ayant écrit un livre aux éditions gallimard, lombard ou labor
	select distinct nationalité from auteurs join livres on auteur_id = id_auteur where éditeur in("lombard", "gallimard", "labor");
5.	La date de naissance et le prénom des auteurs dont les livres sont édités après 1960 et dont  le prix est inférieur à 800€
	select distinct année_naiss, prénom from auteurs join livres on auteur_id = id_auteur where année_edit > 1960 and prix < 800;
6.  Le titre des livres écrit par les auteurs français
	select titre from auteurs join livres on auteur_id = id_auteur where nationalité ="français";
7.  L’éditeur des auteurs de nationalité allemande
	select éditeur from auteurs join livres on auteur_id = id_auteur where nationalité ="allemand";
8.  Le nom et le prénom des auteurs ayant écrit des livres dont la critique est excellente , très bon ou mauvais et qui appartient au 
    genre traité 
	select distinct nom, prénom from auteurs join livres on auteur_id = id_auteur where critique in("excellent", "très bon","mauvais") and genre ="traité";
9.  Le nom des emprunteurs ayant emprunté des livres écrits par des auteurs nés avant 1950.
    select distinct emprunteurs.nom from auteurs join livres on auteur_id = id_auteur join livres_empruntés on id_livre = livre_id join emprunteurs on emprunteur_id = id_emprunteur
	where année_naiss < 1950;
10. Le genre des livres empruntés par des emprunteurs habitant Namur et Bruxelles.
	select distinct genre from livres join livres_empruntés on livre_id = id_livre join emprunteurs on emprunteur_id = id_emprunteur where ville in("Namur", "Bruxelles");
