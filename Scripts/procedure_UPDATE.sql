-- procedure de update da tb_idioma
DELIMITER //
CREATE PROCEDURE sp_up_idioma(up_id_idioma INT, nome_idioma VARCHAR(255))
	BEGIN
	IF 
		(nome_idioma IS NULL) OR (length(trim(fn_remove_acento(nome_idioma)))) < 3 then signal sqlstate '45000' set message_text = 'error nome invalido';
		ELSE
		UPDATE tb_idioma SET nome = (fn_remove_acento(nome_idioma)) WHERE id_idioma = up_id_idioma;
	END IF;
	END //
DELIMITER ;

-- procedure de update da tb_classificacao
DELIMITER //
CREATE PROCEDURE sp_up_classificacao(up_id_classificacao INT, up_idade_class TINYINT, up_descricao_class VARCHAR(255))
	BEGIN 
        IF 
		(up_idade_class > 127) then signal sqlstate '45000' set message_text = 'error idade invalido';
        ELSEIF (up_descricao_class IS NULL) OR (length(trim(fn_remove_acento(up_descricao_class)))) < 3 then signal sqlstate '45000' set message_text = 'error descrcao invalido';
    ELSE
		UPDATE tb_classificacao SET idade = up_idade_class WHERE id_classificacao = up_id_classificacao;
        UPDATE tb_classificacao SET descricao = up_descricao_class WHERE id_classificacao = up_id_classificacao;
	END IF;
    END //
DELIMITER ;

-- procedure de update da tb_categoria
DELIMITER //
CREATE PROCEDURE sp_up_categoria (up_id_categoria INT, nome_categoria VARCHAR(255))
	BEGIN 
    IF 
		(nome_categoria IS NULL) OR (LENGTH(TRIM(fn_remove_acento(nome_categoria)))) < 3 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error nome invalido';
    ELSE
		UPDATE tb_categoria SET nome = fn_remove_acento(nome_categoria) WHERE id_categoria = up_id_categoria;
	END IF;
    END //
DELIMITER ;

-- procedure de update da tb_catalogo
DELIMITER //
CREATE PROCEDURE sp_up_catalogo (in_id_catalogo INT, in_pais_origem VARCHAR(100), in_imagem VARCHAR(255), in_titulo VARCHAR(100), in_sinopse VARCHAR(255), in_ano_lancamento YEAR, in_idioma_original VARCHAR(50), in_idioma_disponivel VARCHAR(255), in_duracao TIME, in_avaliacao INT, in_id_classificacao INT, in_id_idioma INT)
	BEGIN
		IF (in_pais_origem IS NULL) OR (LENGTH(TRIM(fn_remove_acento(in_pais_origem)))) < 3 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error pais_origem invalido';
        ELSEIF (in_titulo IS NULL) OR (LENGTH(TRIM(fn_remove_acento(in_titulo)))) < 3 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error titulo invalido'; 
        ELSEIF (in_sinopse IS NULL) OR (LENGTH(TRIM(fn_remove_acento(in_sinopse)))) < 3 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error sinopse invalido';
		ELSEIF (in_idioma_original IS NULL) OR (LENGTH(TRIM(fn_remove_acento(in_idioma_original)))) < 3 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error idioma invalido';
        ELSEIF (in_idioma_disponivel IS NULL) OR (LENGTH(TRIM(fn_remove_acento(in_idioma_disponivel)))) < 3 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error idioma invalido';
        ELSEIF (in_duracao <= '00:00:00') THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'erro duracao invalida';
        ELSEIF (in_avaliacao IS NULL OR in_avaliacao > 6) THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'erro avaliacao invalida';
        ELSEIF (in_id_classificacao IS NULL) THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'erro classificacao_indicativa invalida';
        ELSEIF (in_id_idioma IS NULL)  THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'erro idioma invalida';
			ELSE
		UPDATE tb_catalogo SET pais_origem = fn_remove_acento(in_pais_origem) WHERE id_catalogo = in_id_catalogo;
        UPDATE tb_catalogo SET titulo = fn_remove_acento(in_titulo) WHERE id_catalogo = in_id_catalogo;
        UPDATE tb_catalogo SET sinopse = fn_remove_acento(in_sinopse) WHERE id_catalogo = in_id_catalogo;
        UPDATE tb_catalogo SET idioma_original = fn_remove_acento(in_idioma_original) WHERE id_catalogo = in_id_catalogo;
        UPDATE tb_catalogo SET idioma_disponivel = fn_remove_acento(in_idioma_disponivel) WHERE id_catalogo = in_id_catalogo;
        UPDATE tb_catalogo SET duracao = in_duracao WHERE id_catalogo = in_id_catalogo;
        UPDATE tb_catalogo SET avaliacao = in_avaliacao WHERE id_catalogo = in_id_catalogo;
        UPDATE tb_catalogo SET id_classificacao = in_id_classificacao WHERE id_catalogo = in_id_catalogo;
        UPDATE tb_catalogo SET id_idioma = in_id_idioma WHERE id_catalogo = in_id_catalogo;
	END IF;
    END //
