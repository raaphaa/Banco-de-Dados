select  cli.nome_completo as cliente,
		cli.cpf ,
		ende.cep,
		ped.cod_pedido,
		ped.data_pedido,
		prod.cod_produto,
		prod.nome as produto,
		prod.valor_unitario,
		en.cod_envio,
		en.data_envio,
		cat.nome as categoria,
		f.nome_completo as funcionario
from envio en
left join pedido ped on ped.cod_pedido = en.cod_pedido
left join cliente cli on cli.cod_cliente = ped.cod_cliente 
left join endereco ende on ende.cod_endereco = cli.cod_endereco
left join produto_pedido pp on pp.cod_pedido = ped.cod_pedido 
left join produto prod on prod.cod_produto = pp.cod_produto
left join produto_funcionario pf on pf.cod_produto = prod.cod_produto
left join funcionario f on f.cod_funcionario = pf.cod_funcionario 
left join categoria cat on cat.cod_categoria = prod.cod_categoria 
group by cli.nome_completo,
		cli.cpf,
		ende.cep,
		ped.cod_pedido,
		ped.data_pedido,
		prod.cod_produto,
		prod.nome,
		prod.valor_unitario,
		en.cod_envio,
		en.data_envio,
		cat.nome,
		f.nome_completo;