use aulaphp;

insert into CadastroAlunos(RegAluno, nome, email, celular)
values (1001,"douglas","douglasreidelas@gmail.com","12356789"),
(1002,"boris","boris@gmail.com","12384743");

-- values ($regAluno, $nome, $email, $celular)

-- Criar tabela
create table CadastroAlunos(
id_cadastroAlunos int primary key auto_increment,
regAluno int not null,
nome varchar(50) not null,
email varchar(50) not null,
celular varchar(20)
);
