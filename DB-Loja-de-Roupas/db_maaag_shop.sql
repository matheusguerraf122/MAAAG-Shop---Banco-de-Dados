-- Criação do Banco de Dados da Loja de Roupas
CREATE DATABASE db_maaag_shop;
USE db_maaag_shop;

-- Criação da Tabela de Clientes para armazenar os dados dos consumidores
CREATE TABLE cliente (
id_cli INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome_cli VARCHAR(100) NOT NULL,
email_cli VARCHAR(50) NOT NULL,
CPF VARCHAR(14)
);

-- Criação da Tabela dos pedidos para registrar as compras dos clientes
CREATE TABLE pedido (
id_pedido INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
id_cli INT NOT NULL,
data_pedido DATE NOT NULL,
valor_total DECIMAL(8,2),
estado VARCHAR(50),
FOREIGN KEY(id_cli) REFERENCES cliente(id_cli)
);

-- Criação da Tabela de pagamentos para administrar as finanças
CREATE TABLE pagamento (
id_pag INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
id_pedido INT NOT NULL,
data_pag DATE NOT NULL,
forma_pag VARCHAR (20),
valor DECIMAL(8,2),
FOREIGN KEY(id_pedido) REFERENCES pedido(id_pedido)
);

-- Criação da tabela fornecedor para registrar os fornecedores das nossas roupas-
CREATE TABLE fornecedor (
id_fornecedor INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome_fornecedor VARCHAR(100) NOT NULL,
CNPJ VARCHAR(20) NOT NULL,
fone VARCHAR(50) NOT NULL,
endereco VARCHAR(100) NOT NULL
);

-- Criação da tabela categoria para organizar as roupas
CREATE TABLE categoria (
id_cat INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome_cat VARCHAR(100) NOT NULL,
descricao_cat VARCHAR(100)
);

-- Criação da tabela produto para registrar as nossas mercadorias
CREATE TABLE produto (
id_prod INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
id_fornecedor INT NOT NULL,
id_cat INT NOT NULL,
nome VARCHAR(100) NOT NULL,
descricao VARCHAR(200) NOT NULL,
cor VARCHAR(50) NOT NULL,
tamanho CHAR(10) NOT NULL,
preco DECIMAL(8,2) NOT NULL,
quantidade INT NOT NULL,
FOREIGN KEY(id_fornecedor) REFERENCES fornecedor(id_fornecedor),
FOREIGN KEY(id_cat) REFERENCES categoria(id_cat)
);

-- Criação da tabela de item_pedido que liga os produtos aos pedidos
CREATE TABLE item_pedido (
id_item INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
id_pedido INT NOT NULL,
id_prod INT NOT NULL,
preco_unit DECIMAL(8,2) NOT NULL,
quantidade_item INT NOT NULL,
FOREIGN KEY(id_pedido) REFERENCES pedido(id_pedido),
FOREIGN KEY(id_prod) REFERENCES produto(id_prod)
);

-- Inserção de clientes e seus respectivos dados
INSERT INTO cliente (id_cli, nome_cli, email_cli, CPF) VALUES
(100, 'Ana Souza', 'ana.souza@email.com', '123.456.789-01'),
(101, 'Bruno Lima', 'bruno.lima@email.com', '234.567.890-12'),
(102, 'Carla Mendes', 'carla.mendes@gmail.com', '345.678.901-23'),
(103, 'Diego Alves', 'diego.alves@email.com', '456.789.012-34'),
(104, 'Elisa Ramos', 'elisa.ramos@hotmail.com', '567.890.123-45'),
(105, 'Felipe Costa', 'felipe.costa@email.com', '678.901.234-56'),
(106, 'Gabriela Nunes', 'gabi.nunes@gmail.com', '789.012.345-67'),
(107, 'Henrique Dias', 'henrique.dias@email.com', '890.123.456-78'),
(108, 'Isabela Freitas', 'isa.freitas@email.com', '901.234.567-89'),
(109, 'João Pedro Martins', 'jp.martins@email.com', '571.981.325-23');