DELIMITER ;

-- procedure de update da tb_filme
DELIMITER //
CREATE PROCEDURE sp_up_filme (in_id_filme INT, in_oscar TINYINT, in_id_catalogo INT)
	BEGIN
		IF (in_oscar <> 0 AND in_oscar <> 1 ) THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'erro boolean  invalida';
        UPDATE tb_filme SET oscar = in_oscar WHERE id_filme = in_id_filme;
        UPDATE tb_filme SET id_catalogo = in_id_catalogo WHERE id_filme = in_id_filme;
	END IF;
    END //
DELIMITER ;

-- procedure de update tb_serie
DELIMITER //
CREATE PROCEDURE sp_up_serie (in_id_serie INT, in_qnt_episodio TINYINT, in_id_catalogo INT)
	BEGIN
     IF (in_qnt_episodio IS NULL OR in_qnt_episodio > 1000) THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'erro quantidade de episodio invalida';
     ELSE
		UPDATE tb_serie SET qnt_episodio = in_qnt_episodio WHERE id_serie = in_id_serie;
        UPDATE tb_serie SET id_catalogo = in_id_catalogo WHERE id_serie = in_id_serie;
	END IF;
    END //
DELIMITER ;

-- procedure de update tb_temporada
DELIMITER //
CREATE PROCEDURE sp_up_temporada (in_id_temporada INT, in_titulo VARCHAR(100), in_descricao VARCHAR(255), in_qnt_temporada TINYINT, in_id_serie INT)
	BEGIN
		DECLARE id_in_temporada  INT DEFAULT 0;
        IF (in_titulo IS NULL) OR (LENGTH(TRIM(fn_remove_acento(in_titulo)))) < 3 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error titulo invalido';
        ELSEIF (in_descricao IS NULL) OR (LENGTH(TRIM(fn_remove_acento(in_descricao)))) < 3 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error titulo invalido'; 
        ELSEIF (in_qnt_temporada IS NULL OR in_qnt_temporada > 127) THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'erro quantidade de episodio invalida';
			ELSE
				UPDATE tb_temporada SET titulo = fn_remove_acento(in_titulo) WHERE id_temporada = in_id_temporada;
                UPDATE tb_temporada SET descricao = fn_remove_acento(in_descricao) WHERE id_temporada = in_id_temporada;
                UPDATE tb_temporada SET qnt_episodio = in_qnt_temporada WHERE id_temporada = in_id_temporada;
        END IF;
    END //
DELIMITER ;

-- procedure de update tb_episodio
DELIMITER //
CREATE PROCEDURE sp_up_episodio (in_id_episodio INT, in_numero INT, in_id_catalogo INT, in_id_temporada INT)
	BEGIN
	IF in_numero < 0 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'erro numero invalida';
    ELSE
		UPDATE tb_episodio SET numero = in_numero WHERE id_episodio = in_id_episodio;
        UPDATE tb_episodio SET id_catalogo = in_id_catalogo WHERE id_episodio = in_id_episodio;
        UPDATE tb_episodio SET id_temporada = in_id_temporada WHERE id_episodio = in_id_episodio;
	END IF;
	END //
DELIMITER ;

-- procedure de update tb_catalogo_categoria
DELIMITER //
CREATE PROCEDURE sp_up_catalogo_categoria ( in_id_catalogo INT, in_id_categoria INT)
	BEGIN
	IF in_id_catalogo < 0 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'erro id do catalogo invalida';
    ELSEIF in_id_categoria < 0 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'erro id do categoria invalida';
    ELSE
		UPDATE tb_catalogo_categoria SET id_catalogo = in_id_catalogo WHERE id_catalogo = in_id_catalogo;
        UPDATE tb_catalogo_categoria SET id_categoria = in_id_categoria WHERE id_catalogo = in_id_categoria;
	END IF;
	END //
