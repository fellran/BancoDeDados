-- PROCEDURE valida dados da tb_idioma
 DELIMITER //
CREATE PROCEDURE sp_in_idioma(nome_idioma VARCHAR(255))
	BEGIN
    IF 
		(nome_idioma IS NULL) OR (length(trim(fn_remove_acento(nome_idioma)))) < 3 then signal sqlstate '45000' set message_text = 'error nome invalido';
    ELSE
		INSERT INTO tb_idioma(nome) VALUES (fn_remove_acento(nome_idioma));
	END IF;
	END //
DELIMITER ;


-- PROCEDURE valida dados da tb_classificacao

DELIMITER //
CREATE PROCEDURE sp_in_classificacao(idade_class TINYINT, descricao_class VARCHAR(255))
	BEGIN 
        IF 
		(idade_class IS NULL) OR (length(trim(fn_remove_acento(descricao_class)))) < 3 then signal sqlstate '45000' set message_text = 'error nome invalido';
    ELSE
		INSERT INTO tb_classificacao(idade, descricao) VALUES (idade_class, (fn_remove_acento(descricao_class)));
	END IF;
    END //
DELIMITER ;

-- PROCEDURE de validacao tb_categoria
DELIMITER //
CREATE PROCEDURE sp_in_categoria (nome_categoria VARCHAR(255))
	BEGIN 
    IF 
		(nome_categoria IS NULL) OR (LENGTH(TRIM(fn_remove_acento(nome_categoria)))) < 3 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error nome invalido';
    ELSE
		INSERT INTO tb_categoria (nome) VALUES (fn_remove_acento(nome_categoria));
	END IF;
    END //
DELIMITER ;

-- procedure de validacao de dados da tb_filme e tabela catalogo
DELIMITER //
CREATE PROCEDURE sp_in_filme (in_pais_origem VARCHAR(100), in_imagem VARCHAR(255), in_titulo VARCHAR(100), in_sinopse VARCHAR(255), in_ano_lancamento YEAR, in_idioma_original VARCHAR(50), in_idioma_disponivel VARCHAR(255), in_duracao TIME, in_avaliacao INT, in_id_classificacao INT, in_id_idioma INT, in_oscar TINYINT(4))
	BEGIN
		DECLARE id_in_catalogo  INT DEFAULT 0;
		IF (in_pais_origem IS NULL) OR (LENGTH(TRIM(fn_remove_acento(in_pais_origem)))) < 3 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error pais_origem invalido';
        ELSEIF (in_titulo IS NULL) OR (LENGTH(TRIM(fn_remove_acento(in_titulo)))) < 3 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error titulo invalido'; 
        ELSEIF (in_sinopse IS NULL) OR (LENGTH(TRIM(fn_remove_acento(in_sinopse)))) < 3 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error sinopse invalido';
		ELSEIF (in_idioma_original IS NULL) OR (LENGTH(TRIM(fn_remove_acento(in_idioma_original)))) < 3 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error idioma invalido';
        ELSEIF (in_idioma_disponivel IS NULL) OR (LENGTH(TRIM(fn_remove_acento(in_idioma_disponivel)))) < 3 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error idioma invalido';
        ELSEIF (in_duracao <= '00:00:00') THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'erro duracao invalida';
        ELSEIF (in_avaliacao IS NULL OR in_avaliacao > 6) THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'erro avaliacao invalida';
        ELSEIF (in_id_classificacao IS NULL) THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'erro classificacao_indicativa invalida';
        ELSEIF (in_id_idioma IS NULL)  THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'erro idioma invalida';
        ELSEIF (in_oscar <> 0 AND in_oscar <> 1 ) THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'erro boolean  invalida';
			ELSE
			 INSERT INTO tb_catalogo (pais_origem, imagem, titulo, sinopse, ano_lancamento, idioma_original, idioma_disponivel, duracao, avaliacao, id_classificacao, id_idioma)
			VALUES (fn_remove_acento(in_pais_origem), in_imagem, fn_remove_acento(in_titulo), fn_remove_acento(in_sinopse), in_ano_lancamento, fn_remove_acento(in_idioma_original), fn_remove_acento(in_idioma_disponivel), in_duracao, in_avaliacao ,in_id_classificacao, in_id_idioma);
        END IF;
			
			SET id_in_catalogo = (SELECT MAX(id_catalogo) FROM tb_catalogo);
            INSERT INTO tb_filme (oscar, id_catalogo) VALUES (in_oscar, id_in_catalogo);
    END //