-- Inserção dos fornecedores e suas informações
INSERT INTO fornecedor (id_fornecedor, nome_fornecedor, CNPJ, fone, endereco) VALUES
(400, 'Tecidos Brasília Confecções', '12.345.678/0001-90', '(61) 3333-1111', 'SIA Trecho 3, Brasília - DF'),
(401, 'Jeans & Cia', '23.456.789/0001-01', '(11) 4444-2222', 'Rua do Brás, 1000, São Paulo - SP'),
(402, 'Estilo Feminino Modas', '34.567.890/0001-12', '(21) 3555-3333', 'Rua da Lapa, 50, Rio de Janeiro - RJ'),
(403, 'Malhas do Sul', '45.678.901/0001-23', '(47) 3666-4444', 'Rua XV de Novembro, 10, Blumenau - SC'),
(404, 'Casacos Serra Gaúcha', '56.789.012/0001-34', '(54) 3777-5555', 'Av. Júlio de Castilhos, 200, Caxias do Sul - RS'),
(405, 'Praia Azul Moda Praia', '67.890.123/0001-45', '(85) 3888-6666', 'Av. Beira Mar, 300, Fortaleza - CE'),
(406, 'Intimus Lingerie', '78.901.234/0001-56', '(31) 3999-7777', 'Av. Amazonas, 400, Belo Horizonte - MG'),
(407, 'Alfaiataria Fina', '89.012.345/0001-67', '(62) 3111-8888', 'Rua 10, 500, Goiânia - GO'),
(408, 'Urban Wear Atacado', '90.123.456/0001-78', '(41) 3222-9999', 'Rua XV, 600, Curitiba - PR'),
(409, 'Moda Plus Confecções', '01.234.567/0001-89', '(61) 3444-0000', 'CLN 205, Brasília - DF');

-- Inserção das classes de categorias e suas descrições
INSERT INTO categoria (id_cat, nome_cat, descricao_cat) VALUES
(500, 'Camisetas', 'Camisetas básicas e estampadas'),
(501, 'Camisas', 'Camisas sociais e casuais'),
(502, 'Calças', 'Calças jeans e de alfaiataria'),
(503, 'Bermudas e Shorts', 'Bermudas e shorts casuais e esportivos'),
(504, 'Vestidos', 'Vestidos curtos, midi e longos'),
(505, 'Saias', 'Saias de diversos modelos'),
(506, 'Jaquetas e Casacos', 'Peças para o frio'),
(507, 'Moletons', 'Moletons com e sem capuz'),
(508, 'Moda Praia', 'Biquínis, maiôs e sungas'),
(509, 'Moda Íntima', 'Lingerie e roupas íntimas');

-- Inserção dos produtos e suas características
INSERT INTO produto (id_prod, id_fornecedor, id_cat, nome, descricao, cor, tamanho, preco, quantidade) VALUES
(600, 400, 500, 'Camiseta Básica', 'Camiseta 100% algodão gola redonda', 'Branco', 'M', 49.90, 80),
(601, 400, 500, 'Camiseta Básica', 'Camiseta 100% algodão gola redonda', 'Preto', 'GG', 49.90, 60),
(602, 400, 500, 'Camiseta Estampada', 'Camiseta algodão com estampa gráfica', 'Azul', 'P', 69.90, 40),
(603, 407, 501, 'Camisa Social Slim', 'Camisa social manga longa slim fit', 'Branco', 'M', 129.90, 30),
(604, 407, 501, 'Camisa Xadrez Flanela', 'Camisa de flanela manga longa', 'Vermelho', 'G', 99.90, 25),
(605, 401, 502, 'Calça Jeans Skinny', 'Calça jeans com elastano', 'Azul', '38', 159.90, 35),
(606, 401, 502, 'Calça Jeans Reta', 'Calça jeans corte reto', 'Preto', '42', 169.90, 28),
(607, 407, 502, 'Calça de Alfaiataria', 'Calça de alfaiataria cintura alta', 'Bege', '40', 189.90, 15),
(608, 408, 503, 'Bermuda Jeans', 'Bermuda jeans masculina', 'Azul', '44', 109.90, 22),
(609, 408, 503, 'Short Esportivo Dry Fit', 'Short de treino secagem rápida', 'Preto', 'M', 59.90, 50),
(610, 402, 504, 'Vestido Midi Floral', 'Vestido midi estampa floral', 'Rosa', 'M', 199.90, 20),
(611, 402, 504, 'Vestido Longo Liso', 'Vestido longo de viscose', 'Preto', 'P', 229.90, 0),
(612, 402, 505, 'Saia Plissada', 'Saia midi plissada', 'Verde', 'M', 139.90, 18),
(613, 404, 506, 'Jaqueta Jeans', 'Jaqueta jeans unissex', 'Azul', 'G', 249.90, 12),
(614, 404, 506, 'Casaco de Lã', 'Casaco de lã com botões', 'Cinza', 'M', 299.90, 10),
(615, 403, 507, 'Moletom Canguru', 'Moletom com capuz e bolso', 'Cinza', 'G', 179.90, 45),
(616, 403, 507, 'Moletom Careca', 'Moletom sem capuz felpudo', 'Preto', 'M', 159.90, 38),
(617, 405, 508, 'Biquíni Cortininha', 'Biquíni com regulagem lateral', 'Vermelho', 'P', 89.90, 30),
(618, 405, 508, 'Maiô Liso', 'Maiô com proteção UV', 'Preto', 'M', 119.90, 25),
(619, 406, 509, 'Conjunto Lingerie Renda', 'Conjunto de sutiã e calcinha em renda', 'Branco', 'P', 99.90, 40);

