select a.nome_artista , g.genero_musical 
from artista a, genero g
where a.id_artista = g.id_genero;

--selecionar com apelido as musicas e seus respectivos artistas
select a.nome, m.nome  
from artista a, musica m 
where a.id = m.id_artista 