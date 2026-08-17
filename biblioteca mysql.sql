CREATE DATABASE db_biblioteca;
USE db_biblioteca;

-- Tabela categorias
CREATE TABLE tbl_categorias (
    ID_Categoria INT(6) PRIMARY KEY AUTO_INCREMENT,
    Categoria VARCHAR(30)
);

-- Tabela autores
CREATE TABLE tbl_autores (
    ID_Autor INT(6) PRIMARY KEY AUTO_INCREMENT,
    Nome_Autor VARCHAR(30),
    Sobrenome_Autor VARCHAR(60)
);

-- Tabela editoras
CREATE TABLE tbl_editoras (
    ID_Editora INT(6) PRIMARY KEY AUTO_INCREMENT,
    Nome_Editora VARCHAR(50)
);

-- Tabela livros
CREATE TABLE tbl_livro (
    ID_Livro INT(6) PRIMARY KEY AUTO_INCREMENT,
    Nome_Livro VARCHAR(70),
    ID_Categoria INT(6),
    ID_Autor INT(6),
    Data_Pub DATE,
    Preco_Livro DECIMAL(6,2),
    ID_Editora INT(6),
    ISBN13 CHAR(13),
    ISBN10 CHAR(10),

    -- Chaves estrangeiras
    FOREIGN KEY (ID_Categoria) REFERENCES tbl_categorias(ID_Categoria),
    FOREIGN KEY (ID_Autor) REFERENCES tbl_autores(ID_Autor),
    FOREIGN KEY (ID_Editora) REFERENCES tbl_editoras(ID_Editora)
);