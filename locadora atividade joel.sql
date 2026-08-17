CREATE DATABASE LOCADORA;
USE LOCADORA;

CREATE TABLE ENDERECO (
    enderecoID INT AUTO_INCREMENT PRIMARY KEY,
    cep VARCHAR(10),
    logradouro VARCHAR(100),
    numero VARCHAR(10),
    complemento VARCHAR(100),
    bairro VARCHAR(100),
    cidade VARCHAR(100),
    uf CHAR(2)
);

CREATE TABLE CLIENTES (
    clienteID INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    cpf VARCHAR(14),
    telefone VARCHAR(20),
    email VARCHAR(100),
    enderecoID INT,
    FOREIGN KEY (enderecoID) REFERENCES ENDERECO(enderecoID)
);

CREATE TABLE CATEGORIAS (
    categoriaID INT AUTO_INCREMENT PRIMARY KEY,
    categoria VARCHAR(50),
    valorDiaria DECIMAL(10,2)
);

CREATE TABLE VEICULOS (
    veiculoID INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(50),
    modelo VARCHAR(50),
    placa VARCHAR(10),
    ano INT,
    categoriaID INT,
    situacao VARCHAR(20),
    FOREIGN KEY (categoriaID) REFERENCES CATEGORIAS(categoriaID)
);

CREATE TABLE FUNCIONARIOS (
    funcionarioID INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    cargo VARCHAR(50),
    telefone VARCHAR(20),
    email VARCHAR(100)
);

CREATE TABLE LOCACOES (
    locacaoID INT AUTO_INCREMENT PRIMARY KEY,
    clienteID INT,
    veiculoID INT,
    funcionarioID INT,
    dataLocacao DATE,
    dataDevolucaoPrevista DATE,
    dataDevolucaoReal DATE,
    valorTotal DECIMAL(10,2),
    FOREIGN KEY (clienteID) REFERENCES CLIENTES(clienteID),
    FOREIGN KEY (veiculoID) REFERENCES VEICULOS(veiculoID),
    FOREIGN KEY (funcionarioID) REFERENCES FUNCIONARIOS(funcionarioID)
);

CREATE TABLE PAGAMENTOS (
    pagamentoID INT AUTO_INCREMENT PRIMARY KEY,
    locacaoID INT,
    metodo VARCHAR(20),
    valorPago DECIMAL(10,2),
    dataPagamento DATE,
    FOREIGN KEY (locacaoID) REFERENCES LOCACOES(locacaoID)
);

INSERT INTO ENDERECO (cep, logradouro, numero, complemento, bairro, cidade, uf) VALUES
('03150-000', 'Rua A', '100', NULL, 'Santana', 'São Paulo', 'SP'),
('21000-100', 'Av. B', '200', 'casa A', 'Realejo', 'Rio de Janeiro', 'RJ'),
('31500-000', 'Rua C', '300', NULL, NULL, 'Belo Horizonte', 'MG'),
('41234-001', 'Rua D', 's/n', 'sitio Alegre', 'Zona Rural', 'Curitiba', 'PR'),
('51000-000', 'Av. E', '500', 'Fundos', 'Centro', 'Porto Alegre', 'RS'),
('04201-001', 'Rua das Flores', '123', NULL, 'Centro', 'São Paulo', 'SP'),
('21002-500', 'Avenida Atlântica', '890', 'Loja 3', 'Copacabana', 'Rio de Janeiro', 'RJ'),
('01995-654', 'Rua das Palmeiras', '210', NULL, 'Jardim Paulista', 'Campinas', 'SP'),
('21400-000', 'Avenida Beira Mar', '90', 'Loja 1', 'Viradouro', 'Rio de Janeiro', 'RJ'),
('01995-654', 'Rua das Palmares', '210', 'Sobreloja', 'Jardim Canadá', 'Campina Grande', 'SP');

INSERT INTO CLIENTES (nome, cpf, telefone, email, enderecoID) VALUES
('João Silva', '12345678901', '11987654321', 'joao.silva@email.com', 1),
('Maria Souza', '23456789012', '11965432109', 'maria.souza@email.com', 2),
('Carlos Pereira', '34567890123', '21988887777', 'carlos.pereira@email.com', 3),
('Ana Oliveira', '45678901234', '31977776666', 'ana.oliveira@email.com', 4),
('Fernanda Lima', '56789012345', '41999998888', 'fernanda.lima@email.com', 5),
('Carla Mendes', '22233344455', '(11) 98876-5432', 'carla.mendes@email.com', 6),
('Lucas Pereira', '33344455566', '(21) 97654-3210', 'lucas.pereira@email.com', 7),
('Fernanda Oliveira', '44455566677', '(41) 98765-9876', 'fernanda.oliveira@email.com', 8),
('Roberto Silva', '55566677788', '(31) 98989-1234', 'roberto.silva@email.com', 9),
('Ana Costa', '66677788899', '(19) 98444-2233', 'ana.costa@email.com', 10);

