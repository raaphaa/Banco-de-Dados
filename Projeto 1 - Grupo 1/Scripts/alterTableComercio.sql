alter table cliente drop column endereco;

alter table cliente add column cod_endereco integer;

alter table cliente 
add foreign key (cod_endereco) references endereco (cod_endereco);

alter table endereco add column rua varchar(50);

alter table endereco
alter column bairro
type varchar(30);

alter table categoria
alter column nome
type varchar(60);

alter table categoria
alter column descrição
type varchar(100);

alter table endereco
alter column cidade
type varchar(30);

alter table endereco
alter column estado
type varchar(30);

alter table endereco
alter column complemento
type varchar(30);

alter table endereco
alter column tipo_moradia
type varchar(15);

alter table cliente
alter column nome_usuario
type varchar(21);

alter table produto
alter column nome
type varchar(200);

alter table produto drop column descrição;

alter table produto
add column descricao varchar(5000);

alter table produto
alter column valor_unitario
type money;

UPDATE endereco
SET tipo_moradia = 'Casa'
where  tipo_moradia = 'casa';

UPDATE endereco
SET lote = '14'
where  cod_endereco = 10;

UPDATE endereco
SET quadra = '35'
where  cod_endereco = 10;

UPDATE endereco
SET logradouro = 'Avenida'
where  cod_endereco = 13;

UPDATE endereco
SET logradouro = 'Rua'
where  cod_endereco = 12;

alter table cliente
alter column cpf
set unique;

ALTER TABLE cliente ADD CONSTRAINT uni UNIQUE (cpf);