-- vw_usuario - Esta visualização deve conter os todos os dados de todos os usuários, deseja-se também saber quais são funcionários e quais são clientes, o endereço de cada um e seu pais de origem,  quantos perfis cada um tem e qual é o seu plano.
CREATE VIEW vw_usuario AS 
	SELECT c.id_usuario AS cliente , f.id_usuario AS funcionario, u.id_usuario, u.nome, u.sobrenome, u.email, u.`status`, u.dt_nascimento, u.dt_cadastro, u.senha, u.dt_atualizacao, u.id_endereco,
    p.nome AS pais, COUNT(pe.nome) AS qnt_perfil, pla.descricao AS plano
    FROM tb_usuario AS u
		LEFT JOIN tb_funcionario AS f
			ON f.id_usuario = u.id_usuario
		LEFT JOIN tb_cliente AS c
			ON c.id_usuario = u.id_usuario
		LEFT JOIN tb_endereco AS e
			ON e.id_endereco = u.id_endereco
		INNER JOIN tb_pais AS p
			ON e.id_pais = p.id_pais
		INNER JOIN tb_perfil pe
			ON pe.id_cliente = c.id_cliente
		INNER JOIN tb_plano pla
			ON c.id_plano = pla.id_plano
		GROUP BY pe.nome;
            
    SELECT * FROM vw_usuario;

    -- vw_catalogo - Esta visualização deve conter todos os dados do catalogo, identificando series e filmes, (não devem estar presente os episodios nesta view), o idioma original e quantos idiomas são possíveis escolher, a classificação indicativa e suas categorias.
    CREATE VIEW vw_catalogo AS 
		SELECT se.id_catalogo AS serie , fe.id_catalogo AS filme, ca.id_catalogo AS catalogo,ca.pais_origem, ca.imagem, ca.titulo, ca.sinopse, ca.ano_lancamento, ca.idioma_original, ca.idioma_disponivel, ca.duracao, ca.avaliacao, ca.dt_atualizacao, ca.id_classificacao, ca.id_idioma, cl.descricao AS classificacao FROM tb_catalogo AS ca
			LEFT JOIN tb_serie AS se
				ON se.id_catalogo = ca.id_catalogo
			LEFT JOIN tb_filme AS fe
				ON ca.id_catalogo = fe.id_catalogo
			LEFT JOIN tb_classificacao AS cl
				ON cl.id_classificacao = ca.id_classificacao
			LEFT JOIN tb_catalogo_categoria AS ct
				ON ct.id_catalogo = ca.id_catalogo
			LEFT JOIN tb_categoria AS cg
				ON cg.id_categoria = ct.id_categoria;

SELECT * FROM vw_catalogo;
            
-- vw_episodio - Esta visualização deve conter todos os dados dos episódios, qual sua serie, e de qual temporada ele é.
CREATE VIEW vw_episodio AS
	SELECT e.id_episodio, e.numero, e.id_catalogo, e.id_temporada, ca.titulo, te.descricao, se.id_serie FROM tb_episodio AS e
		LEFT JOIN tb_temporada AS te
			ON te.id_temporada = e.id_temporada
		LEFT JOIN tb_serie AS se
			ON te.id_serie = se.id_serie
		LEFT JOIN tb_catalogo AS ca
			ON ca.id_catalogo = e.id_catalogo
		RIGHT JOIN tb_catalogo AS cat
			ON ca.id_catalogo = se.id_catalogo
            GROUP BY se.id_serie, e.id_episodio;

 SELECT * FROM vw_episodio;
 
 -- vw_temporada - Esta visualização deve conter todos os dados da temporada, a sua quantidade de episodios, e sua série.
 CREATE VIEW vw_temporada AS
	SELECT te.titulo, te.descricao, te.qnt_episodio, te.dt_atualizada, te.id_serie, se.qnt_episodio AS ep_serie, ca.titulo AS serie FROM tb_temporada AS te
		INNER JOIN tb_serie AS se
			ON se.id_serie = te.id_serie
		INNER JOIN tb_catalogo AS ca
			ON ca.id_catalogo = se.id_catalogo;
SELECT * FROM vw_temporada;
        
-- vw_ator - Deve conter todos os dados dos atores, quantidades de filmes feito por ele, quantidade de series feita por ele.
CREATE VIEW vw_ator AS 
	SELECT a.nome, a.sobrenome, a.dt_nascimento, a.foto, ct.id_ator, ca.id_catalogo, COUNT(ca.titulo) AS qnt_filmes_series ,ca.titulo AS filmes_series FROM tb_ator AS a
		INNER JOIN tb_catalogo_ator AS ct
			ON ct.id_ator = a.id_ator
		INNER JOIN tb_catalogo AS ca
			ON ca.id_catalogo = ct.id_catalogo
		GROUP BY a.nome, a.sobrenome, a.dt_nascimento, a.foto, ct.id_ator, ca.id_catalogo, ca.titulo;

SELECT * FROM vw_ator;
        
-- vw_pagamento - Deve conter todos os dados de pagamento, seu tipo, o nome do cliente, seu plano e data de vencimento.
CREATE VIEW vw_pagamento AS
	SELECT p.id_pagamento, p.valor, p.dt_pagamento, p.id_cartao_credito, p.id_tipo_pagamento, tp.boleto, tp.cartao_debit0, tp.cartao_credito, tp.pix, pl.descricao AS plano_escolhido , cl.dt_vencimento FROM tb_pagamento AS p
		INNER JOIN tb_cliente AS cl
			ON cl.id_cliente = p.id_cliente
		INNER JOIN tb_usuario AS us
			ON us.id_usuario = cl.id_cliente
		INNER JOIN tb_tipo_pagamento AS tp
			ON tp.id_tipo_pagamento = p.id_tipo_pagamento
		INNER JOIN tb_plano AS pl
			ON pl.id_plano  = cl.id_plano
		GROUP BY p.id_pagamento, p.valor, p.dt_pagamento, p.id_cartao_credito, p.id_tipo_pagamento;

SELECT * FROM vw_pagamento;

-- vw_perfil - deve conter todos os dados do perfil e seu cliente.
CREATE VIEW vw_perfil AS
	SELECT p.id_plano, us.nome AS cliente,  p.foto, p.nome AS nome_perfil, p.tipo, cl.id_cliente, cl.plano_escolhido, cl.dt_vencimento, cl.id_usuario, cl.id_cartao_credito FROM tb_perfil AS p
		LEFT JOIN tb_cliente AS cl
			ON p.id_plano = cl.id_plano
		LEFT JOIN tb_plano AS pl
			ON pl.id_plano = cl.id_plano
		LEFT JOIN tb_usuario AS us
			ON us.id_usuario = cl.id_usuario;

    SELECT * FROM vw_perfil;
        
        
        
        
        
        