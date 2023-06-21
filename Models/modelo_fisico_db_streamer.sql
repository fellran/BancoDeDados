CREATE DATABASE db_streamer COLLATE utf8mb4_general_ci CHARSET utf8mb4;

USE db_streamer;

CREATE TABLE IF NOT EXISTS tb_classificacao (
	id_classificacao INT PRIMARY KEY AUTO_INCREMENT,
    idade TINYINT(130) NOT NULL,
    descricao VARCHAR(255) NOT NULL
)AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS tb_idioma (
	id_idioma INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    dt_atualizada DATETIME
)AUTO_INCREMENT = 1;


CREATE TABLE IF NOT EXISTS tb_catalogo_idioma (
	id_catalogo INT,
    id_idioma INT,
	CONSTRAINT fk_catalogo_idioma_id_catalogo FOREIGN KEY (id_catalogo) REFERENCES tb_catalogo(id_catalogo) ON DELETE CASCADE, 
    CONSTRAINT fk_catalogo_idioma_id_idioma FOREIGN KEY (id_idioma) REFERENCES tb_idioma(id_idioma) ON DELETE CASCADE
);
ALTER TABLE tb_catalogo_idioma
DROP FOREIGN KEY fk_catalogo_idioma_id_idioma;

ALTER TABLE tb_catalogo_idioma
ADD CONSTRAINT fk_catalogo_idioma_id_idioma FOREIGN KEY (id_idioma)
REFERENCES tb_idioma (id_idioma)
ON DELETE CASCADE;


CREATE TABLE IF NOT EXISTS tb_categoria (
	id_categoria INT  PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    dt_atualizada DATETIME,
    UNIQUE uq_nome (nome)
)AUTO_INCREMENT = 1;

CREATE TABLE IF  NOT EXISTS tb_catalogo_categoria (
	id_catalogo INT,
    id_categoria INT,
    CONSTRAINT fk_categoria_id_catalogo FOREIGN KEY (id_catalogo) REFERENCES tb_catalogo(id_catalogo) ON DELETE CASCADE,
    CONSTRAINT fk_categoria_id_categoria FOREIGN KEY (id_categoria) REFERENCES tb_categoria(id_categoria) ON DELETE CASCADE
);
ALTER TABLE tb_catalogo_categoria
DROP FOREIGN KEY fk_categoria_id_categoria;

ALTER TABLE tb_catalogo_categoria
ADD CONSTRAINT fk_categoria_id_categoria FOREIGN KEY (id_categoria)
REFERENCES tb_categoria (id_categoria)
ON DELETE CASCADE;


CREATE TABLE IF NOT EXISTS tb_serie (
	id_serie INT PRIMARY KEY AUTO_INCREMENT,
    qnt_episodio TINYINT NOT NULL,
    id_catalogo INT,
    CONSTRAINT fk_serie_id_catalogo FOREIGN KEY (id_catalogo) REFERENCES tb_catalogo(id_catalogo) ON DELETE CASCADE
)AUTO_INCREMENT = 1;

ALTER TABLE tb_serie
DROP FOREIGN KEY fk_serie_id_catalogo;

ALTER TABLE tb_serie
ADD CONSTRAINT fk_serie_id_catalogo FOREIGN KEY (id_catalogo)
REFERENCES tb_catalogo (id_catalogo)
ON DELETE CASCADE;

CREATE TABLE IF NOT EXISTS tb_temporada (
	id_temporada INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(50) NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    qnt_episodio BOOLEAN NOT NULL,
    dt_atualizada DATETIME,
    id_serie INT,
    CONSTRAINT fk_serie_id_serie FOREIGN KEY (id_serie) REFERENCES tb_serie(id_serie) ON DELETE CASCADE
)AUTO_INCREMENT = 1;
ALTER TABLE tb_temporada
DROP FOREIGN KEY fk_serie_id_serie;

ALTER TABLE tb_temporada
ADD CONSTRAINT fk_serie_id_serie FOREIGN KEY (id_serie)
REFERENCES tb_serie (id_serie)
ON DELETE CASCADE;