DELIMITER ;

-- PROCEDURE de validacao da tabela tb_catalogo junto com a tabela tb_serie
DELIMITER //
CREATE PROCEDURE sp_in_serie (in_pais_origem VARCHAR(100), in_imagem VARCHAR(255), in_titulo VARCHAR(100), in_sinopse VARCHAR(255), in_ano_lancamento YEAR, in_idioma_original VARCHAR(50), in_idioma_disponivel VARCHAR(255), in_duracao TIME, in_avaliacao INT, in_id_classificacao INT, in_id_idioma INT, in_qnt_episodio INT)
	BEGIN
		DECLARE id_in_catalogo  INT DEFAULT 0;
		IF (in_pais_origem IS NULL) OR (LENGTH(TRIM(fn_remove_acento(in_pais_origem)))) < 3 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error pais_origem invalido';
        ELSEIF (in_titulo IS NULL) OR (LENGTH(TRIM(fn_remove_acento(in_titulo)))) < 3 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error titulo invalido'; 
        ELSEIF (in_sinopse IS NULL) OR (LENGTH(TRIM(fn_remove_acento(in_sinopse)))) < 3 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error sinopse invalido';
		ELSEIF (in_idioma_original IS NULL) OR (LENGTH(TRIM(fn_remove_acento(in_idioma_original)))) < 3 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error idioma invalido';
        ELSEIF (in_idioma_disponivel IS NULL) OR (LENGTH(TRIM(fn_remove_acento(in_idioma_disponivel)))) < 3 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error idioma invalido';
        ELSEIF (in_duracao <= '00:00:00') THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'erro duracao invalida';
        ELSEIF (in_avaliacao IS NULL OR in_avaliacao > 6) THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'erro avaliacao invalida';
        ELSEIF (in_id_classificacao IS NULL) THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'erro classificacao_indicativa invalida';
        ELSEIF (in_id_idioma IS NULL)  THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'erro idioma invalida';
        ELSEIF (in_qnt_episodio IS NULL OR in_qnt_episodio > 1000) THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'erro quantidade de episodio invalida';
			ELSE
			 INSERT INTO tb_catalogo (pais_origem, imagem, titulo, sinopse, ano_lancamento, idioma_original, idioma_disponivel, duracao, avaliacao, id_classificacao, id_idioma)
			VALUES (fn_remove_acento(in_pais_origem), in_imagem, fn_remove_acento(in_titulo), fn_remove_acento(in_sinopse), in_ano_lancamento, fn_remove_acento(in_idioma_original), fn_remove_acento(in_idioma_disponivel), in_duracao, in_avaliacao ,in_id_classificacao, in_id_idioma);
        END IF;
			
			SET id_in_catalogo = (SELECT MAX(id_catalogo) FROM tb_catalogo);
            INSERT INTO tb_serie (qnt_episodio, id_catalogo) VALUES (in_qnt_episodio, id_in_catalogo);
    END //
DELIMITER ;

-- PROCEDURE tb _temporada 
DELIMITER //
CREATE PROCEDURE sp_in_temporada (in_titulo VARCHAR(100), in_descricao VARCHAR(255), in_qnt_temporada TINYINT, in_id_serie INT)
	BEGIN
		DECLARE id_in_temporada  INT DEFAULT 0;
        IF (in_titulo IS NULL) OR (LENGTH(TRIM(fn_remove_acento(in_titulo)))) < 3 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error titulo invalido';
        ELSEIF (in_descricao IS NULL) OR (LENGTH(TRIM(fn_remove_acento(in_descricao)))) < 3 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error titulo invalido'; 
        ELSEIF (in_qnt_temporada IS NULL OR in_qnt_temporada > 127) THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'erro quantidade de episodio invalida';
			ELSE
			 INSERT INTO tb_temporada (titulo, descricao, qnt_episodio, id_serie)
			VALUES (fn_remove_acento(in_titulo), fn_remove_acento(in_descricao), in_qnt_temporada, in_id_serie);
        END IF;
    END //
