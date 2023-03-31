-- Generated by Oracle SQL Developer Data Modeler 22.2.0.165.1149
--   at:        2023-03-31 15:45:55 BRT
--   site:      SQL Server 2012
--   type:      SQL Server 2012
CREATE TABLE Aplicacao_da_Vacina (
    Nu_Dose INTEGER NOT NULL,
    Cd_Vacina VARCHAR (50) NOT NULL,
    Id_Aplicacao INTEGER NOT NULL,
    Id_Paciente INTEGER NOT NULL,
    Cd_Atendente CHAR (6) NOT NULL,
    Id_Vacina INTEGER NOT NULL
)
GO
ALTER TABLE Aplicacao_da_Vacina
ADD CONSTRAINT Aplicacao_da_Vacina_PK PRIMARY KEY CLUSTERED (Id_Aplicacao) WITH (
        ALLOW_PAGE_LOCKS = ON,
        ALLOW_ROW_LOCKS = ON
    )
GO CREATE TABLE Atendente (
        Cd_Atendente CHAR (6) NOT NULL,
        Nu_CPF CHAR (14) NOT NULL,
        Id_Unidade INTEGER NOT NULL
    )
GO
ALTER TABLE Atendente
ADD CONSTRAINT Atendente_PK PRIMARY KEY CLUSTERED (Cd_Atendente) WITH (
        ALLOW_PAGE_LOCKS = ON,
        ALLOW_ROW_LOCKS = ON
    )
GO CREATE TABLE Endereco (
        Nu_Bloco INTEGER,
        Nu_Apartamento INTEGER,
        Nu_CEP CHAR (9) NOT NULL,
        Nm_Estado VARCHAR (50) NOT NULL,
        Nm_Rua VARCHAR (50) NOT NULL,
        Nm_Cidade VARCHAR (50) NOT NULL,
        Nm_Bairro VARCHAR (50) NOT NULL,
        Nu_Numero INTEGER NOT NULL,
        Id_Endereco INTEGER NOT NULL IDENTITY NOT FOR REPLICATION
    )
GO
ALTER TABLE Endereco
ADD CONSTRAINT Endereco_PK PRIMARY KEY CLUSTERED (Id_Endereco) WITH (
        ALLOW_PAGE_LOCKS = ON,
        ALLOW_ROW_LOCKS = ON
    )
GO CREATE TABLE Fabrica (
        Nm_Fabrica VARCHAR (50) NOT NULL,
        Id_Fabrica INTEGER NOT NULL,
        Id_Fabricante INTEGER NOT NULL,
        "Id_ Endereco" INTEGER NOT NULL
    )
GO
ALTER TABLE Fabrica
ADD CONSTRAINT Fabrica_PK PRIMARY KEY CLUSTERED (Id_Fabrica) WITH (
        ALLOW_PAGE_LOCKS = ON,
        ALLOW_ROW_LOCKS = ON
    )
GO CREATE TABLE Fabricante (
        Nm_Fabricante VARCHAR (50) NOT NULL,
        Id_Fabricante INTEGER NOT NULL IDENTITY NOT FOR REPLICATION
    )
GO
ALTER TABLE Fabricante
ADD CONSTRAINT Fabricante_PK PRIMARY KEY CLUSTERED (Id_Fabricante) WITH (
        ALLOW_PAGE_LOCKS = ON,
        ALLOW_ROW_LOCKS = ON
    )
GO CREATE TABLE Paciente (
        Id_Paciente INTEGER NOT NULL,
        Nu_CPF CHAR (14) NOT NULL
    )
GO
ALTER TABLE Paciente
ADD CONSTRAINT Paciente_PK PRIMARY KEY CLUSTERED (Id_Paciente) WITH (
        ALLOW_PAGE_LOCKS = ON,
        ALLOW_ROW_LOCKS = ON
    )
GO CREATE TABLE Pessoa (
        Nu_RG INTEGER,
        Nu_Declaracao_de_Nascido_Vivo INTEGER,
        Dt_Nascimento DATE NOT NULL,
        Nm_Pessoa VARCHAR (50) NOT NULL,
        Nu_CPF CHAR (14) NOT NULL
    )
GO
ALTER TABLE Pessoa
ADD CONSTRAINT Pessoa_PK PRIMARY KEY CLUSTERED (Nu_CPF) WITH (
        ALLOW_PAGE_LOCKS = ON,
        ALLOW_ROW_LOCKS = ON
    )
