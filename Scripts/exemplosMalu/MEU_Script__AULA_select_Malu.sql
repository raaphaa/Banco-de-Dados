
--  ; não é necessário mas separa os blocos de código
-- as é opcional

-- * = seleciona todos os atributos.
select * from artista artista;

-- seleciona o atributo nome.
select nome from artista;

-- seleciona os atributos nome e popularidade da tabela artista
select nome, popularidade from artista;

-- seleciona  o atributo nome da tabela musica
select nome from musica;

-- seleciona  o atributo nome da tabela musica onde o id = 120
select nome from musica 
	where 
		id = 120;

--seleciona as músicas entre os ids 100 e 200
select nome from musica 
	where 
		id >= 100 and id <= 200;
		
--Selecionar os artistas ordenando por popularidade do maior para o menor
select nome, popularidade from artista 
	order by popularidade desc;

--selecionar sem apelido as musicas e seus respectivos artistas
select artista.nome, musica.nome   -- alguma coisa
from artista artista, musica musica  -- algum lugar
where artista.id = musica.id_artista -- regra de conexão entre PK e FK

--selecionar com apelido as musicas e seus respectivos artistas
select a.nome, m.nome  
from artista a, musica m 
where a.id = m.id_artista 

--selecionar com apelido as musicas, popularidade e seus respectivos artistas
select a.nome, a.popularidade, m.nome   
from artista a, musica m  
where a.id = m.id_artista

--selecionar uma musica específica e seu respectivo artista
select a.nome, m.nome   
from artista a, musica m 
where a.id = m.id_artista 
and -- regra de filtragem 
a.nome = 'Bruno Mars'

--selecionar uma musica específica 
-- seu respectivo artista com popularidade e seguidores
select a.nome, a.popularidade, a.seguidores, m.nome   
from artista a, musica m 
where a.id = m.id_artista 
and -- regra de filtragem 
a.nome = 'Bruno Mars'

-- selecionar algo que começa com k e não importa o que vem depois
select a.nome, a.popularidade, a.seguidores, m.nome -- alguma coisa
from artista a, musica m -- algum lugar
	where 
		a.id = m.id_artista -- regra de conexão entre chave primaria e chave estrangeira
	and 
		a.nome like 'K%'-- regra de filtro
-- 'K%' Começar com k e não importa o que vem depois
-- '%k' Terminar com k e não importa o que vem antes
-- '%k%' Não importa o que vem antes ou depois, tem que ter um k

--selecionar uma musica específica 
-- seu respectivo artista com popularidade e seguidores
select a.nome, a.popularidade, a.seguidores, m.nome   
from artista a, musica m 
	where 
		a.id = m.id_artista 
	and 
		a.nome like 'R%'

-- Todos os artistas que tenham r e popularidade > 80, buscando o nome da música
select a.nome, m.nome, a.popularidade
from artista a, musica m
where a.id = m.id_artista -- regra que coencta as tabelas
and a.popularidade > 80
and LOWER(a.nome) --tudo em minusculo
like '%r%'


-- Todos os artistas que tenham r e popularidade > 80, buscando o nome da música
-- e o gênero
/*se estiver na tabela não precisa selecionar 
 * algo para utilizar uma regra ex.: popularidade
 * 
 * select a.nome, m.nome, g.nome
 * from artista a, musica m, genero g, artista_genero ag, popularidade.a
 * where a.id = m.id_artista -- regra que conecta as tabelas
 * and a.id = ag.id_artista -- regra que conecta as tabelas
 * and g.id = ag.id_genero -- regra que conecta as tabelas
 * and a.popularidade > 80
 * and a.nome like '%r%'
 * 
 */

select a.nome, m.nome, g.nome
from artista a, musica m, genero g, artista_genero ag
where a.id = m.id_artista -- regra que conecta as tabelas
and a.id = ag.id_artista -- regra que conecta as tabelas
and g.id = ag.id_genero -- regra que conecta as tabelas
and a.popularidade > 80
and a.nome like '%r%'

