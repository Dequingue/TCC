CREATE DATABASE MENTALLY;
USE MENTALLY;


-----------------------------------------------------------------

CREATE TABLE USUARIO (
  CPF INTEGER UNSIGNED  NOT NULL  ,
  nome_usuario VARCHAR(255)  NOT NULL  ,
  email_usuario VARCHAR(255)  NOT NULL  ,
  senha_usuario VARCHAR(255) NOT NULL,
  dtNascimento DATE  NOT NULL  ,
  plano_tratamento VARCHAR(255)  NOT NULL    ,
PRIMARY KEY(CPF));


INSERT INTO USUARIO(CPF, nome_usuario, email_usuario, dtNascimento, plano_tratamento) values (111, 'Matheus','matheusp@gmail.com','2000/10/02','Premium');

select* from USUARIO ;

update USUARIO
set plano_tratamento = 'Gratuito'
where CPF = 111;

delete from USUARIO
WHERE CPF = 333;

------------------------------------------------

CREATE TABLE AREA_ATUACAO (
  areaAtuacao_PK INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  areaAtuacao VARCHAR(255)  NOT NULL    ,
PRIMARY KEY(areaAtuacao_PK));


insert INTO AREA_ATUACAO(areaAtuacao_PK, areaAtuacao) values (1,'Saúde Mental' );
insert INTO AREA_ATUACAO(areaAtuacao_PK, areaAtuacao) values (2,'Saúde Mental' );
insert INTO AREA_ATUACAO(areaAtuacao_PK, areaAtuacao) values (3,'Ultrassom' );
insert INTO AREA_ATUACAO(areaAtuacao_PK, areaAtuacao) values (4,'Ultrassom'); 
insert INTO AREA_ATUACAO(areaAtuacao_PK, areaAtuacao) values (5,'Saúde Mental' );
insert INTO AREA_ATUACAO(areaAtuacao_PK, areaAtuacao) values (6,'RX'); 

SELECT* FROM AREA_ATUACAO;

update AREA_ATUACAO
set areaAtuacao = 'Mental'
where areaAtuacao_PK = 2;

DELETE FROM AREA_ATUACAO
where areaAtuacao_PK = 3;

-----------------------------------------------------------------

CREATE TABLE ESPECIALIDADE (
  especialidade_PK INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  especialidade VARCHAR(255)  NOT NULL    ,
PRIMARY KEY(especialidade_PK));

insert INTO ESPECIALIDADE( especialidade_PK , especialidade) values ( 1, 'Psicologia');
insert INTO ESPECIALIDADE( especialidade_PK , especialidade) values ( 2, 'Psicologia');
insert INTO ESPECIALIDADE( especialidade_PK , especialidade) values ( 3, 'USG');
insert INTO ESPECIALIDADE( especialidade_PK , especialidade) values ( 4, 'USG');
insert INTO ESPECIALIDADE( especialidade_PK , especialidade) values ( 5, 'Psicologia');
insert INTO ESPECIALIDADE( especialidade_PK , especialidade) values ( 6, 'Raio X');

SELECT* FROM ESPECIALIDADE ;

UPDATE ESPECIALIDADE
SET especialidade = 'USG'
where especialidade_PK = 2;

DELETE FROM ESPECIALIDADE
WHERE especialidade_PK = 3;



-----------------------------------------------------------------
CREATE TABLE PROFISSIONAIS (
  idProfissional INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  AREA_ATUACAO_areaAtuacao_PK INTEGER UNSIGNED  NOT NULL  ,
  ESPECIALIDADE_especialidade_PK INTEGER UNSIGNED  NOT NULL  ,
  nome_profissional VARCHAR(255)  NOT NULL    ,
	senha_profissional VARCHAR(255) NOT NULL,
PRIMARY KEY(idProfissional)  ,
INDEX PROFISSIONAIS_FKIndex1(ESPECIALIDADE_especialidade_PK)  ,
INDEX PROFISSIONAIS_FKIndex2(AREA_ATUACAO_areaAtuacao_PK));


INSERT INTO PROFISSIONAIS( AREA_ATUACAO_areaAtuacao_PK, ESPECIALIDADE_especialidade_PK, nome_profissional) values (1,1,'Sabine A.');
INSERT INTO PROFISSIONAIS( AREA_ATUACAO_areaAtuacao_PK, ESPECIALIDADE_especialidade_PK, nome_profissional) values (2,2,'Robson C.');
INSERT INTO PROFISSIONAIS( AREA_ATUACAO_areaAtuacao_PK, ESPECIALIDADE_especialidade_PK, nome_profissional) values (3,3,'Victor A.');
INSERT INTO PROFISSIONAIS( AREA_ATUACAO_areaAtuacao_PK, ESPECIALIDADE_especialidade_PK, nome_profissional) values (4,4,'Manuela M.');
INSERT INTO PROFISSIONAIS( AREA_ATUACAO_areaAtuacao_PK, ESPECIALIDADE_especialidade_PK, nome_profissional) values (5,5,'Alexandra Mª.');
INSERT INTO PROFISSIONAIS( AREA_ATUACAO_areaAtuacao_PK, ESPECIALIDADE_especialidade_PK, nome_profissional) values (6,6,'Maria C.');

