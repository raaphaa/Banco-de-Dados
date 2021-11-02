create view NotaFiscal_pedido_5 as 
select  cli.nome_completo as cliente,
		cli.cpf,
		ende.cep,
		ped.cod_pedido,
		ped.data_pedido,
		prod.cod_produto,
		prod.nome as produto,
		pp.quantidade_itens_pedido,
		prod.valor_unitario,
		en.cod_envio,
		en.data_envio,
		cat.nome as categoria,
		f.nome_completo as funcionario,
	(select count(cod_pedido) as produtos_no_pedido
	from produto_pedido
	where cod_pedido = 5),
		(select sum(p.valor_unitario * pp.quantidade_itens_pedido) as total_do_pedido
		from produto_pedido pp
		inner join produto p on p.cod_produto = pp.cod_produto
		where pp.cod_pedido = 5)
from envio en
left join pedido ped on ped.cod_pedido = en.cod_pedido
left join cliente cli on cli.cod_cliente = ped.cod_cliente 
left join endereco ende on ende.cod_endereco = cli.cod_endereco
left join produto_pedido pp on pp.cod_pedido = ped.cod_pedido 
left join produto prod on prod.cod_produto = pp.cod_produto
left join produto_funcionario pf on pf.cod_produto = prod.cod_produto
left join funcionario f on f.cod_funcionario = pf.cod_funcionario 
left join categoria cat on cat.cod_categoria = prod.cod_categoria 
where en.cod_pedido in 
		(select ped.cod_pedido
		from pedido ped
		inner join envio en on en.cod_pedido = ped.cod_pedido
		where en.cod_pedido = 5)
group by cli.nome_completo,
		cli.cpf,
		ende.cep,
		ped.cod_pedido,
		ped.data_pedido,
		prod.cod_produto,
		prod.nome,
		pp.quantidade_itens_pedido,
		prod.valor_unitario,
		en.cod_envio,
		en.data_envio,
		cat.nome,
		f.nome_completo