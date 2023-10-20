insert into categorias(tipo) values ('frios'), ('carnes'), ('limpeza');

select * from categorias;

insert into clientes(nome, cpf, endereco, email) values 
('Matheus', '11111111111', 'rua x', 'matheus@gmail.com'),
('Maria', '22222222222', 'rua y', 'maria@gmail.com'),
('Pedro', '33333333333', 'rua a', 'pedro@gmail.com');

select * from clientes;

insert into fornecedores (nome, cnpj, endereco, telefone) values 
('Sadia', '08280831000176', 'rua 123', '11111111'),
('Perdigao', '39349461000100', 'rua 456', '22222222'),
('Frigorifico Sao Joao', '82667338000166', 'rua 789', '33333333');

select * from fornecedores;

insert into funcionarios (nome, setor) values 
('Gisele', 'financeiro'),
('Beatriz', 'vendas'),
('Severino', 'gerente'),
('Claudio', 'comprador');

select * from funcionarios;

insert into produtos (nome, preco, quantidade, categorias_id) values
('Queijo', 10.90, 10, 1),
('Presunto', 10, 5, 1),
('Alcatra', 29.90, 5, 2),
('Sabão em pó', 15, 10, 3);

select * from produtos;

insert into vendas (data, hora, funcionarios_id, clientes_id) values
('2023-10-19', '15:00:00', 2, 1),
('2023-10-20', '16:00:00', 2, 3),
('2023-10-21', '10:00:00', 2, 2);

select * from vendas;

insert into compras(data, hora, funcionarios_id) values 
('2023-10-19', '10:00:00', 4),
('2023-10-15', '15:00:00', 4),
('2023-10-13', '12:00:00', 4);

select * from compras;

insert into compras_has_produtos (compras_id, produtos_id, quantidade, valor_compra) values
(1, 2, 10, 9.99),
(1, 3, 15, 30.00),
(1, 4, 10, 9.99);

select * from compras_has_produtos;

insert into produtos_has_vendas (produtos_id, vendas_id, quantidade, valor_venda) values
(4, 2, 10, 25.00),
(2, 2, 15, 20.00),
(3, 3, 4, 10.00);

select * from produtos_has_vendas;

insert into fornecedores_has_produtos (fornecedores_id, produtos_id, quantidade, valor_compra, un_medida) values
(3, 4, 10, 20.00, 'kg'),
(1, 3, 10, 10.00, 'un'),
(2, 2, 10, 15.00, 'un');

select * from fornecedores_has_produtos;

insert into conta_pagar (data_vencimento, metodo_pagamento, compras_id) values
('2023-11-25', 'PIX', 1),
('2023-11-20', 'CREDITO', 2),
('2023-12-05', 'DINHEIRO', 3);

select * from conta_pagar;

insert into contas_receber (data_vencimento, metodo_pagamento, vendas_id) values
('2023-10-28', 'DINHEIRO', 1),
('2023-10-27', 'PIX', 2),
('2023-11-10', 'CREDITO', 3);

select * from contas_receber;

/* =========================================================
						SELECT
   ========================================================= */
   
# Criar uma consulta para listar o nome do produto, a quantidade vendida, o valor unitário de cada item
select p.nome, v.quantidade, v.valor_venda
from produtos p
join produtos_has_vendas v on v.produtos_id = p.id;

# Criar uma consulta para listar a data da venda e para qual cliente foi realizada a venda
select c.nome as cliente, vd.data as data_venda
from produtos_has_vendas pv
join vendas vd on pv.vendas_id = vd.id
join clientes c on vd.clientes_id = c.id;

# Listar o código, descrição, nome da categoria e nome do fornecedor de produtos
select p.id, p.nome, c.tipo, f.nome
from fornecedores_has_produtos fp
join produtos p on fp.produtos_id = p.id
join categorias c on p.categorias_id = c.id
join fornecedores f on fp.fornecedores_id = f.id;