SELECT * FROM PROFISSIONAIS ; 

update PROFISSIONAIS
set nome_profissional = 'ALEXANDRE F.'
WHERE ESPECIALIDADE_especialidade_PK = 2;

DELETE FROM PROFISSIONAIS
WHERE ESPECIALIDADE_especialidade_PK = 3;

-----------------------------------------------------------------
CREATE TABLE REGISTRO (
  idProgresso INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  PROFISSIONAIS_idProfissional INTEGER UNSIGNED  NOT NULL  ,
  USUARIO_CPF INTEGER UNSIGNED  NOT NULL  ,
  data_progresso DATE  NOT NULL  ,
  nivel_progressao INTEGER UNSIGNED  NOT NULL  ,
  status_usuario VARCHAR(255)  NOT NULL    ,
PRIMARY KEY(idProgresso)  ,
INDEX REGISTRO_FKIndex1(USUARIO_CPF)  ,
INDEX REGISTRO_FKIndex2(PROFISSIONAIS_idProfissional));



INSERT INTO REGISTRO(PROFISSIONAIS_idProfissional, USUARIO_CPF,data_progresso, nivel_progressao,status_usuario) values (1,111,'2024/12/03', 3 , 'Excelente');
INSERT INTO REGISTRO(PROFISSIONAIS_idProfissional, USUARIO_CPF,data_progresso, nivel_progressao,status_usuario) values (2,222,'2024/11/12', 1 , 'Ruim');
INSERT INTO REGISTRO(PROFISSIONAIS_idProfissional, USUARIO_CPF,data_progresso, nivel_progressao,status_usuario) values (3,333,'2024/12/01', 2, 'BOM');
INSERT INTO REGISTRO(PROFISSIONAIS_idProfissional, USUARIO_CPF,data_progresso, nivel_progressao,status_usuario) values (4,444,'2023/10/14', 3, 'Excelente');
INSERT INTO REGISTRO(PROFISSIONAIS_idProfissional, USUARIO_CPF,data_progresso, nivel_progressao,status_usuario) values (5,555,'2022/09/20', 1, 'Ruim');
INSERT INTO REGISTRO(PROFISSIONAIS_idProfissional, USUARIO_CPF,data_progresso, nivel_progressao,status_usuario) values (6,666,'2024/12/06', 2, 'Bom');

select * from REGISTRO;

update REGISTRO 
set status_usuario = 'Bom'
where PROFISSIONAIS_idProfissional = 1;

DELETE FROM REGISTRO 
WHERE PROFISSIONAIS_idProfissional = 3;

 

-----------------------------------------------------------------
CREATE TABLE CONSULTA (
  idCONSULTA INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  PROFISSIONAIS_idProfissional INTEGER UNSIGNED  NOT NULL  ,
  USUARIO_CPF INTEGER UNSIGNED  NOT NULL  ,
  data_consulta DATE  NOT NULL  ,
  hora_consulta TIME  NOT NULL  ,
  relato_consulta VARCHAR(255)  NULL  ,
  nota_consulta VARCHAR(255)  NOT NULL  ,
  observacao_consulta VARCHAR(255)  NULL    ,
PRIMARY KEY(idCONSULTA)  ,
INDEX CONSULTA_FKIndex1(USUARIO_CPF)  ,
INDEX CONSULTA_FKIndex2(PROFISSIONAIS_idProfissional));


INSERT INTO CONSULTA ( PROFISSIONAIS_idProfissional , USUARIO_CPF, data_consulta, hora_consulta, relato_consulta,nota_consulta,observacao_consulta) values (1,111,'2024/10/03', '08:00', 'S.R', 10, 'N.O');
INSERT INTO CONSULTA ( PROFISSIONAIS_idProfissional , USUARIO_CPF, data_consulta, hora_consulta, relato_consulta,nota_consulta,observacao_consulta) values (2,222,'2024/09/10', '10:10', 'S.R', 7, 'N.O');
INSERT INTO CONSULTA ( PROFISSIONAIS_idProfissional , USUARIO_CPF, data_consulta, hora_consulta, relato_consulta,nota_consulta,observacao_consulta) values (3,333,'2024/12/20', '09:00', 'S.R', 9, 'N.O');
INSERT INTO CONSULTA ( PROFISSIONAIS_idProfissional , USUARIO_CPF, data_consulta, hora_consulta, relato_consulta,nota_consulta,observacao_consulta) values (4,444,'2025/04/15', '07:20', 'S.R', 7, 'N.O');
INSERT INTO CONSULTA ( PROFISSIONAIS_idProfissional , USUARIO_CPF, data_consulta, hora_consulta, relato_consulta,nota_consulta,observacao_consulta) values (5,555,'2025/02/02', '12:30', 'S.R', 6, 'N.O');
INSERT INTO CONSULTA ( PROFISSIONAIS_idProfissional , USUARIO_CPF, data_consulta, hora_consulta, relato_consulta,nota_consulta,observacao_consulta) values (6,666,'2025/10/31', '11:00', 'S.R', 10, 'N.O');