CREATE TABLE IF NOT EXISTS tb_episodio (
	id_episodio INT PRIMARY KEY AUTO_INCREMENT,
    numero INT NOT NULL,
    id_catalogo INT,
    id_temporada INT,
    CONSTRAINT fk_episodio_id_catalogo FOREIGN KEY (id_catalogo) REFERENCES tb_catalogo(id_catalogo) ON DELETE CASCADE,
    CONSTRAINT fk_episodio_id_temporada FOREIGN KEY (id_temporada) REFERENCES tb_temporada(id_temporada) ON DELETE CASCADE
)AUTO_INCREMENT = 1;

ALTER TABLE tb_episodio
DROP FOREIGN KEY fk_episodio_id_temporada;

ALTER TABLE tb_episodio
ADD CONSTRAINT fk_episodio_id_temporada FOREIGN KEY (id_temporada)
REFERENCES tb_temporada (id_temporada)
ON DELETE CASCADE;

CREATE TABLE IF NOT EXISTS tb_filme (
	id_filme INT PRIMARY KEY AUTO_INCREMENT,
    oscar TINYINT,
    id_catalogo INT,
    CONSTRAINT fk_filme_id_catalogo FOREIGN KEY (id_catalogo) REFERENCES tb_catalogo(id_catalogo) ON DELETE CASCADE
)AUTO_INCREMENT = 1;
ALTER TABLE tb_filme
DROP FOREIGN KEY fk_filme_id_catalogo;

ALTER TABLE tb_filme
ADD CONSTRAINT fk_filme_id_catalogo FOREIGN KEY (id_catalogo)
REFERENCES tb_catalogo (id_catalogo)
ON DELETE CASCADE;


CREATE TABLE IF NOT EXISTS tb_catalogo (
	id_catalogo INT PRIMARY KEY AUTO_INCREMENT,
    pais_origem VARCHAR(100) NOT NULL,
    imagem VARCHAR(255) NOT NULL,
    titulo VARCHAR (100) NOT NULL,
    sinopse VARCHAR(255) NOT NULL,
    ano_lancamento YEAR NOT NULL,
    idioma_original VARCHAR(50) NOT NULL,
    idioma_disponivel VARCHAR(255) NOT NULL,
    duracao TIME NOT NULL,
    avaliacao ENUM('0', '1', '2', '3', '4', '5') NOT NULL,
    dt_atualizacao DATETIME NOT NULL,
    id_classificacao INT,
    id_idioma INT,
    UNIQUE uq_imagen (imagem),
    UNIQUE uq_idioma_original (idioma_original),
    CONSTRAINT fk_catalogo_id_classificacao FOREIGN KEY (id_classificacao) REFERENCES tb_classificacao(id_classificacao) ON DELETE CASCADE,
    CONSTRAINT fk_catalogo_id_idioma FOREIGN KEY (id_idioma) REFERENCES tb_idioma(id_idioma) ON DELETE CASCADE
)AUTO_INCREMENT = 1; 
ALTER TABLE tb_catalogo DROP CONSTRAINT uq_idioma_original;
ALTER TABLE tb_catalogo
DROP FOREIGN KEY fk_catalogo_id_idioma;

ALTER TABLE tb_catalogo
ADD CONSTRAINT fk_catalogo_id_idioma FOREIGN KEY (id_idioma)
REFERENCES tb_idioma (id_idioma)
ON DELETE CASCADE;


CREATE TABLE IF NOT EXISTS tb_ator (
	id_ator INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    sobrenome VARCHAR(255) NOT NULL,
    dt_nascimento DATE NOT NULL,
    foto VARCHAR(255) NOT NULL
)AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS tb_catalogo_ator (
	id_ator INT,
    id_catalogo INT,
	CONSTRAINT fk_catalogo_ator_id_ator FOREIGN KEY (id_ator) REFERENCES tb_ator(id_ator) ON DELETE CASCADE,
    CONSTRAINT fk_catalogo_ator_id_catalogo FOREIGN KEY (id_catalogo) REFERENCES tb_catalogo(id_catalogo) ON DELETE CASCADE
);
ALTER TABLE tb_catalogo_ator
DROP FOREIGN KEY fk_catalogo_ator_id_catalogo;

