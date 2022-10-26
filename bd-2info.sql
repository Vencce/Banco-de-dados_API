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

select nome, cpf, cod_pedido, dtped2) CRUC que retorne: quantidade de pedidos agrupando pela sigla da UF
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

select descricao, preco_unit, (preco_unit + 2.50)/2 as calculo from produto;

/*podendo colocar em parenteses pode se colocar qualquer calculo 
ex : (preco_unit + 2.50)/2
*/

select cod_pedido, cad_usuario_cpf, dtped, faturado, naofaturado, dtentrega, qtditem, descricao, preco_unit
from pedidos, itemped, produto
where pedidos.cod_pedido = itemped.ped_codpedidos and
itemped.prod_cod_produto = produto.cod_produto and
pedidos.faturado is null;

select cod_produto,descricao,preco_unit, preco_emb, qtd_emb, (preco_unit* qtd_emb) preco_embalagem
from produto;

select cod_produto,descricao,preco_unit, preco_emb, qtd_emb, (preco_unit* qtd_emb) preco_embalagem
from produto where cod_produto = 22;

update produto set preco_emb = (preco_unit* qtd_emb) where cod_produto = 22;
/*Apenas uma colunas é atualizada*/

update produto set preco_emb = (preco_unit* qtd_emb) where preco_emb is null;
/*Todas as colunas são atualizadaas*/

update produto set preco_emb = (preco_unit * qtd_emb)
where preco_emb <> (preco_unit * qtd_emb);

select * from produto;
select max(preco_unit) from produto;
select min(preco_unit) from produto;
select avg(preco_unit) from produto;
select count(cod_produtot) from produto;
select sum(preco_unit) from produto;
select (sum(preco_unit)/count(cod_produto)) from produto;
select round(avg(preco_unit),2) from produto;

select max(preco_unit) from produto;
select descricao,preco_unit from produto
where preco_unit = (select max(preco_unit)from produto);

select nome,descricao_tipo
from cad_usuario, tipo_usuario
where cad_usuario.tipuser_cd = tipo_usuario.cod_tip_user;

select descricao_tipo, count(tipuser_cd)
from cad_usuario, tipo_usuario
where cad_usuario.tipuser_cd = tipo_usuario.cod_tip_user 
group by descricao_tipo order by count(tipuser_cd) desc;

/*----------------------------------------------------------19/10--------------------------------------------------------------------------*/

/*1) CRUC que retorne: nome dos usuários e a quantidade de pedidos realizados por cada usuário.*/

select nome, count(cad_usuario_cpf)
from cad_usuario, pedidos
where cad_usuario.cpf = pedidos.cad_usuario_cpf
group by nome;

/*2) CRUC que retorne: nome do usuário e o valor total do pedido, filtrando por um código de pedido válido.*/

select nome, sum(preco_unit * qtditem)
from cad_usuario,pedidos,itemped,produto
where cad_usuario.cpf = pedidos.cad_usuario_cpf and
pedidos.cod_pedido = itemped.ped_codpedidos and
itemped.prod_cod_produto = produto.cod_produto and
pedidos.cod_pedido = 1 group by nome;

/*3) CRUC que retorne: a quantidade de logradouros filtrando pela sigla do estado.*/

select ds_uf_sigla, count(cd_logradouro)
from logradouro, bairros, cidades, uf
where logradouro.bairros_cd_bairro = bairros.cd_bairro and
bairros.cidade_cd_cidade = cidades.cd_cidade and
cidades.uf_cd_uf = uf.cd_uf group by ds_uf_sigla;


/*4) CRUC que retorne: a quantidade de bairros agrupando pela sigla do estado.*/

select ds_uf_sigla, count(cd_bairro)
from bairros, cidades, uf
where bairros.cidade_cd_cidade = cidades.cd_cidade and
cidades.uf_cd_uf = uf.cd_uf group by ds_uf_sigla;

/*5) CRUC que retorne: preço total dos pedidos agrupando pelo código dos pedidos.*/

select cod_pedido, sum(preco_unit * qtditem)
from pedidos, itemped, produto
where pedidos.cod_pedido = itemped.ped_codpedidos and
itemped.prod_cod_produto = prod_cod_produto group by cod_pedido;

/*--------------------------------------------------------------26/10----------------------------------------------------------------------*/


/*1) CRUC que retorne: descrição do produto e a quantidade de vezes que ele foi comprado, agrupando pela descrição do produto.*/

/*2) CRUC que retorne: quantidade de pedidos agrupando pela sigla UF.*/

/*3) CRUC que retorne: quantidade de usuarios agrupando pelo estado.*/
/*1) CRUC que retorne: nome dos usuários e a quantidade de pedidos realizados por cada usuário.*/
117
​
118
select nome, count(dtped)
119
from cad_usuario, pedidos
120
where cad_usuario.cpf = pedidos.cad_usuario_cpf
121
group by nome;
122
​
123
/*2) CRUC que retorne: nome do usuário e o valor total do pedido, filtrando por um código de pedido válido.*/
124
​
125
​
126
​
127
/*3) CRUC que retorne: a quantidade de logradouros filtrando pela sigla do estado.*/
128
​
129
​
130
​
131
/*4) CRUC que retorne: a quantidade de bairros agrupando pela sigla do estado.*/
132
​
133
​
134
​
135
/*5) CRUC que retorne: preço total dos pedidos agrupando pelo código dos pedidos.*/
136

