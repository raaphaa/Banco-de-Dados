create view dados_gerais as
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
