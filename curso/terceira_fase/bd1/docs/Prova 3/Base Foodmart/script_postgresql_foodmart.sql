
CREATE TABLE public.periodo (
                codigo INTEGER DEFAULT 0 NOT NULL,
                data TIMESTAMP,
                dia_da_semana VARCHAR(30),
                mes_extenso VARCHAR(30),
                ano SMALLINT,
                dia SMALLINT,
                semana_no_ano INTEGER,
                mes SMALLINT,
                CONSTRAINT periodo_pk PRIMARY KEY (codigo)
);

CREATE TABLE public.regiao (
                codigo INTEGER DEFAULT 0 NOT NULL,
                cidade VARCHAR(30),
                estado VARCHAR(30),
                distrito VARCHAR(30),
                regional VARCHAR(30),
                pais VARCHAR(30),
                CONSTRAINT regiao_pk PRIMARY KEY (codigo)
);

CREATE TABLE public.cliente (
                codigo INTEGER DEFAULT 0 NOT NULL,
                endereco VARCHAR(30),
                cep VARCHAR(30) NOT NULL,
                regiao_codigo INTEGER NOT NULL,
                nascimento DATE NOT NULL,
                estado_civil VARCHAR(30) NOT NULL,
                faixa_salarial VARCHAR(30) NOT NULL,
                sexo VARCHAR(30) NOT NULL,
                numero_filhos SMALLINT NOT NULL,
                instrucao VARCHAR(30) NOT NULL,
                cliente_desde DATE NOT NULL,
                tipo_cartao VARCHAR(30),
                ocupacao VARCHAR(30),
                casa_propria VARCHAR(30),
                nome_completo VARCHAR(60) NOT NULL,
                CONSTRAINT cliente_pk PRIMARY KEY (codigo)
);

CREATE TABLE public.loja (
                codigo INTEGER DEFAULT 0 NOT NULL,
                tipo VARCHAR(30),
                regiao_codigo INTEGER,
                nome VARCHAR(30),
                numero INTEGER,
                endereco VARCHAR(30),
                cep VARCHAR(30),
                gerente VARCHAR(30),
                fone VARCHAR(30),
                fax VARCHAR(30),
                CONSTRAINT loja_pk PRIMARY KEY (codigo)
);

CREATE TABLE public.classe (
                codigo INTEGER DEFAULT 0 NOT NULL,
                subcategoria VARCHAR(30),
                categoria VARCHAR(30),
                departamento VARCHAR(30),
                familia VARCHAR(30),
                CONSTRAINT classe_pk PRIMARY KEY (codigo)
);

CREATE TABLE public.produto (
                codigo INTEGER DEFAULT 0 NOT NULL,
                classe_codigo INTEGER DEFAULT 0 NOT NULL,
                marca VARCHAR(60),
                nome VARCHAR(60) NOT NULL,
                peso_bruto DOUBLE PRECISION,
                peso_liquido DOUBLE PRECISION,
                CONSTRAINT produto_pk PRIMARY KEY (codigo)
);

CREATE TABLE public.vendas (
                produto_codigo INTEGER NOT NULL,
                periodo_codigo INTEGER NOT NULL,
                cliente_codigo INTEGER NOT NULL,
                remover INTEGER NOT NULL,
                loja_codigo INTEGER NOT NULL,
                preco_venda NUMERIC(10,4) NOT NULL,
                custo_unitario NUMERIC(10,4) NOT NULL,
                unidade NUMERIC(10,4) NOT NULL,
                CONSTRAINT vendas_pk PRIMARY KEY (produto_codigo, periodo_codigo, cliente_codigo)
);


ALTER TABLE public.vendas ADD CONSTRAINT periodo_vendas_fk
FOREIGN KEY (periodo_codigo)
REFERENCES public.periodo (codigo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;


ALTER TABLE public.loja ADD CONSTRAINT regiao_loja_fk
FOREIGN KEY (regiao_codigo)
REFERENCES public.regiao (codigo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;


ALTER TABLE public.cliente ADD CONSTRAINT regiao_cliente_fk
FOREIGN KEY (regiao_codigo)
REFERENCES public.regiao (codigo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;


ALTER TABLE public.vendas ADD CONSTRAINT cliente_vendas_fk
FOREIGN KEY (cliente_codigo)
REFERENCES public.cliente (codigo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;


ALTER TABLE public.vendas ADD CONSTRAINT loja_vendas_fk
FOREIGN KEY (loja_codigo)
REFERENCES public.loja (codigo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;


ALTER TABLE public.produto ADD CONSTRAINT classe_produto_fk
FOREIGN KEY (classe_codigo)
REFERENCES public.classe (codigo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;


ALTER TABLE public.vendas ADD CONSTRAINT produto_vendas_fk
FOREIGN KEY (produto_codigo)
REFERENCES public.produto (codigo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