DELIMITER ;

-- PROCEDURE valida dados tb_espisodio
DELIMITER //
CREATE PROCEDURE sp_in_episodio (in_numero INT, in_id_catalogo INT, in_id_temporada INT)
	BEGIN
	IF in_numero < 0 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'erro numero invalida';
    ELSE
		INSERT INTO tb_episodio (numero, id_catalogo, id_temporada) VALUES (in_numero, in_id_catalogo, in_id_temporada);
	END IF;
	END //
DELIMITER ;

-- procedure valida tb_catalogo_categoria
DELIMITER //
CREATE PROCEDURE sp_in_catalogo_categoria (in_id_catalogo INT, in_id_categoria INT)
	BEGIN
	IF in_id_catalogo < 0 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'erro id do catalogo invalida';
    ELSEIF in_id_categoria < 0 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'erro id do categoria invalida';
    ELSE
		INSERT INTO tb_catalogo_categoria (id_catalogo, id_categoria) VALUES (in_id_catalogo, in_id_categoria);
	END IF;
	END //
DELIMITER ;

-- procedure de validacao da tb_catalogo_idioma
DELIMITER //
CREATE PROCEDURE sp_in_catalogo_idioma (in_id_catalogo INT, in_id_idioma INT)
	BEGIN
	IF in_id_catalogo < 0 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'erro id do catalogo invalida';
    ELSEIF in_id_idioma < 0 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'erro id do idioma invalida';
    ELSE
		INSERT INTO tb_catalogo_idioma (id_catalogo, id_idioma) VALUES (in_id_catalogo, in_id_idioma);
	END IF;
	END //
DELIMITER ;

-- procedure validada de insert da tb_ator 
DELIMITER //
CREATE PROCEDURE sp_in_ator (in_nome VARCHAR(100), in_sobrenome VARCHAR(255), in_dt_nascimento DATE, in_foto VARCHAR(2555))
	BEGIN
		DECLARE id_in_ator  INT DEFAULT 0;
		IF (in_nome IS NULL) OR (LENGTH(TRIM(fn_remove_acento(in_nome)))) < 3 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error ator invalido';
        ELSEIF (in_sobrenome IS NULL) OR (LENGTH(TRIM(fn_remove_acento(in_sobrenome)))) < 3 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error sobrenome invalido'; 
			ELSE
			 INSERT INTO tb_ator (nome, sobrenome, dt_nascimento, foto)
			VALUES (fn_remove_acento(in_nome), fn_remove_acento(in_sobrenome), in_dt_nascimento, in_foto);
        END IF;
    END //
DELIMITER ;

-- procedure que valida dados tb_pais
DELIMITER //
CREATE PROCEDURE sp_in_pais (in_nome VARCHAR(255), in_descricao VARCHAR(255))
	BEGIN
    IF (in_nome IS NULL) OR (LENGTH(TRIM(fn_remove_acento(in_nome)))) < 3 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error descricao invalido';
    ELSEIF (in_descricao IS NULL) OR (LENGTH(TRIM(fn_remove_acento(in_descricao)))) < 3 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error descricao invalido';
		ELSE 
			INSERT INTO tb_pais (nome, descricao) VALUES (fn_remove_acento(in_nome), fn_remove_acento(in_descricao));
    END IF;
    END //
DELIMITER ;

-- procedure que valida dados da tb_endereco
DELIMITER //
CREATE PROCEDURE sp_in_endereco (in_rua VARCHAR(255), in_numero TINYINT, in_bairro VARCHAR(255), in_id_pais INT)
	BEGIN
		IF (in_rua IS NULL) OR  (LENGTH(TRIM(fn_remove_acento(in_rua)))) < 3 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error rua invalido';
        ELSEIF (in_numero IS NULL) OR (in_numero > 127) THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error numero invalido';
        ELSEIF (in_bairro IS NULL) OR (LENGTH(TRIM(fn_remove_acento(in_bairro)))) < 3 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error bairro invalido';
        ELSE
			INSERT INTO tb_endereco (rua, numero, bairro, id_pais) VALUES (fn_remove_acento(in_rua), in_numero, fn_remove_acento(in_bairro), in_id_pais);
		END IF;
    END //
