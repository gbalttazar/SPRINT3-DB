
CREATE SEQUENCE seq_anuncio;
CREATE SEQUENCE seq_associacao;
CREATE SEQUENCE seq_associacao2;
CREATE SEQUENCE seq_campanha;
CREATE SEQUENCE seq_cidade;
CREATE SEQUENCE seq_cliente;
CREATE SEQUENCE seq_email;
CREATE SEQUENCE seq_empresa;
CREATE SEQUENCE seq_fonte_dados;
CREATE SEQUENCE seq_ia;
CREATE SEQUENCE seq_pais;
CREATE SEQUENCE seq_previsao_tendencia;
CREATE SEQUENCE seq_regiao;
CREATE SEQUENCE seq_resultado;


CREATE TABLE t_anuncio (
    id_anuncio    NUMBER(9) NOT NULL,
    ds_anuncio    VARCHAR2(100) NOT NULL,
    categ_anuncio VARCHAR2(100) NOT NULL,
    dt_inicio     DATE NOT NULL,
    dt_fim        DATE,
    id_campanha   NUMBER(9) NOT NULL
);

ALTER TABLE t_anuncio ADD CONSTRAINT t_anuncio_pk PRIMARY KEY ( id_anuncio,
                                                                id_campanha );

CREATE TABLE t_associacao (
    id_campanha NUMBER(9) NOT NULL,
    id_cliente  NUMBER(9) NOT NULL
);

COMMENT ON COLUMN t_associacao.id_campanha IS
    'Esse atributo irá receber a chave primária da campanha. Esse número é sequencial e gerado automaticamente pelo sistema. Seu conteúdo é obrigatório.'
    ;

CREATE TABLE t_associacao2 (
    id_email    NUMBER(9) NOT NULL,
    id_campanha NUMBER(9) NOT NULL
);

CREATE TABLE t_campanha (
    id_campanha NUMBER(9) NOT NULL,
    st_campanha CHAR(1) NOT NULL,
    dt_inicio   DATE NOT NULL,
    dt_fim      DATE,
    ds_campanha VARCHAR2(80) NOT NULL
);

COMMENT ON COLUMN t_campanha.id_campanha IS
    'Esse atributo irá receber a chave primária da campanha. Esse número é sequencial e gerado automaticamente pelo sistema. Seu conteúdo é obrigatório.'
    ;

COMMENT ON COLUMN t_campanha.st_campanha IS
    'Esse atributo irá receber o atributo status da campanha. Seu conteúdo é obrigatório.';

COMMENT ON COLUMN t_campanha.dt_inicio IS
    'Esse atributo irá receber o atributo data inicio da campanha. Seu conteúdo é obrigatório.';

COMMENT ON COLUMN t_campanha.dt_fim IS
    'Esse atributo irá receber o atributo data final da campanha. Seu conteúdo não  é obrigatório.';

COMMENT ON COLUMN t_campanha.ds_campanha IS
    'Esse atributo irá receber o atributo da descrição campanha. Seu conteúdo é obrigatório.';

ALTER TABLE t_campanha ADD CONSTRAINT t_campanha_pk PRIMARY KEY ( id_campanha );

CREATE TABLE t_cidade (
    id_cidade  NUMBER(9) NOT NULL,
    ds_cidade  VARCHAR2(100) NOT NULL,
    id_empresa NUMBER(9) NOT NULL,
    id_regiao  NUMBER(9) NOT NULL,
    id_pais    NUMBER NOT NULL
);

COMMENT ON COLUMN t_cidade.id_cidade IS
    'Esse atributo irá receber a chave primária do id cidade. Esse número é sequencial e gerado automaticamente pelo sistema. Seu conteúdo é obrigatório.'
    ;

COMMENT ON COLUMN t_cidade.ds_cidade IS
    'Esse atributo irá receber o atributo da descricção cidade. Seu conteúdo é obrigatório.';

CREATE UNIQUE INDEX t_cidade__idx ON
    t_cidade (
        id_empresa
    ASC );

ALTER TABLE t_cidade
    ADD CONSTRAINT t_cidade_pk PRIMARY KEY ( id_cidade,
                                             id_regiao,
                                             id_pais );

CREATE TABLE t_cliente (
    id_cliente NUMBER(9) NOT NULL,
    nm_cliente VARCHAR2(80) NOT NULL
);