-- Inserção dos pedidos feitos na loja
INSERT INTO pedido (id_pedido, id_cli, data_pedido, valor_total, estado) VALUES
(200, 100, '2024-01-10', 259.70, 'Entregue'),
(201, 101, '2024-01-15', 299.80, 'Entregue'),
(202, 102, '2024-02-03', 199.90, 'Enviado'),
(203, 103, '2024-02-20', 429.80, 'Pago'),
(204, 100, '2024-03-05', 199.70, 'Entregue'),
(205, 104, '2024-03-18', 209.80, 'Cancelado'),
(206, 105, '2024-04-02', 299.90, 'Pendente'),
(207, 106, '2024-04-25', 339.70, 'Entregue'),
(208, 107, '2024-05-12', 419.50, 'Enviado'),
(209, 101, '2024-05-30', 249.70, 'Pago');

-- Inserção dos dados da tabela item_pedido
INSERT INTO item_pedido (id_item, id_pedido, id_prod, preco_unit, quantidade_item) VALUES
(700, 200, 600, 49.90, 2),
(701, 200, 605, 159.90, 1),
(702, 201, 603, 129.90, 1),
(703, 201, 606, 169.90, 1),
(704, 202, 610, 199.90, 1),
(705, 203, 613, 249.90, 1),
(706, 203, 615, 179.90, 1),
(707, 204, 602, 69.90, 2),
(708, 204, 609, 59.90, 1),
(709, 205, 617, 89.90, 1),
(710, 205, 618, 119.90, 1),
(711, 206, 614, 299.90, 1),
(712, 207, 612, 139.90, 1),
(713, 207, 619, 99.90, 2),
(714, 208, 601, 49.90, 3),
(715, 208, 616, 159.90, 1),
(716, 208, 608, 109.90, 1),
(717, 209, 604, 99.90, 2),
(718, 209, 600, 49.90, 1);

-- Inserção dos dados de pagamento
INSERT INTO pagamento (id_pag, id_pedido, data_pag, forma_pag, valor) VALUES
(300, 200, '2024-01-10', 'Pix', 259.70),
(301, 201, '2024-01-15', 'Cartão de Crédito', 299.80),
(302, 202, '2024-02-03', 'Boleto', 199.90),
(303, 203, '2024-02-20', 'Cartão de Crédito', 200.00),
(304, 203, '2024-02-21', 'Pix', 229.80),
(305, 204, '2024-03-05', 'Cartão de Débito', 199.70),
(306, 207, '2024-04-25', 'Pix', 339.70),
(307, 208, '2024-05-12', 'Cartão de Crédito', 200.00),
(308, 208, '2024-05-13', 'Pix', 219.50),
(309, 209, '2024-05-30', 'Boleto', 249.70);

