-	Les divers genres des livres ;
Select distinct genre from livres;

-	Les titres des livres écrits avant 1970 ;
SELECT titre from livres where année_edit < 1970;

-	Les éditeurs des livres dont le prix est supérieur à 600 ;
SELECT distinct éditeur from livres where prix > 600;

-	Le genre des livres dont le nombre de pages est compris entre 451 et 1256 inclus ;
select distinct genre from livres where nb_pg between 451 and 1256;
select distinct genre from livres where nb_pg >= 451 and nb_pg <=1256;

-	Le titre et l’éditeur des livres  dont le genre est soit scolaire, soit essai, soit roman ;
select titre, éditeur from livres where genre="scolaire" or genre="essai" or genre="roman";
select titre, éditeur from livres where genre in ("essai","scolaire","roman");
select titre, éditeur from livres where genre not in ("traité","sexe");
select titre, éditeur from livres where genre <> "traité" and genre <> "sexe";
select titre, éditeur from livres where genre not like "traité" and genre not like "sexe";
select titre, éditeur from livres where genre like "scolaire" or genre like"essai" or genre like "roman";

-	Nationalité des auteurs dont nom comprend la lettre ‘r’ ;
select distinct nationalité from auteurs where nom like "%r%";

-	Date de naissance des auteurs qui ne sont ni Français, ni Belge ;
select année_naiss from auteurs where nationalité <> "Français" and nationalité<>"belge";
select année_naiss from auteurs where nationalité not in ("belge","français");
select année_naiss from auteurs where nationalité in ("allemand","américain");
select année_naiss from auteurs where nationalité like "allemand" or nationalité like "américain";
select année_naiss from auteurs where nationalité  not like "belge" and nationalité not like "français";

-	Titre des livres dont la critique est bon, excellent ou très bon et dont le nombre d’exemplaires est inférieur à 10 ;
select titre from livres where (critique ="bon" or critique ="excellent" or critiqu e="très bon") and nb_exempl < 10;
select titre from livres where critique <> "la bible" and critique <> "mauvais" and critique <> "très mauvais" and critique <> "nul" and nb_exempl < 10;
select titre from livres where critique in("bon" ,"excellent","très bon") and nb_exempl < 10;
select titre from livres where critique not in ("la bible", "mauvais" , "très mauvais" , "nul") and nb_exempl < 10;
select titre from livres where (critique like "bon" or critique like "excellent" or critique like "très bon") and nb_exempl < 10;
select titre from livres where critique not like "la bible" and critique  not like "nul" and critique  not like "très mauvais" and critique  not like "très mauvais" and nb_exempl < 10;

-	Le titre et le genre des livres empruntés édités après 1900 et dont le prix est supérieur à 500 ;
select titre, genre from livres where emprunté = 1 and année_edit > 1900 and prix > 500;
select titre, genre from livres where emprunté <> 0 and année_edit > 1900 and prix > 500;