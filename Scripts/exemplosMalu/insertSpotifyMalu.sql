insert into pais (sigla, nome_pais) 
	values
		('br', 'Brasil'),
		('pt', 'Portugal'),
		('fr', 'Francês');

insert into artista 
(nome_artista, popularidade_artista, seguidores_artista) 
	values 
		('Malu', 100, 10000);

insert into musica (nome_musica, id_artista) 
	values 
		('Qualquer', 1);
	

insert into musica (nome_musica, url, id_artista) 
values ('Música teste 2', 'https://www.postgresql.org/docs/12/index.html', 
(select id_artista from artista where nome_artista = 'Malu'));


insert into musica (nome_musica, url, id_artista) 
values ('Música teste 2', 'https://www.postgresql.org/docs/12/index.html', 
(select id_artista from artista where nome_artista = 'Malu' limit 1));