-- Todas as informações dos clientes
SELECT *
FROM cliente;

-- Nome, cor e tamanho dos produtos
SELECT nome, cor, tamanho
FROM produto;

-- Nome, descrição e preço dos produtos
SELECT nome, descricao, preco
FROM produto;

-- Mostra todos os pedidos feitos e suas informações
SELECT *
FROM pedido;

-- Mostra o nome e o CNPJ de todos os fornecedores
SELECT nome_fornecedor, CNPJ
FROM fornecedor;

-- Mostra o nome e a descrição de cada uma das categorias
SELECT nome_cat, descricao_cat
FROM categoria;

-- Mostra os valores e os meios de pagamento de todos os pagamentos
SELECT forma_pag, valor
FROM pagamento;

-- Mostra o número, a data e o status dos pedidos
SELECT id_pedido, data_pedido, estado
FROM pedido;

-- Mostra todas as cores dos produtos sem repetir valores, organizadas em ordem crescente
SELECT DISTINCT cor
FROM produto
ORDER BY cor ASC;

-- Mostra o nome, a cor, o tamanho, o valor total em estoque e o preço com 10% de desconto dos produtos que custam 100 reais ou mais
SELECT nome, cor, tamanho, preco * quantidade as valor_estoque, preco * 0.9 as preco_desconto
FROM produto
WHERE preco>=100;

-- Mostra o nome e a cor dos produtos pretos ou azuis que custam menos de 200 reais e não possuem tamanho P
SELECT nome, cor
FROM produto
WHERE cor IN ('Preto', 'Azul') AND preco<200 AND tamanho<>'P';

-- Mostra a quantidade de produtos cadastrados, o preço médio, o produto mais caro, o produto mais barato e o total de peças em estoque
SELECT COUNT(*) AS quantidade_produtos, AVG(preco) AS preco_medio, MAX(preco) AS produto_mais_caro, MIN(preco) AS produto_mais_barato, SUM(quantidade) AS total_pecas
FROM produto;

-- Mostra o nome, o tamanho e o preço dos produtos que custam entre 50 e 150 reais e possuem tamanho P, M ou G
SELECT nome, tamanho, preco
FROM produto
WHERE preco BETWEEN 50 AND 150 AND (tamanho = 'P' OR tamanho = 'M' OR tamanho = 'G');

-- Mostra a quantidade de produtos e o total de peças em estoque agrupados por cor, exibindo apenas as cores com pelo menos 3 produtos e ordenando pela maior quantidade de produtos
SELECT cor, COUNT(*) AS quantidade_produtos, SUM(quantidade) AS total_pecas
FROM produto
GROUP BY cor
HAVING COUNT(*)>=3
ORDER BY quantidade_produtos DESC;

-- Mostra o nome, a cor e o tamanho dos produtos junto com o nome de suas categorias e fornecedores
SELECT produto.nome, produto.cor, produto.tamanho, categoria.nome_cat, fornecedor.nome_fornecedor
FROM produto
JOIN categoria
ON categoria.id_cat = produto.id_cat
JOIN fornecedor
ON produto.id_fornecedor = fornecedor.id_fornecedor;

-- Mostra o nome dos produtos que nunca foram adicionados a nenhum pedido
SELECT produto.nome
FROM produto
LEFT JOIN item_pedido
ON produto.id_prod = item_pedido.id_prod
WHERE item_pedido.id_prod IS NULL;

-- Cria uma trigger que diminui automaticamente a quantidade em estoque quando um produto é adicionado a um pedido
DELIMITER $$
CREATE TRIGGER baixa_estoque
AFTER INSERT ON item_pedido
FOR EACH ROW
BEGIN
    UPDATE produto
    SET quantidade = quantidade - NEW.quantidade_item
    WHERE id_prod = NEW.id_prod;
END $$
DELIMITER ;

-- Cadastra um novo pedido para o cliente 109
INSERT INTO pedido (id_pedido, id_cli, data_pedido, valor_total, estado) VALUES
(210, 109, '2024-06-10', 99.80, 'Pendente');

