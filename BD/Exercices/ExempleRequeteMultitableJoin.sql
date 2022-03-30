select distinct nom, prénom from auteurs join livres on id_auteur = auteur_id and critique = 'bon'  OU

select distinct nom, prénom from auteurs join livres on id_auteur = auteur_id where critique = 'bon' and nb_pg > 500 ;