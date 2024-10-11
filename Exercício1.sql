create database GER_JOIN;
use GER_JOIN;

create table funcionarios (
COD int auto_increment primary key not null,
NOME varchar(100) not null,
ESPECIALIDADE varchar(100) not null
);

create table dependentes (
COD int auto_increment primary key not null,
NOME varchar(100) not null,
COD_FUNC int,
foreign key (COD_FUNC) references funcionarios(COD)
);

insert into funcionarios (NOME, ESPECIALIDADE)
	values
    ("JOSÉ", "ENGENHEIRO"),
    ("JOÃO", "MESTRE DE OBRAS"),
    ("MARIA", "CONTABILISTA");

insert into dependentes (NOME, COD_FUNC)
	values
    ("PEDRO",1),
    ("ALICE",1),
    ("LUANA",3);
    
SELECT * from funcionarios;
SELECT * from dependentes;

SELECT FUNC.NOME NOME_FUNC, DEP.NOME NOME_DEP
FROM funcionarios FUNC
INNER JOIN dependentes DEP
ON FUNC.COD = DEP.COD_FUNC;

SELECT funcionarios.NOME, dependentes.NOME
FROM funcionarios
INNER JOIN dependentes
ON funcionarios.COD = dependentes.COD_FUNC
WHERE funcionarios.COD = 1;

SELECT funcionarios.NOME NOME_FUNC, dependentes.NOME NOME_DEP
FROM funcionarios
LEFT JOIN dependentes
ON funcionarios.COD = dependentes.COD_FUNC;

SELECT funcionarios.NOME NOME_FUNC, dependentes.NOME NOME_DEP
FROM funcionarios
LEFT JOIN dependentes
ON funcionarios.COD = dependentes.COD_FUNC
WHERE dependentes.NOME is null;

SELECT funcionarios.NOME NOME_FUNC, dependentes.NOME NOME_DEP
FROM funcionarios
RIGHT JOIN dependentes
ON funcionarios.COD = dependentes.COD_FUNC;

SELECT funcionarios.NOME NOME_FUNC, dependentes.NOME NOME_DEP
FROM funcionarios
RIGHT JOIN dependentes
ON funcionarios.COD = dependentes.COD_FUNC
WHERE funcionarios.COD is null;