-- Consulta o estoque atual do produto de código 600 antes de adicioná-lo ao pedido
SELECT id_prod, nome, quantidade
FROM produto
WHERE id_prod = 600;

-- Adiciona 2 unidades do produto de código 600 ao pedido de código 210
INSERT INTO item_pedido (id_item, id_pedido, id_prod, preco_unit, quantidade_item) VALUES
(719, 210, 600, 49.90, 2);

-- Consulta novamente o estoque do produto de código 600 para verificar se a trigger realizou a baixa automática
SELECT id_prod, nome, quantidade
FROM produto
WHERE id_prod = 600;

-- Cria uma trigger que impede o cadastro de produtos com preço menor ou igual a zero ou quantidade negativa
DELIMITER $$
CREATE TRIGGER validar_produto
BEFORE INSERT ON produto
FOR EACH ROW
BEGIN
    IF NEW.preco <= 0 OR NEW.quantidade < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Erro: preço deve ser maior que zero e a quantidade não pode ser negativa';
    END IF;
END $$
DELIMITER ;

-- Cadastra um produto com preço e quantidade válidos para testar a trigger de validação
INSERT INTO produto (id_prod, id_fornecedor, id_cat, nome, descricao, cor, tamanho, preco, quantidade) VALUES
(620, 403, 500, 'Camiseta Polo', 'Camiseta polo piquet manga curta', 'Azul', 'M', 89.90, 20);

-- Consulta os dados do produto cadastrado para verificar se a inserção foi realizada corretamente
SELECT id_prod, nome, preco, quantidade
FROM produto
WHERE id_prod = 620;

-- Tenta cadastrar um produto com preço igual a zero para testar se a trigger impede a inserção de valores inválidos
INSERT INTO produto (id_prod, id_fornecedor, id_cat, nome, descricao, cor, tamanho, preco, quantidade) VALUES
(621, 400, 500, 'Camiseta Defeito', 'Camiseta com preço inválido', 'Preto', 'M', 0.00, 10);

-- Cria uma trigger que verifica se existe estoque suficiente antes de adicionar um produto a um pedido
DELIMITER $$
CREATE TRIGGER validar_estoque
BEFORE INSERT ON item_pedido
FOR EACH ROW
BEGIN
    DECLARE estoque_atual INT;
    SELECT quantidade
    INTO estoque_atual
    FROM produto
    WHERE id_prod = NEW.id_prod;

    IF NEW.quantidade_item > estoque_atual THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Erro: estoque insuficiente para realizar o pedido';
    END IF;
END $$
DELIMITER ;

-- Consulta o estoque atual do produto de código 611 antes de realizar a inserção no pedido
SELECT id_prod, nome, quantidade
FROM produto
WHERE id_prod = 611;

-- Tenta adicionar uma unidade do produto de código 611 ao pedido 210, verificando se existe estoque suficiente
INSERT INTO item_pedido (id_item, id_pedido, id_prod, preco_unit, quantidade_item) VALUES
(720, 210, 611, 229.90, 1);

-- Cria uma trigger que atualiza o status do pedido para Pago quando a soma dos pagamentos atinge ou ultrapassa o valor total do pedido
DELIMITER $$
CREATE TRIGGER atualizar_pedido
AFTER INSERT ON pagamento
FOR EACH ROW
BEGIN
    DECLARE total_pago DECIMAL(10,2);
    DECLARE valor_pedido DECIMAL(10,2);
    -- Calcula a soma de todos os pagamentos realizados para o pedido
    SELECT SUM(valor)
    INTO total_pago
    FROM pagamento
    WHERE id_pedido = NEW.id_pedido;
    -- Busca o valor total do pedido que recebeu o pagamento
    SELECT valor_total
    INTO valor_pedido
    FROM pedido
    WHERE id_pedido = NEW.id_pedido;
    -- Atualiza o status do pedido para Pago quando o valor recebido é suficiente
    IF total_pago >= valor_pedido THEN
        UPDATE pedido
        SET estado = 'Pago'
        WHERE id_pedido = NEW.id_pedido;
    END IF;
END $$
DELIMITER ;

-- Consulta o valor total e o status atual do pedido de código 206 antes de inserir um pagamento
SELECT id_pedido, valor_total, estado
FROM pedido
WHERE id_pedido = 206;

