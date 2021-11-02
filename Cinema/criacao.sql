create table funcao (
    cod_funcao serial primary key not null,
    nome_funcao text,

    id_horario integer,

    foreign key (id_horario) references horario (cod_horario)

);

create table horario (
    cod_horario serial primary key not null,
    horario time
);

create table funcionario (
    ctps serial primary key not null,
    nome text,
    data_admissao date,
    salario money,
    id_funcao integer,
    foreign key (id_funcao) references funcao (cod_funcao)
);

create table premiacoes (
    cod_premiacoes serial primary key not null,
    premiacoes text,
    data_premiacao date,
    indicacao_premiacao text,
    data_indicacao date
);

create table filme (
    cod_filme serial primary key not null,
    nome_portugues text,
    ano_lancamento date,
    nome_original text,
    diretor text,
    tipo text,
    sinopse text,
    id_premiacao integer,
    id_linguagem integer,
    foreign key (id_premiacao) references premiacoes (cod_premiacoes),
    foreign key (id_linguagem) references linguagem (cod_linguagem)
);

create table linguagem (
    cod_linguagem serial primary key not null,
    linguagem_original text,
    linguagem_legenda_original text,
    linguagem_exibicao text,
    linguagem_legenda_exibicao text
);

create table divulgacao (
    cod_divulgacao serial primary key not null,
    ID_premiacoes integer not null,
    foreign key (ID_premiacoes) references premiacoes (cod_premiacoes)
);

create table rodizio (
    cod_rodizio serial primary key not null,
    id_funcao integer,
    id_funcionario integer,
    id_horario integer,
    foreign key (id_funcao) references funcao (cod_funcao),
    foreign key (id_funcionario) references funcionario (ctps),
    foreign key (id_horario) references horario (cod_horario)

);

create table horario_rodizio (
    cod_horario_rodizio serial primary key not null,
    id_horario integer,
    id_rodizio integer,
    foreign key (id_horario) references horario (cod_horario),
    foreign key (id_rodizio) references rodizio (cod_rodizio)
);

create table cartaz (
    cod_cartaz serial primary key not null,
    id_exibicao integer,
    foreign key (id_exibicao) references exibicao (cod_exibicao)
);

create table exibicao (
    cod_exibicao serial primary key not null,
    id_sala text,
    id_horario integer,
    id_filme integer,
    id_linguagem integer,
    data_exibicao date,
    foreign key (id_sala) references sala (nome),
    foreign key (id_horario) references horario (cod_horario),
    foreign key (id_filme) references filme (cod_filme),
    foreign key (id_linguagem) references linguagem (cod_linguagem)
);

create table sala (
    nome text primary key,
    id_exibicao integer,
    capacidade integer

);