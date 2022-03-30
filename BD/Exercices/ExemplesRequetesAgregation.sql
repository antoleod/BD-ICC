1. le nombre d'enregistrement que contient la table auteurs
SELECT count( * ) as nbenreg FROM auteurs;

2.  Le nombre de nationalités mentionnées dans la table auteurs
SELECT count(nationalité) FROM `auteurs`; 

3.  Le nombre de nationalités différentes mentionnées dans la table auteurs
SELECT count(distinct nationalité) FROM `auteurs`; 

4.  Le nombre de nationalités différentes mentionnées dans la table auteurs regroupé par nationalité différentes
SELECT nationalité,count( nationalité) as nbre_auteurs_par_nationalité FROM `auteurs` group by nationalité;

5. Prix minimum des livres
SELECT min(prix) prix_minimum from livres;

6. Prix minimum des livres par critique
SELECT critique ,min(prix) prix_minimum from livres group by critique;

7. Prix maximum des livres par critique
SELECT critique ,max(prix) prix_maximum from livres group by critique;

8. Somme des exemplaires des livres possédés par la bibliothèque
Select sum(nb_exempl) as Nbre_total_exemplaires from livres;

9. Somme des exemplaires des livres possédés par la bibliothèque par genre 
Select genre,sum(nb_exempl) as Nbre_total_exemplaires from livres group by genre;

10. Somme des exemplaires des livres possédés par la bibliothèque par genre pour les genres roman ou essai
Select genre,sum(nb_exempl) as Nbre_total_exemplaires from livres where genre in ('roman','essai') group by genre;

11. Prix moyen des livres possédés par la bibliothèque
select avg(prix) prix_moyen_livres from livres;