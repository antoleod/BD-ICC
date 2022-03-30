
Requêtes imbriquées utilisant la clause FROM : ATTENTION DANS CE CAS LA SOUS-REQUETE ENTRE  () 
DOIT TOUJOURS ETRE RENOMMEE. ESSAYEZ SANS RENOMMAGE...

select bq.titre 
from ( select * from livres ) as bq
OU
select bq.titre 
from ( select * from livres ) bq
OU
select titre 
from ( select * from livres ) bq

select bq.titre 
from ( select * from livres where critique='bon') bq

select distinct nationalité 
from (select nom, nationalité from auteurs, livres where auteur_id = id_auteur) q

select max(prix) from
(select nom, prénom, nationalité, titre, éditeur, prix
from auteurs, livres
where auteur_id = id_auteur
and nationalité <> « Américain »
and genre
in ('essai',  'traité',  'roman',  'scolaire'))as machin;

OU SANS REQUETE IMBRIQUEE

select max(prix) from auteurs, livres where auteur_id= id_auteur and and nationalité <> « Américain »
 genre in ('essai','traité','roman','scolaire');
 
/*Requêtes imbriquées utilisant la clause IN */

select nom 
from auteurs 
where auteur_id in (select id_auteur from livres where genre = 'roman' or genre='sexe')
OU
select nom 
from auteurs 
where auteur_id in (select id_auteur from livres where genre in ('roman', 'sexe'))

select nom 
from auteurs 
where auteur_id not in (select id_auteur from livres where genre in ('roman', 'sexe'))

select nom, prénom, nationalité
from auteurs
where auteur_id in (
select id_auteur
from livres 
where éditeur like '%a%');

/* OU RESULTAT IDENTIQUE POSSIBLE EN UTILISANT UNE JOINTURE ENTRE LES 2 TABLES */

select nom, prénom, nationalité
from auteurs, livres
where auteur_id = id_auteur and éditeur like '%a%';



select nom, prénom, nationalité
from auteurs
where auteur_id  not in (
select id_auteur
from livres 
where éditeur like '%a%');

OU SANS REQUETE IMBRIQUEE

select nom, prénom, nationalité
from auteurs, livres
where auteur_id = id_auteur and éditeur  not like '%a%';


Requêtes imbriquées utilisant les opérateurs de comparaison

select nom 
from auteurs 
where auteur_id = (select id_auteur from livres where titre ='Erasme')

select titre, prix 
from livres where prix > (select avg(prix) from livres)

Plusieurs imbrications de requêtes

SELECT DISTINCT nom 
FROM emprunteurs 
WHERE emprunteur_id IN (select id_emprunteur FROM livres_empruntés 
WHERE id_livre IN(SELECT livre_id FROM livres WHERE id_auteur IN(SELECT auteur_id 
FROM auteurs WHERE nationalité IN('Belge','Allemand','Américain')) ) );