DELIMITER ;

-- procedure de update tb_catalogo_idioma
DELIMITER //
CREATE PROCEDURE sp_up_catalogo_idioma (in_id_catalogo INT, in_id_idioma INT)
	BEGIN
	IF in_id_catalogo < 0 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'erro id do catalogo invalida';
    ELSEIF in_id_idioma < 0 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'erro id do idioma invalida';
    ELSE
		UPDATE tb_catalogo_idioma SET id_catalogo = in_id_catalogo WHERE id_catalogo = in_id_catalogo;
        UPDATE tb_catalogo_idioma SET idioma = in_id_idioma WHERE id_catalogo = in_id_idioma;
	END IF;
	END //
DELIMITER ;

-- procedure de update tb_ator
DELIMITER //
CREATE PROCEDURE sp_up_ator (in_id_ator INT, in_nome VARCHAR(100), in_sobrenome VARCHAR(255), in_dt_nascimento DATE, in_foto VARCHAR(2555))
	BEGIN
		IF (in_nome IS NULL) OR (LENGTH(TRIM(fn_remove_acento(in_nome)))) < 3 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error ator invalido';
        ELSEIF (in_sobrenome IS NULL) OR (LENGTH(TRIM(fn_remove_acento(in_sobrenome)))) < 3 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error sobrenome invalido'; 
			ELSE
			UPDATE tb_ator SET nome = fn_remove_acento(in_nome) WHERE id_ator = in_id_ator;
            UPDATE tb_ator SET sobrenome = fn_remove_acento(in_sobrenome) WHERE id_ator = in_id_ator;
            UPDATE tb_ator SET dt_nascimento = in_dt_nascimento WHERE id_ator = in_id_ator;
            UPDATE tb_ator SET foto = in_foto WHERE id_ator = in_id_ator;
        END IF;
    END //
DELIMITER ;

-- procedure de update da tb_pais
DELIMITER //
CREATE PROCEDURE sp_up_pais (in_id_pais INT, in_nome VARCHAR(255), in_descricao VARCHAR(255))
	BEGIN
    IF (in_nome IS NULL) OR (LENGTH(TRIM(fn_remove_acento(in_nome)))) < 3 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error descricao invalido';
    ELSEIF (in_descricao IS NULL) OR (LENGTH(TRIM(fn_remove_acento(in_descricao)))) < 3 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error descricao invalido';
		ELSE 
			UPDATE tb_pais SET nome = fn_remove_acento(in_nome) WHERE id_pais = in_id_pais;
            UPDATE tb_pais SET descricao = fn_remove_acento(in_descricao) WHERE id_pais = in_id_pais;
    END IF;
    END //
DELIMITER ;

-- procedure de update da tb_endereco
DELIMITER //
CREATE PROCEDURE sp_up_endereco (in_id_endereco INT, in_rua VARCHAR(255), in_numero TINYINT, in_bairro VARCHAR(255), in_id_pais INT)
	BEGIN
		IF (in_rua IS NULL) OR  (LENGTH(TRIM(fn_remove_acento(in_rua)))) < 3 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error rua invalido';
        ELSEIF (in_numero IS NULL) OR (in_numero > 127) THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error numero invalido';
        ELSEIF (in_bairro IS NULL) OR (LENGTH(TRIM(fn_remove_acento(in_bairro)))) < 3 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error bairro invalido';
        ELSE
			UPDATE tb_endereco SET rua = fn_remove_acento(in_rua) WHERE id_endereco = in_id_endereco;
            UPDATE tb_endereco SET numero = in_numero WHERE id_endereco = in_id_endereco;
            UPDATE tb_endereco SET bairro = fn_remove_acento(in_bairro) WHERE id_endereco = in_id_endereco;
		END IF;
    END //
DELIMITER ;
CALL sp_up_endereco('2', 'Rua Açucenna', '123', 'Bairro do Florido', '2');

