Prix minimum des livres par genre dont le nombre total d'exemplaires est inférieur à 20
select min(prix) as prixmin, genre from livres group by genre having sum(nb_exempl) < 20;

Nombre moyen de pages des livres  par  type de critique si cette critique apparaît plus d'une fois
select avg(nb_pg) as nbre_moyen_pages, critique from livres  group by critique having count(critique) > 1;

Editeurs des livres dont le prix maximum est supérieur à 500
select éditeur from livres group by éditeur having max(prix) > 500;    OU
select éditeur from livres where éditeur <> ‘NULL’  group by éditeur having max(prix) > 500;


Editeurs des livres ayant édités plus d'un titre
select éditeur from livres group by éditeur having count(titre) > 1;

Quel est le prix total d’achat de tous les livres pour chaque genre de livre dont le prix total d’achat est d’au moins 10000
select sum(prix * nb_exempl) as prix_total_achat, genre from livres group by genre having sum(prix * nb_exempl) >= 10000;