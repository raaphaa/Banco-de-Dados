create view produtos_geridos_por_funcionario as
select count(p.cod_produto) as produtos_geridos_por_funcionario, 
		f.nome_completo as funcionario 
from produto p
left join produto_funcionario pf on pf.cod_produto = p.cod_produto
left join funcionario f on f.cod_funcionario = pf.cod_funcionario
group by f.nome_completo,
		f.nome_completo ;