insert into artista_genero (
	id, 
	id_artista, 
	id_genero) 
	values (
	1,
(select id_artista from artista where nome_artista = 'Avenged Sevenfold'),
(select id_genero from genero where genero_musical = 'Metalcore')
);

insert into artista_genero (
	id, 
	id_artista, 
	id_genero) 
	values (
	2,
(select id_artista from artista where nome_artista = 'Biston Maroney'),
(select id_genero from genero where genero_musical = 'Indie Rock')
);

insert into artista_genero (
	id, 
	id_artista, 
	id_genero) 
	values (
	3,
(select id_artista from artista where nome_artista = 'Corey Taylor'),
(select id_genero from genero where genero_musical = 'Hard Rock')
);

insert into artista_genero (
	id, 
	id_artista, 
	id_genero) 
	values (
	4,
(select id_artista from artista where nome_artista = 'Drake'),
(select id_genero from genero where genero_musical = 'Hip-hop/Rap')
);

insert into artista_genero (
	id, 
	id_artista, 
	id_genero) 
	values (
	5,
(select id_artista from artista where nome_artista = 'Jaden'),
(select id_genero from genero where genero_musical = 'Hip-hop/Rap')
);

insert into artista_genero (
	id, 
	id_artista, 
	id_genero) 
	values (
	6,
(select id_artista from artista where nome_artista = 'Jimi Hendrix'),
(select id_genero from genero where genero_musical = 'Rock')
);

insert into artista_genero (
	id, 
	id_artista, 
	id_genero) 
	values (
	7,
(select id_artista from artista where nome_artista = 'Kansas'),
(select id_genero from genero where genero_musical = 'Classic Rock')
);

insert into artista_genero (
	id, 
	id_artista, 
	id_genero) 
	values (
	8,
(select id_artista from artista where nome_artista = 'Mac Ayres'),
(select id_genero from genero where genero_musical = 'Low key')
);

insert into artista_genero (
	id, 
	id_artista, 
	id_genero) 
	values (
	9,
(select id_artista from artista where nome_artista = 'Mountain'),
(select id_genero from genero where genero_musical = 'Rock')
);