GO CREATE TABLE Unidade_Basica_de_Saude (
        Nm_Unidade VARCHAR (50) NOT NULL,
        Id_Unidade INTEGER NOT NULL IDENTITY NOT FOR REPLICATION,
        "Id_ Endereco" INTEGER NOT NULL
    )
GO
ALTER TABLE Unidade_Basica_de_Saude
ADD CONSTRAINT Unidade_Basica_de_Saude_PK PRIMARY KEY CLUSTERED (Id_Unidade) WITH (
        ALLOW_PAGE_LOCKS = ON,
        ALLOW_ROW_LOCKS = ON
    )
GO CREATE TABLE Vacina (
        Nm_Vacina VARCHAR (50) NOT NULL,
        Tpo_Vacina VARCHAR (50) NOT NULL,
        Cd_Lote CHAR (5) NOT NULL,
        Dt_Fabricacao DATE NOT NULL,
        Dt_Validade DATE NOT NULL,
        Cd_Vacina VARCHAR (50) NOT NULL,
        Id_Vacina INTEGER NOT NULL IDENTITY NOT FOR REPLICATION,
        Id_Fabrica INTEGER NOT NULL
    )
GO
ALTER TABLE Vacina
ADD CONSTRAINT Vacina_PK PRIMARY KEY CLUSTERED (Id_Vacina) WITH (
        ALLOW_PAGE_LOCKS = ON,
        ALLOW_ROW_LOCKS = ON
    )
GO
ALTER TABLE Aplicacao_da_Vacina
ADD CONSTRAINT Aplicacao_Vacina_Atendente_FK FOREIGN KEY (Cd_Atendente) REFERENCES Atendente (Cd_Atendente) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE Aplicacao_da_Vacina
ADD CONSTRAINT Aplicacao_Vacina_Paciente_FK FOREIGN KEY (Id_Paciente) REFERENCES Paciente (Id_Paciente) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE Aplicacao_da_Vacina
ADD CONSTRAINT Aplicacao_Vacina_Vacina_FK FOREIGN KEY (Id_Vacina) REFERENCES Vacina (Id_Vacina) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE Atendente
ADD CONSTRAINT Atendente_Pessoa_FK FOREIGN KEY (Nu_CPF) REFERENCES Pessoa (Nu_CPF) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE Atendente
ADD CONSTRAINT Atendente_Unidade_Basica_de_Saude_FK FOREIGN KEY (Id_Unidade) REFERENCES Unidade_Basica_de_Saude (Id_Unidade) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE Fabrica
ADD CONSTRAINT Fabrica_Endereco_FK FOREIGN KEY ("Id_ Endereco") REFERENCES Endereco (Id_Endereco) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE Fabrica
ADD CONSTRAINT Fabrica_Fabricante_FK FOREIGN KEY (Id_Fabricante) REFERENCES Fabricante (Id_Fabricante) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE Paciente
ADD CONSTRAINT Paciente_Pessoa_FK FOREIGN KEY (Nu_CPF) REFERENCES Pessoa (Nu_CPF) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE Unidade_Basica_de_Saude
ADD CONSTRAINT Unidade_Endere � o_FK FOREIGN KEY ("Id_ Endereco") REFERENCES Endereco (Id_Endereco) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE Vacina
ADD CONSTRAINT Vacina_Fabrica_FK FOREIGN KEY (Id_Fabrica) REFERENCES Fabrica (Id_Fabrica) ON DELETE NO ACTION ON UPDATE NO ACTION
GO -- Oracle SQL Developer Data Modeler Summary Report: 
    -- 
    -- CREATE TABLE                             9
    -- CREATE INDEX                             0
    -- ALTER TABLE                             19
    -- CREATE VIEW                              0
    -- ALTER VIEW                               0
    -- CREATE PACKAGE                           0
    -- CREATE PACKAGE BODY                      0
    -- CREATE PROCEDURE                         0
    -- CREATE FUNCTION                          0
    -- CREATE TRIGGER                           0
    -- ALTER TRIGGER                            0
    -- CREATE DATABASE                          0
    -- CREATE DEFAULT                           0
    -- CREATE INDEX ON VIEW                     0
    -- CREATE ROLLBACK SEGMENT                  0
    -- CREATE ROLE                              0
    -- CREATE RULE                              0
    -- CREATE SCHEMA                            0
    -- CREATE SEQUENCE                          0
    -- CREATE PARTITION FUNCTION                0
    -- CREATE PARTITION SCHEME                  0
    -- 
    -- DROP DATABASE                            0
    -- 
    -- ERRORS                                   0
    -- WARNINGS                                 0