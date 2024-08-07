/*
Seleciona o que quer
coloca daonde eles vem (exemplo dt,é a tabela detalhes_produto só que em 2 letras)
só 1 from da tabela principal
depois vc coloca as junçoes
"esse fulano tambem esta na tabela tal dt.id_tipo = pt.id_tipo
*/
SELECT pt.nome_tipo AS tipo_produto, 
	   el.estoque AS disponibilidade_estoque, 
	   dt.nome_produto, 
	   rp.descricao_recurso AS recurso, 
       	   sa.tamanho        
FROM  DETALHES_PRODUTO dt
JOIN ESTOQUE_LOJA el ON dt.id_produto = el.id_produto 
JOIN TIPOS_PRODUTO pt ON dt.id_tipo = pt.id_tipo
JOIN RECURSOS_PRODUTO rp ON dt.id_produto = rp.id_produto
JOIN  DISPONIBILIDADE_TAMANHO sa ON dt.id_produto = sa.id_produto
WHERE dt.id_tipo = 1  AND el.id_loja = 41  AND sa.id_tamanho = 2;  

CREATE TABLE aulas.funcionarios2 (nome varchar(50),cargo varchar(50),idade int,presenca int ,salario int, avaliacao double) ;

INSERT INTO aulas.funcionarios2 (nome, cargo, idade, presenca, salario, avaliacao) VALUES
('Ana ellva', 'adm', 34, 95, 5500, 8.5),
('Felipe Santos', 'ti', 31, 92, 9500, 8.1),
('Bruno Pereira', 'ti', 28, 90, 7800, 7.8),
('Carla Souza', 'rh', 45, 85, 6200, 9.2),
('Diego Oliveira', 'tecnico', 39, 88, 4400, 7.5),
('Eduarda Lima', 'gerente', 50, 80, 25000, 9.0),
('Gabriela Costa', 'adm', 27, 87, 5200, 7.4),
('Henrique Almeida', 'rh', 43, 78, 6000, 8.7),
('Isabela Rocha', 'tecnico', 37, 82, 4600, 7.9),
('João Fernandes', 'gerente', 48, 85, 24000, 9.5),
('rafa', 'ti', 48, 85, 24000, 9.5);

INSERT INTO aulas.funcionarios2 (nome, cargo, idade, presenca, salario, avaliacao) VALUES
('Paulo ', 'rh', 48, 85, 24000, 9.5);

/*dados de quem trabalha em TI*/
SELECT  * from aulas.funcionarios2  where cargo='ti';

/*dados quem tem avaliacao>7*/
SELECT  * from aulas.funcionarios2  where avaliacao>=7;

/*tem  no nome P e trabalham no RH*/
SELECT  * from aulas.funcionarios2  where cargo='rh' and nome like 'P%';

/*NOME,CARGO,SALARIO de quem tem entre 20 e 50 anos*/
SELECT nome,cargo,salario from aulas.funcionarios2  where idade>20 and idade<50;

/*quem ganha mais que 10000 e mostrar nome,idade*/
SELECT nome,idade from aulas.funcionarios2  where salario>10000;

/*todos dados quem foi mais de 80% das aulas */
SELECT  * from aulas.funcionarios2  where presenca>80;

/*maior salario*/
select max(salario) from aulas.funcionarios2;

/*menor salario*/
select min(salario) from aulas.funcionarios2;

/*pior avaliacao*/
select min(avaliacao) from aulas.funcionarios2;

/*contagem de salarios maior que 10000*/
select count(salario) from aulas.funcionarios2 where salario>10000;

/*media salarial dos adm*/
select avg(salario) from aulas.funcionarios2 where cargo='adm';

/*Selecione quantos que são gastos com salarios do pessoal do TI*/ 
select sum(salario) from aulas.funcionarios2 where cargo='ti';

/*Selecione o nome, e o salario das pessoas que ganham mais que a media salarial de todos*/
SELECT nome, salario FROM aulas.funcionarios2 WHERE salario > (SELECT AVG(salario) FROM aulas.funcionarios2);

/*Selecione a media salarial por cargo*/
Select cargo,avg(salario) from aulas.funcionarios2 group by cargo;

/*Mostre a media salarial dos cargos que possuam a sua media maior que 10.000*/
SELECT cargo, AVG(salario)  FROM aulas.funcionarios2 GROUP BY cargo HAVING AVG(salario) > 10000;

