-- Criação do banco de dados
CREATE DATABASE sistema_treino;

-- Usando o banco de dados
USE sistema_treino;

-- Criação da tabela de Usuários
CREATE TABLE usuarios (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    data_nascimento DATE,
    data_criacao DATETIME DEFAULT GETDATE()
);

-- Criação da tabela de Produtos
CREATE TABLE produtos (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10, 2) NOT NULL,
    estoque INT DEFAULT 0
);

-- Criação da tabela de Pedidos
CREATE TABLE pedidos (
    id INT IDENTITY(1,1) PRIMARY KEY,
    id_usuario INT,
    data_pedido DATETIME DEFAULT GETDATE(),
    total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id)
);

-- Criação da tabela de Itens de Pedido
CREATE TABLE itens_pedido (
    id INT IDENTITY(1,1) PRIMARY KEY,
    id_pedido INT,
    id_produto INT,
    quantidade INT,
    preco_unitario DECIMAL(10, 2),
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id),
    FOREIGN KEY (id_produto) REFERENCES produtos(id)
);

-- Inserindo 10 usuários
INSERT INTO usuarios (nome, email, senha, data_nascimento) VALUES
('João Silva', 'joao.silva@example.com', 'senha123', '1990-04-15'),
('Maria Oliveira', 'maria.oliveira@example.com', 'senha456', '1985-07-22'),
('Carlos Pereira', 'carlos.pereira@example.com', 'senha789', '1992-11-30'),
('Ana Costa', 'ana.costa@example.com', 'senha101', '1994-01-25'),
('Lucas Santos', 'lucas.santos@example.com', 'senha112', '1988-03-10'),
('Fernanda Almeida', 'fernanda.almeida@example.com', 'senha113', '1987-06-12'),
('Rafael Lima', 'rafael.lima@example.com', 'senha114', '1993-02-05'),
('Juliana Rocha', 'juliana.rocha@example.com', 'senha115', '1995-10-20'),
('Paulo Souza', 'paulo.souza@example.com', 'senha116', '1991-07-17'),
('Camila Martins', 'camila.martins@example.com', 'senha117', '1992-05-22');

-- Inserindo 10 produtos
INSERT INTO produtos (nome, descricao, preco, estoque) VALUES
('Camiseta', 'Camiseta de algodão', 39.99, 100),
('Tênis', 'Tênis de corrida', 199.99, 50),
('Jaqueta', 'Jaqueta impermeável', 149.99, 30),
('Calça Jeans', 'Calça jeans masculina', 79.99, 75),
('Blusa de Frio', 'Blusa de frio feminina', 59.99, 120),
('Boné', 'Boné de aba reta', 29.99, 200),
('Meia', 'Meia de algodão', 9.99, 300),
('Óculos de Sol', 'Óculos de sol estilo aviador', 99.99, 40),
('Relógio', 'Relógio masculino', 259.99, 20),
('Sapatênis', 'Sapatênis em couro', 169.99, 60);

-- Inserindo 10 pedidos
INSERT INTO pedidos (id_usuario, total) VALUES
(1, 239.78), (2, 439.98), (3, 179.98), (4, 229.97), (5, 289.97),
(6, 359.98), (7, 479.98), (8, 179.98), (9, 249.97), (10, 219.97);

-- Inserindo 10 itens de pedido
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade, preco_unitario) VALUES
(1, 1, 2, 39.99), (1, 2, 1, 199.99),
(2, 3, 1, 149.99), (2, 4, 1, 79.99), (2, 5, 1, 59.99),
(3, 6, 1, 29.99), (3, 7, 3, 9.99),
(4, 8, 1, 99.99), (4, 9, 1, 259.99),
(5, 10, 2, 169.99), (5, 1, 1, 39.99),
(6, 2, 1, 199.99), (6, 3, 2, 149.99),
(7, 4, 1, 79.99), (7, 5, 2, 59.99),
(8, 6, 2, 29.99), (8, 7, 1, 9.99),
(9, 8, 1, 99.99), (9, 10, 1, 169.99),
(10, 9, 1, 259.99), (10, 2, 1, 199.99);


INSERT INTO itens_pedido (id_pedido, id_produto, quantidade, preco_unitario) VALUES
(1, 1, 2, 39.99), (1, 2, 1, 199.99),
(2, 1, 3, 39.99), (2, 2, 2, 199.99);


/*
1. Liste todos os usuários cadastrados no banco de dados.
2. Encontre os produtos cujo preço seja maior que R$50,00.
3. Exiba os pedidos realizados pelo usuário com o nome "João Silva".
4. Insira um novo usuário chamado "Eduardo Farias" com suas informações de contato e data de nascimento.
5. Liste os nomes e preços de todos os produtos ordenados pelo preço em ordem crescente.
*/