SELECT* FROM CONSULTA ;

UPDATE CONSULTA
SET hora_consulta = '09:30'
where USUARIO_CPF = 222;

DELETE FROM CONSULTA
WHERE USUARIO_CPF = 333;





-----------------------------------------------------------------

CREATE TABLE DISPONIBILIDADE (
  PROFISSIONAIS_idProfissional INTEGER UNSIGNED  NOT NULL  ,
  data_disponivel DATE  NOT NULL  ,
  hora_disponivel TIME  NOT NULL  ,
  status_disponivel VARCHAR(255)  NOT NULL    ,
INDEX DISPONIBILIDADE_FKIndex1(PROFISSIONAIS_idProfissional));

INSERT INTO DISPONIBILIDADE ( PROFISSIONAIS_idProfissional, data_disponivel, hora_disponivel, status_disponivel) values ( 1,'2024/12/22','08:00','Disponivel');
INSERT INTO DISPONIBILIDADE ( PROFISSIONAIS_idProfissional, data_disponivel, hora_disponivel, status_disponivel) values ( 2,'2025/01/05','08:40','Disponivel');
INSERT INTO DISPONIBILIDADE ( PROFISSIONAIS_idProfissional, data_disponivel, hora_disponivel, status_disponivel) values ( 3,'2024/12/18','09:00','Disponivel');
INSERT INTO DISPONIBILIDADE ( PROFISSIONAIS_idProfissional, data_disponivel, hora_disponivel, status_disponivel) values ( 4,'2025/07/11','11:00','Disponivel');
INSERT INTO DISPONIBILIDADE ( PROFISSIONAIS_idProfissional, data_disponivel, hora_disponivel, status_disponivel) values ( 5,'2025/02/18','11:20','Disponivel');
INSERT INTO DISPONIBILIDADE ( PROFISSIONAIS_idProfissional, data_disponivel, hora_disponivel, status_disponivel) values ( 6,'2025/03/05','17:00','Disponivel');

select* from DISPONIBILIDADE;

update DISPONIBILIDADE
set hora_disponivel = '08:10'
where PROFISSIONAIS_idProfissional = 1;

DELETE FROM DISPONIBILIDADE
WHERE PROFISSIONAIS_idProfissional = 3;


-----------------------------------------------------------------



-- Restrições -------

-- Garantir que o CPF dos usuarios sejam únicos -- 
ALTER TABLE USUARIO
ADD CONSTRAINT UC_CPF UNIQUE (CPF);

-- Garantir que se um usuário for deletado, seus registros também serão excluidos tambem ---
ALTER TABLE REGISTRO
ADD CONSTRAINT FK_REGISTRO_USUARIO
FOREIGN KEY (USUARIO_CPF)
REFERENCES USUARIO(CPF)
ON DELETE CASCADE;


-- Garantir que o nivel de progressao seja de 1 a 5 ---
ALTER TABLE REGISTRO
ADD CONSTRAINT CK_NivelProgressao CHECK (nivel_progressao BETWEEN 1 AND 5);

-- Impedir que existam mais consultas com o mesmo usuario e profissional agendadas para o mesmo horário 
ALTER TABLE CONSULTA
ADD CONSTRAINT UC_ConsultaUnica UNIQUE (PROFISSIONAIS_idProfissional, USUARIO_CPF, data_consulta, hora_consulta);



-- Rotinas -----

-- VIEW PROFISSIONAIS --

CREATE VIEW prof_especialidades AS
SELECT p.nome_profissional,e.especialidade,a.areaAtuacao
FROM PROFISSIONAIS p
INNER JOIN ESPECIALIDADE e ON p.ESPECIALIDADE_especialidade_PK = e.especialidade_PK
INNER JOIN AREA_ATUACAO a ON p.AREA_ATUACAO_areaAtuacao_PK = a.areaAtuacao_PK;

select * from prof_especialidades where especialidade = 'Psicologia';


-- PROCEDURE para listar as consultas do usuario de acordo com o nome do profissional , data e hora da consulta
DELIMITER $$

