create table cliente(
	cod_cliente serial primary key not null,
	nome_completo varchar(50) not null,
	nome_usuario varchar(15) unique not null,
	senha varchar(8) not null,
	email varchar(30) unique not null,
	cpf varchar(14) unique not null,
	data_nascimento date not nul
);

create table estoque(
	cod_estoque serial primary key not null,
	quantidade_produtos_em_estoque INTEGER not null
);

create table pedido(
	cod_pedido serial primary key not null,
	data_pedido date not null,
	cod_cliente integer,

	 foreign key (cod_cliente) references cliente (cod_cliente)
);

create table categoria(
	cod_categoria serial primary key not null,
	nome varchar(20) not null,
	descrição varchar(50)
);

create table produto(
	cod_produto serial primary key not null,
	nome varchar(20) not null,
	descrição varchar(50),
	data_fabricacao date not null,
	valor_unitario integer not null,
	cod_categoria integer,
	cod_estoque integer,

	 foreign key (cod_categoria) references categoria (cod_categoria),
	 foreign key (cod_estoque) references estoque (cod_estoque)
);

create table produto_pedido(
	cod_produto_pedido serial primary key not null,
	cod_produto integer,
	cod_pedido integer,

	 foreign key (cod_produto) references produto (cod_produto),
	 foreign key (cod_pedido) references pedido (cod_pedido)
);

create table funcionario(
	cod_funcionario serial primary key not null,
	nome_completo varchar(50) not null,
	nome_usuario varchar(15) unique not null,
	senha varchar(8) not null,
	cpf varchar(14) unique not null,
	data_nascimento date not null,
	data_admissao date not null,
	endereco varchar(70) not null
);

create table produto_funcionario(
	cod_produto_funcionario serial primary key not null,
	cod_produto integer,
	cod_funcionario integer,

	 foreign key (cod_produto) references produto (cod_produto),
	 foreign key (cod_funcionario) references funcionario (cod_funcionario)
);

create table envio(
	cod_envio serial primary key not null,
	data_envio date not null,
	cod_pedido integer,
	cod_funcionario integer,

	 foreign key (cod_pedido) references pedido (cod_pedido),
	 foreign key (cod_funcionario) references funcionario (cod_funcionario)
);

create table endereco(
	cod_endereco serial primary key not null,
	cep char(9) not null, 
	logradouro varchar(10),
	lote char(5),
	quadra char(5),
	tipo_moradia varchar(10) not null,	
	complemento varchar(20),
	referencia varchar(50),
	numero varchar(5) not null,
	bairro varchar(20) not null, 
	cidade varchar(20) not null,
	estado varchar(20) not null,
	sigla_estado varchar(2) not null
);