ALTER TABLE tb_catalogo_ator
ADD CONSTRAINT fk_catalogo_ator_id_catalogo FOREIGN KEY (id_catalogo)
REFERENCES tb_catalogo (id_catalogo)
ON DELETE CASCADE;
CREATE TABLE IF NOT EXISTS tb_pais (
	id_pais INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    descricao CHAR(5) NOT NULL,
    UNIQUE uq_nome (nome),
    UNIQUE uq_descricao (descricao)
)AUTO_INCREMENT = 1;
ALTER TABLE tb_pais DROP CONSTRAINT uq_nome;

CREATE TABLE IF NOT EXISTS tb_catalogo_pais (
	id_pais INT,
    id_catalogo INT,
	CONSTRAINT fk_catalogo_pais_id_pais FOREIGN KEY (id_pais) REFERENCES tb_pais(id_pais) ON DELETE CASCADE,
    CONSTRAINT fk_catalogo_pais_id_catalogo FOREIGN KEY (id_catalogo) REFERENCES tb_catalogo(id_catalogo) ON DELETE CASCADE
);
ALTER TABLE tb_catalogo_pais
DROP FOREIGN KEY fk_catalogo_pais_id_catalogo;

ALTER TABLE tb_catalogo_pais
ADD CONSTRAINT fk_catalogo_pais_id_catalogo FOREIGN KEY (id_catalogo)
REFERENCES tb_catalogo (id_catalogo)
ON DELETE CASCADE;

CREATE TABLE IF NOT EXISTS tb_endereco (
	id_endereco INT PRIMARY KEY AUTO_INCREMENT,
    rua VARCHAR(50) NOT NULL,
    numero TINYINT NOT NULL,
    bairro VARCHAR(50),
    id_pais INT,
    CONSTRAINT fk_endereco_id_pais FOREIGN KEY (id_pais) REFERENCES tb_pais(id_pais) ON DELETE CASCADE
)AUTO_INCREMENT = 1;

ALTER TABLE tb_endereco
DROP FOREIGN KEY fk_endereco_id_pais;

ALTER TABLE tb_endereco
ADD CONSTRAINT fk_endereco_id_pais FOREIGN KEY (id_pais)
REFERENCES tb_pais (id_pais)
ON DELETE CASCADE;

CREATE TABLE IF NOT EXISTS tb_usuario (
	id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    sobrenome VARCHAR(150) NOT NULL,
    email VARCHAR(255) NOT NULL,
    `status` BOOLEAN,
    dt_nascimento DATE NOT NULL,
    dt_cadastro DATETIME NOT NULL,
    senha VARCHAR(255) NOT NULL,
    dt_atualizacao DATETIME NOT NULL,
    id_endereco INT,
    UNIQUE uq_email (email),
    CONSTRAINT fk_usuario_id_endereco FOREIGN KEY (id_endereco) REFERENCES tb_endereco(id_endereco) ON DELETE CASCADE
)AUTO_INCREMENT = 1;
ALTER TABLE tb_usuario MODIFY dt_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE tb_endereco
ADD INDEX idx_id_endereco (id_endereco);

CREATE TABLE IF NOT EXISTS tb_funcionario (
	id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    foto VARCHAR(255) NOT NULL,
    UNIQUE uq_foto (foto),
    id_usuario INT,
    CONSTRAINT fk_funcionario_id_usuario FOREIGN KEY (id_usuario) REFERENCES tb_usuario(id_usuario) ON DELETE CASCADE
)AUTO_INCREMENT = 1;

ALTER TABLE tb_funcionario
DROP FOREIGN KEY fk_funcionario_id_usuario;

ALTER TABLE tb_funcionario
ADD CONSTRAINT fk_funcionario FOREIGN KEY (id_usuario)
REFERENCES tb_usuario (id_usuario)
ON DELETE CASCADE;

