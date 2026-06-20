-- 1-CRIAÇÃO DO BANCO DE DADOS

CREATE DATABASE IF NOT EXISTS loja_veiculos_luxo;
USE loja_veiculos_luxo;



-- 2-CRIAÇÃO DAS TABELAS

-- Tabela Clientes
CREATE TABLE IF NOT EXISTS clientes(
	id_cliente INT PRIMARY KEY AUTO_INCREMENT
    ,nome_completo VARCHAR(100)
    ,cpf CHAR(11) UNIQUE
    ,telefone VARCHAR(20)
    ,estado CHAR(2)
    ,cidade VARCHAR(50)
);

-- Tabela Veículos
CREATE TABLE IF NOT EXISTS veiculos(
	id_veiculo INT PRIMARY KEY AUTO_INCREMENT
    ,marca VARCHAR(50)
    ,modelo VARCHAR(100)
    ,ano INT
    ,categoria VARCHAR(50)
    ,preco DECIMAL(10,2)
    ,status_veiculo VARCHAR(20)
);

-- Tabela Funcionários
CREATE TABLE IF NOT EXISTS funcionarios(
	id_funcionario INT PRIMARY KEY AUTO_INCREMENT
    ,nome VARCHAR(100)
    ,cargo VARCHAR(50)
    ,salario DECIMAL(10,2)
    ,percentual_comissao DECIMAL(5,2)
);

-- Tabela Vendas
CREATE TABLE IF NOT EXISTS vendas(
	id_venda INT PRIMARY KEY AUTO_INCREMENT
    ,id_cliente INT
    ,id_veiculo INT
    ,id_funcionario INT
    ,data_venda DATE
    ,valor_venda DECIMAL(10, 2)
    ,desconto DECIMAL(10, 2)
    
    ,FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
	,FOREIGN KEY (id_veiculo) REFERENCES veiculos(id_veiculo)
    ,FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id_funcionario)
);

-- Tabela Pagamentos
CREATE TABLE IF NOT EXISTS pagamentos(
	id_pagamento INT PRIMARY KEY AUTO_INCREMENT
    ,id_venda INT
    ,forma_pagamento VARCHAR(30)
    ,valor_pago DECIMAL(10,2)
    ,status_pagamento VARCHAR(20)
    ,data_pagamento DATE
    
    ,FOREIGN KEY (id_venda) REFERENCES vendas(id_venda)
);



-- 3-INSERÇÃO DOS DADOS (FEITO POR IA)

-- Tabela Clientes
INSERT INTO clientes
(nome_completo, cpf, telefone, estado, cidade)
VALUES
('Henrique Machado', '12345678901', '(11)99999-1111', 'SP', 'Sao Paulo'),
('Joao Silva', '12345678902', '(11)99999-2222', 'SP', 'Campinas'),
('Maria Oliveira', '12345678903', '(21)99999-3333', 'RJ', 'Niteroi'),
('Pedro Santos', '12345678904', '(31)99999-4444', 'MG', 'Belo Horizonte'),
('Ana Costa', '12345678905', '(41)99999-5555', 'PR', 'Curitiba'),
('Lucas Ferreira', '12345678906', '(51)99999-6666', 'RS', 'Porto Alegre'),
('Juliana Rocha', '12345678907', '(85)99999-7777', 'CE', 'Fortaleza'),
('Bruno Almeida', '12345678908', '(71)99999-8888', 'BA', 'Salvador'),
('Fernanda Lima', '12345678909', '(62)99999-9999', 'GO', 'Goiania'),
('Rafael Martins', '12345678910', '(11)98888-0000', 'SP', 'Santos');

-- Tabela Veículos
INSERT INTO veiculos
(marca, modelo, ano, categoria, preco, status_veiculo)
VALUES
('BMW', 'M5 Competition', 2024, 'Sedan Esportivo', 850000.00, 'Vendido'),
('Porsche', '911 Carrera', 2023, 'Esportivo', 980000.00, 'Vendido'),
('Audi', 'RS6 Avant', 2024, 'Perua Esportiva', 1250000.00, 'Vendido'),
('Mercedes-Benz', 'C63 AMG', 2022, 'Sedan Esportivo', 720000.00, 'Vendido'),
('Ferrari', 'Roma', 2024, 'Esportivo', 2400000.00, 'Vendido'),
('BMW', 'X6 M', 2024, 'SUV', 890000.00, 'Disponivel'),
('Porsche', 'Cayenne Turbo', 2024, 'SUV', 1150000.00, 'Disponivel'),
('Audi', 'R8 Coupe', 2023, 'Esportivo', 1650000.00, 'Disponivel'),
('Mercedes-Benz', 'G63 AMG', 2024, 'SUV', 1800000.00, 'Disponivel'),
('Lamborghini', 'Huracan EVO', 2024, 'Esportivo', 3200000.00, 'Disponivel');

-- Tabela Funcionários
INSERT INTO funcionarios
(nome, cargo, salario, percentual_comissao)
VALUES
('Carlos Mendes', 'Vendedor', 3500.00, 2.50),
('Mariana Souza', 'Vendedora', 4000.00, 3.00),
('Joao Oliveira', 'Gerente', 8000.00, 1.00),
('Fernanda Costa', 'Vendedora', 3800.00, 2.75),
('Rafael Lima', 'Vendedor', 3600.00, 2.00),
('Paula Rocha', 'Vendedora', 3900.00, 2.50),
('Bruno Martins', 'Vendedor', 3700.00, 2.25),
('Ana Pereira', 'Supervisora', 6000.00, 1.50),
('Lucas Almeida', 'Vendedor', 3500.00, 2.50),
('Gabriel Santos', 'Vendedor', 3650.00, 2.25);

