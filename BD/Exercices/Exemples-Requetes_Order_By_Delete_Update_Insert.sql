Select distinct nationalité from auteurs  order by nationalité;
Select distinct nationalité from auteurs  order by nationalité asc;
Select distinct nationalité from auteurs  where année_naiss >1950 order by nationalité desc;
Select nom, nationalité, année_naiss from auteurs  order by nationalité, année_naiss desc;
update auteurs set nationalité='russe' where nationalité ='belge';
update emprunteurs set ville='molenbeek', cp='1080', adresse="rue verte 25" where emprunteur_id = 15;


Remarque : 
			pour la clause insert into allez voir sur le script de création de la base "biblio_mysql";
			
			
Delete from auteurs where nationalité='belge'; impossible à exécuter car ces auteurs se trouvent
dans la table livres, il faut maintenir l'intégrité référentielle.
			