CREATE TABLE IF NOT EXISTS tb_cliente (
	id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    plano_escolhido VARCHAR(100),
    dt_vencimento DATETIME NOT NULL,
    id_usuario INT,
    id_plano INT,
    id_cartao_credito INT,
    CONSTRAINT fk_cliente_id_usuario FOREIGN KEY (id_usuario) REFERENCES tb_usuario(id_usuario) ON DELETE CASCADE,
    CONSTRAINT fk_cliente_id_plano FOREIGN KEY (id_plano) REFERENCES tb_plano(id_plano) ON DELETE CASCADE,
    CONSTRAINT fk_cliente_id_cartao_credito FOREIGN KEY (id_cartao_credito) REFERENCES tb_cartao_credito(id_cartao_credito) ON DELETE CASCADE
)AUTO_INCREMENT = 1;
ALTER TABLE tb_cliente MODIFY dt_vencimento DATE NOT NULL;

ALTER TABLE tb_cliente
DROP FOREIGN KEY fk_cliente_id_cartao_credito;

ALTER TABLE tb_cliente
ADD CONSTRAINT fk_cliente_id_cartao_credito FOREIGN KEY (id_cartao_credito)
REFERENCES tb_cartao_credito (id_cartao_credito)
ON DELETE CASCADE;

CREATE TABLE IF NOT EXISTS tb_plano (
	id_plano INT PRIMARY KEY AUTO_INCREMENT,
    valor FLOAT(5,2) NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    nome_plano VARCHAR(255) NOT NULL,
    UNIQUE uq_valor (valor),
    UNIQUE uq_nome_plano (nome_plano)
)AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS tb_perfil (
	id_plano INT PRIMARY KEY AUTO_INCREMENT,
    foto VARCHAR(255) NOT NULL,
    nome VARCHAR(255) NOT NULL,
    tipo VARCHAR(255) NOT NULL,
    id_cliente INT,
    CONSTRAINT fk_perfil_id_cliente FOREIGN KEY (id_cliente) REFERENCES tb_cliente(id_cliente) ON DELETE CASCADE
)AUTO_INCREMENT =1;

ALTER TABLE tb_perfil
DROP FOREIGN KEY fk_perfil_id_cliente;

ALTER TABLE tb_perfil
ADD CONSTRAINT fk_perfil_id_cliente FOREIGN KEY (id_cliente)
REFERENCES tb_cliente (id_cliente)
ON DELETE CASCADE;

CREATE TABLE IF NOT EXISTS tb_cartao_credito (
	id_cartao_credito INT PRIMARY KEY AUTO_INCREMENT,
    numero INT NOT NULL,
    dt_vencimento DATE NOT NULL,
    cod_seguranca VARCHAR(255) NOT NULL,
    titular VARCHAR(100) NOT NULL,
    UNIQUE uq_numero (numero)
)AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS tb_pagamento (
	id_pagamento INT PRIMARY KEY AUTO_INCREMENT,
    valor FLOAT(5,2),
    dt_pagamento DATETIME NOT NULL,
    id_cartao_credito INT,
    id_tipo_pagamento INT,
    id_cliente INT,
    CONSTRAINT fk_pag_id_cartao FOREIGN KEY (id_cartao_credito) REFERENCES tb_cartao_credito(id_cartao_credito) ON DELETE CASCADE,
    CONSTRAINT fk_pag_pagamento FOREIGN KEY (id_tipo_pagamento) REFERENCES tb_tipo_pagamento(id_tipo_pagamento) ON DELETE CASCADE,
    CONSTRAINT fk_pag_cliente FOREIGN KEY (id_cliente) REFERENCES tb_cliente(id_cliente) ON DELETE CASCADE
)AUTO_INCREMENT = 1; 
ALTER TABLE tb_pagamento MODIFY dt_pagamento DATETIME DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE tb_pagamento
DROP FOREIGN KEY fk_pag_cliente;

ALTER TABLE tb_pagamento
ADD CONSTRAINT fk_pag_cliente FOREIGN KEY (id_cliente)
REFERENCES tb_cliente (id_cliente)
ON DELETE CASCADE;

CREATE TABLE IF NOT EXISTS tb_tipo_pagamento (
	id_tipo_pagamento INT PRIMARY KEY AUTO_INCREMENT,
    boleto INT, 
    cartao_debit0 INT,
    cartao_credito INT,
    pix INT
)AUTO_INCREMENT = 1;
 ALTER TABLE tb_temporada MODIFY dt_atualizada DATETIME DEFAULT CURRENT_TIMESTAMP;



