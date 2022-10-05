select * from logradouro;

select * from logradouro where cep = '89212404';

explain bairros;

select ds_logradouro_nome, ds_bairro_nome, ds_cidade_nome
from logradouro, bairros, cidades
where cep = '89212404' and
bairros_cd_bairro = cd_bairro and
cidade_cd_cidade = cd_cidade;

select nome,ds_logradouro_nome, ds_bairro_nome, ds_cidade_nome
from logradouro, bairros, cidades,cad_usuario
where 
bairros_cd_bairro = cd_bairro and
cidade_cd_cidade = cd_cidade and
cad_usuario.log_cd_logradouro = logradouro.cd_logradouro;

select nome, ds_logradouro_nome, ds_bairro_nome, descricao_tipo
from cad_usuario, logradouro, bairros, tipo_usuario
where cad_usuario.log_cd_logradouro = logradouro.cd_logradouro and
logradouro.bairros_cd_bairro = bairros.cd_bairro and
cad_usuario.tipuser_cd = tipo_usuario.cod_tip_user;

select * from pedidos;

select nome, cpf, cod_pedido, dtped
from cad_usuario, pedidos
where cad_usuario.cpf = pedidos.cad_usuario_cpf;

select nome, cpf, cod_pedido, dtped, qtditem, descricao, preco_unit
from cad_usuario, pedidos, itemped, produto
where cad_usuario.cpf = pedidos.cad_usuario_cpf and
pedidos.cod_pedido = itemped.ped_codpedidos and
itemped.prod_cod_produto = produto.cod_produto;

select descricao, preco_unit, preco_emb
from produto
where preco_unit > 3.00;


select nome, email, tel, cod_pedido, dtped, qtditem, descricao, preco_unit
from cad_usuario, pedidos, itemped, produto
where cad_usuario.cpf = pedidos.cad_usuario_cpf and
pedidos.cod_pedido = itemped.ped_codpedidos and
itemped.prod_cod_produto = produto.cod_produto and
cad_usuario.cpf ='85763098123'; 

select ds_logradouro_nome, ds_bairro_nome, ds_cidade_nome
from logradouro, bairros, cidades, tipo_logradouro
where logradouro.bairros_cd_bairro = bairros.cd_bairro and
bairros.cidade_cd_cidade = cidades.cd_cidade and
logradouro.log_cd_tip_log = tipo_logradouro.cd_tipo_logradouro and
tipo_logradouro.desc_tip_log = 'avenida' and
cidades.ds_cidade_nome = 'joinville';


select cod_pedido, cad_usuario_cpf, dtped, faturado, naofaturado, dtentrega, qtditem, descricao, preco_unit
from pedidos, itemped, produto
where pedidos.cod_pedido = itemped.ped_codpedidos and
itemped.prod_cod_produto = produto.cod_produto and
produto.preco_unit >= 1.20 and produto.preco_unit <=8.00;

select *from produto;

