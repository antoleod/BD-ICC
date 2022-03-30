INSERT INTO Auteurs (nom,prénom,nationalité,année_naiss) values 
		('Arsen','Gulen','Turc',1963),
		('Doltrup','Abdul','Turc',1942),
		('Mars','Hilis','Mongol',1913),
		('Vernin','José','Allemand',1875),
		('Helens','David','Lituanien',1943);
		
		
Update emprunteurs set ville='Arlon' where ville='Liège';

Delete from Auteurs where nationalité='turc' and année_naiss > 1950;

Select titre, critique,année_edit from livres order by critique asc, année_edit desc;		
		