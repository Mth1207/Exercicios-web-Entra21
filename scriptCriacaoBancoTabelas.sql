create database exercicios_entra21;

use exercicios_entra21;

create table clientes (
	id int not null primary key auto_increment,
    nome varchar(45) not null,
    cpf varchar(11) not null,
    endereco varchar(45) not null,
    email varchar(100)
);

create table categorias (
	id int not null primary key auto_increment,
    tipo varchar(45) not null
);

create table produtos (
	id int not null primary key auto_increment,
    nome varchar(50) not null,
    descricao varchar(100) not null,
    preco decimal(8, 2) not null,
    quantidade int not null,
    categorias_id int not null,
    constraint fk_produtos_categorias foreign key (categorias_id) references categorias(id)
);

create table funcionarios (
	id int not null primary key auto_increment,
    nome varchar(45) not null,
	setor varchar(45) not null
);

create table compras (
	id int not null primary key auto_increment,
    data date not null,
    hora varchar(10) not null,
    funcionarios_id int not null,
	constraint fk_compras_funcionarios foreign key (funcionarios_id) references funcionarios(id)
);

create table vendas (
	id int not null primary key auto_increment,
	data date not null,
    hora varchar(45) not null,
    funcionarios_id int not null,
    clientes_id int not null,
    constraint fk_vendas_funcionarios foreign key (funcionarios_id) references funcionarios(id),
    constraint fk_vendas_clientes foreign key (clientes_id) references clientes(id)
);

create table fornecedores (
	id int not null primary key auto_increment,
    nome varchar(100) not null,
    cnpj varchar(14) not null,
    endereco varchar(45) not null,
    telefone varchar(30)
);

create table compras_has_produtos (
	compras_id int not null,
    produtos_id int not null,
    quantidade decimal not null,
    valor_compra decimal(8, 2) not null,
    constraint fk_compras_has_produtos_compras foreign key (compras_id) references compras(id),
    constraint fk_compras_has_produtos_produtos foreign key (produtos_id) references produtos(id)
);

create table fornecedores_has_produtos (
	fornecedores_id int not null,
    produtos_id int not null,
    quantidade decimal not null,
    valor_compra decimal(8, 2) not null,
    un_medida varchar(45) not null,
    constraint fk_fornecedores_has_produtos_fornecedores foreign key (fornecedores_id) references fornecedores(id),
    constraint fk_fornecedores_has_produtos_produtos foreign key (produtos_id) references produtos(id)
);

create table produtos_has_vendas (
	produtos_id int not null,
    vendas_id int not null,
    quantidade decimal not null,
    valor_venda decimal(8, 2) not null,
    constraint fk_produtos_has_vendas_produtos foreign key (produtos_id) references produtos(id),
    constraint fk_produtos_has_vendas_vendas foreign key (vendas_id) references vendas(id)
);

create table conta_pagar (
	id int not null primary key auto_increment,
    data_vencimento date not null,
    metodo_pagamento varchar(45) not null,
    compras_id int not null,
    constraint fk_contas_pagar_compras foreign key (compras_id) references compras(id)
);

create table contas_receber (
	id int not null primary key auto_increment,
    data_vencimento date not null,
    metodo_pagamento varchar(45) not null,
    vendas_id int not null,
    constraint fk_contas_receber_vendas foreign key (vendas_id) references vendas(id)
);
