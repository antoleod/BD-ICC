1. Le nom de l’auteur du livre emprunté par Durand
SELECT DISTINCT auteurs.nom,auteurs.prénom FROM auteurs,livres,emprunteurs,livres_empruntés WHERE emprunteurs.nom="Durand" AND auteur_id=id_auteur AND livre_id=id_livre AND id_emprunteur=id_emprunteur;

SELECT DISTINCT auteurs.nom,auteurs.prénom FROM emprunteurs join livres_empruntés on emprunteur_id = id_emprunteur join livres on livre_id= id_livre join auteurs on auteur_id=id_auteur 
where emprunteurs.nom="Durand";

2. La nationalité des auteurs dont les emprunteurs habitent Bruxelles
SELECT DISTINCT auteurs.nationalité FROM auteurs,livres,emprunteurs,livres_empruntés WHERE emprunteurs.ville="Bruxelles" AND auteur_id=id_auteur AND livre_id=id_livre 
AND id_emprunteur=emprunteur_id ;

  
3. Quelles sont les livres empruntés dont le titre contient la lettre p
SELECT titre FROM livres WHERE emprunté=1 AND titre LIKE "%p%";


4. Requête qui permet de supprimer le champ emprunté dans la table livres
ALTER TABLE livres DROP emprunté;

5. Augmentation du prix des livres de 25% avec renommage de la colonne prix en prix pour pigeon
SELECT titre,prix*1.25 prix_pour_pigeon FROM livres;
SELECT titre,prix*1.25 as prix_pour_pigeon FROM livres;

6. Quel est le nom des emprunteurs des livres appartenant à la catégorie roman ou sexe
SELECT DISTINCT emprunteurs.nom FROM livres,emprunteurs,livres_empruntés WHERE livres.genre IN ("Roman","Sexe") AND (id_emprunteur=emprunteur_id AND id_livre=livre_id);

7. Année de naissance des auteurs dont la deuxième lettre du prénom est E
SELECT année_naiss FROM auteurs WHERE prénom LIKE "_e%";

8. Différentes nationalités (pas de doublon) des auteurs ayant écrit un livre aux éditions gallimard, lombard ou labor
SELECT DISTINCT auteurs.nationalité FROM auteurs,livres WHERE id_auteur = auteur_id and livres.éditeur IN ("Gallimard","Labor","Lombard");

9. La date de naissance et le prénom des auteurs dont les livres sont édités après 1960 et dont le prix est inférieur à 800€
SELECT DISTINCT auteurs.année_naiss,auteurs.prénom FROM auteurs,livres WHERE prix<800 AND livres.année_edit>1960 AND auteur_id=id_auteur;

10. Le titre des livres écrit par les auteurs français
SELECT livres.titre FROM livres,auteurs WHERE auteurs.nationalité="Français" AND auteur_id=id_auteur;

11. L’éditeur des auteurs de nationalité allemande
SELECT livres.éditeur FROM livres,auteurs WHERE auteurs.nationalité="Allemand" AND auteur_id=id_auteur;

12. Le nom et le prénom des auteurs ayant écrit des livres dont la critique est excellente , très bon ou mauvais et qui appartient au genre traité
SELECT DISTINCT auteurs.nom,auteurs.prénom FROM livres,auteurs WHERE critique IN ("Excellent","Très bon","mauvais") AND genre="Traité" AND auteur_id=id_auteur;