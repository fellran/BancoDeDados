-- INSERT da tb_idioma da database db_streamer validada
CALL sp_in_idioma('Inglês');
CALL sp_in_idioma('italiano');
CALL sp_in_idioma('frances');
CALL sp_in_idioma('coreano');
CALL sp_in_idioma('espanhol');
CALL sp_in_idioma('portugues');

-- INSERT DE PROCEDURE da tb_classificacao
CALL sp_in_classificacao('10', 'nao recomendado para menores de 10 anos, contem violencia');
CALL sp_in_classificacao('12', 'não recomendado para menores de 12 anos, contem violencia, sexo/nudez, drogas');
CALL sp_in_classificacao('14', 'não recomendado para menores de 14 anos, contem violencia, sexo/nudez, drogas,aborto');
CALL sp_in_classificacao('16', 'não recomendado para menores de 16 anos, contem violencia, sexo/nudez, drogas, suicidio');
CALL sp_in_classificacao('18', 'nao recomendado para menores de 18 anos, contem violencia, sexo/nudez, drogas, suicidio, aborto, apologia');
CALL sp_in_classificacao('0', 'livre para todos os publicos');

-- INSERT de validacao da tb_categoria

CALL sp_in_categoria('acão e aventura');
CALL sp_in_categoria('drama');
CALL sp_in_categoria('comedia romantica');
CALL sp_in_categoria('ficcão cientifica');
CALL SP_IN_CATEGORIA('terror');

-- INSERT da tb_catalogo junto com a tabela tb_filme

CALL sp_in_filme('brazil', 'https://upload.wikimedia.org/wikipedia/pt/thumb/e/e5/Tropa_de_Elite_trilha_sonora.jpg/220px-Tropa_de_Elite_trilha_sonora.jpg', 'tropa de elite', 'filme pauleira dimais', '2007', 'portugues', 'engles', '02:30:00', '5', '3', '6', '1');
CALL sp_in_filme('brazil', 'https://m.media-amazon.com/images/I/51cY0Lsf1DL._AC_UF1000,1000_QL80_.jpg', 'cidade de deus', 'muito pesado para amadores', '2002', 'portugues', 'engles', '01:20:00', '5', '3', '6', '2');
CALL sp_in_filme('EUA', 'httb_catalogo_atortb_catalogotps://images-na.ssl-images-amazon.com/images/S/pv-target-images/5d8fee97f2506d606c237738e45f79e875b05f7cb0af75fa78dc6d1eac973d8c._RI_TTW_.jpg', 'a hora do rush', 'muito bom esse', '1998', 'ingles', 'portugues', '01:40:00', '5', '3', '6', '1');
CALL sp_in_filme('EUA', 'https://br.web.img3.acsta.net/medias/nmedia/18/97/52/82/20534159.jpg', 'as branquelas', 'otimo filme', '2004', 'ingles', 'portugues', '01:30:00', '4', '4', '6', '1');
CALL sp_in_filme('EUA', 'https://br.web.img3.acsta.net/medias/nmedia/18/87/28/03/19873867.jpg', 'todo mundo em panico', 'comedia pura', '2000', 'ingles', 'portugues', '01:30:00', '3', '2', '6', '0');

