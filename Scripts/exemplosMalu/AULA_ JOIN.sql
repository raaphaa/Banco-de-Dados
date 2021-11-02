-- tabela da esquerda é a que fica perto do from
--ex:
/*
select nome_coluna from tabela_1    --tabela a esquerda
right | left | full join  tabela_2  --tabela a direita
		ON tabela_1.nome_coluna = tabela_2.nome_coluna;
*/
-- Junções
-- INNER JOIN (interseção)
select a.nome, a.popularidade, a.seguidores, m.nome -- alguma coisa
from artista a -- algum lugar
inner join musica m on m.id_artista = a.id; -- conexao
-- isso é a mesma coisa que: where a.id = m.id_artista

select a.nome, a.popularidade, a.seguidores, m.nome -- alguma coisa
from artista a -- algum lugar   --- tabela mais a esquerda
inner join musica m on m.id_artista = a.id -- conexao
-- isso é a mesma coisa que: where a.id = m.id_artista
where a.nome like 'K%' ;

select a.nome, a.popularidade, a.seguidores, m.nome 
from artista a 
inner join musica m on m.id_artista = a.id
where a.nome like'k%';

-- Selecionar a quantidade de músicas cadastradas em cada país
select count(m.id), p.nome
from musica m
inner join pais_musica pm on pm.id_musica = m.id -- 1 conexao
inner join pais p on p.id = pm.id_pais 
group by p.nome

---
insert into artista (nome, popularidade, seguidores)
values ('Malu', 80, 36), ('Raphaela', 100, 36), ('Lucas', 100, 36),
('Naiara', 100, 36), ('Marcella', 100, 36)


--
select count(*) from artista a 
--
select count(m.id) as qntd_musicas,
		a.nome,
		a.popularidade,
		a.seguidores
	from artista a 
	left join musica m on m.id_artista = a.id
	group by a.nome
	order by a.popularidade desc, a.seguidores desc;

select a.nome,
	a.popularidade,
	a.seguidores, 
	m.nome nome_musica,
	p.nome nome_pais
from artista a -- traz tudo da tabela artista, essa é sempre a tabela da esquerda
left join musica m on m.id_artista = a.id -- independente se tem música ou não
left join pais_musica pm on pm.id_musica = m.id 
left join pais p on p.id = pm.id_pais
group by a.nome
order by a.popularidade desc, a.seguidores desc;