-- procedure de update tb_usuario
DELIMITER //
CREATE PROCEDURE sp_up_usuario (in_id_usuario INT, in_nome VARCHAR(100), in_sobrenome VARCHAR(255), in_email VARCHAR(255), in_status TINYINT, in_dt_nascimento DATE, in_dt_cadastro DATETIME, in_senha VARCHAR(255), in_id_endereco INT)
	BEGIN
    IF (in_nome IS NULL) OR (LENGTH(TRIM(fn_remove_acento(in_nome)))) < 3 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error nome invalido';
    ELSEIF (in_sobrenome IS NULL) OR (LENGTH(TRIM(fn_remove_acento(in_sobrenome)))) < 3 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error sobrenome invalido';
    ELSEIF (in_email IS NULL) OR (LENGTH(TRIM(fn_remove_acento(in_email)))) < 3 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error email invalido';
    ELSEIF (in_status IS NULL) OR (in_status <> 0 AND in_status <> 1) THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error status invalido';
    ELSEIF (in_dt_nascimento IS NULL) OR (in_dt_nascimento = '0000-00-00') THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error data nascimento invalido';
    ELSEIF (in_senha IS NULL) THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error senha invalido';
		ELSE
			UPDATE tb_usuario SET nome = fn_remove_acento(in_nome) WHERE id_usuario = in_id_usuario;
            UPDATE tb_usuario SET sobrenome = fn_remove_acento(in_sobrenome) WHERE id_usuario = in_id_usuario;
            UPDATE tb_usuario SET emeil = fn_remove_acento(in_email) WHERE id_usuario = in_in_usuario;
            UPDATE tb_usuario SET `status` = in_status WHERE id_usuario = in_id_usuario;
            UPDATE tb_usuario SET dt_nascimento = in_dt_nascimento WHERE id_usuario = in_id_usuario;
            UPDATE tb_usuario SET senha = in_senha WHERE id_usuario = in_id_usuario;
            UPDATE tb_usuario SET id_endereco = in_id_endereco WHERE id_usuario = in_id_usuario;
		END IF;
    END //
DELIMITER ;

-- PROCEDURE de update da tb_cliente
DELIMITER //
CREATE PROCEDURE sp_up_cliente (in_id_cliente INT, in_plano_escolhido VARCHAR(255), in_dt_vencimento DATETIME, in_id_usuario INT, in_id_plano INT, in_id_cartao_credito INT)
	BEGIN
		IF (LENGTH(TRIM(fn_remove_acento(in_plano_escolhido)))) < 3 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error plano invalido';
        ELSEIF (in_dt_vencimento = '0000-00-00') THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error data vencimento invalido';
        ELSE
		UPDATE tb_cliente SET plano_escolhido = fn_remove_acento(in_plano_escolhido) WHERE id_cliente = in_id_cliente;
        UPDATE tb_cliente SET dt_nascimento = in_dt_vencimento WHERE id_cliente = in_id_cliente;
        UPDATE tb_cliente SET id_usuario = in_id_usuario WHERE id_cliente = in_id_cliente;
        UPDATE tb_cliente SET id_plano = in_id_plano WHERE id_cliente = in_id_cliente;
        UPDATE tb_cliente SET id_cartao_credito = in_id_cliente WHERE id_cliente = in_id_cliente;
	END IF;
    END //
DELIMITER ;

-- procedure de update tb_plano
DELIMITER //
CREATE PROCEDURE sp_up_plano (in_id_plano INT, in_valor FLOAT, in_descricao VARCHAR(255), in_nome_plano VARCHAR(255))
	BEGIN
		IF in_valor < '19,00' THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error valor invalido';
        ELSEIF (LENGTH(TRIM(fn_remove_acento(in_descricao)))) < 3 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error descricao invalido';
        ELSEIF (LENGTH(TRIM(fn_remove_acento(in_nome_plano)))) < 3 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error descricao invalido';
        ELSE
			UPDATE tb_plano SET valor = in_valor WHERE id_plano = in_id_plano;
            UPDATE tb_plano SET descricao = fn_remove_acento(in_descricao) WHERE id_plano = in_id_plano;
            UPDATE tb_plano SET nome_plano = fn_remove_acento(in_nome_plano) WHERE id_plano = in_id_plano;
	END IF;
    END //
DELIMITER ;

-- procedure de update da tb_perfil
DELIMITER //
CREATE PROCEDURE sp_up_perfil (in_id_perfil INT, in_foto VARCHAR(255), in_nome VARCHAR(255), in_tipo VARCHAR(255), in_id_cliente INT)
	BEGIN
		IF (LENGTH(TRIM(fn_remove_acento(in_nome)))) < 3 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error nome invalido';
		ELSEIF (LENGTH(TRIM(fn_remove_acento(in_tipo)))) < 3 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error tipo invalido';
        ELSE
			UPDATE tb_perfil SET foto = in_foto WHERE id_plano = in_id_perfil;
            UPDATE tb_perfil SET nome = in_nome WHERE id_plano = in_id_perfil;
            UPDATE tb_perfil SET tipo = in_tipo WHERE id_plano = in_id_perfil;
            UPDATE tb_perfil SET id_cliente = in_id_cliente WHERE id_plano = in_id_perfil;
	END IF;
    END //