COMMENT ON COLUMN t_cliente.id_cliente IS
    'Esse atributo irá receber a chave primária do cliente. Esse número é sequencial e gerado automaticamente pelo sistema. Seu conteúdo é obrigatório.'
    ;

COMMENT ON COLUMN t_cliente.nm_cliente IS
    'Esse atributo irá receber o atributo do nome cliente. Seu conteúdo é obrigatório.';

ALTER TABLE t_cliente ADD CONSTRAINT t_cliente_pk PRIMARY KEY ( id_cliente );

CREATE TABLE t_email (
    id_email   NUMBER(9) NOT NULL,
    ds_email   VARCHAR2(100) NOT NULL,
    st_email   CHAR(1) NOT NULL,
    tp_email   VARCHAR2(20) NOT NULL,
    id_empresa NUMBER(9) NOT NULL
);

COMMENT ON COLUMN t_email.id_email IS
    'Esse atributo irá receber a chave primária do email. Esse número é sequencial e gerado automaticamente pelo sistema. Seu conteúdo é obrigatório.'
    ;

COMMENT ON COLUMN t_email.ds_email IS
    'Esse atributo irá receber o atributo da descrição email. Seu conteúdo é obrigatório.';

COMMENT ON COLUMN t_email.st_email IS
    'Esse atributo irá receber o atributo da status email. Seu conteúdo é obrigatório.';

COMMENT ON COLUMN t_email.tp_email IS
    'Esse atributo irá receber o atributo da tipo email. Seu conteúdo é obrigatório.';

CREATE UNIQUE INDEX t_email__idx ON
    t_email (
        id_empresa
    ASC );

ALTER TABLE t_email ADD CONSTRAINT t_email_pk PRIMARY KEY ( id_email );

CREATE TABLE t_empresa (
    id_empresa NUMBER(9) NOT NULL,
    cnpj       NUMBER(14) NOT NULL,
    ds_email   VARCHAR2(100) NOT NULL,
    nm_empresa VARCHAR2(90) NOT NULL,
    st_empresa CHAR(1) NOT NULL,
    id_cliente NUMBER(9) NOT NULL
);

COMMENT ON COLUMN t_empresa.id_empresa IS
    'Esse atributo irá receber a chave primária da empresa. Esse número é sequencial e gerado automaticamente pelo sistema. Seu conteúdo é obrigatório.'
    ;

COMMENT ON COLUMN t_empresa.cnpj IS
    'Esse atributo irá receber o atributo cnpj. Seu conteúdo é obrigatório.';

COMMENT ON COLUMN t_empresa.ds_email IS
    'Esse atributo irá receber o atributo da descrição email. Seu conteúdo é obrigatório.';

COMMENT ON COLUMN t_empresa.nm_empresa IS
    'Esse atributo irá receber o atributo nome da empresa. Seu conteúdo é obrigatório.';

COMMENT ON COLUMN t_empresa.st_empresa IS
    'Esse atributo irá receber o atributo status da empresa. Seu conteúdo é obrigatório.';

CREATE UNIQUE INDEX t_empresa__idx ON
    t_empresa (
        id_cliente
    ASC );

ALTER TABLE t_empresa ADD CONSTRAINT t_empresa_pk PRIMARY KEY ( id_empresa );

CREATE TABLE t_fonte_dados (
    id_fonte_dados NUMBER(9) NOT NULL,
    nm_fonte_dados VARCHAR2(90) NOT NULL,
    tp_fonte_dados VARCHAR2(20) NOT NULL,
    ds_fonte_dados VARCHAR2(100) NOT NULL,
    url            VARCHAR2(30) NOT NULL,
    id_ia          NUMBER(9) NOT NULL
);

COMMENT ON COLUMN t_fonte_dados.id_fonte_dados IS
    'Esse atributo irá receber a chave primária da fonte dos dados. Esse número é sequencial e gerado automaticamente pelo sistema. Seu conteúdo é obrigatório.'
    ;

COMMENT ON COLUMN t_fonte_dados.nm_fonte_dados IS
    'Esse atributo irá receber o atributo nome das fontes de dados. Seu conteúdo é obrigatório.';

