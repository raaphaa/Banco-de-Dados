select 	prod.nome as produto,
		prod.descricao as descrição,
		cat.nome as categoria,
		prod.data_fabricacao,
		prod.valor_unitario,
		e.quantidade_produtos_em_estoque as estoque
from produto prod
left join categoria cat on cat.cod_categoria = prod.cod_categoria 
left join estoque e on e.cod_estoque = prod.cod_estoque 
group by prod.nome,
		prod.descricao,
		cat.nome,
		prod.data_fabricacao,
		prod.valor_unitario,
		e.quantidade_produtos_em_estoque