-- INSEER da tb_catalogo junto com a tabela tb_serie
CALL sp_in_serie('EUA', 'https://static.sbt.com.br/media/playlist/20100312151406/20100312151904/tn/20150615144815.jpg', 'sobrenartual', 'e ruim mais todos gostam', '2004', 'ingles', 'portugues', '20:30:00', '4', '3', '4', '200');
CALL sp_in_serie('EUA', 'https://img.olhardigital.com.br/wp-content/uploads/2023/06/Black-Mirror.png', 'black mirror', 'crise existencial', '2028', 'ingles', 'portugues', '21:30:00', '4', '3', '4', '50');
CALL sp_in_serie('EUA', 'https://m.media-amazon.com/images/M/MV5BYTNiYTNkNTAtYzE3ZS00ZDQ1LWEwZTYtZjI1NzYzMWJjY2U4XkEyXkFqcGdeQXVyODk4OTc3MTY@._V1_FMjpg_UX1000_.jpg', 'love death and robots', 'outra crise existencial', '2010', 'ingles', 'portugues', '10:00:10', '4', '3', '3', '60');
CALL sp_in_serie('EUA', 'https://i.pinimg.com/originals/4a/71/da/4a71daa369a5f423c82007a7428c37c3.png', 'DARK', 'confuso', '2015', 'ingles', 'portugus', '09:30:00', '4', '2', '4', '20');
CALL sp_in_serie('EUA', 'https://br.web.img2.acsta.net/pictures/22/09/23/20/14/0505071.jpg', 'vandinha', 'me endentifico', '2022', 'ingles', 'portugues', '05:30:00', '4', '3', '2', '20');

-- INSERT validado da tb_temporada
CALL sp_in_temporada('piloto', 'no passado', '11', '1');
CALL sp_in_temporada('piloto', 'regesso', '4', '2');
CALL sp_in_temporada('piloto', 'pesadelo', '6', '3');
CALL sp_in_temporada('piloto', 'reinicio', '5', '2');
CALL sp_in_temporada('piloto', 'amanha', '5', '3');
SELECT * from tb_serie;

-- insert tb_episodio
CALL sp_in_episodio('1', '1', '1');
CALL sp_in_episodio('2', '1', '1');
CALL sp_in_episodio('3', '1', '1');
CALL sp_in_episodio('4', '1', '1');
CALL sp_in_episodio('5', '1', '1');

-- insert da tb_catalogo_categoria
CALL sp_in_catalogo_categoria('1', '1');
CALL sp_in_catalogo_categoria('2', '2');
CALL sp_in_catalogo_categoria('3', '3');
CALL sp_in_catalogo_categoria('4', '4');
CALL sp_in_catalogo_categoria('5', '5');

-- insert tb_catalogo_idioma
CALL sp_in_catalogo_idioma('1', '1');
CALL sp_in_catalogo_idioma('2', '2');
CALL sp_in_catalogo_idioma('1', '3');
CALL sp_in_catalogo_idioma('1', '4');
CALL sp_in_catalogo_idioma('1', '5');

