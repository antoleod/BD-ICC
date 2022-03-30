
--	Prix maximum des livres  par genre dont le genre apparaît plusieurs fois (plus d'une fois)
select max(prix), genre from livres group by genre having count(genre) > 1;

	
select max(prix), genre from livres group by genre having max(prix) < 900;
--	Prix maximum des livres  par genre  dont le prix maximum est inférieur à 900

select éditeur from livres group by éditeur having min(prix) < 500;
		Editeurs des livres dont le prix minimum est inférieur à 500