-- Tabela Vendas
INSERT INTO vendas
(id_cliente, id_veiculo, id_funcionario, data_venda, valor_venda, desconto)
VALUES
(1, 1, 2, '2026-01-15', 850000.00, 10000.00),
(2, 2, 1, '2026-02-10', 980000.00, 15000.00),
(3, 3, 4, '2026-03-05', 1250000.00, 25000.00),
(4, 4, 5, '2026-03-28', 720000.00, 5000.00),
(5, 5, 2, '2026-04-20', 2400000.00, 50000.00),
(6, 1, 1, '2026-05-10', 840000.00, 5000.00),
(7, 2, 4, '2026-05-18', 950000.00, 10000.00),
(8, 3, 5, '2026-05-25', 1200000.00, 15000.00),
(9, 4, 2, '2026-06-01', 715000.00, 5000.00),
(10, 5, 1, '2026-06-08', 2350000.00, 25000.00);

-- Tabela Pagamentos
INSERT INTO pagamentos
(id_venda, forma_pagamento, valor_pago, status_pagamento, data_pagamento)
VALUES
(1, 'PIX', 840000.00, 'Pago', '2026-01-15'),
(2, 'TED', 965000.00, 'Pago', '2026-02-10'),
(3, 'Financiamento', 1225000.00, 'Pago', '2026-03-06'),
(4, 'PIX', 715000.00, 'Pago', '2026-03-28'),
(5, 'Financiamento', 2350000.00, 'Pendente', '2026-04-20'),
(6, 'TED', 835000.00, 'Pago', '2026-05-10'),
(7, 'PIX', 940000.00, 'Pago', '2026-05-18'),
(8, 'Financiamento', 1185000.00, 'Pago', '2026-05-25'),
(9, 'TED', 710000.00, 'Pago', '2026-06-01'),
(10, 'Financiamento', 2325000.00, 'Pendente', '2026-06-08');



-- 4-CONSULTAS SQL

-- Consultas Simples

-- Quais veiculos estão disponíveis para venda?
SELECT 
	*
FROM loja_veiculos_luxo.veiculos
WHERE status_veiculo = 'Disponivel'

-- Quais clientes moram no estado de São Paulo?
SELECT
	*
FROM loja_veiculos_luxo.clientes
WHERE estado = 'SP'

-- Quais vendas tiveram desconto superior a R$10.000?
SELECT
	*
FROM loja_veiculos_luxo.vendas
WHERE desconto > 10000

-- Operadores Lógicos 

-- Quais veículos são da categoria "SUV" e possuem preço superior a R$1.000.000?
SELECT
	*
FROM loja_veiculos_luxo.veiculos
WHERE categoria = 'SUV' AND preco > 1000000

-- Quais funcionários possuem cargo de "Vendedor" e comissão superior a 2,5%
SELECT
	*
FROM loja_veiculos_luxo.funcionarios
WHERE cargo = 'Vendedor' AND percentual_comissao > 2.50

-- Quais veículos são da marca BMW ou Porsche?
SELECT
	*
FROM loja_veiculos_luxo.veiculos
WHERE marca = 'BMW' OR marca = 'Porsche'

-- Quais pagamentos estão com status "Pendentes" ou foram realizados por Financiamento?
SELECT
	*
FROM loja_veiculos_luxo.pagamentos
WHERE status_pagamento = 'Pendente' OR forma_pagamento = 'Financiamento'

-- Funções de Agregação

-- Quantos veículos existem cadastrados na loja
SELECT
	COUNT(*) AS qtd_total_veiculos
FROM loja_veiculos_luxo.veiculos

-- Qual é o preço médio dos veículos cadastrados?
SELECT
	AVG(preco) AS preco_medio_veiculos
FROM loja_veiculos_luxo.veiculos

-- 5-JOINS

-- Liste o nome do cliente, o veículo comprado e a data da venda
SELECT
	c.nome_completo
    ,v.modelo
    ,vd.data_venda
FROM loja_veiculos_luxo.vendas as vd
INNER JOIN loja_veiculos_luxo.clientes as c
ON vd.id_cliente = c.id_cliente
INNER JOIN loja_veiculos_luxo.veiculos as v
ON vd.id_veiculo = v.id_veiculo

-- Liste o nome do funcionário responsável por cada venda e o valor da venda
SELECT
	f.nome
    ,vd.valor_venda
FROM loja_veiculos_luxo.vendas as vd
LEFT JOIN loja_veiculos_luxo.funcionarios as f
ON vd.id_funcionario = f.id_funcionario

-- Liste o nome do cliente, a forma de pagamento utilizada e o status do pagamento
SELECT
	c.nome_completo
    ,p.forma_pagamento
    ,p.status_pagamento
FROM loja_veiculos_luxo.clientes as c
INNER JOIN loja_veiculos_luxo.vendas as v
ON c.id_cliente = v.id_cliente
INNER JOIN loja_veiculos_luxo.pagamentos as p
ON v.id_venda = p.id_venda

-- Operações Matemáticas

-- Calcule o valor final de cada venda após aplicar o desconto.
SELECT
	(valor_venda - desconto) as valor_final_venda
FROM loja_veiculos_luxo.vendas

-- Calcule o valor da comissão que cada funcionário recebeu em cada venda.
SELECT
	f.nome
    ,vd.valor_venda
	,ROUND((vd.valor_venda * f.percentual_comissao / 100), 2) as comissao_recebida
FROM loja_veiculos_luxo.vendas as vd
INNER JOIN loja_veiculos_luxo.funcionarios as f
ON vd.id_funcionario = f.id_funcionario