/* voltar depois
-- Selecionar nome da música e o nome do país especifico em que ela toca

select a.nome, m.nome, p.nome
from artista a, musica m, pais p , pais_musica pm
where a.id = m.id_artista 
and a.id = pm.id_musica 
and p.id = p.id_pais
and a.popularidade > 80
and p.sigla like '%ad%'

select m.nome nome_musica, 
		p.nome nome_pais
from musica m, pais p, pais_musica pm 
where m.id = pm.id_musica 
and p.id = pm.id_pais
and p.sigla like 'br'
select a.nome, m.nome, p.nome
from artista a, musica m, pais p , pais_musica pm
where a.id = m.id_artista 
and a.id = pm.id_musica 
and p.id = pm.id_musica
and a.popularidade > 80



select m.nome nome_musica, 
		p.nome nome_pais
from musica m, pais p, pais_musica pm 
where m.id = pm.id_musica 
and p.id = pm.id_pais
and p.sigla like 'br'
select a.nome, m.nome, p.nome
from artista a, musica m, pais p , pais_musica pm
where a.id = m.id_artista 
and a.id = pm.id_musica 
and p.id = pm.id_musica
and a.popularidade > 80

*/

select m.nome nome_musica, 
		p.nome nome_pais
from musica m, pais p, pais_musica pm 
where m.id = pm.id_musica 
and p.id = pm.id_pais
and p.sigla like 'br';

-------------------------------------------------------------
-- Selecionar o total de registros na tabela genero

select count (*)--contagem mais simples, para ver o n° de linhas na tabela
	from genero;
	
	
	-- Selecionar a quantidade de músicas cadastradas em cada país
select count(m.id) qtd_musicas, -- fun. agregação para contar a qntd de ids
		p.nome nome_pais
from musica m, pais p, pais_musica pm 
where m.id = pm.id_musica -- regra de conexão
and p.id = pm.id_pais -- regra de conexão
group by p.nome ;-- critério de agrupamento

/* dando erro
--selecionar a quantidade de musicas cadastradas em cada pais 
select count(m.id) qtd musicas, --fun. de agregação para contar a qnt de ids
			p.nome nome_pais
	from musica m, pais p , pais_musica pm 
		where m.id = pm.id_musica 
		and p.id = pm.id_pais
	group by p.nome
	*/

--selecionar a qnt de musicas para cada artista em ordem decrescente
select count(m.id) as qntd_musicas, 
	a.nome, 
	a.seguidores, 
	a.popularidade 
from artista a, 
	musica m 
where a.id = m.id_artista 
group by a.nome
order by qntd_musicas desc;


****************
--selecionar a qnt de musicas para cada artista em ordem crescente
select count(m.id) as qntd_musicas, 
	a.nome, 
	a.seguidores, 
	a.popularidade 
from artista a, 
	musica m 
where a.id = m.id_artista 
group by a.nome;

-- Selecionar o artista que tem o maior número de streams e a música
select a.nome, 
	pm.streams as top_streams, 
	m.nome as musica,
	p.nome as pais
from artista a, musica m, pais_musica pm, pais p
where a.id = m.id_artista
and pm.id_musica = m.id
and pm.id_pais = p.id
and m.nome = '4 AM';

-- Recuperar a planilha inspiração
-- recupera tudo
-- as é opcional

select a.nome as artista,
	m.nome as musica,
	m.url,
	p.sigla,
	pm.streams,
	a.popularidade,
	a.seguidores, 
	g.nome as genero
from artista a,
	musica m,
	genero g,
	artista_genero ag,
	pais_musica pm,
	pais p
where p.id = pm.id_pais -- 1 conexao
and pm.id_musica = m.id -- 2 conexao
and m.id_artista = a.id -- 3 conexao
and a.id = ag.id_artista  -- 4 conexao
and ag.id_genero = g.id -- 5 conexao
order by a.nome

/*
- ALTER table para adicionar o atributo novo
- ALTER TABLE <nome_tabela>
   ADD CONSTRAINT fk_algumNome
   FOREIGN KEY (id_tabela_exemplo) 
   REFERENCES tabela_exemplo(id);

create table genero(
	id serial primary key not null,
	nome text
);
*/
