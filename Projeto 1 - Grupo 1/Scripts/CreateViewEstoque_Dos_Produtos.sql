create view estoque_dos_produtos as
select p.nome, e.quantidade_produtos_em_estoque
from produto p , estoque e
where p.cod_produto = e.cod_estoque;