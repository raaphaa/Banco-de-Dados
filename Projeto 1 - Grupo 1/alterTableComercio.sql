alter table cliente drop column endereco;

alter table cliente add column cod_endereco integer;

alter table cliente 
add foreign key (cod_endereco) references endereco (cod_endereco);


alter table funcionario drop column endereco;

alter table funcionario add column cod_endereco integer;

alter table funcionario 
add foreign key (cod_endereco) references endereco (cod_endereco);
