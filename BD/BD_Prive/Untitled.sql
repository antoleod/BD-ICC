1.	Moyenne du nombre de pages des livres (titres) écrits par des auteurs français
    
    SELECT avg(nb_pg*nb_exempl) as nombre_de_pages_moyen
    FROM  auteurs AS a
	JOIN  livres AS l ON a.auteur_id=l.id_auteur
	where a.nationalité in ('Français');    


    
	select distinct genre, avg(nb_pg*nb_exempl) as nombre_de_pages_moyen 
    from livres, auteurs 
    where auteur_id = id_auteur and auteurs.nationalité not in ('Français') and livres.prix >=500 
    group by genre ;


2.	Noms des emprunteurs des livres écrits par Basquin
SELECT emprunteurs.nom
FROM emprunteurs
INNER JOIN livres_empruntés on emprunteurs.emprunteur_id=livres_empruntés.id_emprunteur
INNER JOIN livres on livres.livre_id=emprunteurs.emprunteur_id
INNER JOIN auteurs on livres.livre_id=auteurs.auteur_id
WHERE auteurs.nom='Basquin'


3.	Editeurs des livres dont le nombre d'exemplaires est inférieur à  la moyenne des exemplaires de tous les livres
4.	Nom, nationalité et année de naissance des auteurs des livres empruntés  dont le statut de l'emprunt est "retard"
5.	Le nombre d'ouvrages dont la critique est soit mauvais, soit très mauvais soit nul. Ce nombre sera présenté par type de critique et la colonne reprenant le nombre de chaque type s‘intitulera "total".
6.	Le titre des livres dont le prix est supérieur à  deux fois le prix minimum des livres appartenant au genre 'scolaire'
7.	Année de naissance et nom des auteurs ayant écrit des livres du genre essai ou traité et dont le nombre d'exemplaires est supérieur à 5
