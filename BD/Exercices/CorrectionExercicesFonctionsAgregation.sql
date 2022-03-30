1. Nombre minimum d'exemplaires des livres
SELECT MIN(nb_exempl) FROM livres;

2. Afficher le titre , le genre et le prix minimum par genre dans la table livre  
SELECT titre, genre, MIN(prix) FROM livres GROUP BY genre; 

3. Afficher le prix max des livres dont genre est différent de scolaire
SELECT Max(prix) FROM livres WHERE genre<>'Scolaire';

4. Le nombre total d’exemplaires de la table livres
SELECT SUM(nb_exempl) FROM livres;

5. Nombre total d’exemplaires édités chez gallimard
SELECT SUM(nb_exempl) FROM livres WHERE éditeur='Gallimard';

6. Nombre de livres dont la critique est "très bon" ou "mauvais" ou "excellent" présenté par critique
SELECT critique,SUM(nb_exempl) FROM livres WHERE critique in ('très bon','mauvais','excellent')group by critique;

7. Nombre de lignes par éditeur dans la table livre
SELECT éditeur, COUNT(*) AS "Nombre de titres par éditeur" FROM livres GROUP BY éditeur;

8. Prix total d’acquisition de tous les livres
SELECT SUM(prix*nb_exempl) AS 'Prix total d’acquisition des livres' FROM livres;

9. Idem mais livres édités après 1950
SELECT SUM(prix*nb_exempl) AS "Prix total d’acquisition des livres" FROM livres WHERE année_edit>1950;

10.La moyenne du nombre de pages des livres dont le prix est supérieur à 500 et écrits par des auteurs de nationalité "Belge" ou "Français";
Select AVG(nb_pg) Nbre_moyen_pages, nationalité from livres, auteurs where auteur_id=id_auteur and prix > 500 and nationalité in ('Belge','Français');