CREATE PROCEDURE ListarConsultasUsuario(p_CPF_usuario INT,p_data_inicio DATE,p_data_fim DATE)
BEGIN
    SELECT 
        u.nome_usuario AS Nome_Usuario,
        p.nome_profissional AS Nome_Profissional,
        c.data_consulta AS Data_Consulta,
        c.hora_consulta AS Hora_Consulta
    FROM CONSULTA c
    INNER JOIN USUARIO u ON c.USUARIO_CPF = u.CPF
    INNER JOIN PROFISSIONAIS p ON c.PROFISSIONAIS_idProfissional = p.idProfissional
    WHERE c.USUARIO_CPF = p_CPF_usuario
      AND c.data_consulta BETWEEN p_data_inicio AND p_data_fim
    ORDER BY c.data_consulta, c.hora_consulta;
END$$

DELIMITER ;

CALL ListarConsultasUsuario(111,'2024/01/01', '2025/12/31');


-- Function para listar a quantidade de consultas que um usuario tem de acordo com o profissional
DELIMITER $$

CREATE FUNCTION QT_CONSULTAS_PROF(p_CPF_usuario INT,p_idProfissional INT)
RETURNS INT  -- retornar a função como valor Int em consultas
BEGIN
    DECLARE quantidade INT;
    
    SELECT COUNT(*)  -- conta o número dos registros
    INTO quantidade
    FROM CONSULTA
    WHERE USUARIO_CPF = p_CPF_usuario
      AND PROFISSIONAIS_idProfissional = p_idProfissional;

    RETURN quantidade;
END$$

DELIMITER ;

SELECT QT_CONSULTAS_PROF(666,6) AS Total_Consultas


-- Trigger para verificar a disponibilidade antes de marcar uma consulta
DELIMITER $$

CREATE TRIGGER VerificandoDisponibilidade
BEFORE INSERT ON CONSULTA
FOR EACH ROW -- Trigger sera acionado a cada linha inserida na tabela
BEGIN
    DECLARE disponibilidade_count INT;

    -- Verifica se há disponibilidade para o profissional na data e horário especificados
    SELECT COUNT(*)
    INTO disponibilidade_count
    FROM DISPONIBILIDADE
    WHERE PROFISSIONAIS_idProfissional = NEW.PROFISSIONAIS_idProfissional -- filtra os profissionais para uma nova consulta
      AND data_disponivel = NEW.data_consulta
      AND hora_disponivel = NEW.hora_consulta
      AND status_disponivel = 'Disponivel';

    -- Se não houver disponibilidade, lança um erro
    IF disponibilidade_count = 0 THEN -- contagem de registro = 0 , executa o IF 
        SIGNAL SQLSTATE '45000' -- Erro genérico personalizado definido pela equipe
        SET MESSAGE_TEXT = 'O profissional não está disponível na data e horário especificados';
    END IF;
    
    -- Atualiza o status de disponibilidade para "Indisponível" automaticamente
    UPDATE DISPONIBILIDADE
    SET status_disponivel = 'Indisponivel'
    WHERE PROFISSIONAIS_idProfissional = NEW.PROFISSIONAIS_idProfissional
      AND data_disponivel = NEW.data_consulta
      AND hora_disponivel = NEW.hora_consulta;
END$$

DELIMITER ;

-- Tentativa de inserir uma consulta em um horário indisponível 
-- ( irá dar erro devido a indisponibilidade do profissional)
INSERT INTO CONSULTA (PROFISSIONAIS_idProfissional,USUARIO_CPF,data_consulta,hora_consulta,relato_consulta,nota_consulta,observacao_consulta) VALUES (1, 111,'2024-12-22', '14:00', 'Teste de conflito',9, 'Teste de indisponibilidade');
select* from disponibilidade;

-- Adicionando um registro de disponibilidade para o teste
INSERT INTO DISPONIBILIDADE (PROFISSIONAIS_idProfissional,data_disponivel,hora_disponivel,status_disponivel) VALUES (1,'2024-12-23', '10:00', 'Disponivel');

select*from disponibilidade;

-- Inserindo uma consulta em um horário disponível
INSERT INTO CONSULTA (PROFISSIONAIS_idProfissional,USUARIO_CPF,data_consulta,hora_consulta,relato_consulta,nota_consulta,observacao_consulta) VALUES (1, 111, '2024-12-23', '10:00', 'Primeira sessão',10, 'Tudo ocorreu bem' );

select* from consulta;


-- Verificar a disponibilidade atualizada , ja indisponivel devido a inserção da consulta no horário que estava disponível
SELECT * FROM DISPONIBILIDADE
WHERE PROFISSIONAIS_idProfissional = 1
  AND data_disponivel = '2024-12-23'
  AND hora_disponivel = '10:00';