DELIMITER ;

-- procedure de update da tb_cartao_credito
DELIMITER //
CREATE PROCEDURE sp_up_cartao_credito (in_cartao_credito INT, in_numero INT, in_dt_vencimento DATE, in_cod_seguranca VARCHAR(255), in_titular VARCHAR(100))
	BEGIN
		IF in_numero < '0' THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error numero invalido';
        ELSEIF in_dt_vencimento = '0000-00-00' THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error dt_vencimento invalido';
        ELSEIF (LENGTH(TRIM(fn_remove_acento(in_titular)))) < 3 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error titular invalido';
        ELSE
			UPDATE tb_cartao_credito SET numero = in_numero WHERE id_cartao_credito = in_cartao_credito;
            UPDATE tb_cartao_credito SET dt_vencimento = in_dt_vencimento WHERE id_cartao_credito = in_id_cartao_credito;
            UPDATE tb_cartao_credito SET titular = fn_remove_acento(in_titular) WHERE id_cartao_credito = in_id_cartao_credito;
	END IF;
    END //
DELIMITER ;

-- procedure de update da tb_pagamento
DELIMITER //
CREATE PROCEDURE sp_up_pagamento (in_id_pagamento INT, in_valor FLOAT, in_dt_pagamento DATETIME, in_id_cartao_credito INT, in_id_tipo_pagamento INT, in_id_cliente INT)
	BEGIN 
        IF in_valor < '000.00' THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error valor invalido';
        ELSE
		UPDATE tb_pagamento SET valor = in_valor WHERE id_pagamento = in_id_pagamento;
        UPDATE tb_pagamento SET dt_pagamento = in_id_pagamento WHERE id_pagamento = in_id_pagamento;
        UPDATE tb_pagamento SET id_cartao_credito = in_id_cartao_credito WHERE id_pagamento = in_id_pagamento;
        UPDATE tb_pagamento SET id_tipo_pagamento = in_id_tipo_pagamento WHERE id_pagamento = in_id_pagamento;
        UPDATE tb_pagamento SET id_cliente = in_id_cliente WHERE id_pagamento = in_id_pagamento;
	END IF;
    END //
DELIMITER ;

-- procedure de update da tb_tipo_pagamento
DELIMITER //
CREATE PROCEDURE sp_up_tipo_pagamento (in_id_tipo_pagamento INT, in_boleto INT, in_cartao_debit0 INT, in_cartao_credito INT, in_pix INT)
	BEGIN 
		IF in_boleto < '0' THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error boleto invalido';
        ELSEIF in_cartao_debit0 < '0' THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error cartao debito invalido';
        ELSEIF in_cartao_credito < '0' THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error cartao credito invalido';
        ELSEIF in_pix < '0' THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error pix invalido';
        ELSE
		UPDATE tb_tipo_pagamento SET boleto = in_boleto WHERE id_tipo_pagamento = in_id_tipo_pagamento;
        UPDATE tb_tipo_pagamento SET cartao_debit0 = in_cartao_debit0 WHERE id_tipo_pagamento = in_id_tipo_pagamento;
        UPDATE tb_tipo_pagamento SET cartao_credito = in_cartao_credito WHERE id_tipo_pagamento = in_id_tipo_pagamento;
        UPDATE tb_tipo_pagamento SET pix = in_pix WHERE id_tipo_pagamento = in_id_tipo_pagamento;
	END IF;
    END //
DELIMITER ;

-- procedure de update da tb_funcionario
CREATE PROCEDURE sp_up_funcionario (in_id_funcionario INT, in_foto VARCHAR(255), in_id_usuario INT)
	BEGIN
		IF (in_foto IS NULL) THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'error ';
        ELSE
			UPDATE tb_funcionario SET foto = in_foto WHERE id_funcionario = in_id_funcionario;
            UPDATE tb_funcionario SET id_usuario = in_id_usuario WHERE id_funcionario = in_id_funcionario;
	END IF;
    END //
DELIMITER ;














