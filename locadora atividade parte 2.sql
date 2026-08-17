use LOCADORA;
-- mostrar os nomes dos clientes e seus enderecos

select*from clientes;

-- JOIN 
-- fazer pesquisa

select  

-- quais tabelas e campos 
C.nome,
C.cpf,  
C.logradouro,
E.numero,
E.complemento
-- onde estar a chave estrangeira
from cliente C
-- onde estar a chave primaria 
join  endereco E
-- quem faz o relacionamento
on C.enderecoID = E.enderecoID;