DELIMITER ;

-- procedure que valida dados da tb_usuario
DELIMITER //
CREATE PROCEDURE sp_in_usuario (in_nome VARCHAR(100), in_sobrenome VARCHAR(255), in_email VARCHAR(255), in_status TINYINT, in_dt_nascimento DATE, in_dt_cadastro DATETIME, in_senha VARCHAR(255), in_id_endereco INT, in_foto VARCHAR(255))
	BEGIN
    DECLARE id_in_usuario INT DEFAULT 0;
    IF (in_nome IS NULL) OR (LENGTH(TRIM(fn_remove_acento(in_nome)))) < 3 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error nome invalido';
    ELSEIF (in_sobrenome IS NULL) OR (LENGTH(TRIM(fn_remove_acento(in_sobrenome)))) < 3 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error sobrenome invalido';
    ELSEIF (in_email IS NULL) OR (LENGTH(TRIM(fn_remove_acento(in_email)))) < 3 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error email invalido';
    ELSEIF (in_status IS NULL) OR (in_status <> 0 AND in_status <> 1) THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error status invalido';
    ELSEIF (in_dt_nascimento IS NULL) OR (in_dt_nascimento = '0000-00-00') THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error data nascimento invalido';
    ELSEIF (in_dt_cadastro = '0000-00-00 00:00:00') THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error data cadastro invalido';
    ELSEIF (in_senha IS NULL) THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error senha invalido';
    ELSEIF (in_foto IS NULL) THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error foto invalido';
		ELSE
			INSERT INTO tb_usuario (nome, sobrenome, email, `status`, dt_nascimento, dt_cadastro, senha, dt_atualizacao, id_endereco)
            VALUES (fn_remmove_acento(in_nome), fn_remove_acento(in_sobrenome), in_email, `status`, dt_nascimento, dt_cadastro, senha, in_is_endereco);
		END IF;
			SET id_in_usuario = (SELECT MAX(id_usuario) FROM tb_usuario);
            INSERT INTO tb_funcionario (foto, id_usuario) VALUES (foto, id_in_usuario);
    END //
DELIMITER ;
CALL sp_in_usuario('felipe', 'oliveira', 'felipe@gmail.com', '1', '1998-04-20', '2023-06-15 01:15:30', '123456', '3', 'https://engenharia360.com/wp-content/uploads/2019/05/esta-pessoa-nao-existe-engenharia360-4.png');
 
-- procedure validada da tb_cliente
DELIMITER //
CREATE PROCEDURE sp_in_cliente (in_plano_escolhido VARCHAR(255), in_dt_vencimento DATETIME, in_id_usuario INT, in_id_plano INT, in_id_cartao_credito INT)
	BEGIN
		IF (LENGTH(TRIM(fn_remove_acento(in_plano_escolhido)))) < 3 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error plano invalido';
        ELSEIF (in_dt_vencimento = '0000-00-00') THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error data vencimento invalido';
        ELSE
		INSERT INTO tb_cliente (plano_escolhido, dt_vencimento, id_usuario, id_plano, id_cartao_credito)
        VALUES (fn_remove_acento(in_plano_escolhido), in_dt_vencimento, in_id_usuario, in_id_plano, in_id_cartao_credito);
	END IF;
    END //
DELIMITER ;

-- PROCEDURE de validacao tb_plano
DELIMITER //
CREATE PROCEDURE sp_in_plano (in_valor FLOAT, in_descricao VARCHAR(255), in_nome_plano VARCHAR(255))
	BEGIN
		IF in_valor < '19,00' THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error valor invalido';
        ELSEIF (LENGTH(TRIM(fn_remove_acento(in_descricao)))) < 3 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error descricao invalido';
        ELSEIF (LENGTH(TRIM(fn_remove_acento(in_nome_plano)))) < 3 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error descricao invalido';
        ELSE
		INSERT INTO tb_plano (valor, descricao, nome_plano) 
        VALUES (in_valor, fn_remove_acento(in_descricao), fn_remove_acento(in_nome_plano));
	END IF;
    END //