INSERT INTO CATEGORIAS (categoria, valorDiaria) VALUES
('Econômico', 120.00),
('SUV', 220.00),
('Luxo', 400.00),
('Utilitário', 180.00),
('Sedan', 150.00),
('Hatch', 120.00),
('Pick-up', 220.00),
('Elétrico', 300.00),
('Minivan', 180.00),
('Conversível', 350.00);

INSERT INTO VEICULOS (marca, modelo, placa, ano, categoriaID, situacao) VALUES
('Chevrolet', 'Onix', 'ABC1D23', 2021, 6, 'Disponivel'),
('Toyota', 'Hilux', 'XYZ9E88', 2020, 7, 'Disponivel'),
('Tesla', 'Model 3', 'TESL123', 2022, 8, 'Disponivel'),
('Toyota', 'Corolla', 'KLM5F67', 2022, 5, 'Disponivel'),
('Jeep', 'Compass', 'JHK8P90', 2021, 2, 'Disponivel'),
('Honda', 'Civic', 'GHJ3L45', 2023, 5, 'Disponivel'),
('Fiat', 'Strada', 'AAA9Z99', 2021, 7, 'Disponivel'),
('Fiat', 'Argo', 'ABC1234', 2020, 1, 'Disponivel'),
('Chevrolet', 'Onix', 'DEF5678', 2021, 1, 'Disponivel'),
('Toyota', 'Hilux', 'GHI9012', 2022, 4, 'Disponivel'),
('Honda', 'HR-V', 'JKL3456', 2021, 2, 'Alugado'),
('BMW', '320i', 'MNO7890', 2022, 3, 'Disponivel'),
('Jeep', 'Compass', 'PQR2345', 2021, 2, 'Disponivel');

INSERT INTO FUNCIONARIOS (nome, cargo, telefone, email) VALUES
('Paulo Mendes', 'Atendente', '11955554444', 'paulo.mendes@locadora.com'),
('Juliana Rocha', 'Gerente', '21944443333', 'juliana.rocha@locadora.com'),
('Roberto Alves', 'Mecânico', '31933332222', 'roberto.alves@locadora.com'),
('Patrícia Gomes', 'Atendente', '(11) 97777-1122', 'patricia@locadora.com.br'),
('João Batista', 'Gerente', '(21) 98888-3344', 'joao@locadora.com.br'),
('Sofia Martins', 'Mecânico', '(31) 96666-5566', 'sofia@locadora.com.br'),
('Bruno Ferreira', 'Atendente', '(41) 95555-7788', 'bruno@locadora.com.br');

INSERT INTO LOCACOES (clienteID, veiculoID, funcionarioID, dataLocacao, dataDevolucaoPrevista, dataDevolucaoReal, valorTotal) VALUES
(1, 1, 1, '2025-08-01', '2025-08-05', '2025-08-05', 480.00),
(2, 4, 1, '2025-08-02', '2025-08-06', NULL, 880.00),
(3, 3, 2, '2025-08-03', '2025-08-07', '2025-08-08', 900.00),
(4, 5, 2, '2025-08-04', '2025-08-06', '2025-08-06', 800.00),
(6, 7, 2, '2025-01-15','2025-01-20', '2025-01-20', 500.00),
(7, 8, 5, '2025-02-01', '2025-02-10', '2025-02-10', 1500.00),
(8, 9, 6, '2025-02-05', '2025-02-07', '2025-02-07', 800.00),
(9, 10, 1, '2025-03-01', '2025-03-05', '2025-03-05', 700.00),
(6, 11, 4, '2025-03-10', '2025-03-15', '2025-03-15', 1200.00);

INSERT INTO PAGAMENTOS (locacaoID, metodo, valorPago, dataPagamento) VALUES
(1, 'Cartao', 480.00, '2025-08-05'),
(2, 'PIX', 880.00, '2025-08-02'),
(3, 'Dinheiro', 900.00, '2025-08-08'),
(4, 'Cartao', 800.00, '2025-08-06'),
(5, 'Cartao', 500.00, '2025-01-15'),
(6, 'Boleto', 1500.00, '2025-02-01'),
(7, 'Pix', 800.00, '2025-02-05'),
(8, 'Cartao', 700.00, '2025-03-01'),
(9, 'Pix', 1200.00, '2025-03-10');