COMMENT ON COLUMN t_fonte_dados.tp_fonte_dados IS
    'Esse atributo irá receber o atributo tipo das fontes de dados. Seu conteúdo é obrigatório.';

COMMENT ON COLUMN t_fonte_dados.ds_fonte_dados IS
    'Esse atributo irá receber o atributo da descrição fonte de dados. Seu conteúdo é obrigatório.';

COMMENT ON COLUMN t_fonte_dados.url IS
    'Esse atributo irá receber o atributo url da fonte de dados. Seu conteúdo é obrigatório.';

CREATE UNIQUE INDEX t_fonte_dados__idx ON
    t_fonte_dados (
        id_ia
    ASC );

ALTER TABLE t_fonte_dados ADD CONSTRAINT t_fonte_dados_pk PRIMARY KEY ( id_fonte_dados );

CREATE TABLE t_ia (
    id_ia      NUMBER(9) NOT NULL,
    tp_ia      VARCHAR2(20) NOT NULL,
    ds_ia      VARCHAR2(100) NOT NULL,
    acuracia   VARCHAR2(5) NOT NULL,
    st_ia      CHAR(1) NOT NULL,
    id_empresa NUMBER(9) NOT NULL
);

COMMENT ON COLUMN t_ia.id_ia IS
    'Esse atributo irá receber a chave primária da ia. Esse número é sequencial e gerado automaticamente pelo sistema. Seu conteúdo é obrigatório.'
    ;

COMMENT ON COLUMN t_ia.tp_ia IS
    'Esse atributo irá receber o atributo tipo da ia. Seu conteúdo é obrigatório.';

COMMENT ON COLUMN t_ia.ds_ia IS
    'Esse atributo irá receber o atributo da descrição ia. Seu conteúdo é obrigatório.';

COMMENT ON COLUMN t_ia.acuracia IS
    'Esse atributo irá receber o atributo acuracia. Seu conteúdo é obrigatório.';

COMMENT ON COLUMN t_ia.st_ia IS
    'Esse atributo irá receber o atributo status da ia. seu conteúdo é obrigatório.';

COMMENT ON COLUMN t_ia.id_empresa IS
    'Esse atributo irá receber o atributo cnpj. Seu conteúdo é obrigatório.';

ALTER TABLE t_ia ADD CONSTRAINT t_ia_pk PRIMARY KEY ( id_ia );

CREATE TABLE t_pais (
    id_pais    NUMBER(9) NOT NULL,
    ds_pais    VARCHAR2(100) NOT NULL,
    id_empresa NUMBER(9) NOT NULL
);

COMMENT ON COLUMN t_pais.id_pais IS
    'Esse atributo irá receber a chave primária do id pais. Esse número é sequencial e gerado automaticamente pelo sistema. Seu conteúdo é obrigatório.'
    ;

COMMENT ON COLUMN t_pais.ds_pais IS
    'Esse atributo irá receber o atributo da descrição pais. Seu conteúdo é obrigatório.';

CREATE UNIQUE INDEX t_pais__idx ON
    t_pais (
        id_empresa
    ASC );

ALTER TABLE t_pais ADD CONSTRAINT t_pais_pk PRIMARY KEY ( id_pais );

CREATE TABLE t_previsao_tendencia (
    id_previsao_tendencia NUMBER(9) NOT NULL,
    dt_previsao_tendencia DATE NOT NULL,
    acuracia              VARCHAR2(5) NOT NULL,
    id_ia                 NUMBER(9) NOT NULL
);

COMMENT ON COLUMN t_previsao_tendencia.id_previsao_tendencia IS
    'Esse atributo irá receber a chave primária do is previsão das tendencias. Esse número é sequencial e gerado automaticamente pelo sistema. Seu conteúdo é obrigatório.'
    ;

COMMENT ON COLUMN t_previsao_tendencia.dt_previsao_tendencia IS
    'Esse atributo irá receber o atributo data de previsão das tendencias. Seu conteúdo é obrigatório.';

COMMENT ON COLUMN t_previsao_tendencia.acuracia IS
    'Esse atributo irá receber o atributo acuracia. Seu conteúdo é obrigatório.';

CREATE UNIQUE INDEX t_previsao_tendencia__idx ON
    t_previsao_tendencia (
        id_ia
    ASC );