DELIMITER ;

-- PROCEDURE de validacao da tb_perfil
DELIMITER //
CREATE PROCEDURE sp_in_perfil (in_foto VARCHAR(255), in_nome VARCHAR(255), in_tipo VARCHAR(255), in_id_cliente INT)
	BEGIN
		IF (LENGTH(TRIM(fn_remove_acento(in_nome)))) < 3 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error nome invalido';
		ELSEIF (LENGTH(TRIM(fn_remove_acento(in_tipo)))) < 3 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error tipo invalido';
        ELSE
		INSERT INTO tb_perfil (foto, nome, tipo, id_cliente) 
        VALUES (in_foto, fn_remove_acento(in_nome), fn_remove_acento(in_tipo), in_id_cliente);
	END IF;
    END //
DELIMITER ;


-- procedure de validacao tb_cartao_credito
DELIMITER //
CREATE PROCEDURE sp_in_cartao_credito (in_numero INT, in_dt_vencimento DATE, in_cod_seguranca VARCHAR(255), in_titular VARCHAR(100))
	BEGIN
		IF in_numero < '0' THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error numero invalido';
        ELSEIF in_dt_vencimento = '0000-00-00' THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error dt_vencimento invalido';
        ELSEIF (LENGTH(TRIM(fn_remove_acento(in_titular)))) < 3 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error titular invalido';
        ELSE
		INSERT INTO tb_cartao_credito (numero, dt_vencimento, cod_seguranca, titular) 
        VALUES (in_numero, in_dt_vencimento, in_cod-seguranca, in_titular);
	END IF;
    END //
DELIMITER ;

CALL sp_in_cartao_credito(854756789, '2029-01-31', '583', 'João condé');

-- procedure insert tb_pagamento
DELIMITER //
CREATE PROCEDURE sp_in_pagamento (in_valor FLOAT, in_dt_pagamento DATETIME, in_id_cartao_credito INT, in_id_tipo_pagamento INT, in_id_cliente INT)
	BEGIN 
        IF in_valor < '000.00' THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error valor invalido';
        ELSE
		INSERT INTO tb_pagamento (valor, dt_pagamento, id_cartao_credito, id_tipo_pagamento, id_cliente)
        VALUES (in_valor, in_dt_pagamento, in_id_cartao_credito, in_id_tipo_pagamento, in_id_cliente);
	END IF;
    END //
DELIMITER ;
CALL sp_in_pagamento('25.00', NOW(), '1', '1', '4');

-- procedure valida dados da tb_tipo_pagamento
DELIMITER //
CREATE PROCEDURE sp_in_tipo_pagamento (in_boleto INT, in_cartao_debit0 INT, in_cartao_credito INT, in_pix INT)
	BEGIN 
		IF in_boleto < '0' THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error boleto invalido';
        ELSEIF in_cartao_debit0 < '0' THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error cartao debito invalido';
        ELSEIF in_cartao_credito < '0' THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error cartao credito invalido';
        ELSEIF in_pix < '0' THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error pix invalido';
        ELSE
		INSERT INTO tb_tipo_pagamento (boleto, cartao_debit0, cartao_credito, pix) 
        VALUES (in_boleto, in_cartao_debit0, in_cartao_credito, in_pix);
	END IF;
    END //
DELIMITER ;

-- procedure que valida dados da tb_funcionario
DELIMITER //
CREATE PROCEDURE sp_in_funcionario (in_foto VARCHAR(255), in_id_usuario INT)
	BEGIN
		IF (in_foto IS NULL) THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error foto invalido';
        ELSE
		INSERT INTO tb_funcionario (foto, id_usuario) VALUES (in_foto, in_id_usuario);
    END IF;
    END //
DELIMITER ;