-- Registra um pagamento via Pix no valor de 299,90 reais para o pedido de código 206
INSERT INTO pagamento (id_pag, id_pedido, data_pag, forma_pag, valor) VALUES
(310, 206, '2024-04-03', 'Pix', 299.90);

-- Consulta novamente o valor total e o status do pedido para verificar se a trigger atualizou seu estado
SELECT id_pedido, valor_total, estado
FROM pedido
WHERE id_pedido = 206;

-- Cria uma função que calcula o preço de um produto após aplicar um percentual de desconto informado
DELIMITER $$
CREATE FUNCTION fn_preco_desconto(
    p_preco DECIMAL(8,2),
    p_percentual DECIMAL(5,2)
)
RETURNS DECIMAL(8,2)
DETERMINISTIC
BEGIN
    DECLARE preco_final DECIMAL(8,2);

    -- Calcula o preço final subtraindo o percentual de desconto do preço original
    SET preco_final = p_preco - (p_preco * p_percentual / 100);

    -- Retorna o preço com desconto aplicado
    RETURN preco_final;
END $$
DELIMITER ;

-- Executa a função para calcular o preço de 199,90 reais com 15% de desconto
SELECT fn_preco_desconto(199.90, 15) AS preco_final;

-- Mostra o nome e o preço original dos produtos da categoria 500 junto com seus preços após a aplicação de 10% de desconto
SELECT nome, preco, fn_preco_desconto(preco, 10) AS preco_com_desconto
FROM produto
WHERE id_cat = 500;

-- Cria uma função que calcula o valor total de um pedido com base nos preços e nas quantidades de seus itens
DELIMITER $$
CREATE FUNCTION fn_total_pedido(
    p_id_pedido INT
)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);
    -- Soma o preço unitário multiplicado pela quantidade de cada item do pedido informado
    SELECT SUM(preco_unit * quantidade_item)
    INTO total
    FROM item_pedido
    WHERE id_pedido = p_id_pedido;

    -- Retorna o total calculado ou zero caso o pedido não possua itens
    RETURN IFNULL(total, 0);
END $$
DELIMITER ;

-- Executa a função para calcular o valor total dos itens do pedido de código 200
SELECT fn_total_pedido(200) AS total_pedido_200;

-- Mostra o código e o valor total registrado de cada pedido junto com o valor calculado pela função
SELECT id_pedido, valor_total, fn_total_pedido(id_pedido) AS total_calculado
FROM pedido;

-- Cria uma procedure que consulta os produtos de acordo com a cor e o tamanho informados
DELIMITER $$
CREATE PROCEDURE pprodutos_por_cor_tamanho(
    IN p_cor VARCHAR(50),
    IN p_tamanho VARCHAR(10)
)
BEGIN
    -- Mostra os produtos que possuem a cor e o tamanho recebidos como parâmetros
    SELECT nome, cor, tamanho, preco, quantidade
    FROM produto
    WHERE cor = p_cor AND tamanho = p_tamanho;
END $$
DELIMITER ;

-- Executa a procedure para consultar os produtos de cor preta e tamanho M
CALL pprodutos_por_cor_tamanho('Preto', 'M');

-- Cria uma procedure que calcula o total gasto por um cliente, desconsiderando os pedidos cancelados, e retorna o resultado por um parâmetro de saída
DELIMITER $$
CREATE PROCEDURE ptotal_gasto_cliente(
    IN p_id_cli INT,
    OUT p_total DECIMAL(8,2)
)
BEGIN
    -- Soma os valores totais dos pedidos não cancelados do cliente informado e armazena o resultado no parâmetro de saída
    SELECT IFNULL(SUM(valor_total), 0)
    INTO p_total
    FROM pedido
    WHERE id_cli = p_id_cli AND estado <> 'Cancelado';
END $$
DELIMITER ;

-- Executa a procedure para calcular o total gasto pelo cliente de código 100 e armazena o resultado na variável @total
CALL ptotal_gasto_cliente(100, @total);

-- Mostra o total gasto pelo cliente armazenado na variável @total
SELECT @total AS total_gasto;
