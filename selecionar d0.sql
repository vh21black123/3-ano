use recantodocafé;
create table Cadastro_Cliente(	
	id_cliente int primary key auto_increment,
    nome varchar(100) not null,
    email varchar(100)not null,
    telefone varchar(20) not null,
    id_endereço int,-- chave primaria da tabela endereço
    -- informar o SGBD qual é o relacionamento 
    foreign key (id_endereco) references endeco(id_endereco) 
    );
create table endereco ( 
	id_endereco int primary key auto_increment,
    bairro varchar (100) not null,
    cidade varchar(100) not null,
    numero varchar (20)not null,
    foreign key (
);