ALTER TABLE t_previsao_tendencia ADD CONSTRAINT t_previsao_tendencia_pk PRIMARY KEY ( id_previsao_tendencia );

CREATE TABLE t_regiao (
    id_regiao  NUMBER(9) NOT NULL,
    ds_regiao  VARCHAR2(100) NOT NULL,
    id_empresa NUMBER(9) NOT NULL,
    id_pais    NUMBER(9) NOT NULL
);

COMMENT ON COLUMN t_regiao.id_regiao IS
    'Esse atributo irá receber a chave primária do id região. Esse número é sequencial e gerado automaticamente pelo sistema. Seu conteúdo é obrigatório.'
    ;

COMMENT ON COLUMN t_regiao.ds_regiao IS
    'Esse atributo irá receber o atributo da descrição região. Seu conteúdo é obrigatório.';

CREATE UNIQUE INDEX t_regiao__idx ON
    t_regiao (
        id_empresa
    ASC );

ALTER TABLE t_regiao ADD CONSTRAINT t_regiao_pk PRIMARY KEY ( id_regiao );

CREATE TABLE t_resultado (
    id_resultado NUMBER(9) NOT NULL,
    id_ia        NUMBER(9) NOT NULL
);

CREATE UNIQUE INDEX t_resultado__idx ON
    t_resultado (
        id_ia
    ASC );

ALTER TABLE t_resultado ADD CONSTRAINT t_resultado_pk PRIMARY KEY ( id_resultado );

ALTER TABLE t_pais
    ADD CONSTRAINT fk_t_pais_id_empresa FOREIGN KEY (id_empresa)
    REFERENCES t_empresa (id_empresa);

ALTER TABLE t_regiao
    ADD CONSTRAINT fk_t_regiao_id_empresa FOREIGN KEY (id_empresa)
    REFERENCES t_empresa (id_empresa);

ALTER TABLE t_resultado
    ADD CONSTRAINT relation_12 FOREIGN KEY ( id_ia )
        REFERENCES t_ia ( id_ia );

ALTER TABLE t_email
    ADD CONSTRAINT relation_15 FOREIGN KEY ( id_empresa )
        REFERENCES t_empresa ( id_empresa );

ALTER TABLE t_anuncio
    ADD CONSTRAINT relation_18 FOREIGN KEY ( id_campanha )
        REFERENCES t_campanha ( id_campanha );

ALTER TABLE t_regiao
    ADD CONSTRAINT relation_19 FOREIGN KEY ( id_pais )
        REFERENCES t_pais ( id_pais );

ALTER TABLE t_associacao
    ADD CONSTRAINT relation_2 FOREIGN KEY ( id_campanha )
        REFERENCES t_campanha ( id_campanha );

ALTER TABLE t_cidade
    ADD CONSTRAINT relation_21 FOREIGN KEY ( id_regiao )
        REFERENCES t_regiao ( id_regiao );

ALTER TABLE t_associacao2
    ADD CONSTRAINT relation_24 FOREIGN KEY ( id_email )
        REFERENCES t_email ( id_email );

ALTER TABLE t_associacao2
    ADD CONSTRAINT relation_25 FOREIGN KEY ( id_campanha )
        REFERENCES t_campanha ( id_campanha );

ALTER TABLE t_fonte_dados
    ADD CONSTRAINT relation_3 FOREIGN KEY ( id_ia )
        REFERENCES t_ia ( id_ia );

ALTER TABLE t_previsao_tendencia
    ADD CONSTRAINT relation_4 FOREIGN KEY ( id_ia )
        REFERENCES t_ia ( id_ia );

ALTER TABLE t_ia
    ADD CONSTRAINT relation_5 FOREIGN KEY ( id_empresa )
        REFERENCES t_empresa ( id_empresa );

ALTER TABLE t_associacao
    ADD CONSTRAINT relation_7 FOREIGN KEY ( id_cliente )
        REFERENCES t_cliente ( id_cliente );

ALTER TABLE t_empresa
    ADD CONSTRAINT relation_8 FOREIGN KEY ( id_cliente )
        REFERENCES t_cliente ( id_cliente );

ALTER TABLE t_cidade
    ADD CONSTRAINT relation_9 FOREIGN KEY ( id_empresa )
        REFERENCES t_empresa ( id_empresa );