-- insert da tb_ator
CALL sp_in_ator ('samuel', 'jackson', '1988-05-02', 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Samuel_L._Jackson_2019_by_Glenn_Francis.jpg/800px-Samuel_L._Jackson_2019_by_Glenn_Francis.jpg');
CALL sp_in_ator ('will', 'smith', '1984-06-01', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/TechCrunch_Disrupt_2019_%2848834434641%29_%28cropped%29.jpg/640px-TechCrunch_Disrupt_2019_%2848834434641%29_%28cropped%29.jpg');
CALL sp_in_ator ('tom', 'cruise', '1970-05-04', 'https://classic.exame.com/wp-content/uploads/2016/09/size_960_16_9_tom-cruise9.jpg?quality=70&strip=info&w=960');
CALL sp_in_ator ('leonardo', 'di caprio', '1986-07-12', 'https://s2.glbimg.com/HBMCDY-qWaSzDqROpGGsSLtZm94=/0x0:4928x3280/924x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_b0f0e84207c948ab8b8777be5a6a4395/internal_photos/bs/2023/j/p/lWVfTDT8yIGBZEiRYOig/gettyimages-1205143953.jpg');
CALL sp_in_ator ('brad', 'pitt,', '1989-08-20', 'https://images.mubicdn.net/images/cast_member/2552/cache-207-1524922850/image-w856.jpg?size=800x');

-- insert na tabela tb_catalgo_ator
INSERT INTO tb_catalogo_ator (id_ator, id_catalogo) VALUES ('1', '3');
INSERT INTO tb_catalogo_ator (id_ator, id_catalogo) VALUES ('3', '1');
INSERT INTO tb_catalogo_ator (id_ator, id_catalogo) VALUES ('3', '3');
INSERT INTO tb_catalogo_ator (id_ator, id_catalogo) VALUES ('1', '3');
INSERT INTO tb_catalogo_ator (id_ator, id_catalogo) VALUES ('1', '3');
INSERT INTO tb_catalogo_ator (id_ator, id_catalogo) VALUES ('1', '3');

-- -- insert da tb_pais
CALL sp_in_pais ('BRASIL', 'bra');
CALL sp_in_pais ('franca', 'fra');
CALL sp_in_pais ('italia', 'ita');
CALL sp_in_pais ('spanish', 'spn');
CALL sp_in_pais ('inglaterra', 'igt');

-- insert tb_catalogo_pais
DESCRIBE tb_catalogo_pais;
INSERT INTO tb_catalogo_pais (id_pais, id_catalogo) VALUES ('2', '1');
INSERT INTO tb_catalogo_pais (id_pais, id_catalogo) VALUES ('3', '1');
INSERT INTO tb_catalogo_pais (id_pais, id_catalogo) VALUES ('4', '1');
INSERT INTO tb_catalogo_pais (id_pais, id_catalogo) VALUES ('5', '1');
INSERT INTO tb_catalogo_pais (id_pais, id_catalogo) VALUES ('6', '1');
INSERT INTO tb_catalogo_pais (id_pais, id_catalogo) VALUES ('2', '2');
INSERT INTO tb_catalogo_pais (id_pais, id_catalogo) VALUES ('3', '2');
INSERT INTO tb_catalogo_pais (id_pais, id_catalogo) VALUES ('4', '2');
INSERT INTO tb_catalogo_pais (id_pais, id_catalogo) VALUES ('5', '2');
INSERT INTO tb_catalogo_pais (id_pais, id_catalogo) VALUES ('6', '2');

-- insert tb_endereco
CALL sp_in_endereco('Rua Açucena', '123', 'Bairro Florido', '2');
CALL sp_in_endereco('Rua peba', '120', 'Bairro violento', '3');
CALL sp_in_endereco('Rua valencia', '12', 'Bairro nobre', '4');
CALL sp_in_endereco('Rua capao', '20', 'Bairro zona zull', '5');
CALL sp_in_endereco('Rua irinopolis', '39', 'Bairro azuç', '6');

-- insert tb_usuario
INSERT INTO tb_usuario (nome, sobrenome, email, `status`, dt_nascimento, dt_cadastro, senha, dt_atualizacao,  id_endereco)
VALUES ('joao', 'almeida', 'lost2@gmail.com', 1, '1991-02-02', NOW(), MD5(23484), NOW(), 2);

INSERT INTO tb_usuario (nome, sobrenome, email, `status`, dt_nascimento, dt_cadastro, senha, dt_atualizacao, id_endereco)
VALUES ('pedro', 'alves', 'gusta@gmail.com', 0, '1992-03-03', NOW(), '44531', NOW(), 3);

INSERT INTO tb_usuario (nome, sobrenome, email, `status`, dt_nascimento, dt_cadastro, senha, dt_atualizacao, id_endereco)
VALUES ('gustavo', 'pereira', 'guasw4@gmail.com', 1, '1993-04-04', NOW(), MD5(8787), NOW(), 4);

INSERT INTO tb_usuario (nome, sobrenome, email, `status`, dt_nascimento, dt_cadastro, senha, dt_atualizacao, id_endereco)
VALUES ('maria', 'clara', 'boston@gmail.com', 1, '1994-05-05', NOW(), MD5(15485), NOW(), 6);

INSERT INTO tb_usuario (nome, sobrenome, email, `status`, dt_nascimento, dt_cadastro, senha, dt_atualizacao, id_endereco)
VALUES ('fernado', 'souza', 'souzaw@gmail.com', 1, '1990-01-01', NOW(), MD5(15488), NOW(), 3);

INSERT INTO tb_usuario (nome, sobrenome, email, `status`, dt_nascimento, dt_cadastro, senha, dt_atualizacao, id_endereco)
VALUES ('matias', 'nobre', 'marte2@example.com', 1, '1991-02-02', NOW(), MD5(94565), NOW(), 2);

INSERT INTO tb_usuario (nome, sobrenome, email, `status`, dt_nascimento, dt_cadastro, senha, dt_atualizacao, id_endereco)
VALUES ('lucas', 'tesla', 'plutao@gmail.com', 0, '1992-03-03', NOW(), MD5(1548), NOW(), 3);

INSERT INTO tb_usuario (nome, sobrenome, email, `status`, dt_nascimento, dt_cadastro, senha, dt_atualizacao, id_endereco)
VALUES ('marcos', 'sulivan', 'sulivan4@gmail.com', 1, '1993-04-04', NOW(), MD5(458768), NOW(), 4);

INSERT INTO tb_usuario (nome, sobrenome, email, `status`, dt_nascimento, dt_cadastro, senha, dt_atualizacao, id_endereco)
VALUES ('thiago', 'silva', 'kiels5@gmail.com', 1, '1994-05-05', NOW(), MD5(1548), NOW(), 6);

-- insert tb_funcionario
INSERT INTO tb_funcionario (foto, id_usuario) VALUES ('https://www.ahnegao.com.br/wp-content/uploads/2017/07/img-2-2.jpg', 3);
INSERT INTO tb_funcionario (foto, id_usuario) VALUES ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0DwPlM8k8fzS1KR4Lu1GI6lolxXUn4Tk4bw&usqp=CAU', 4);
INSERT INTO tb_funcionario (foto, id_usuario) VALUES ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRzSCxaIXbYXsgPvycKcilUTQUbhNov2t0ITA&usqp=CAU', 4);
INSERT INTO tb_funcionario (foto, id_usuario) VALUES ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwpeDtjslvZ_83wjNYfJYxFMLtcLSaXExz1Q&usqp=CAU', 6);
INSERT INTO tb_funcionario (foto, id_usuario) VALUES ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLT8-_NH-vCY2V6YDOgWS8mXrgbmUY-ry0Kg&usqp=CAU', 8);

-- insert tb_plano
INSERT INTO tb_plano (valor, descricao, nome_plano)
VALUES (19.99, 'Plano básico', 'Plano A');

INSERT INTO tb_plano (valor, descricao, nome_plano)
VALUES (29.99, 'Plano intermediário', 'Plano B');

INSERT INTO tb_plano (valor, descricao, nome_plano)
VALUES (39.99, 'Plano avançado', 'Plano C');

INSERT INTO tb_plano (valor, descricao, nome_plano)
VALUES (49.99, 'Plano premium', 'Plano D');

INSERT INTO tb_plano (valor, descricao, nome_plano)
VALUES (59.99, 'Plano empresarial', 'Plano E');
describe tb_cliente;

-- insert tb_perfil

INSERT INTO tb_perfil (foto, nome, tipo, id_cliente)
VALUES ('https://i.pinimg.com/736x/dc/b9/71/dcb971025f1931493cff258e118267e2.jpg', 'Perfil 1', 'Tipo A', 1);

INSERT INTO tb_perfil (foto, nome, tipo, id_cliente)
VALUES ('https://i.pinimg.com/550x/d5/a0/61/d5a061b8bf327df8bab437ed17b5d1da.jpg', 'Perfil 2', 'Tipo B', 4);

INSERT INTO tb_perfil (foto, nome, tipo, id_cliente)
VALUES ('https://i.pinimg.com/736x/d6/e9/2b/d6e92bbb85c5dc2ade8c6e88f6b7455d.jpg', 'Perfil 3', 'Tipo C', 5);

INSERT INTO tb_perfil (foto, nome, tipo, id_cliente)
VALUES ('https://i.pinimg.com/236x/ac/7e/98/ac7e98935e00787616bce95475ed0d92.jpg', 'Perfil 4', 'Tipo A', 6);

INSERT INTO tb_perfil (foto, nome, tipo, id_cliente)
VALUES ('https://i.pinimg.com/236x/37/47/3e/37473e515b8b54495cf07cb1ec876740.jpg', 'Perfil 5', 'Tipo B', 8);

-- inser tb_cartao_credito
INSERT INTO tb_cartao_credito (numero, dt_vencimento, cod_seguranca, titular)
VALUES (123456789, '2024-01-31', '123', 'João Silva');

INSERT INTO tb_cartao_credito (numero, dt_vencimento, cod_seguranca, titular)
VALUES (987654, '2023-12-31', '456', 'Maria Santos');

INSERT INTO tb_cartao_credito (numero, dt_vencimento, cod_seguranca, titular)
VALUES (111122, '2024-06-30', '789', 'Pedro Oliveira');

INSERT INTO tb_cartao_credito (numero, dt_vencimento, cod_seguranca, titular)
VALUES (5555666, '2023-09-30', '012', 'Ana Costa');

INSERT INTO tb_cartao_credito (numero, dt_vencimento, cod_seguranca, titular)
VALUES (99990000, '2024-03-31', '345', 'Carlos Pereira');

-- insert tb_cliente
INSERT INTO tb_cliente (plano_escolhido, dt_vencimento, id_usuario, id_plano, id_cartao_credito)
VALUES ('Plano A', '2024-03-31', 3, 1, 1);

INSERT INTO tb_cliente (plano_escolhido, dt_vencimento, id_usuario, id_plano, id_cartao_credito)
VALUES ('Plano B', '2023-09-30', 4, 2, 2);

INSERT INTO tb_cliente (plano_escolhido, dt_vencimento, id_usuario, id_plano, id_cartao_credito)
VALUES ('Plano C', '2024-06-30', 7, 4, 3);

INSERT INTO tb_cliente (plano_escolhido, dt_vencimento ,id_usuario, id_plano, id_cartao_credito)
VALUES ('Plano A', '2023-12-31', 6, 5, 4);

INSERT INTO tb_cliente (plano_escolhido, dt_vencimento, id_usuario, id_plano, id_cartao_credito)
VALUES ('Plano B', '2024-01-31', 8, 3, 5);
SELECT * FROM tb_tipo_pagamento;
-- insert tb_tipo_pagamento
INSERT INTO tb_tipo_pagamento (boleto, cartao_debit0, cartao_credito, pix)
VALUES (1, 0, 1, 0);

INSERT INTO tb_tipo_pagamento (boleto, cartao_debit0, cartao_credito, pix)
VALUES (1, 1, 0, 0);

INSERT INTO tb_tipo_pagamento (boleto, cartao_debit0, cartao_credito, pix)
VALUES (0, 0, 1, 1);

INSERT INTO tb_tipo_pagamento (boleto, cartao_debit0, cartao_credito, pix)
VALUES (0, 1, 1, 0);

INSERT INTO tb_tipo_pagamento (boleto, cartao_debit0, cartao_credito, pix)
VALUES (1, 0, 0, 1);

-- insert tb_pagamento
INSERT INTO tb_pagamento (valor, dt_pagamento, id_cartao_credito, id_tipo_pagamento, id_cliente)
VALUES (100.00, '2025-08-06', 1, 1, 1);

INSERT INTO tb_pagamento (valor, dt_pagamento, id_cartao_credito, id_tipo_pagamento, id_cliente)
VALUES (50.00, '2023-04-12', 2, 2, 4);

INSERT INTO tb_pagamento (valor, dt_pagamento, id_cartao_credito, id_tipo_pagamento, id_cliente)
VALUES (75.00, '2024-04-05', 3, 1, 5);

INSERT INTO tb_pagamento (valor, dt_pagamento, id_cartao_credito, id_tipo_pagamento, id_cliente)
VALUES (200.00, '2022-09-25',4, 3, 6);

INSERT INTO tb_pagamento (valor, dt_pagamento, id_cartao_credito, id_tipo_pagamento, id_cliente)
VALUES (150.00, '2025-07-14', 5, 2, 8);


















