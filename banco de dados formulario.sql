CREATE DATABASE syslogin
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE syslogin;

CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(11) NOT NULL UNIQUE,
    email VARCHAR(150) NOT NULL UNIQUE,
    data_nascimento DATE NOT NULL,
    nome_mae VARCHAR(100) NOT NULL,
    cidade_nascimento VARCHAR(100) NOT NULL,
    senha VARCHAR(255) NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);