/*1. Liste todos os usuários cadastrados no banco de dados.*/
select * from usuarios;

/*2. Encontre os produtos cujo preço seja maior que R$50,00.*/

select * from produtos where preco > 50;

/*3. Exiba os pedidos realizados pelo usuário com o nome "João Silva".*/

select * from usuarios where nome = 'João Silva';

/*4. Insira um novo usuário chamado "Eduardo Farias" com suas informações de contato e data de nascimento.*/

INSERT INTO usuarios (nome, email, senha, data_nascimento) VALUES ('Eduardo Farias', 'eduardo@email.com', '123456789', '2002-10-04');

/*5. Liste os nomes e preços de todos os produtos ordenados pelo preço em ordem crescente. */

select nome, preco from produtos order by preco asc;


/*
6.Encontre os produtos que têm mais de 50 unidades no estoque.
7.Calcule o valor total do estoque de cada produto (preço * quantidade em estoque).
8.Liste todos os pedidos com o nome do usuário que os realizou, ordenados pela data do pedido mais recente.
9.Atualize o preço do produto "Camiseta" para R$49,99.
10.Exclua todos os usuários que não possuem pedidos associados.
*/


--6.Encontre os produtos que têm mais de 50 unidades no estoque.

select * from produtos where estoque > 50 order by estoque asc;

--7.Calcule o valor total do estoque de cada produto (preço * quantidade em estoque)

select *, preco * estoque as vl_total from produtos;

--8.Liste todos os pedidos com o nome do usuário que os realizou, ordenados pela data do pedido mais recente.

select usuarios.nome, pedidos.id, pedidos.data_pedido  from pedidos 
inner join usuarios on pedidos.id_usuario = usuarios.id 
order by data_pedido asc

--9.Atualize o preço do produto "Camiseta" para R$49,99.

update produtos set preco = 49.99 where nome = 'Camiseta' 

--10.Exclua todos os usuários que não possuem pedidos associados.

delete usuarios where id
not in (
	select id_usuario from pedidos
	)


/*
11.Encontre os usuários que gastaram mais de R$350,00 em pedidos.
12.Liste o total de vendas (soma dos valores dos pedidos) por produto.
13.Encontre o produto mais vendido (com base na soma das quantidades nos itens de pedido).
14.Exiba o nome do usuário e os detalhes do produto mais caro que ele comprou.
15.Adicione uma nova coluna na tabela produtos para indicar se o produto está "Em promoção" (sim ou não), e atualize os valores com base em critérios de sua escolha.
*/

--11.Encontre os usuários que gastaram mais de R$350,00 em pedidos.

SELECT usuarios.id, usuarios.nome, SUM(pedidos.total) AS total_gasto
FROM usuarios
JOIN pedidos ON usuarios.id = pedidos.id_usuario
GROUP BY usuarios.id, usuarios.nome
HAVING SUM(pedidos.total) > 350.00;  

--12.Liste o total de vendas (soma dos valores dos pedidos) por produto.

select pro.nome, sum(p.total) as total from itens_pedido ut
join pedidos p on ut.id_pedido = p.id 
join produtos pro on ut.id_produto = pro.id
group by pro.nome
order by total

--13.Encontre o produto mais vendido (com base na soma das quantidades nos itens de pedido).

select top 1 produtos.nome, SUM(itens_pedido.quantidade) as quantidade from itens_pedido
inner join pedidos on pedidos.id = itens_pedido.id_pedido
inner join produtos on produtos.id = itens_pedido.id_produto
group by produtos.nome
order by quantidade desc

-- 14.Exiba o nome do usuário e os detalhes do produto mais caro que ele comprou.

SELECT usuarios.nome AS nome_usuario, produtos.nome AS nome_produto, produtos.preco, itens_pedido.quantidade FROM usuarios
INNER JOIN pedidos ON usuarios.id = pedidos.id_usuario
INNER JOIN itens_pedido ON pedidos.id = itens_pedido.id_pedido
INNER JOIN produtos ON itens_pedido.id_produto = produtos.id
INNER JOIN (
    SELECT id_pedido, MAX(preco_unitario) AS max_preco
    FROM itens_pedido
    JOIN produtos ON itens_pedido.id_produto = produtos.id
    GROUP BY id_pedido
) AS produtos_maximos ON itens_pedido.id_pedido = produtos_maximos.id_pedido AND itens_pedido.preco_unitario = produtos_maximos.max_preco
ORDER BY usuarios.nome;

--15.Adicione uma nova coluna na tabela produtos para indicar se o produto está "Em promoção" (sim ou não), e atualize os valores com base em critérios de sua escolha.

ALTER TABLE produtos ADD em_promocao BIT;

UPDATE produtos SET em_promocao = CASE
WHEN preco > 100 THEN 
	1  
ELSE 
	0                   
END;


