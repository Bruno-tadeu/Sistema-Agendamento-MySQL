-- Criação do banco e das tabelas (Sistema de Agendamentos)

CREATE DATABASE sistema_agendamentos;
USE sistema_agendamentos;

CREATE TABLE clientes (
    id_cliente      INT AUTO_INCREMENT,
    cpf             VARCHAR(14)  NOT NULL UNIQUE,
    nome            VARCHAR(100) NOT NULL,
    telefone        VARCHAR(20)  NOT NULL,
    email           VARCHAR(100) NOT NULL,
    data_nascimento DATE         NOT NULL,
    data_cadastro   DATE         NOT NULL,
    PRIMARY KEY (id_cliente)
);

CREATE TABLE colaboradores (
    id_colaborador INT AUTO_INCREMENT,
    cpf            VARCHAR(14)  NOT NULL UNIQUE,
    nome           VARCHAR(100) NOT NULL,
    telefone       VARCHAR(20)  NOT NULL,
    email          VARCHAR(100) NOT NULL,
    cargo          VARCHAR(50)  NOT NULL,
    data_admissao  DATE         NOT NULL,
    PRIMARY KEY (id_colaborador)
);

CREATE TABLE categorias_servico (
    id_categoria INT AUTO_INCREMENT,
    nome         VARCHAR(50)  NOT NULL UNIQUE,
    descricao    VARCHAR(255) NOT NULL,
    PRIMARY KEY (id_categoria)
);

CREATE TABLE servicos (
    id_servico      INT AUTO_INCREMENT,
    id_categoria    INT           NOT NULL,
    nome            VARCHAR(100)  NOT NULL,
    descricao       VARCHAR(255)  NOT NULL,
    duracao_minutos INT           NOT NULL,
    preco           DECIMAL(10,2) NOT NULL,
    status          VARCHAR(20)   NOT NULL,
    PRIMARY KEY (id_servico),
    FOREIGN KEY (id_categoria) REFERENCES categorias_servico (id_categoria)
);

CREATE TABLE formas_pagamento (
    id_forma_pagamento INT AUTO_INCREMENT,
    descricao          VARCHAR(50) NOT NULL,
    status             VARCHAR(20) NOT NULL,
    PRIMARY KEY (id_forma_pagamento)
);

CREATE TABLE agendamentos (
    id_agendamento   INT AUTO_INCREMENT,
    id_cliente       INT          NOT NULL,
    id_colaborador   INT          NOT NULL,
    id_servico       INT          NOT NULL,
    data_agendamento DATE         NOT NULL,
    horario_inicio   TIME         NOT NULL,
    horario_fim      TIME         NOT NULL,
    status           VARCHAR(20)  NOT NULL,
    observacao       VARCHAR(100) NULL,
    PRIMARY KEY (id_agendamento),
    FOREIGN KEY (id_cliente)     REFERENCES clientes (id_cliente),
    FOREIGN KEY (id_colaborador) REFERENCES colaboradores (id_colaborador),
    FOREIGN KEY (id_servico)     REFERENCES servicos (id_servico)
);

CREATE TABLE pagamentos (
    id_pagamento       INT AUTO_INCREMENT,
    id_agendamento     INT           NOT NULL,
    id_forma_pagamento INT           NOT NULL,
    valor              DECIMAL(10,2) NOT NULL,
    data_pagamento     DATETIME      NOT NULL,
    status             VARCHAR(20)   NOT NULL,
    PRIMARY KEY (id_pagamento),
    FOREIGN KEY (id_agendamento)     REFERENCES agendamentos (id_agendamento),
    FOREIGN KEY (id_forma_pagamento) REFERENCES formas_pagamento (id_forma_pagamento)
);