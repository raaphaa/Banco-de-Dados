create table genero(
	id_genero serial primary key not null,
	genero_musical text
);

create table pais(
	id_pais serial primary key not null,
	sigla text not null,
	nome_pais text
);

create table artista(
	id_artista serial primary key not null,
	nome_artista text,
	popularidade_artista integer,
	seguidores_artista integer
	
);

drop table musica;
-- adicionar coluna de data 
alter table musica add column data_lancamento2 date;
--**errado**alter table musica alter column data_lancamento type integer;
alter table musica drop column  data_lancamento2;

create table musica(
	id_musica serial primary key not null,
	nome_musica text,
	data_lancamento date,
	url text,
	id_artista integer not null,
	-- faço ele apontar para o atributo id que esta dentro de artista
	-- meu atributo local faz referência ao atributo id que está dentro de artista
	foreign key (id_artista) references artista(id_artista)
);
/*create table usuario(
	id_usuario serial primary key not null,
	nome_usuario text
);
*/

create table pais_musica(
	id_pais_musica serial primary key not null,
	id_pais integer not null,
	id_musica integer not null,
	foreign key (id_musica) references musica(id_musica),
	foreign key (id_pais) references pais(id_pais)
);
create table artista_genero(
	id serial primary key not null,
	id_artista integer not null,
	id_genero integer not null,
	foreign key (id_artista) references artista(id_artista),
	foreign key (id_genero) references genero(id_genero)
);
/*create table seguidor(
	id_seguidor serial primary key not null,
	nome_seguidor text
);
*/