-- procedure de delete da tb_idioma
DELIMITER $$
CREATE PROCEDURE sp_delete_idioma (id_delete_idioma INT)
	BEGIN
		DELETE FROM tb_idioma WHERE id_idioma = id_delete_idioma;
    END $$
DELIMITER ;

-- procedure de delete tb_classificacao
DELIMITER $$
CREATE PROCEDURE sp_delete_classificacao (id_delete_classificacao INT)
	BEGIN
		DELETE FROM tb_classificacao 
        WHERE id_classificacao = id_delete_classificacao;
    END $$
DELIMITER ;

-- procedure de delete tb_categoria
DELIMITER $$
CREATE PROCEDURE sp_delete_categoria (id_delete_categoria INT)
	BEGIN
		DELETE FROM tb_categoria WHERE id_categoria = id_delete_categoria;
    END $$
DELIMITER ;

-- procedure de delete tb_catalogo
DELIMITER $$
CREATE PROCEDURE sp_delete_catalogo (id_delete_catalogo INT)
	BEGIN
		DELETE FROM tb_catalogo
		WHERE id_catalogo = id_delete_catalogo;
    END $$
DELIMITER ;

-- procedure de delete tb_serie
DELIMITER $$
CREATE PROCEDURE sp_delete_serie (id_delete_serie INT)
	BEGIN
		DELETE FROM 
			tb_serie
		WHERE
			id_serie = id_delete_serie;
    END $$
DELIMITER ;

-- procedure de delete tb_filme
DELIMITER $$
CREATE PROCEDURE sp_delete_filme (id_delete_filme INT)
	BEGIN
		DELETE FROM 
			tb_filme
		WHERE
			id_filme = id_delete_filme;
    END $$
DELIMITER ;

-- procedure de delete tb_temporada
DELIMITER $$
CREATE PROCEDURE sp_delete_temporada (id_delete_temporada INT)
	BEGIN
		DELETE FROM 
			tb_temporada
		WHERE
			id_temporada = id_delete_temporada;
    END $$
DELIMITER ;

-- procedure de delete tb_episodio
DELIMITER $$
CREATE PROCEDURE sp_delete_episodio (id_delete_episodio INT)
	BEGIN
		DELETE FROM 
			tb_episodio
		WHERE
			id_episodio = id_delete_episodio;
    END $$
DELIMITER ;

-- procedure de delete tb_catalogo_categoria
DELIMITER $$
CREATE PROCEDURE sp_delete_catalogo_categoria (id_delete_categoria INT, id_delete_catalogo INT)
	BEGIN
		DELETE FROM 
			tb_catalogo_categoria
		WHERE
			id_catalogo = id_delete_catalogo OR id_categoria = id_delete_categoria;
    END $$
DELIMITER ;

-- procedure de delete tb_catalogo_idioma
DELIMITER $$
CREATE PROCEDURE sp_delete_catalogo_idioma (id_delete_catalogo INT, id_delete_idioma INT)
	BEGIN
		DELETE FROM 
			tb_catalogo_idioma
		WHERE
			id_catalogo = id_delete_catalogo OR id_categoria = id_delete_categoria;
    END $$
DELIMITER ;

-- procedure de delete tb_ator
DELIMITER $$
CREATE PROCEDURE sp_delete_ator  (id_delete_ator INT)
	BEGIN
		DELETE FROM 
			tb_ator
		WHERE
			id_ator = id_delete_ator;
    END $$
DELIMITER ;

-- procedure de delete tb_pais
DELIMITER $$
CREATE PROCEDURE sp_delete_pais (id_delete_pais INT)
	BEGIN
		DELETE FROM 
			tb_pais
		WHERE
			id_pais = id_delete_pais;
    END $$
DELIMITER ;


-- procedure de delete tb_endereco
DELIMITER $$
CREATE PROCEDURE sp_delete_endereco (id_delete_endereco INT)
	BEGIN
		DELETE FROM 
			tb_endereco
		WHERE
			id_endereco = id_delete_endereco;
    END $$
DELIMITER ;

-- procedure de delete tb_usuario
DELIMITER $$
CREATE PROCEDURE sp_delete_usuario (id_delete_usuario INT)
	BEGIN
		DELETE FROM 
			tb_usuario
		WHERE
			id_usuario = id_delete_usuario;
    END $$
DELIMITER ;

-- procedure de delete tb_cliente
DELIMITER $$
CREATE PROCEDURE sp_delete_cliente (id_delete_cliente INT)
	BEGIN
		DELETE FROM 
			tb_cliente
		WHERE
			id_cliente = id_delete_cliente;
    END $$
DELIMITER ;

-- procedure de delete tb_plano
DELIMITER $$
CREATE PROCEDURE sp_delete_plano (id_delete_plano INT)
	BEGIN
		DELETE FROM 
			tb_plano
		WHERE
			id_plano = id_delete_plano;
    END $$
DELIMITER ;

-- procedure de delete tb_perfil
DELIMITER $$
CREATE PROCEDURE sp_delete_perfil (id_delete_perfil INT)
	BEGIN
		DELETE FROM 
			tb_perfil
		WHERE
			id_perfil = id_delete_perfil;
    END $$
DELIMITER ;

-- procedure de delete tb_cartao_credito
DELIMITER $$
CREATE PROCEDURE sp_delete_cartao_credito (id_delete_cartao_credito INT)
	BEGIN
		DELETE FROM 
			tb_cartao_credito
		WHERE
			id_cartao_credito = id_delete_cartao_credito;
    END $$
DELIMITER ;

-- procedure de delete tb_pagemento
DELIMITER $$
CREATE PROCEDURE sp_delete_pagamento (id_delete_pagamento INT)
	BEGIN
		DELETE FROM 
			tb_pagamento
		WHERE
			id_pagamento = id_delete_pagamento;
    END $$
DELIMITER ;

-- procedure de delete tb_tipo_pagamento
DELIMITER $$
CREATE PROCEDURE sp_delete_tipo_pagamento (id_delete_tipo_pagamento INT)
	BEGIN
		DELETE FROM 
			tb_tipo_pagamento
		WHERE
			id_tipo_pagamento = id_delete_tipo_pagamento;
    END $$
DELIMITER ;

-- procedure de delete tb_funcionario
DELIMITER $$
CREATE PROCEDURE sp_delete_funcionario (id_delete_funcionario INT)
	BEGIN
		DELETE FROM 
			tb_funcionario
		WHERE
			id_funcionario = id_delete_funcionario;
    END $$
DELIMITER ;




