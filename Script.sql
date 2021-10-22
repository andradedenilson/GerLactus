-- Database: ERP

-- DROP DATABASE "ERP";

CREATE DATABASE "ERP"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	
	-- Table: public.cliente

-- DROP TABLE public.cliente;

CREATE TABLE public.cliente
(
    idcliente integer NOT NULL,
    nome character(80) COLLATE pg_catalog."default",
    tppessoa character(1) COLLATE pg_catalog."default",
    cpfcnpj character(14) COLLATE pg_catalog."default",
    rg character(15) COLLATE pg_catalog."default",
    cep character(80) COLLATE pg_catalog."default",
    fone character(20) COLLATE pg_catalog."default",
    "endereço" character(80) COLLATE pg_catalog."default",
    numero integer,
    bairro character(250) COLLATE pg_catalog."default",
    cidade character(250) COLLATE pg_catalog."default",
    uf character(2) COLLATE pg_catalog."default",
    email character(250) COLLATE pg_catalog."default",
    nomedamae character(250) COLLATE pg_catalog."default",
    observacao character(250) COLLATE pg_catalog."default",
    tptipo character(1) COLLATE pg_catalog."default",
    dtalteracao timestamp with time zone
)

TABLESPACE pg_default;

ALTER TABLE public.cliente
    OWNER to postgres;

COMMENT ON TABLE public.cliente
    IS 'tabela de clientes';
	
	
	-- Table: public.config_contador

-- DROP TABLE public.config_contador;

CREATE TABLE public.config_contador
(
    chave character(50) COLLATE pg_catalog."default",
    contador integer
)

TABLESPACE pg_default;

ALTER TABLE public.config_contador
    OWNER to postgres;
	-- Table: public.contas_receber

-- DROP TABLE public.contas_receber;

CREATE TABLE public.contas_receber
(
    idtitulo integer NOT NULL,
    idplanilha integer NOT NULL,
    idcliente integer NOT NULL,
    parcela character(10) COLLATE pg_catalog."default",
    idrecebimento integer NOT NULL,
    cpfcnpj character(14) COLLATE pg_catalog."default",
    flagbaixada character(1) COLLATE pg_catalog."default",
    dtlancamento timestamp without time zone,
    dtvencimento timestamp without time zone,
    dtpagamento timestamp without time zone,
    vlvalortitulo numeric(15,2)
)

TABLESPACE pg_default;

ALTER TABLE public.contas_receber
    OWNER to postgres;

COMMENT ON TABLE public.contas_receber
    IS 'tabela de contas receber';


-- Table: public.estado

-- DROP TABLE public.estado;

CREATE TABLE public.estado
(
    uf character(2) COLLATE pg_catalog."default",
    descrestado character(250) COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE public.estado
    OWNER to postgres;
	
-- Table: public.estoque_analitico

-- DROP TABLE public.estoque_analitico;

CREATE TABLE public.estoque_analitico
(
    idproduto integer,
    idplanilha integer,
    idusuario integer,
    tpmovimento character(1) COLLATE pg_catalog."default",
    quantidade numeric(15,2),
    idsubgrupo integer,
    observacao character(255) COLLATE pg_catalog."default",
    dtalteracao timestamp without time zone
)

TABLESPACE pg_default;

ALTER TABLE public.estoque_analitico
    OWNER to postgres;

COMMENT ON TABLE public.estoque_analitico
    IS 'tabela de formapagrec';	
	
-- Table: public.formapagrec

-- DROP TABLE public.formapagrec;

CREATE TABLE public.formapagrec
(
    idrecebimento integer NOT NULL,
    descricao character(80) COLLATE pg_catalog."default",
    flagentrada character(1) COLLATE pg_catalog."default",
    qtdparcela integer NOT NULL,
    tpcondicao character(1) COLLATE pg_catalog."default",
    dtalteracao timestamp without time zone
)

TABLESPACE pg_default;

ALTER TABLE public.formapagrec
    OWNER to postgres;

COMMENT ON TABLE public.formapagrec
    IS 'tabela de formapagrec';
	
-- Table: public.item_nota

-- DROP TABLE public.item_nota;

CREATE TABLE public.item_nota
(
    idproduto integer,
    idplanilha integer,
    quantidade numeric(15,2),
    idsubgrupo integer,
    vlunitario numeric(15,2),
    vltotal numeric(15,2)
)

TABLESPACE pg_default;

ALTER TABLE public.item_nota
    OWNER to postgres;

COMMENT ON TABLE public.item_nota
    IS 'tabela de item_nota';	
	
-- Table: public.produto

-- DROP TABLE public.produto;

CREATE TABLE public.produto
(
    idproduto integer NOT NULL,
    descricao character(80) COLLATE pg_catalog."default",
    marca character(80) COLLATE pg_catalog."default",
    idsubgrupo integer,
    observacao character(250) COLLATE pg_catalog."default",
    dtalteracao timestamp without time zone,
    codbar numeric(15,0)
)

TABLESPACE pg_default;

ALTER TABLE public.produto
    OWNER to postgres;

COMMENT ON TABLE public.produto
    IS 'tabela de formapagrec';
	
	
-- Table: public.produto_preco_historico

-- DROP TABLE public.produto_preco_historico;

CREATE TABLE public.produto_preco_historico
(
    idplanilha integer NOT NULL,
    idusuario integer NOT NULL,
    idproduto integer NOT NULL,
    observacao character(250) COLLATE pg_catalog."default",
    vlvalortitulo money
)

TABLESPACE pg_default;

ALTER TABLE public.produto_preco_historico
    OWNER to postgres;

COMMENT ON TABLE public.produto_preco_historico
    IS 'tabela de produto preco historico';	
	
-- Table: public.usuario

-- DROP TABLE public.usuario;

CREATE TABLE public.usuario
(
    idusuario integer NOT NULL,
    ativo character(1) COLLATE pg_catalog."default",
    desclogin character(20) COLLATE pg_catalog."default",
    senha character(10) COLLATE pg_catalog."default",
    nome character(80) COLLATE pg_catalog."default",
    email character(80) COLLATE pg_catalog."default",
    fone character(15) COLLATE pg_catalog."default",
    dtalteracao timestamp with time zone
)

TABLESPACE pg_default;

ALTER TABLE public.usuario
    OWNER to postgres;

COMMENT ON TABLE public.usuario
    IS 'tabela de usuarios';

INSERT INTO public.usuario(
	idusuario, ativo, desclogin, senha, nome, email, fone, dtalteracao)
	VALUES (1, 'A', 'admin', ''1, 'admin', 'teste@teste.com', '', now());	