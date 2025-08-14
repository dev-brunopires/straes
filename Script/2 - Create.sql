/* ---------------------------------------------------------------------- */
/* Script generated with: DeZign for Databases V10.0.2                    */
/* Target DBMS:           MS SQL Server 2016                              */
/* Project file:          Der STRAES_XM.dez                               */
/* Project name:          Banco de Dados STRAES_XM                        */
/* Author:                Wellington Marques                              */
/* Script type:           Database creation script                        */
/* Created on:            2020-08-06 18:05                                */
/* ---------------------------------------------------------------------- */


/* ---------------------------------------------------------------------- */
/* Add tables                                                             */
/* ---------------------------------------------------------------------- */

GO


/* ---------------------------------------------------------------------- */
/* Add table "cfg.USUARIO"                                                */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [cfg].[USUARIO] (
    [ID_USUARIO] INTEGER IDENTITY(1,1) NOT NULL,
    [LOGIN] VARCHAR(20) COLLATE Latin1_General_CI_AS NOT NULL,
    [SENHA] VARBINARY(100) NOT NULL,
    [NOME] VARCHAR(50) COLLATE Latin1_General_CI_AS NOT NULL,
    [DT_NASCIMENTO] SMALLDATETIME NOT NULL,
    [ATIVO] BIT CONSTRAINT [DF_USUARIO_ATIVO] DEFAULT 1 NOT NULL,
    [USUARIO_OPERACAO] VARCHAR(20) COLLATE Latin1_General_CI_AS NOT NULL,
    [DATA_OPERACAO] SMALLDATETIME CONSTRAINT [DEF_USUARIO_DATA_OPERACAO] DEFAULT getdate() NOT NULL,
    CONSTRAINT [PK_USUARIO] PRIMARY KEY CLUSTERED ([ID_USUARIO]),
    CONSTRAINT [TUC_USUARIO_LOGIN] UNIQUE ([LOGIN])
)
GO


CREATE NONCLUSTERED INDEX [IDX_USUARIO_LOGIN] ON [cfg].[USUARIO] ([LOGIN] ASC)
GO


ALTER TABLE [cfg].[USUARIO] ADD CONSTRAINT [CC_USUARIO_%column%] 
    CHECK ([ATIVO]=(0) OR [ATIVO]=(1))
GO


ALTER TABLE [cfg].[USUARIO] ADD CONSTRAINT [CC_USUARIO_ATIVO] 
    CHECK ([ATIVO]=(0) OR [ATIVO]=(1))
GO


ALTER TABLE [cfg].[USUARIO] ADD CONSTRAINT [CK_USUARIO_%column%] 
    CHECK ([ATIVO]=(0) OR [ATIVO]=(1))
GO


/* ---------------------------------------------------------------------- */
/* Add table "cfg.MODULO"                                                 */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [cfg].[MODULO] (
    [ID_MODULO] INTEGER IDENTITY(1,1) NOT NULL,
    [ID_MODULO_PAI] INTEGER,
    [DESCRICAO] VARCHAR(100) COLLATE Latin1_General_CI_AS NOT NULL,
    [COMPONENTE] VARCHAR(100) COLLATE Latin1_General_CI_AS NOT NULL,
    [ATIVO] BIT CONSTRAINT [DF_MODULO_ATIVO] DEFAULT 1 NOT NULL,
    [USUARIO_OPERACAO] VARCHAR(20) COLLATE Latin1_General_CI_AS NOT NULL,
    [DATA_OPERACAO] SMALLDATETIME CONSTRAINT [DEF_MODULO_DATA_OPERACAO] DEFAULT getdate() NOT NULL,
    CONSTRAINT [PK_MODULO] PRIMARY KEY CLUSTERED ([ID_MODULO]),
    CONSTRAINT [TUC_MODULO_COMPONENTE] UNIQUE ([COMPONENTE])
)
GO


CREATE NONCLUSTERED INDEX [IDX_MODULO_COMPONENTE] ON [cfg].[MODULO] ([COMPONENTE] ASC)
GO


CREATE NONCLUSTERED INDEX [IDX_MODULO_DESCRICAO] ON [cfg].[MODULO] ([DESCRICAO] ASC)
GO


ALTER TABLE [cfg].[MODULO] ADD CONSTRAINT [CC_MODULO_ATIVO] 
    CHECK ([Ativo]=(0) OR [Ativo]=(1))
GO


/* ---------------------------------------------------------------------- */
/* Add table "cfg.USUARIO_MODULO"                                         */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [cfg].[USUARIO_MODULO] (
    [ID_USUARIO_MODULO] INTEGER IDENTITY(1,1) NOT NULL,
    [ID_USUARIO] INTEGER NOT NULL,
    [ID_MODULO] INTEGER NOT NULL,
    [PERMISSAO] BIT CONSTRAINT [DEF_USUARIO_MODULO_PERMISSAO] DEFAULT 1 NOT NULL,
    [BLOQUEADO] BIT CONSTRAINT [DEF_USUARIO_MODULO_BLOQUEADO] DEFAULT 1 NOT NULL,
    [USUARIO_OPERACAO] VARCHAR(20) COLLATE Latin1_General_CI_AS NOT NULL,
    [DATA_OPERACAO] SMALLDATETIME CONSTRAINT [DEF_USUARIO_MODULO_DATA_OPERACAO] DEFAULT getdate() NOT NULL,
    CONSTRAINT [PK_USUARIO_MODULO] PRIMARY KEY CLUSTERED ([ID_USUARIO_MODULO])
)
GO


CREATE NONCLUSTERED INDEX [IDX_USUARIO_MODULO_ID_USUARIO] ON [cfg].[USUARIO_MODULO] ([ID_USUARIO] ASC,[ID_MODULO] ASC)
GO


ALTER TABLE [cfg].[USUARIO_MODULO] ADD CONSTRAINT [CC_USUARIO_MODULO_BLOQUEADO] 
    CHECK ([BLOQUEADO]=(0) OR [BLOQUEADO]=(1))
GO


ALTER TABLE [cfg].[USUARIO_MODULO] ADD CONSTRAINT [CC_USUARIO_MODULO_PERMISSAO] 
    CHECK ([PERMISSAO]=(0) OR [PERMISSAO]=(1))
GO


/* ---------------------------------------------------------------------- */
/* Add table "cfg.PAIS"                                                   */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [cfg].[PAIS] (
    [ID_PAIS] INTEGER IDENTITY(1,1) NOT NULL,
    [NOME] VARCHAR(60) COLLATE Latin1_General_CI_AS NOT NULL,
    [NOME_PT] VARCHAR(60) COLLATE Latin1_General_CI_AS NOT NULL,
    [SIGLA] CHAR(2) COLLATE Latin1_General_CI_AS,
    [BACEN] INTEGER NOT NULL,
    CONSTRAINT [PK_PAIS] PRIMARY KEY CLUSTERED ([ID_PAIS])
)
GO


CREATE NONCLUSTERED INDEX [IDX_PAIS_NOME] ON [cfg].[PAIS] ([NOME] ASC)
GO


/* ---------------------------------------------------------------------- */
/* Add table "log.ENDERECO"                                               */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [log].[ENDERECO] (
    [ID_ENDERECO] INTEGER,
    [ID_PESSOA] INTEGER,
    [ID_TIPO_ENDERECO] INTEGER,
    [ID_CIDADE] INTEGER,
    [LOGRADOURO] VARCHAR(100) COLLATE Latin1_General_CI_AS,
    [NUMERO] VARCHAR(10) COLLATE Latin1_General_CI_AS,
    [COMPLEMENTO] VARCHAR(20) COLLATE Latin1_General_CI_AS,
    [BAIRRO] VARCHAR(50) COLLATE Latin1_General_CI_AS,
    [CEP] VARCHAR(8) COLLATE Latin1_General_CI_AS,
    [ATIVO] BIT,
    [USUARIO_OPERACAO] VARCHAR(20) COLLATE Latin1_General_CI_AS,
    [DATA_OPERACAO] SMALLDATETIME,
    [STATUS_OPERACAO] VARCHAR(10) COLLATE Latin1_General_CI_AS
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "log.CONTATO"                                                */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [log].[CONTATO] (
    [ID_CONTATO] INTEGER,
    [ID_PESSOA] INTEGER,
    [ID_TIPO_CONTATO] INTEGER,
    [DESCRICAO] VARCHAR(100) COLLATE Latin1_General_CI_AS,
    [ATIVO] BIT,
    [USUARIO_OPERACAO] VARCHAR(20) COLLATE Latin1_General_CI_AS,
    [DATA_OPERACAO] SMALLDATETIME,
    [STATUS_OPERACAO] VARCHAR(10) COLLATE Latin1_General_CI_AS
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "log.MODULO"                                                 */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [log].[MODULO] (
    [ID_MODULO] INTEGER,
    [ID_MODULO_PAI] INTEGER,
    [DESCRICAO] VARCHAR(100) COLLATE Latin1_General_CI_AS,
    [COMPONENTE] VARCHAR(100) COLLATE Latin1_General_CI_AS,
    [ATIVO] BIT,
    [USUARIO_OPERACAO] VARCHAR(20) COLLATE Latin1_General_CI_AS,
    [DATA_OPERACAO] SMALLDATETIME,
    [STATUS_OPERACAO] VARCHAR(10) COLLATE Latin1_General_CI_AS
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "log.TIPO_CONTATO"                                           */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [log].[TIPO_CONTATO] (
    [ID_TIPO_CONTATO] INTEGER,
    [DESCRICAO] VARCHAR(100) COLLATE Latin1_General_CI_AS,
    [ATIVO] BIT,
    [USUARIO_OPERACAO] VARCHAR(20) COLLATE Latin1_General_CI_AS,
    [DATA_OPERACAO] SMALLDATETIME,
    [STATUS_OPERACAO] VARCHAR(10) COLLATE Latin1_General_CI_AS
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "sis.TIPO_CONTATO"                                           */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [sis].[TIPO_CONTATO] (
    [ID_TIPO_CONTATO] INTEGER IDENTITY(1,1) NOT NULL,
    [DESCRICAO] VARCHAR(100) COLLATE Latin1_General_CI_AS NOT NULL,
    [ATIVO] BIT CONSTRAINT [DEF_TIPO_CONTATO_ATIVO] DEFAULT 1 NOT NULL,
    [USUARIO_OPERACAO] VARCHAR(20) COLLATE Latin1_General_CI_AS NOT NULL,
    [DATA_OPERACAO] SMALLDATETIME CONSTRAINT [DEF_TIPO_CONTATO_DATA_OPERACAO] DEFAULT getdate() NOT NULL,
    CONSTRAINT [PK_TIPO_CONTATO] PRIMARY KEY ([ID_TIPO_CONTATO]),
    CONSTRAINT [TUC_TIPO_CONTATO_DESCRICAO] UNIQUE ([DESCRICAO])
)
GO


CREATE NONCLUSTERED INDEX [IDX_TIPO_CONTATO_DESCRICAO] ON [sis].[TIPO_CONTATO] ([DESCRICAO] ASC)
GO


ALTER TABLE [sis].[TIPO_CONTATO] ADD CONSTRAINT [CC_TIPO_CONTATO_ATIVO] 
    CHECK ([ATIVO]=(0) OR [ATIVO]=(1))
GO


/* ---------------------------------------------------------------------- */
/* Add table "log.TIPO_ENDERECO"                                          */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [log].[TIPO_ENDERECO] (
    [ID_TIPO_ENDERECO] INTEGER NOT NULL,
    [DESCRICAO] VARCHAR(100) COLLATE Latin1_General_CI_AS,
    [ATIVO] BIT,
    [USUARIO_OPERACAO] VARCHAR(20) COLLATE Latin1_General_CI_AS,
    [DATA_OPERACAO] SMALLDATETIME,
    [STATUS_OPERACAO] VARCHAR(10) COLLATE Latin1_General_CI_AS
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "sis.TIPO_ENDERECO"                                          */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [sis].[TIPO_ENDERECO] (
    [ID_TIPO_ENDERECO] INTEGER IDENTITY(1,1) NOT NULL,
    [DESCRICAO] VARCHAR(100) COLLATE Latin1_General_CI_AS NOT NULL,
    [ATIVO] BIT CONSTRAINT [DEF_TIPO_ENDERECO_ATIVO] DEFAULT 1 NOT NULL,
    [USUARIO_OPERACAO] VARCHAR(20) COLLATE Latin1_General_CI_AS NOT NULL,
    [DATA_OPERACAO] SMALLDATETIME CONSTRAINT [DEF_TIPO_ENDERECO_DATA_OPERACAO] DEFAULT getdate() NOT NULL,
    CONSTRAINT [PK_TIPO_ENDERECO] PRIMARY KEY ([ID_TIPO_ENDERECO]),
    CONSTRAINT [TUC_TIPO_ENDERECO_DESCRICAO] UNIQUE ([DESCRICAO])
)
GO


CREATE NONCLUSTERED INDEX [IDX_TIPO_ENDERECO_DESCRICAO] ON [sis].[TIPO_ENDERECO] ([DESCRICAO] ASC)
GO


ALTER TABLE [sis].[TIPO_ENDERECO] ADD CONSTRAINT [CC_TIPO_ENDERECO_ATIVO] 
    CHECK ([ATIVO]=(0) OR [ATIVO]=(1))
GO


/* ---------------------------------------------------------------------- */
/* Add table "log.USUARIO"                                                */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [log].[USUARIO] (
    [ID_USUARIO] INTEGER,
    [LOGIN] VARCHAR(20) COLLATE Latin1_General_CI_AS,
    [SENHA] VARBINARY(100),
    [NOME] VARCHAR(50) COLLATE Latin1_General_CI_AS,
    [DT_NASCIMENTO] SMALLDATETIME,
    [ATIVO] BIT,
    [USUARIO_OPERACAO] VARCHAR(20) COLLATE Latin1_General_CI_AS,
    [DATA_OPERACAO] SMALLDATETIME,
    [STATUS_OPERACAO] VARCHAR(10) COLLATE Latin1_General_CI_AS
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "log.USUARIO_MODULO"                                         */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [log].[USUARIO_MODULO] (
    [ID_USUARIO_MODULO] INTEGER,
    [ID_USUARIO] INTEGER,
    [ID_MODULO] INTEGER,
    [PERMISSAO] BIT,
    [BLOQUEADO] BIT,
    [USUARIO_OPERACAO] VARCHAR(20) COLLATE Latin1_General_CI_AS,
    [DATA_OPERACAO] SMALLDATETIME,
    [STATUS_OPERACAO] VARCHAR(10) COLLATE Latin1_General_CI_AS
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "sis.TIPO_DOCUMENTO"                                         */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [sis].[TIPO_DOCUMENTO] (
    [ID_TIPO_DOCUMENTO] INTEGER IDENTITY(1,1) NOT NULL,
    [DESCRICAO] VARCHAR(100) COLLATE Latin1_General_CI_AS NOT NULL,
    [ATIVO] BIT CONSTRAINT [DF_TIPO_DOCUMENTO_ATIVO] DEFAULT 1 NOT NULL,
    [USUARIO_OPERACAO] VARCHAR(20) COLLATE Latin1_General_CI_AS NOT NULL,
    [DATA_OPERACAO] SMALLDATETIME CONSTRAINT [DEF_TIPO_DOCUMENTO_DATA_OPERACAO] DEFAULT getdate() NOT NULL,
    CONSTRAINT [PK_TIPO_DOCUMENTO] PRIMARY KEY ([ID_TIPO_DOCUMENTO]),
    CONSTRAINT [TUC_TIPO_DOCUMENTO_DESCRICAO] UNIQUE ([DESCRICAO])
)
GO


CREATE NONCLUSTERED INDEX [IDX_TIPO_DOCUMENTO_DESCRICAO] ON [sis].[TIPO_DOCUMENTO] ([DESCRICAO] ASC)
GO


ALTER TABLE [sis].[TIPO_DOCUMENTO] ADD CONSTRAINT [CC_TIPO_DOCUMENTO_ATIVO] 
    CHECK ([ATIVO]=(0) OR [ATIVO]=(1))
GO


/* ---------------------------------------------------------------------- */
/* Add table "log.DOCUMENTO"                                              */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [log].[DOCUMENTO] (
    [ID_DOCUMENTO] INTEGER,
    [ID_PESSOA] INTEGER,
    [ID_TIPO_DOCUMENTO] INTEGER,
    [DESCRICAO] VARCHAR(100) COLLATE Latin1_General_CI_AS,
    [ATIVO] BIT,
    [USUARIO_OPERACAO] VARCHAR(20) COLLATE Latin1_General_CI_AS,
    [DATA_OPERACAO] SMALLDATETIME,
    [STATUS_OPERACAO] VARCHAR(10) COLLATE Latin1_General_CI_AS
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "log.TIPO_DOCUMENTO"                                         */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [log].[TIPO_DOCUMENTO] (
    [ID_TIPO_DOCUMENTO] INTEGER,
    [DESCRICAO] VARCHAR(100) COLLATE Latin1_General_CI_AS,
    [ATIVO] BIT,
    [USUARIO_OPERACAO] VARCHAR(20) COLLATE Latin1_General_CI_AS,
    [DATA_OPERACAO] SMALLDATETIME,
    [STATUS_OPERACAO] VARCHAR(10) COLLATE Latin1_General_CI_AS
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "log.ATIVIDADE"                                              */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [log].[ATIVIDADE] (
    [ID_ATIVIDADE] INTEGER,
    [DESCRICAO] VARCHAR(100) COLLATE Latin1_General_CI_AS,
    [ATIVO] BIT,
    [USUARIO_OPERACAO] VARCHAR(20) COLLATE Latin1_General_CI_AS,
    [DATA_OPERACAO] SMALLDATETIME,
    [STATUS_OPERACAO] VARCHAR(10) COLLATE Latin1_General_CI_AS
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "sis.ATIVIDADE"                                              */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [sis].[ATIVIDADE] (
    [ID_ATIVIDADE] INTEGER IDENTITY(1,1) NOT NULL,
    [DESCRICAO] VARCHAR(100) COLLATE Latin1_General_CI_AS NOT NULL,
    [ATIVO] BIT CONSTRAINT [DEF_ATIVIDADE_ATIVO] DEFAULT 1 NOT NULL,
    [USUARIO_OPERACAO] VARCHAR(20) COLLATE Latin1_General_CI_AS NOT NULL,
    [DATA_OPERACAO] SMALLDATETIME CONSTRAINT [DEF_ATIVIDADE_DATA_OPERACAO] DEFAULT getdate() NOT NULL,
    CONSTRAINT [PK_ATIVIDADE] PRIMARY KEY ([ID_ATIVIDADE]),
    CONSTRAINT [TUC_ATIVIDADE_1] UNIQUE ([DESCRICAO])
)
GO


CREATE NONCLUSTERED INDEX [IDX_ATIVIDADE_1] ON [sis].[ATIVIDADE] ([DESCRICAO] ASC)
GO


ALTER TABLE [sis].[ATIVIDADE] ADD CONSTRAINT [CC_ATIVIDADE_ATIVO] 
    CHECK ([ATIVO]=(0) OR [ATIVO]=(1))
GO


/* ---------------------------------------------------------------------- */
/* Add table "log.CLASSIFICACAO"                                          */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [log].[CLASSIFICACAO] (
    [ID_CLASSIFICACAO] INTEGER,
    [DESCRICAO] VARCHAR(100) COLLATE Latin1_General_CI_AS,
    [ATIVO] BIT,
    [USUARIO_OPERACAO] VARCHAR(20) COLLATE Latin1_General_CI_AS,
    [DATA_OPERACAO] SMALLDATETIME,
    [STATUS_OPERACAO] VARCHAR(10) COLLATE Latin1_General_CI_AS
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "sis.CLASSIFICACAO"                                          */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [sis].[CLASSIFICACAO] (
    [ID_CLASSIFICACAO] INTEGER IDENTITY(1,1) NOT NULL,
    [DESCRICAO] VARCHAR(100) COLLATE Latin1_General_CI_AS NOT NULL,
    [ATIVO] BIT CONSTRAINT [DF_CLASSIFICACAO_ATIVO] DEFAULT 1 NOT NULL,
    [USUARIO_OPERACAO] VARCHAR(20) COLLATE Latin1_General_CI_AS NOT NULL,
    [DATA_OPERACAO] SMALLDATETIME CONSTRAINT [DEF_CLASSIFICACAO_DATA_OPERACAO] DEFAULT getdate() NOT NULL,
    CONSTRAINT [PK_CLASSIFICACAO] PRIMARY KEY ([ID_CLASSIFICACAO]),
    CONSTRAINT [TUC_CLASSIFICACAO_DESCRICAO] UNIQUE ([DESCRICAO])
)
GO


CREATE NONCLUSTERED INDEX [IDX_CLASSIFICACAO_DESCRICAO] ON [sis].[CLASSIFICACAO] ([DESCRICAO] ASC)
GO


ALTER TABLE [sis].[CLASSIFICACAO] ADD CONSTRAINT [CC_CLASSIFICACAO_ATIVO] 
    CHECK ([ATIVO]=(0) OR [ATIVO]=(1))
GO


/* ---------------------------------------------------------------------- */
/* Add table "cfg.CONFIGURACAO"                                           */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [cfg].[CONFIGURACAO] (
    [ID_CONFIGURACAO] INTEGER IDENTITY(1,1) NOT NULL,
    [FIN_ANO_CONTABIL] CHAR(4) COLLATE Latin1_General_CI_AS NOT NULL,
    [FIN_DIA_VENCIMENTO] CHAR(2) COLLATE Latin1_General_CI_AS NOT NULL,
    [FIN_JUROS_DIA] SMALLMONEY CONSTRAINT [DEF_CONFIGURACAO_FIN_JUROS_DIA] DEFAULT 0 NOT NULL,
    [ATIVO] BIT CONSTRAINT [DEF_CONFIGURACAO_ATIVO] DEFAULT 0 NOT NULL,
    [USUARIO_OPERACAO] VARCHAR(20) COLLATE Latin1_General_CI_AS NOT NULL,
    [DATA_OPERACAO] SMALLDATETIME CONSTRAINT [DEF_CONFIGURACAO_DATA_OPERACAO] DEFAULT getdate() NOT NULL,
    CONSTRAINT [PK__CONFIGUR__83C33A775AF93CFD] PRIMARY KEY CLUSTERED ([ID_CONFIGURACAO])
)
GO


ALTER TABLE [cfg].[CONFIGURACAO] ADD CONSTRAINT [CC_CONFIGURACAO_ATIVO] 
    CHECK ([ATIVO]=(0) OR [ATIVO]=(1))
GO


/* ---------------------------------------------------------------------- */
/* Add table "log.CONFIGURACAO"                                           */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [log].[CONFIGURACAO] (
    [ID_CONFIGURACAO] INTEGER,
    [FIN_ANO_CONTABIL] CHAR(4) COLLATE Latin1_General_CI_AS,
    [FIN_DIA_VENCIMENTO] CHAR(2) COLLATE Latin1_General_CI_AS,
    [FIN_JUROS_DIA] SMALLMONEY,
    [ATIVO] BIT,
    [USUARIO_OPERACAO] VARCHAR(20) COLLATE Latin1_General_CI_AS,
    [DATA_OPERACAO] SMALLDATETIME,
    [STATUS_OPERACAO] VARCHAR(10) COLLATE Latin1_General_CI_AS
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "log.FILANTROPIA"                                            */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [log].[FILANTROPIA] (
    [ID_FILANTROPIA] INTEGER,
    [DESCRICAO] VARCHAR(100) COLLATE Latin1_General_CI_AS,
    [PERCENTUAL] SMALLMONEY,
    [VALOR] SMALLMONEY,
    [ATIVO] BIT,
    [DT_INICIO] SMALLDATETIME,
    [DT_FIM] SMALLDATETIME,
    [USUARIO_OPERACAO] VARCHAR(20) COLLATE Latin1_General_CI_AS,
    [DATA_OPERACAO] SMALLDATETIME,
    [STATUS_OPERACAO] VARCHAR(10) COLLATE Latin1_General_CI_AS
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "sis.FILANTROPIA"                                            */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [sis].[FILANTROPIA] (
    [ID_FILANTROPIA] INTEGER IDENTITY(1,1) NOT NULL,
    [DESCRICAO] VARCHAR(100) COLLATE Latin1_General_CI_AS NOT NULL,
    [PERCENTUAL] SMALLMONEY NOT NULL,
    [VALOR] SMALLMONEY NOT NULL,
    [ATIVO] BIT CONSTRAINT [DF_FILANTROPIA_ATIVO] DEFAULT 1 NOT NULL,
    [USUARIO_OPERACAO] VARCHAR(20) COLLATE Latin1_General_CI_AS NOT NULL,
    [DATA_OPERACAO] SMALLDATETIME CONSTRAINT [DEF_FILANTROPIA_DATA_OPERACAO] DEFAULT getdate() NOT NULL,
    CONSTRAINT [PK_FILANTROPIA] PRIMARY KEY ([ID_FILANTROPIA]),
    CONSTRAINT [TUC_FILANTROPIA_DESCRICAO] UNIQUE ([DESCRICAO])
)
GO


CREATE NONCLUSTERED INDEX [IDX_FILANTROPIA_DESCRICAO] ON [sis].[FILANTROPIA] ([DESCRICAO] ASC)
GO


/* ---------------------------------------------------------------------- */
/* Add table "log.FINANCEIRO"                                             */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [log].[FINANCEIRO] (
    [ID_FINANCEIRO] INTEGER,
    [ID_PESSOA] INTEGER,
    [REFER] CHAR(6) COLLATE Latin1_General_CI_AS,
    [DT_VENCIMENTO] SMALLDATETIME,
    [VL_REFER] SMALLMONEY,
    [VL_DESCONTO] SMALLMONEY,
    [DT_PAGAMENTO] SMALLDATETIME,
    [VL_PAGO] SMALLMONEY,
    [USUARIO_OPERACAO] VARCHAR(20) COLLATE Latin1_General_CI_AS,
    [DATA_OPERACAO] SMALLDATETIME,
    [STATUS_OPERACAO] VARCHAR(10) COLLATE Latin1_General_CI_AS
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "log.FINANCEIRO_ALTERACAO"                                   */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [log].[FINANCEIRO_ALTERACAO] (
    [ID_FINANCEIRO_ALTERACAO] INTEGER,
    [ID_FINANCEIRO] INTEGER,
    [DT_VENCIMENTO] SMALLDATETIME,
    [VL_DESCONTO_ORIGINAL] SMALLMONEY,
    [VL_DESCONTO] SMALLMONEY,
    [VL_JUROS_ORIGINAL] SMALLMONEY,
    [VL_JUROS] SMALLMONEY,
    [OBSERVACAO] VARCHAR(200) COLLATE Latin1_General_CI_AS,
    [USUARIO_OPERACAO] VARCHAR(20) COLLATE Latin1_General_CI_AS,
    [DATA_OPERACAO] SMALLDATETIME,
    [STATUS_OPERACAO] VARCHAR(10) COLLATE Latin1_General_CI_AS
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "log.FINANCEIRO_ESTORNO"                                     */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [log].[FINANCEIRO_ESTORNO] (
    [ID_FINANCEIRO_ESTORNO] INTEGER,
    [ID_FINANCEIRO] INTEGER,
    [OBSERVACAO] VARCHAR(200) COLLATE Latin1_General_CI_AS,
    [USUARIO_OPERACAO] VARCHAR(20) COLLATE Latin1_General_CI_AS,
    [DATA_OPERACAO] SMALLDATETIME,
    [STATUS_OPERACAO] VARCHAR(10) COLLATE Latin1_General_CI_AS
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "log.PESSOA_FILANTROPIA"                                     */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [log].[PESSOA_FILANTROPIA] (
    [ID_PESSOA_FILANTROPIA] INTEGER,
    [ID_PESSOA] INTEGER,
    [ID_FILANTROPIA] INTEGER,
    [REFER_INICIO] CHAR(6) COLLATE Latin1_General_CI_AS,
    [REFER_FIM] CHAR(6) COLLATE Latin1_General_CI_AS,
    [USUARIO_OPERACAO] VARCHAR(20) COLLATE Latin1_General_CI_AS,
    [DATA_OPERACAO] SMALLDATETIME,
    [STATUS_OPERACAO] VARCHAR(10) COLLATE Latin1_General_CI_AS
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "log.PESSOA_PLANO"                                           */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [log].[PESSOA_PLANO] (
    [ID_PESSOA_PLANO] INTEGER,
    [ID_PESSOA] INTEGER,
    [ID_PLANO] INTEGER,
    [REFER_INICIO] CHAR(6) COLLATE Latin1_General_CI_AS,
    [REFER_FIM] CHAR(6) COLLATE Latin1_General_CI_AS,
    [USUARIO_OPERACAO] VARCHAR(20) COLLATE Latin1_General_CI_AS,
    [DATA_OPERACAO] SMALLDATETIME,
    [STATUS_OPERACAO] VARCHAR(10) COLLATE Latin1_General_CI_AS
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "log.PLANO"                                                  */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [log].[PLANO] (
    [ID_PLANO] INTEGER,
    [DESCRICAO] VARCHAR(100) COLLATE Latin1_General_CI_AS,
    [VALOR] SMALLMONEY,
    [ATIVO] BIT,
    [REFER_INICIO] CHAR(6) COLLATE Latin1_General_CI_AS,
    [REFER_FIM] CHAR(6) COLLATE Latin1_General_CI_AS,
    [USUARIO_OPERACAO] VARCHAR(20) COLLATE Latin1_General_CI_AS,
    [DATA_OPERACAO] SMALLDATETIME,
    [STATUS_OPERACAO] VARCHAR(10) COLLATE Latin1_General_CI_AS
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "sis.PLANO"                                                  */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [sis].[PLANO] (
    [ID_PLANO] INTEGER IDENTITY(1,1) NOT NULL,
    [DESCRICAO] VARCHAR(100) COLLATE Latin1_General_CI_AS NOT NULL,
    [VALOR] SMALLMONEY NOT NULL,
    [ATIVO] BIT CONSTRAINT [DF_PLANO_ATIVO] DEFAULT 1 NOT NULL,
    [USUARIO_OPERACAO] VARCHAR(20) COLLATE Latin1_General_CI_AS NOT NULL,
    [DATA_OPERACAO] SMALLDATETIME CONSTRAINT [DEF_PLANO_DATA_OPERACAO] DEFAULT getdate() NOT NULL,
    CONSTRAINT [PK_PLANO] PRIMARY KEY ([ID_PLANO]),
    CONSTRAINT [TUC_PLANO_DESCRICAO] UNIQUE ([DESCRICAO])
)
GO


CREATE NONCLUSTERED INDEX [IDX_SYS_PLANO_DESCRICAO] ON [sis].[PLANO] ([DESCRICAO] ASC)
GO


ALTER TABLE [sis].[PLANO] ADD CONSTRAINT [CC_PLANO_ATIVO] 
    CHECK ([ATIVO]=(0) OR [ATIVO]=(1))
GO


/* ---------------------------------------------------------------------- */
/* Add table "cfg.ESTADO_CIVIL"                                           */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [cfg].[ESTADO_CIVIL] (
    [ID_ESTADO_CIVIL] INTEGER IDENTITY(1,1) NOT NULL,
    [DESCRICAO] VARCHAR(100) NOT NULL,
    [ATIVO] BIT CONSTRAINT [DEF_ESTADO_CIVIL_ATIVO] DEFAULT 0 NOT NULL,
    [USUARIO_OPERACAO] VARCHAR(20) NOT NULL,
    [DATA_OPERACAO] SMALLDATETIME CONSTRAINT [DEF_ESTADO_CIVIL_DATA_OPERACAO] DEFAULT getdate() NOT NULL,
    CONSTRAINT [PK_ESTADO_CIVIL] PRIMARY KEY ([ID_ESTADO_CIVIL]),
    CONSTRAINT [TUC_ESTADO_CIVIL_DESCRICAO] UNIQUE ([DESCRICAO])
)
GO


CREATE NONCLUSTERED INDEX [IDX_ESTADO_CIVIL_DESCRICAO] ON [cfg].[ESTADO_CIVIL] ([DESCRICAO] ASC)
GO


/* ---------------------------------------------------------------------- */
/* Add table "log.ESTADO_CIVIL"                                           */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [log].[ESTADO_CIVIL] (
    [ID_ESTADO_CIVIL] INTEGER,
    [DESCRICAO] VARCHAR(100),
    [ATIVO] BIT,
    [USUARIO_OPERACAO] VARCHAR(20),
    [DATA_OPERACAO] SMALLDATETIME,
    [STATUS_OPERACAO] VARCHAR(10)
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "log.SANTO"                                                  */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [log].[SANTO] (
    [ID_SANTO] INTEGER,
    [ID_PESSOA] INTEGER,
    [DESCRICAO] VARCHAR(100),
    [USUARIO_OPERACAO] VARCHAR(20),
    [DATA_OPERACAO] SMALLDATETIME,
    [STATUS_OPERACAO] VARCHAR(10)
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "log.OBRIGACAO"                                              */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [log].[OBRIGACAO] (
    [ID_OBRIGACAO] INTEGER,
    [ID_PESSOA] INTEGER,
    [DATA] SMALLDATETIME,
    [DESCRICAO] VARCHAR(100),
    [USUARIO_OPERACAO] VARCHAR(20),
    [DATA_OPERACAO] SMALLDATETIME,
    [STATUS_OPERACAO] VARCHAR(10)
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "log.PESSOA"                                                 */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [log].[PESSOA] (
    [ID_PESSOA] INTEGER,
    [ID_CLASSIFICACAO] INTEGER,
    [ID_ATIVIDADE] INTEGER,
    [ID_ESTADO_CIVIL] INTEGER,
    [ID_CIDADE] INTEGER,
    [MATRICULA] VARCHAR(10),
    [NOME] VARCHAR(100),
    [DT_NASCIMENTO] SMALLDATETIME,
    [ATIVO] BIT,
    [PAI] VARCHAR(100),
    [MAE] VARCHAR(100),
    [PROFISSAO] VARCHAR(100),
    [CONJUGE] VARCHAR(100),
    [RAZAO_SOCIAL] VARCHAR(100),
    [LOGRADOURO] VARCHAR(40),
    [NUMERO] VARCHAR(10),
    [COMPLEMENTO] VARCHAR(20),
    [BAIRRO] VARCHAR(50),
    [CEP] VARCHAR(8),
    [DATA_ADMISSAO_TERREIRO] SMALLDATETIME,
    [USUARIO_OPERACAO] VARCHAR(20),
    [DATA_OPERACAO] SMALLDATETIME,
    [STATUS_OPERACAO] VARCHAR(10)
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "sis.FORMA_PAGAMENTO"                                        */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [sis].[FORMA_PAGAMENTO] (
    [ID_FORMA_PAGAMENTO] INTEGER IDENTITY(1,1) NOT NULL,
    [DESCRICAO] VARCHAR(40) NOT NULL,
    [ATIVO] BIT CONSTRAINT [DEF_FORMA_PAGAMENTO_ATIVO] DEFAULT 0 NOT NULL,
    [USUARIO_OPERACAO] VARCHAR(20) NOT NULL,
    [DATA_OPERACAO] SMALLDATETIME CONSTRAINT [DEF_FORMA_PAGAMENTO_DATA_OPERACAO] DEFAULT GETDATE() NOT NULL,
    CONSTRAINT [PK_FORMA_PAGAMENTO] PRIMARY KEY ([ID_FORMA_PAGAMENTO]),
    CONSTRAINT [TUC_FORMA_PAGAMENTO_DESCRICAO] UNIQUE ([DESCRICAO])
)
GO


CREATE NONCLUSTERED INDEX [IDX_FORMA_PAGAMENTO_DESCRICAO] ON [sis].[FORMA_PAGAMENTO] ([DESCRICAO])
GO


/* ---------------------------------------------------------------------- */
/* Add table "log.FORMA_PAGAMENTO"                                        */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [log].[FORMA_PAGAMENTO] (
    [ID_FORMA_PAGAMENTO] INTEGER,
    [DESCRICAO] VARCHAR(40),
    [ATIVO] BIT,
    [USUARIO_OPERACAO] VARCHAR(20),
    [DATA_OPERACAO] SMALLDATETIME,
    [STATUS_OPERACAO] VARCHAR(10)
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "sis.PAGAMENTO_DIVERSO"                                      */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [sis].[PAGAMENTO_DIVERSO] (
    [ID_PAGAMENTO_DIVERSO] INTEGER IDENTITY(1,1) NOT NULL,
    [ID_PESSOA] INTEGER,
    [ID_FORMA_PAGAMENTO] INTEGER NOT NULL,
    [DATA_PAGAMENTO] SMALLDATETIME NOT NULL,
    [VALOR] SMALLMONEY NOT NULL,
    [DESCRICAO] VARCHAR(100) NOT NULL,
    [USUARIO_OPERACAO] VARCHAR(20) NOT NULL,
    [DATA_OPERACAO] SMALLDATETIME CONSTRAINT [DEF_PAGAMENTO_DIVERSO_DATA_OPERACAO] DEFAULT GETDATE() NOT NULL,
    CONSTRAINT [PK_PAGAMENTO_DIVERSO] PRIMARY KEY ([ID_PAGAMENTO_DIVERSO])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "log.PAGAMENTO_DIVERSO"                                      */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [log].[PAGAMENTO_DIVERSO] (
    [ID_PAGAMENTO_DIVERSO] INTEGER,
    [ID_PESSOA] INTEGER,
    [ID_FORMA_PAGAMENTO] INTEGER,
    [DATA_PAGAMENTO] SMALLDATETIME,
    [VALOR] SMALLMONEY,
    [DESCRICAO] VARCHAR(100),
    [USUARIO_OPERACAO] VARCHAR(20),
    [DATA_OPERACAO] SMALLDATETIME,
    [STATUS_OPERACAO] VARCHAR(10)
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "cfg.ESTADO"                                                 */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [cfg].[ESTADO] (
    [ID_ESTADO] INTEGER IDENTITY(1,1) NOT NULL,
    [ID_PAIS] INTEGER NOT NULL,
    [NOME] VARCHAR(75) COLLATE Latin1_General_CI_AS NOT NULL,
    [UF] CHAR(2) COLLATE Latin1_General_CI_AS NOT NULL,
    CONSTRAINT [PK_ESTADO] PRIMARY KEY CLUSTERED ([ID_ESTADO])
)
GO


CREATE NONCLUSTERED INDEX [IDX_ESTADO_NOME] ON [cfg].[ESTADO] ([NOME] ASC)
GO


/* ---------------------------------------------------------------------- */
/* Add table "cfg.CIDADE"                                                 */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [cfg].[CIDADE] (
    [ID_CIDADE] INTEGER IDENTITY(1,1) NOT NULL,
    [ID_ESTADO] INTEGER NOT NULL,
    [CODIGO] INTEGER NOT NULL,
    [NOME] VARCHAR(255) COLLATE Latin1_General_CI_AS NOT NULL,
    CONSTRAINT [PK_CIDADE] PRIMARY KEY CLUSTERED ([ID_CIDADE])
)
GO


CREATE NONCLUSTERED INDEX [IDX_CIDADE_NOME] ON [cfg].[CIDADE] ([NOME] ASC)
GO


/* ---------------------------------------------------------------------- */
/* Add table "sis.PESSOA"                                                 */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [sis].[PESSOA] (
    [ID_PESSOA] INTEGER IDENTITY(1,1) NOT NULL,
    [ID_CLASSIFICACAO] INTEGER NOT NULL,
    [ID_ATIVIDADE] INTEGER,
    [ID_ESTADO_CIVIL] INTEGER,
    [ID_CIDADE] INTEGER,
    [MATRICULA] VARCHAR(10) COLLATE Latin1_General_CI_AS,
    [NOME] VARCHAR(100) COLLATE Latin1_General_CI_AS NOT NULL,
    [DT_NASCIMENTO] SMALLDATETIME,
    [ATIVO] BIT CONSTRAINT [DF_PESSOA_ATIVO] DEFAULT 1 NOT NULL,
    [PAI] VARCHAR(100),
    [MAE] VARCHAR(100),
    [PROFISSAO] VARCHAR(100),
    [CONJUGE] VARCHAR(100),
    [RAZAO_SOCIAL] VARCHAR(100),
    [LOGRADOURO] VARCHAR(40),
    [NUMERO] VARCHAR(10),
    [COMPLEMENTO] VARCHAR(20),
    [BAIRRO] VARCHAR(50),
    [CEP] VARCHAR(8),
    [DATA_ADMISSAO_TERREIRO] SMALLDATETIME,
    [USUARIO_OPERACAO] VARCHAR(20) COLLATE Latin1_General_CI_AS NOT NULL,
    [DATA_OPERACAO] SMALLDATETIME CONSTRAINT [DEF_PESSOA_DATA_OPERACAO] DEFAULT getdate() NOT NULL,
    CONSTRAINT [PK_PESSOA] PRIMARY KEY ([ID_PESSOA])
)
GO


CREATE NONCLUSTERED INDEX [IDX_PESSOA_MATRICULA] ON [sis].[PESSOA] ([MATRICULA] ASC)
GO


CREATE NONCLUSTERED INDEX [IDX_PESSOA_NOME] ON [sis].[PESSOA] ([NOME] ASC)
GO


ALTER TABLE [sis].[PESSOA] ADD CONSTRAINT [CC_PESSOA_ATIVO] 
    CHECK ([ATIVO]=(0) OR [ATIVO]=(1))
GO


/* ---------------------------------------------------------------------- */
/* Add table "sis.DOCUMENTO"                                              */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [sis].[DOCUMENTO] (
    [ID_DOCUMENTO] INTEGER IDENTITY(1,1) NOT NULL,
    [ID_PESSOA] INTEGER,
    [ID_TIPO_DOCUMENTO] INTEGER NOT NULL,
    [DESCRICAO] VARCHAR(100) COLLATE Latin1_General_CI_AS NOT NULL,
    [ATIVO] BIT CONSTRAINT [DF_DOCUMENTO_ATIVO] DEFAULT 1 NOT NULL,
    [USUARIO_OPERACAO] VARCHAR(20) COLLATE Latin1_General_CI_AS NOT NULL,
    [DATA_OPERACAO] SMALLDATETIME CONSTRAINT [DEF_DOCUMENTO_DATA_OPERACAO] DEFAULT getdate() NOT NULL,
    CONSTRAINT [PK_DOCUMENTO] PRIMARY KEY ([ID_DOCUMENTO]),
    CONSTRAINT [TUC_DOCUMENTO_DESCRICAO] UNIQUE ([DESCRICAO])
)
GO


CREATE NONCLUSTERED INDEX [IDX_DOCUMENTO_DESCRICAO] ON [sis].[DOCUMENTO] ([DESCRICAO] ASC)
GO


ALTER TABLE [sis].[DOCUMENTO] ADD CONSTRAINT [CC_DOCUMENTO_ATIVO] 
    CHECK ([ATIVO]=(0) OR [ATIVO]=(1))
GO


/* ---------------------------------------------------------------------- */
/* Add table "sis.FINANCEIRO"                                             */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [sis].[FINANCEIRO] (
    [ID_FINANCEIRO] INTEGER IDENTITY(1,1) NOT NULL,
    [ID_PESSOA] INTEGER NOT NULL,
    [ID_FORMA_PAGAMENTO] INTEGER,
    [REFER] CHAR(6) COLLATE Latin1_General_CI_AS NOT NULL,
    [DT_VENCIMENTO] SMALLDATETIME NOT NULL,
    [VL_REFER] SMALLMONEY NOT NULL,
    [VL_DESCONTO] SMALLMONEY,
    [DT_PAGAMENTO] SMALLDATETIME,
    [VL_PAGO] SMALLMONEY,
    [USUARIO_OPERACAO] VARCHAR(20) COLLATE Latin1_General_CI_AS NOT NULL,
    [DATA_OPERACAO] SMALLDATETIME CONSTRAINT [DEF_FINANCEIRO_DATA_OPERACAO] DEFAULT getdate() NOT NULL,
    CONSTRAINT [PK_FINANCEIRO] PRIMARY KEY ([ID_FINANCEIRO])
)
GO


CREATE NONCLUSTERED INDEX [IDX_FINANCEIRO_REFER] ON [sis].[FINANCEIRO] ([REFER] ASC)
GO


/* ---------------------------------------------------------------------- */
/* Add table "sis.FINANCEIRO_ALTERACAO"                                   */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [sis].[FINANCEIRO_ALTERACAO] (
    [ID_FINANCEIRO_ALTERACAO] INTEGER IDENTITY(1,1) NOT NULL,
    [ID_FINANCEIRO] INTEGER NOT NULL,
    [DT_VENCIMENTO] SMALLDATETIME NOT NULL,
    [VL_DESCONTO_ORIGINAL] SMALLMONEY NOT NULL,
    [VL_DESCONTO] SMALLMONEY NOT NULL,
    [VL_JUROS_ORIGINAL] SMALLMONEY NOT NULL,
    [VL_JUROS] SMALLMONEY NOT NULL,
    [OBSERVACAO] VARCHAR(200) COLLATE Latin1_General_CI_AS NOT NULL,
    [USUARIO_OPERACAO] VARCHAR(20) COLLATE Latin1_General_CI_AS NOT NULL,
    [DATA_OPERACAO] SMALLDATETIME CONSTRAINT [DEF_FINANCEIRO_ALTERACAO_DATA_OPERACAO] DEFAULT getdate() NOT NULL,
    CONSTRAINT [PK_FINANCEIRO_ALTERACAO] PRIMARY KEY ([ID_FINANCEIRO_ALTERACAO])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "sis.FINANCEIRO_ESTORNO"                                     */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [sis].[FINANCEIRO_ESTORNO] (
    [ID_FINANCEIRO_ESTORNO] INTEGER IDENTITY(1,1) NOT NULL,
    [ID_FINANCEIRO] INTEGER NOT NULL,
    [OBSERVACAO] VARCHAR(200) COLLATE Latin1_General_CI_AS NOT NULL,
    [USUARIO_OPERACAO] VARCHAR(20) COLLATE Latin1_General_CI_AS NOT NULL,
    [DATA_OPERACAO] SMALLDATETIME CONSTRAINT [DEF_FINANCEIRO_ESTORNO_DATA_OPERACAO] DEFAULT getdate() NOT NULL,
    CONSTRAINT [PK_FINANCEIRO_ESTORNO] PRIMARY KEY ([ID_FINANCEIRO_ESTORNO])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "sis.PESSOA_FILANTROPIA"                                     */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [sis].[PESSOA_FILANTROPIA] (
    [ID_PESSOA_FILANTROPIA] INTEGER IDENTITY(1,1) NOT NULL,
    [ID_PESSOA] INTEGER NOT NULL,
    [ID_FILANTROPIA] INTEGER NOT NULL,
    [REFER_INICIO] CHAR(6) COLLATE Latin1_General_CI_AS NOT NULL,
    [REFER_FIM] CHAR(6) COLLATE Latin1_General_CI_AS NOT NULL,
    [USUARIO_OPERACAO] VARCHAR(20) COLLATE Latin1_General_CI_AS NOT NULL,
    [DATA_OPERACAO] SMALLDATETIME CONSTRAINT [DEF_PESSOA_FILANTROPIA_DATA_OPERACAO] DEFAULT getdate() NOT NULL,
    CONSTRAINT [PK_PESSOA_FILANTROPIA] PRIMARY KEY ([ID_PESSOA_FILANTROPIA])
)
GO


CREATE NONCLUSTERED INDEX [IDX_PESSOA_FILANTROPIA_REFER_FIM] ON [sis].[PESSOA_FILANTROPIA] ([REFER_FIM] ASC)
GO


CREATE NONCLUSTERED INDEX [IDX_PESSOA_FILANTROPIA_REFER_INICIO] ON [sis].[PESSOA_FILANTROPIA] ([REFER_INICIO] ASC)
GO


/* ---------------------------------------------------------------------- */
/* Add table "sis.PESSOA_PLANO"                                           */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [sis].[PESSOA_PLANO] (
    [ID_PESSOA_PLANO] INTEGER IDENTITY(1,1) NOT NULL,
    [ID_PESSOA] INTEGER NOT NULL,
    [ID_PLANO] INTEGER NOT NULL,
    [REFER_INICIO] CHAR(6) COLLATE Latin1_General_CI_AS NOT NULL,
    [REFER_FIM] CHAR(6) COLLATE Latin1_General_CI_AS NOT NULL,
    [USUARIO_OPERACAO] VARCHAR(20) COLLATE Latin1_General_CI_AS NOT NULL,
    [DATA_OPERACAO] SMALLDATETIME CONSTRAINT [DEF_PESSOA_PLANO_DATA_OPERACAO] DEFAULT getdate() NOT NULL,
    CONSTRAINT [PK_PESSOA_PLANO] PRIMARY KEY ([ID_PESSOA_PLANO])
)
GO


CREATE NONCLUSTERED INDEX [IDX_PESSOA_PLANO_REFER_FIM] ON [sis].[PESSOA_PLANO] ([REFER_FIM] ASC)
GO


CREATE NONCLUSTERED INDEX [IDX_PESSOA_PLANO_REFER_INICIO] ON [sis].[PESSOA_PLANO] ([REFER_INICIO] ASC)
GO


/* ---------------------------------------------------------------------- */
/* Add table "sis.SANTO"                                                  */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [sis].[SANTO] (
    [ID_SANTO] INTEGER IDENTITY(1,1) NOT NULL,
    [ID_PESSOA] INTEGER NOT NULL,
    [DESCRICAO] VARCHAR(100) NOT NULL,
    [USUARIO_OPERACAO] VARCHAR(20) NOT NULL,
    [DATA_OPERACAO] SMALLDATETIME CONSTRAINT [DEF_SANTO_DATA_OPERACAO] DEFAULT GETDATE() NOT NULL,
    CONSTRAINT [PK_SANTO] PRIMARY KEY ([ID_SANTO]),
    CONSTRAINT [TUC_SANTO_DESCRICAO] UNIQUE ([DESCRICAO])
)
GO


CREATE NONCLUSTERED INDEX [IDX_SANTO_DESCRICAO] ON [sis].[SANTO] ([DESCRICAO] ASC)
GO


/* ---------------------------------------------------------------------- */
/* Add table "sis.OBRIGACAO"                                              */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [sis].[OBRIGACAO] (
    [ID_OBRIGACAO] INTEGER IDENTITY(1,1) NOT NULL,
    [ID_PESSOA] INTEGER,
    [DATA] SMALLDATETIME NOT NULL,
    [DESCRICAO] VARCHAR(100) NOT NULL,
    [USUARIO_OPERACAO] VARCHAR(20) NOT NULL,
    [DATA_OPERACAO] SMALLDATETIME CONSTRAINT [DEF_OBRIGACAO_DATA_OPERACAO] DEFAULT getdate() NOT NULL,
    CONSTRAINT [PK_OBRIGACAO] PRIMARY KEY ([ID_OBRIGACAO]),
    CONSTRAINT [TUC_OBRIGACAO_DESCRICAO] UNIQUE ([DESCRICAO])
)
GO


CREATE NONCLUSTERED INDEX [IDX_OBRIGACAO_DESCRICAO] ON [sis].[OBRIGACAO] ([DESCRICAO] ASC)
GO


/* ---------------------------------------------------------------------- */
/* Add table "sis.ENDERECO"                                               */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [sis].[ENDERECO] (
    [ID_ENDERECO] INTEGER IDENTITY(1,1) NOT NULL,
    [ID_PESSOA] INTEGER,
    [ID_TIPO_ENDERECO] INTEGER,
    [ID_CIDADE] INTEGER,
    [LOGRADOURO] VARCHAR(100) COLLATE Latin1_General_CI_AS,
    [NUMERO] VARCHAR(10) COLLATE Latin1_General_CI_AS,
    [COMPLEMENTO] VARCHAR(20) COLLATE Latin1_General_CI_AS,
    [BAIRRO] VARCHAR(50) COLLATE Latin1_General_CI_AS,
    [CEP] VARCHAR(8) COLLATE Latin1_General_CI_AS,
    [ATIVO] BIT CONSTRAINT [DF_ENDERECO_ATIVO] DEFAULT 1 NOT NULL,
    [USUARIO_OPERACAO] VARCHAR(20) COLLATE Latin1_General_CI_AS NOT NULL,
    [DATA_OPERACAO] SMALLDATETIME CONSTRAINT [DEF_ENDERECO_DATA_OPERACAO] DEFAULT getdate() NOT NULL,
    CONSTRAINT [PK_ENDERECO] PRIMARY KEY ([ID_ENDERECO])
)
GO


CREATE NONCLUSTERED INDEX [IDX_ENDERECO_LOGRADOURO] ON [sis].[ENDERECO] ([LOGRADOURO] ASC)
GO


ALTER TABLE [sis].[ENDERECO] ADD CONSTRAINT [CC_ENDERECO_ATIVO] 
    CHECK ([ATIVO]=(0) OR [ATIVO]=(1))
GO


/* ---------------------------------------------------------------------- */
/* Add table "sis.CONTATO"                                                */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [sis].[CONTATO] (
    [ID_CONTATO] INTEGER IDENTITY(1,1) NOT NULL,
    [ID_PESSOA] INTEGER,
    [ID_TIPO_CONTATO] INTEGER,
    [DESCRICAO] VARCHAR(100) COLLATE Latin1_General_CI_AS NOT NULL,
    [ATIVO] BIT CONSTRAINT [DF_CONTATO_ATIVO] DEFAULT 1 NOT NULL,
    [USUARIO_OPERACAO] VARCHAR(20) COLLATE Latin1_General_CI_AS NOT NULL,
    [DATA_OPERACAO] SMALLDATETIME CONSTRAINT [DEF_CONTATO_DATA_OPERACAO] DEFAULT getdate() NOT NULL,
    CONSTRAINT [PK_CONTATO] PRIMARY KEY ([ID_CONTATO]),
    CONSTRAINT [TUC_CONTATO_DESCRICAO] UNIQUE ([DESCRICAO])
)
GO


CREATE NONCLUSTERED INDEX [IDX_CONTATO_DESCRICAO] ON [sis].[CONTATO] ([DESCRICAO] ASC)
GO


ALTER TABLE [sis].[CONTATO] ADD CONSTRAINT [CC_CONTATO_ATIVO] 
    CHECK ([ATIVO]=(0) OR [ATIVO]=(1))
GO


/* ---------------------------------------------------------------------- */
/* Add foreign key constraints                                            */
/* ---------------------------------------------------------------------- */

GO


ALTER TABLE [cfg].[MODULO] ADD CONSTRAINT [FK_MODULO_MODULO] 
    FOREIGN KEY ([ID_MODULO_PAI]) REFERENCES [cfg].[MODULO] ([ID_MODULO])
GO


ALTER TABLE [cfg].[USUARIO_MODULO] ADD CONSTRAINT [FK_USUARIO_USUARIO_MODULO] 
    FOREIGN KEY ([ID_USUARIO]) REFERENCES [cfg].[USUARIO] ([ID_USUARIO])
GO


ALTER TABLE [cfg].[USUARIO_MODULO] ADD CONSTRAINT [FK_MODULO_USUARIO_MODULO] 
    FOREIGN KEY ([ID_MODULO]) REFERENCES [cfg].[MODULO] ([ID_MODULO])
GO


ALTER TABLE [cfg].[CIDADE] ADD CONSTRAINT [FK_ESTADO_CIDADE] 
    FOREIGN KEY ([ID_ESTADO]) REFERENCES [cfg].[ESTADO] ([ID_ESTADO])
GO


ALTER TABLE [cfg].[ESTADO] ADD CONSTRAINT [FK_PAIS_ESTADO] 
    FOREIGN KEY ([ID_PAIS]) REFERENCES [cfg].[PAIS] ([ID_PAIS])
GO


ALTER TABLE [sis].[ENDERECO] ADD CONSTRAINT [FK_CIDADE_ENDERECO] 
    FOREIGN KEY ([ID_CIDADE]) REFERENCES [cfg].[CIDADE] ([ID_CIDADE])
GO


ALTER TABLE [sis].[ENDERECO] ADD CONSTRAINT [FK_PESSOA_ENDERECO] 
    FOREIGN KEY ([ID_PESSOA]) REFERENCES [sis].[PESSOA] ([ID_PESSOA])
GO


ALTER TABLE [sis].[ENDERECO] ADD CONSTRAINT [FK_TIPO_ENDERECO_ENDERECO] 
    FOREIGN KEY ([ID_TIPO_ENDERECO]) REFERENCES [sis].[TIPO_ENDERECO] ([ID_TIPO_ENDERECO])
GO


ALTER TABLE [sis].[CONTATO] ADD CONSTRAINT [FK_PESSOA_CONTATO] 
    FOREIGN KEY ([ID_PESSOA]) REFERENCES [sis].[PESSOA] ([ID_PESSOA])
GO


ALTER TABLE [sis].[CONTATO] ADD CONSTRAINT [FK_TIPO_CONTATO_CONTATO] 
    FOREIGN KEY ([ID_TIPO_CONTATO]) REFERENCES [sis].[TIPO_CONTATO] ([ID_TIPO_CONTATO])
GO


ALTER TABLE [sis].[PESSOA] ADD CONSTRAINT [FK_ATIVIDADE_PESSOA] 
    FOREIGN KEY ([ID_ATIVIDADE]) REFERENCES [sis].[ATIVIDADE] ([ID_ATIVIDADE])
GO


ALTER TABLE [sis].[PESSOA] ADD CONSTRAINT [FK_CLASSIFICACAO_PESSOA] 
    FOREIGN KEY ([ID_CLASSIFICACAO]) REFERENCES [sis].[CLASSIFICACAO] ([ID_CLASSIFICACAO])
GO


ALTER TABLE [sis].[PESSOA] ADD CONSTRAINT [ESTADO_CIVIL_PESSOA] 
    FOREIGN KEY ([ID_ESTADO_CIVIL]) REFERENCES [cfg].[ESTADO_CIVIL] ([ID_ESTADO_CIVIL])
GO


ALTER TABLE [sis].[PESSOA] ADD CONSTRAINT [CIDADE_PESSOA] 
    FOREIGN KEY ([ID_CIDADE]) REFERENCES [cfg].[CIDADE] ([ID_CIDADE])
GO


ALTER TABLE [sis].[DOCUMENTO] ADD CONSTRAINT [FK_PESSOA_DOCUMENTO] 
    FOREIGN KEY ([ID_PESSOA]) REFERENCES [sis].[PESSOA] ([ID_PESSOA])
GO


ALTER TABLE [sis].[DOCUMENTO] ADD CONSTRAINT [FK_TIPO_DOCUMENTO_DOCUMENTO] 
    FOREIGN KEY ([ID_TIPO_DOCUMENTO]) REFERENCES [sis].[TIPO_DOCUMENTO] ([ID_TIPO_DOCUMENTO])
GO


ALTER TABLE [sis].[FINANCEIRO] ADD CONSTRAINT [FK_PESSOA_FINANCEIRO] 
    FOREIGN KEY ([ID_PESSOA]) REFERENCES [sis].[PESSOA] ([ID_PESSOA])
GO


ALTER TABLE [sis].[FINANCEIRO] ADD CONSTRAINT [FORMA_PAGAMENTO_FINANCEIRO] 
    FOREIGN KEY ([ID_FORMA_PAGAMENTO]) REFERENCES [sis].[FORMA_PAGAMENTO] ([ID_FORMA_PAGAMENTO])
GO


ALTER TABLE [sis].[FINANCEIRO_ALTERACAO] ADD CONSTRAINT [FK_FINANCEIRO_FINANCEIRO_ALTERACAO] 
    FOREIGN KEY ([ID_FINANCEIRO]) REFERENCES [sis].[FINANCEIRO] ([ID_FINANCEIRO])
GO


ALTER TABLE [sis].[FINANCEIRO_ESTORNO] ADD CONSTRAINT [FK_FINANCEIRO_FINANCEIRO_ESTORNO] 
    FOREIGN KEY ([ID_FINANCEIRO]) REFERENCES [sis].[FINANCEIRO] ([ID_FINANCEIRO])
GO


ALTER TABLE [sis].[PESSOA_FILANTROPIA] ADD CONSTRAINT [FK_FILANTROPIA_PESSOA_FILANTROPIA] 
    FOREIGN KEY ([ID_FILANTROPIA]) REFERENCES [sis].[FILANTROPIA] ([ID_FILANTROPIA])
GO


ALTER TABLE [sis].[PESSOA_FILANTROPIA] ADD CONSTRAINT [FK_PESSOA_PESSOA_FILANTROPIA] 
    FOREIGN KEY ([ID_PESSOA]) REFERENCES [sis].[PESSOA] ([ID_PESSOA])
GO


ALTER TABLE [sis].[PESSOA_PLANO] ADD CONSTRAINT [FK_PESSOA_PESSOA_PLANO] 
    FOREIGN KEY ([ID_PESSOA]) REFERENCES [sis].[PESSOA] ([ID_PESSOA])
GO


ALTER TABLE [sis].[PESSOA_PLANO] ADD CONSTRAINT [FK_PLANO_PESSOA_PLANO] 
    FOREIGN KEY ([ID_PLANO]) REFERENCES [sis].[PLANO] ([ID_PLANO])
GO


ALTER TABLE [sis].[SANTO] ADD CONSTRAINT [PESSOA_SANTO] 
    FOREIGN KEY ([ID_PESSOA]) REFERENCES [sis].[PESSOA] ([ID_PESSOA])
GO


ALTER TABLE [sis].[OBRIGACAO] ADD CONSTRAINT [PESSOA_OBRIGACAO] 
    FOREIGN KEY ([ID_PESSOA]) REFERENCES [sis].[PESSOA] ([ID_PESSOA])
GO


ALTER TABLE [sis].[PAGAMENTO_DIVERSO] ADD CONSTRAINT [FORMA_PAGAMENTO_PAGAMENTO_DIVERSO] 
    FOREIGN KEY ([ID_FORMA_PAGAMENTO]) REFERENCES [sis].[FORMA_PAGAMENTO] ([ID_FORMA_PAGAMENTO])
GO


/* ---------------------------------------------------------------------- */
/* Add views                                                              */
/* ---------------------------------------------------------------------- */

GO


CREATE   VIEW [cfg].[V_PERMISSAO]
AS
	SELECT
		U.ID_USUARIO,
		U.LOGIN,
		U.NOME,
		M.ID_MODULO,
		M.ID_MODULO_PAI,
		M.DESCRICAO,
		M.COMPONENTE,
		UM.PERMISSAO
	FROM [cfg].[USUARIO] U
	INNER JOIN [cfg].[USUARIO_MODULO] UM
		ON ( U.ID_USUARIO = UM.ID_USUARIO )
	INNER JOIN [cfg].[MODULO] M
		ON ( UM.ID_MODULO = M.ID_MODULO )
	WHERE U.ATIVO = 1
GO


CREATE   VIEW [cfg].[V_USUARIO_MODULO]
AS
SELECT
   su.ID_USUARIO,
   su.NOME,
   su.LOGIN,
   sm.ID_MODULO,
   sm.ID_MODULO_PAI,
   sm.DESCRICAO,
   sm.COMPONENTE,
   sum.PERMISSAO,
   sum.BLOQUEADO
FROM [cfg].[USUARIO] su
INNER JOIN [cfg].[USUARIO_MODULO] sum
   ON ( su.ID_USUARIO = sum.ID_USUARIO )
INNER JOIN [cfg].[MODULO] sm
   ON ( sum.ID_MODULO = sm.ID_MODULO )
WHERE su.ATIVO = 1
AND sm.ATIVO = 1
GO


CREATE   VIEW [sis].[V_NOVA_MATRICULA]
AS
SELECT
	REPLICATE('0', 6 - LEN( COALESCE( MAX(MATRICULA), 0 ) + 1 ))
	+
	CAST((COALESCE(MAX(MATRICULA), 0) + 1) AS VARCHAR(6)) AS MATRICULA
FROM [sis].[PESSOA]
GO


CREATE   VIEW [sis].[V_PESSOA_PLANO]
AS
SELECT
	A.ID_PESSOA_PLANO,
	A.ID_PESSOA,
	A.ID_PLANO,
	C.NOME,
	B.DESCRICAO,
	B.VALOR,
	A.REFER_INICIO,
	A.REFER_FIM

FROM [sis].[PESSOA_PLANO] A

INNER JOIN [sis].[PLANO] B
	ON ( A.ID_PLANO = B.ID_PLANO )

INNER JOIN [sis].[PESSOA] C
	ON ( A.ID_PESSOA = C.ID_PESSOA )
GO


CREATE   VIEW [sis].[V_PESSOA_FILANTROPIA]
AS
SELECT
	A.ID_PESSOA_FILANTROPIA,
	A.ID_PESSOA,
	A.ID_FILANTROPIA,
	C.NOME,
	B.DESCRICAO,
	B.VALOR,
	B.PERCENTUAL,
	A.REFER_INICIO,
	A.REFER_FIM

FROM [sis].[PESSOA_FILANTROPIA] A

INNER JOIN [sis].[FILANTROPIA] B
	ON ( A.ID_FILANTROPIA = B.ID_FILANTROPIA )

INNER JOIN [sis].[PESSOA] C
	ON ( A.ID_PESSOA = C.ID_PESSOA )
GO


CREATE   VIEW [sis].[V_PESSOA_PLANO_FILANTROPIA]
AS
SELECT
	A.ID_PESSOA,
	A.MATRICULA,
	A.NOME,
	B.ID_PESSOA_PLANO,
	B.ID_PLANO,
	C.DESCRICAO		AS PLANO_DESCRICAO,
	C.VALOR			AS PLANO_VALOR,
	SUBSTRING(B.REFER_INICIO, 1, 2) AS PLANO_REFER_INICIO_MES,
	SUBSTRING(B.REFER_INICIO, 3, 4) AS PLANO_REFER_INICIO_ANO,
	SUBSTRING(B.REFER_INICIO, 3, 4) + '-' + SUBSTRING(B.REFER_INICIO, 1, 2) + '-01' AS PLANO_REFER_INICIO_DATA,
	B.REFER_INICIO	AS PLANO_REFER_INICIO,
	B.REFER_FIM		AS PLANO_REFER_FIM,
	D.ID_PESSOA_FILANTROPIA,
	D.ID_FILANTROPIA,
	E.DESCRICAO		AS FILANTROPIA_DESCRICAO,
	E.PERCENTUAL	AS FILANTROPIA_PERCENTUAL,
	E.VALOR			AS FILANTROPIA_VALOR,
	SUBSTRING(D.REFER_INICIO, 1, 2) AS FILANTROPIA_REFER_INICIO_MES,
	SUBSTRING(D.REFER_INICIO, 3, 4) AS FILANTROPIA_REFER_INICIO_ANO,
	SUBSTRING(D.REFER_INICIO, 3, 4) + '-' + SUBSTRING(D.REFER_INICIO, 1, 2) + '-01' AS FILANTROPIA_REFER_INICIO_DATA,
	D.REFER_INICIO	AS FILANTROPIA_REFER_INICIO,
	D.REFER_FIM		AS FILANTROPIA_REFER_FIM
FROM [sis].[PESSOA] A
LEFT JOIN [sis].[PESSOA_PLANO] B
	ON ( A.ID_PESSOA = B.ID_PESSOA )
LEFT JOIN [sis].[PLANO] C
	ON ( B.ID_PLANO = C.ID_PLANO )
LEFT JOIN [sis].[PESSOA_FILANTROPIA] D
	ON ( A.ID_PESSOA = D.ID_PESSOA )
LEFT JOIN [sis].[FILANTROPIA] E
	ON ( D.ID_FILANTROPIA = E.ID_FILANTROPIA )
WHERE ( B.ID_PESSOA_PLANO IS NOT NULL OR D.ID_PESSOA_FILANTROPIA IS NOT NULL )
GO


CREATE     VIEW [sis].[V_DADOS_PESSOA]
AS
SELECT
	P.ID_PESSOA,
	P.ID_CLASSIFICACAO,
	C.DESCRICAO AS CLASSIFICACAO,
	P.ID_ATIVIDADE,
	A.DESCRICAO AS ATIVIDADE,
	P.ID_ESTADO_CIVIL,
	EC.DESCRICAO AS ESTADO_CIVIL,
	P.MATRICULA,
	P.NOME,
	P.DT_NASCIMENTO,
	P.PAI,
	P.MAE,
	P.PROFISSAO,
	P.CONJUGE,
	P.RAZAO_SOCIAL,
	P.LOGRADOURO AS [EMPRESA_LOGRADOURO],
	P.NUMERO AS [EMPRESA_NUMERO],
	P.COMPLEMENTO AS [EMPRESA_COMPLEMENTO],
	P.BAIRRO AS [EMPRESA_BAIRRO],
	P.ID_CIDADE,
	CID.NOME AS [EMPRESA_CIDADE],
	EST.ID_ESTADO,
	EST.NOME AS [EMPRESA_ESTADO],
	PAI.ID_PAIS,
	PAI.NOME_PT AS [EMPRESA_PAIS],
	P.CEP AS [EMPRESA_CEP],
	P.DATA_ADMISSAO_TERREIRO,
	P.ATIVO,
	( SELECT CASE WHEN COUNT(*) > 0 THEN 'Inadimplente' WHEN COUNT(*) = 0 THEN 'Adimplente' END AS STATUS FROM [sis].[FINANCEIRO] WHERE DT_PAGAMENTO IS NULL AND DT_VENCIMENTO < GETDATE() AND ID_PESSOA = P.ID_PESSOA ) AS STATUS
FROM [sis].[PESSOA] P

LEFT JOIN [sis].[CLASSIFICACAO] C
	ON ( P.ID_CLASSIFICACAO = C.ID_CLASSIFICACAO )

LEFT JOIN [sis].[ATIVIDADE] A
	ON ( P.ID_ATIVIDADE = A.ID_ATIVIDADE )

LEFT JOIN [cfg].[ESTADO_CIVIL] EC
	ON ( P.ID_ESTADO_CIVIL = EC.ID_ESTADO_CIVIL )

LEFT JOIN [cfg].[CIDADE] CID
	ON ( P.ID_CIDADE = CID.ID_CIDADE )

LEFT JOIN [cfg].[ESTADO] EST
	ON ( CID.ID_ESTADO = EST.ID_ESTADO )

LEFT JOIN [cfg].[PAIS] PAI
	ON ( EST.ID_PAIS = PAI.ID_PAIS )
GO
GO


CREATE   VIEW [sis].[V_DADOS_PESSOA_CONTATO]
AS
SELECT
	[sis].[CONTATO].[ID_PESSOA],
	[sis].[CONTATO].[ID_CONTATO],
	LTRIM(RTRIM([sis].[CONTATO].[DESCRICAO])) AS DESCRICAO_CONTATO,
	[sis].[CONTATO].[ID_TIPO_CONTATO],
	LTRIM(RTRIM([sis].[TIPO_CONTATO].[DESCRICAO])) AS DESCRICAO_TIPO_CONTATO

FROM [sis].[CONTATO]

INNER JOIN [sis].[TIPO_CONTATO]
	ON ( [sis].[CONTATO].[ID_TIPO_CONTATO] = [sis].[TIPO_CONTATO].[ID_TIPO_CONTATO] )
GO


CREATE   VIEW [sis].[V_DADOS_PESSOA_DOCUMENTO]
AS
SELECT
	[sis].[DOCUMENTO].[ID_PESSOA],
	[sis].[DOCUMENTO].[ID_DOCUMENTO],
	LTRIM(RTRIM([sis].[DOCUMENTO].[DESCRICAO])) AS DESCRICAO_DOCUMENTO,
	[sis].[DOCUMENTO].[ID_TIPO_DOCUMENTO],
	LTRIM(RTRIM([sis].[TIPO_DOCUMENTO].[DESCRICAO])) AS DESCRICAO_TIPO_DOCUMENTO

FROM [sis].[DOCUMENTO]

INNER JOIN [sis].[TIPO_DOCUMENTO]
	ON ( [sis].[DOCUMENTO].[ID_TIPO_DOCUMENTO] = [sis].[TIPO_DOCUMENTO].[ID_TIPO_DOCUMENTO] )
GO


CREATE   VIEW [sis].[V_DADOS_PESSOA_ENDERECO]
AS
SELECT
	[sis].[ENDERECO].[ID_PESSOA],
	[sis].[ENDERECO].[ID_ENDERECO],
	LTRIM(RTRIM([sis].[ENDERECO].[LOGRADOURO])) AS LOGRADOURO,
	[sis].[ENDERECO].[NUMERO],
	LTRIM(RTRIM([sis].[ENDERECO].[COMPLEMENTO])) AS COMPLEMENTO,
	[sis].[ENDERECO].[BAIRRO],
	[cfg].[ESTADO].[ID_PAIS],
	LTRIM(RTRIM([cfg].[PAIS].[NOME])) AS NOME_INTERNACIONAL ,
	LTRIM(RTRIM([cfg].[PAIS].[NOME_PT])) AS NOME_PORTUGUES,
	[cfg].[CIDADE].[ID_ESTADO],
	[cfg].[ESTADO].[UF],
	LTRIM(RTRIM([cfg].[ESTADO].[NOME])) AS ESTADO,
	[sis].[ENDERECO].[ID_CIDADE],
	LTRIM(RTRIM([cfg].[CIDADE].[NOME])) AS CIDADE,
	[sis].[ENDERECO].[CEP],
	[sis].[ENDERECO].[ID_TIPO_ENDERECO],
	LTRIM(RTRIM([sis].[TIPO_ENDERECO].[DESCRICAO])) AS DESCRICAO_TIPO_ENDERECO


FROM [sis].[ENDERECO]

INNER JOIN [sis].[TIPO_ENDERECO]
	ON ( [sis].[ENDERECO].[ID_TIPO_ENDERECO] = [sis].[TIPO_ENDERECO].[ID_TIPO_ENDERECO] )

LEFT JOIN [cfg].[CIDADE]
	ON ( [sis].[ENDERECO].[ID_CIDADE] = [cfg].[CIDADE].[ID_CIDADE] )

LEFT JOIN [cfg].[ESTADO]
	ON ( [cfg].[CIDADE].[ID_ESTADO] = [cfg].[ESTADO].[ID_ESTADO] )

LEFT JOIN [cfg].[PAIS]
	ON ( [cfg].[ESTADO].[ID_PAIS] = [cfg].[PAIS].[ID_PAIS] )
GO


CREATE   VIEW [sis].[V_DADOS_PESSOA_FINANCEIRO]
AS
	SELECT
		VP.ID_PESSOA,
		VP.CLASSIFICACAO,
		VP.ATIVIDADE,
		VP.MATRICULA,
		VP.NOME,

		F.ID_FINANCEIRO,
		F.REFER,
		F.DT_VENCIMENTO,
		F.VL_REFER,
		F.VL_DESCONTO,
		F.DT_PAGAMENTO,
		F.VL_PAGO

	FROM [sis].[V_DADOS_PESSOA] VP

	INNER JOIN [sis].[FINANCEIRO] F
		ON ( VP.ID_PESSOA = F.ID_PESSOA )
GO


CREATE   VIEW [sis].[V_DADOS_FINANCEIRO]
AS
WITH DADOS_FINANCEIRO ( ID_FINANCEIRO, ID_FORMA_PAGAMENTO, FORMA_PAGAMENTO, ID_PESSOA, REFER, DT_VENCIMENTO, VL_REFER, DIAS_VENCIDOS, FIN_JUROS_DIA, VL_DESCONTO, DT_PAGAMENTO, VL_PAGO )
AS (
		SELECT
			ID_FINANCEIRO,
			F.ID_FORMA_PAGAMENTO,
			FP.DESCRICAO AS FORMA_PAGAMENTO,
			ID_PESSOA,
			REFER,
			DT_VENCIMENTO,
			VL_REFER,

			CASE
				WHEN DATEDIFF(DAY, DT_VENCIMENTO, GETDATE()) > 0 THEN DATEDIFF(DAY, DT_VENCIMENTO, GETDATE())
			ELSE 0 END AS DIAS_VENCIDOS,

			CASE
				WHEN ( SELECT FIN_JUROS_DIA FROM [CFG].[CONFIGURACAO] WHERE FIN_ANO_CONTABIL = SUBSTRING(F.REFER, 3, 4) ) > 0 THEN ( SELECT FIN_JUROS_DIA FROM [CFG].[CONFIGURACAO] WHERE FIN_ANO_CONTABIL = SUBSTRING(F.REFER, 3, 4) )
			ELSE 0 END FIN_JUROS_DIA,

			CASE
				WHEN DATEDIFF(DAY, DT_VENCIMENTO, GETDATE()) <= 0 THEN VL_DESCONTO
			ELSE 0 END AS VL_DESCONTO,

			DT_PAGAMENTO,

			VL_PAGO

		FROM [sis].[FINANCEIRO] F

		LEFT JOIN [sis].[FORMA_PAGAMENTO] FP
			ON ( F.ID_FORMA_PAGAMENTO = FP.ID_FORMA_PAGAMENTO )
)
SELECT

	ID_FINANCEIRO,

	ID_FORMA_PAGAMENTO,

	FORMA_PAGAMENTO,

	ID_PESSOA,

	REFER,

	DT_VENCIMENTO,

	VL_REFER,

	CASE
		WHEN VL_PAGO IS NULL THEN VL_DESCONTO
		WHEN ( VL_REFER - VL_PAGO ) > 0 THEN ( VL_REFER - VL_PAGO )
	ELSE 0
	END AS VL_DESCONTO,

	CASE
		WHEN VL_PAGO IS NULL THEN ( COALESCE( DIAS_VENCIDOS, 0 ) * COALESCE( FIN_JUROS_DIA, 0 ) )
		WHEN ( VL_PAGO - VL_REFER ) > 0 THEN ( VL_PAGO - VL_REFER )
	ELSE 0
	END AS VL_JUROS,

	VL_REFER
	-
	CASE
		WHEN VL_PAGO IS NULL THEN VL_DESCONTO
		WHEN ( VL_REFER - VL_PAGO ) > 0 THEN ( VL_REFER - VL_PAGO )
	ELSE 0
	END
	+
	CASE
		WHEN VL_PAGO IS NULL THEN ( COALESCE( DIAS_VENCIDOS, 0 ) * COALESCE( FIN_JUROS_DIA, 0 ) )
		WHEN ( VL_PAGO - VL_REFER ) > 0 THEN ( VL_PAGO - VL_REFER )
	ELSE 0
	END AS VL_PAGAR,

	DT_PAGAMENTO,

	VL_PAGO

FROM DADOS_FINANCEIRO
GO


CREATE VIEW [cfg].[V_MODULO]
AS
SELECT 
	FILHO.ID_MODULO,
	FILHO.ID_MODULO_PAI,
	CASE 
		WHEN PAI.DESCRICAO IS NULL THEN '[Módulo Pai]'
	ELSE PAI.DESCRICAO 
	END AS DESCRICAO_PAI,
	PAI.COMPONENTE AS COMPONENTE_PAI,
	FILHO.DESCRICAO,
	FILHO.COMPONENTE,
	FILHO.ATIVO

FROM [cfg].[MODULO] FILHO

LEFT JOIN [cfg].[MODULO] PAI
	ON ( FILHO.ID_MODULO_PAI = PAI.ID_MODULO )
GO


CREATE VIEW [sis].[V_DADOS_PESSOA_SANTO]
AS
SELECT 
	P.ID_PESSOA,
	S.ID_SANTO,
	S.DESCRICAO,
	S.USUARIO_OPERACAO,
	S.DATA_OPERACAO
FROM [sis].[PESSOA] P
LEFT JOIN [sis].[SANTO] S
	ON ( P.ID_PESSOA = S.ID_PESSOA )
GO


CREATE VIEW [sis].[V_DADOS_PESSOA_OBRIGACAO]
AS
SELECT 
	P.ID_PESSOA,
	O.ID_OBRIGACAO,
	O.DATA,
	O.DESCRICAO,
	O.USUARIO_OPERACAO,
	O.DATA_OPERACAO
FROM [sis].[PESSOA] P

LEFT JOIN [sis].[OBRIGACAO] O
	ON ( P.ID_PESSOA = O.ID_PESSOA )
GO


CREATE VIEW [sis].[V_DADOS_PAGAMENTO_DIVERSO]
AS
SELECT 
	PD.ID_PESSOA,
	P.MATRICULA,
	P.NOME,
	PD.ID_PAGAMENTO_DIVERSO,
	PD.ID_FORMA_PAGAMENTO,
	FP.DESCRICAO AS FORMA_PAGAMENTO,
	PD.DATA_PAGAMENTO,
	PD.VALOR,
	PD.DESCRICAO,
	PD.USUARIO_OPERACAO,
	PD.DATA_OPERACAO
FROM [sis].[PAGAMENTO_DIVERSO] PD

LEFT JOIN [sis].[FORMA_PAGAMENTO] FP
	ON ( PD.ID_FORMA_PAGAMENTO = FP.ID_FORMA_PAGAMENTO )

LEFT JOIN [sis].[PESSOA] P
	ON ( PD.ID_PESSOA = P.ID_PESSOA )
GO


CREATE VIEW [old].[V_DADOS_MENSALIDADE_ANTIGOS]
AS
SELECT 
	C.IDCONTATO			AS [CONTATO_IDCONTATO],
	C.MATRICULA			AS [CONTATO_MATRICULA],
	REPLICATE('0', 6 - LEN( C.MATRICULA ) ) + CAST( C.MATRICULA AS VARCHAR(6) ) AS [CONTATO_MATRICULA_MASCARA],
	C.NOMECOMPLETO		AS [CONTATO_NOMECOMPLETO],
	C.DT_NASCIMENTO		AS [CONTATO_DT_NASCIMENTO],
	C.IDENTIDADE		AS [CONTATO_IDENTIDADE],
	C.ORGAOEXPEDIDOR	AS [CONTATO_ORGAOEXPEDITOR],
	C.CPF				AS [CONTATO_CPF],
	C.TITULOELEITORAL	AS [CONTATO_TITULOELEITORAL],
	C.CELULAR			AS [CONTATO_CELULAR],
	C.TELEFONE			AS [CONTATO_TELEFONE],
	C.EMAIL				AS [CONTATO_EMAIL],
	C.SITUACAO			AS [CONTATO_SITUACAO],

	M.IDMENSALIDADE		AS [MENSALIDADE_IDMENSALIDADE],
	M.IDCONTATO			AS [MENSALIDADE_IDCONTATO],
	M.MESREF			AS [MENSALIDADE_MESREF],
	( REPLICATE('0', 2 - LEN( M.MESREF ) ) + CAST( M.MESREF AS VARCHAR(2) ) + CAST( M.ANO AS VARCHAR(4) ) ) AS [MENSALIDADE_REFER_MASCARA],
	M.MES				AS [MENSALIDADE_MES],
	M.ANO				AS [MENSALIDADE_ANO],
	M.DATACADASTRO		AS [MENSALIDADE_DATACADASTRO],
	M.PAGO				AS [MENSALIDADE_PAGO],

	P.IDPGTO			AS [PAGAMENTO_IDPGTO],
	P.IDCONTATO			AS [PAGAMENTO_IDCONTATO],
	P.IDMENSALIDADE		AS [PAGAMENTO_IDMENSALIDADE],
	P.IDORIGEM			AS [PAGAMENTO_IDORIGEM],
	P.DATAPAGAMENTO		AS [PAGAMENTO_DATAPAGAMENTO],
	P.VALOR				AS [PAGAMENTO_VALOR],
	P.FORMAPAGAMENTO	AS [PAGAMENTO_FORMAPAGAMENTO],
	P.OBSERVACAO		AS [PAGAMENTO_OBSERVACAO],

	OP.IDORIGEM			AS [ORIGEM_IDORIGEM],
	OP.ORIGEMPAGAMENTO	AS [ORIGEM_ORIGEMPAGAMENTO]
FROM [OLD].[MENSALIDADE] M

LEFT JOIN [OLD].[CONTATO] C
	ON ( M.IDCONTATO = C.IDCONTATO )

LEFT JOIN [OLD].[PGTO] P
	ON ( M.IDMENSALIDADE = P.IDMENSALIDADE )

LEFT JOIN [OLD].[ORIGEMPAGAMENTO] OP
	ON ( P.IDORIGEM = OP.IDORIGEM )
GO
GO


CREATE VIEW [old].[V_DADOS_PAGAMENTOS_ANTIGOS]
AS
SELECT 
	P.IDPGTO			AS [PAGAMENTO_IDPGTO],
	P.IDCONTATO			AS [PAGAMENTO_IDCONTATO],
	P.IDMENSALIDADE		AS [PAGAMENTO_IDMENSALIDADE],
	P.IDORIGEM			AS [PAGAMENTO_IDORIGEM],
	P.DATAPAGAMENTO		AS [PAGAMENTO_DATAPAGAMENTO],
	P.VALOR				AS [PAGAMENTO_VALOR],
	P.FORMAPAGAMENTO	AS [PAGAMENTO_FORMAPAGAMENTO],
	P.OBSERVACAO		AS [PAGAMENTO_OBSERVACAO],

	OP.IDORIGEM			AS [ORIGEM_IDORIGEM],
	OP.ORIGEMPAGAMENTO	AS [ORIGEM_ORIGEMPAGAMENTO]
FROM [OLD].[PGTO] P

LEFT JOIN [OLD].[ORIGEMPAGAMENTO] OP
	ON ( P.IDORIGEM = OP.IDORIGEM )

WHERE P.IDORIGEM <> 1
GO
GO


/* ---------------------------------------------------------------------- */
/* Add procedures                                                         */
/* ---------------------------------------------------------------------- */

GO


CREATE   PROCEDURE [cfg].[P_CONFIGURACAO_UPDATE] (
	@ID_CONFIGURACAO 	INT,
	@FIN_ANO_CONTABIL	CHAR(4),
	@FIN_DIA_VENCIMENTO	CHAR(2),
	@FIN_JUROS_DIA		SMALLMONEY,
	@ATIVO				BIT,
	@USUARIO_OPERACAO	VARCHAR(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN

		UPDATE [cfg].[CONFIGURACAO] SET
			FIN_ANO_CONTABIL	=@FIN_ANO_CONTABIL,
			FIN_DIA_VENCIMENTO	=@FIN_DIA_VENCIMENTO,
			FIN_JUROS_DIA		=@FIN_JUROS_DIA,
			ATIVO				=@ATIVO,
			USUARIO_OPERACAO	=@USUARIO_OPERACAO,
			DATA_OPERACAO 	 	= GETDATE()
		WHERE ID_CONFIGURACAO =@ID_CONFIGURACAO

		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE   PROCEDURE [cfg].[P_CONFIGURACAO_INSERT] (
	@FIN_ANO_CONTABIL	CHAR(4),
	@FIN_DIA_VENCIMENTO	CHAR(2),
	@FIN_JUROS_DIA		SMALLMONEY,
	@ATIVO				INT,
	@USUARIO_OPERACAO	VARCHAR(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN

		INSERT INTO [cfg].[CONFIGURACAO] ( FIN_ANO_CONTABIL, FIN_DIA_VENCIMENTO, FIN_JUROS_DIA, ATIVO, USUARIO_OPERACAO, DATA_OPERACAO)
		VALUES ( @FIN_ANO_CONTABIL, @FIN_DIA_VENCIMENTO, @FIN_JUROS_DIA, @ATIVO, @USUARIO_OPERACAO, GETDATE())

		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE   PROCEDURE [cfg].[P_USUARIO_INSERT] (
	@LOGIN				VARCHAR(20),
	@SENHA				VARCHAR(100),
	@NOME				VARCHAR(50),
	@DT_NASCIMENTO		SMALLDATETIME,
	@USUARIO_OPERACAO	VARCHAR(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN

		DECLARE @PWD VARBINARY(100)

		SET @PWD = CONVERT(VARBINARY(100), PWDENCRYPT(@SENHA))

		INSERT INTO [cfg].[USUARIO] ( [LOGIN], [SENHA], [NOME], [DT_NASCIMENTO], [ATIVO], [USUARIO_OPERACAO], [DATA_OPERACAO] )
		VALUES ( @LOGIN, @PWD, @NOME, @DT_NASCIMENTO, 1, @USUARIO_OPERACAO, GETDATE() )

		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE   PROCEDURE [cfg].[P_USUARIO_UPDATE] (
	@ID_USUARIO			INT,
	@LOGIN				VARCHAR(20),
	@SENHA				VARCHAR(100),
	@NOME				VARCHAR(50),
	@DT_NASCIMENTO		SMALLDATETIME,
	@USUARIO_OPERACAO	VARCHAR(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN

		DECLARE @PWD VARBINARY(100)

		SET @PWD = CONVERT(VARBINARY(100), PWDENCRYPT(@SENHA))

		UPDATE [cfg].[USUARIO] SET
			[LOGIN]				= @LOGIN,
			[SENHA]				= @PWD,
			[NOME]				= @NOME,
			[DT_NASCIMENTO]		= @DT_NASCIMENTO,
			[USUARIO_OPERACAO]	= @USUARIO_OPERACAO,
			[DATA_OPERACAO]		= GETDATE()
		WHERE ID_USUARIO = @ID_USUARIO

		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE   PROCEDURE [cfg].[P_USUARIO_ATIVAR] (
	@ID_USUARIO			INT,
	@USUARIO_OPERACAO	VARCHAR(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			UPDATE [cfg].[USUARIO] SET
				[ATIVO]				= 1,
				[USUARIO_OPERACAO]	= @USUARIO_OPERACAO,
				[DATA_OPERACAO]		= GETDATE()
			WHERE ID_USUARIO = @ID_USUARIO
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE   PROCEDURE [cfg].[P_USUARIO_SENHA_UPDATE] (
	@LOGIN				VARCHAR(20),
	@SENHA				VARCHAR(100),
	@DT_NASCIMENTO		SMALLDATETIME
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN

		DECLARE @PWD VARBINARY(100)

		SET @PWD = CONVERT(VARBINARY(100), PWDENCRYPT(@SENHA))

		UPDATE [cfg].[USUARIO] SET
			[SENHA]				= @PWD,
			[USUARIO_OPERACAO]	= 'system',
			[DATA_OPERACAO]		= GETDATE()
		WHERE [LOGIN] = @LOGIN
		AND [DT_NASCIMENTO] = @DT_NASCIMENTO

		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE   PROCEDURE [cfg].[P_USUARIO_DESATIVAR] (
	@ID_USUARIO			INT,
	@USUARIO_OPERACAO	VARCHAR(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			UPDATE [cfg].[USUARIO] SET
				[ATIVO]				= 0,
				[USUARIO_OPERACAO]	= @USUARIO_OPERACAO,
				[DATA_OPERACAO]		= GETDATE()
			WHERE ID_USUARIO = @ID_USUARIO
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE   PROCEDURE [cfg].[P_MODULO_INSERT] (
	@ID_MODULO_PAI		INT,
	@DESCRICAO			VARCHAR(100),
	@COMPONENTE			VARCHAR(100),
	@USUARIO_OPERACAO	VARCHAR(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN

		INSERT INTO [cfg].[MODULO] ( ID_MODULO_PAI, DESCRICAO, COMPONENTE, ATIVO, USUARIO_OPERACAO, DATA_OPERACAO )
		VALUES ( @ID_MODULO_PAI, @DESCRICAO, @COMPONENTE, 1, @USUARIO_OPERACAO, GETDATE() )

		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE   PROCEDURE [cfg].[P_MODULO_UPDATE] (
	@ID_MODULO			INT,
	@ID_MODULO_PAI		INT,
	@DESCRICAO			VARCHAR(100),
	@COMPONENTE			VARCHAR(100),
	@USUARIO_OPERACAO	VARCHAR(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN

		UPDATE [cfg].[MODULO] SET
			ID_MODULO_PAI		=@ID_MODULO_PAI,
			DESCRICAO			=@DESCRICAO,
			COMPONENTE			=@COMPONENTE,
			USUARIO_OPERACAO	=@USUARIO_OPERACAO,
			DATA_OPERACAO		=GETDATE()
		WHERE ID_MODULO = @ID_MODULO

		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE   PROCEDURE [cfg].[P_MODULO_ATIVAR] (
	@ID_MODULO			INT,
	@USUARIO_OPERACAO	VARCHAR(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			UPDATE [cfg].[MODULO] SET
				[ATIVO]				= 1,
				[USUARIO_OPERACAO]	= @USUARIO_OPERACAO,
				[DATA_OPERACAO]		= GETDATE()
			WHERE ID_MODULO = @ID_MODULO
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE   PROCEDURE [cfg].[P_MODULO_DESATIVAR] (
	@ID_MODULO			INT,
	@USUARIO_OPERACAO	VARCHAR(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			UPDATE [cfg].[MODULO] SET
				[ATIVO]				= 0,
				[USUARIO_OPERACAO]	= @USUARIO_OPERACAO,
				[DATA_OPERACAO]		= GETDATE()
			WHERE ID_MODULO = @ID_MODULO
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE   PROCEDURE [cfg].[P_USUARIO_MODULO_INSERT] (
	@ID_USUARIO			INT,
	@ID_MODULO			INT,
	@PERMISSAO			BIT,
	@BLOQUEADO			BIT,
	@USUARIO_OPERACAO	VARCHAR(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN

		INSERT INTO [cfg].[USUARIO_MODULO] ( ID_USUARIO, ID_MODULO, PERMISSAO, BLOQUEADO, USUARIO_OPERACAO, DATA_OPERACAO )
		VALUES ( @ID_USUARIO, @ID_MODULO, @PERMISSAO, @BLOQUEADO, @USUARIO_OPERACAO, GETDATE() )

		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE   PROCEDURE [cfg].[P_USUARIO_MODULO_UPDATE] (
	@ID_USUARIO_MODULO	INT,
	@ID_USUARIO			INT,
	@ID_MODULO			INT,
	@PERMISSAO			BIT,
	@BLOQUEADO			BIT,
	@USUARIO_OPERACAO	VARCHAR(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN

		UPDATE [cfg].[USUARIO_MODULO] SET
			ID_USUARIO		 = @ID_USUARIO,
			ID_MODULO		 = @ID_MODULO,
			PERMISSAO	 	 = @PERMISSAO,
			BLOQUEADO		 = @BLOQUEADO,
			USUARIO_OPERACAO = @USUARIO_OPERACAO,
			DATA_OPERACAO	 = GETDATE()
		WHERE ID_USUARIO_MODULO =@ID_USUARIO_MODULO

		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE     PROCEDURE [sis].[P_PESSOA_UPDATE] (
	@ID_PESSOA					INT,
	@ID_PESSOA_PLANO			INT,
	@ID_PESSOA_FILANTROPIA		INT,
	@MATRICULA					VARCHAR(10),
	@ID_CLASSIFICACAO			INT,
	@NOME						VARCHAR(100),
	@DT_NASCIMENTO				SMALLDATETIME,
	@ID_ATIVIDADE				INT,
	@ID_PLANO					INT,
	@PLANO_REFER_INICIO			CHAR(6),
	@PLANO_REFER_FIM			CHAR(6),
	@ID_FILANTROPIA				INT,
	@FILANTROPIA_REFER_INICIO	CHAR(6),
	@FILANTROPIA_REFER_FIM		CHAR(6),
	@ID_ESTADO_CIVIL			INTEGER,
	@ID_CIDADE					INTEGER,
	@PAI						VARCHAR(100),
	@MAE						VARCHAR(100),
	@PROFISSAO					VARCHAR(100),
	@CONJUGE					VARCHAR(100),
	@RAZAO_SOCIAL				VARCHAR(100),
	@LOGRADOURO					VARCHAR(40),
	@NUMERO						VARCHAR(10),
	@COMPLEMENTO				VARCHAR(20),
	@BAIRRO						VARCHAR(50),
	@CEP						VARCHAR(8),
	@DATA_ADMISSAO_TERREIRO		SMALLDATETIME,
	@USUARIO_OPERACAO			VARCHAR(20) )
AS
BEGIN
	DECLARE @QTDE			INT,
			@DIA			CHAR(2),
			@MES			CHAR(2),
			@ANO			CHAR(4),
			@QTDE_FIM		INT,
			@REFER			CHAR(6),
			@VENCIMENTO		CHAR(100),
			@VALOR			SMALLMONEY,
			@COUNT			INT,
			@ID_FINANCEIRO	INT

	SET NOCOUNT ON;

	BEGIN TRY
		-- PESSOA --
		BEGIN TRAN
			UPDATE [sis].[PESSOA] SET
				ID_CLASSIFICACAO		=@ID_CLASSIFICACAO,
				ID_ATIVIDADE			=@ID_ATIVIDADE,
				MATRICULA				=@MATRICULA,
				NOME					=@NOME,
				DT_NASCIMENTO			=@DT_NASCIMENTO,
				ID_ESTADO_CIVIL			=@ID_ESTADO_CIVIL,
				ID_CIDADE				=@ID_CIDADE,
				PAI						=@PAI,
				MAE						=@MAE,
				PROFISSAO				=@PROFISSAO,
				CONJUGE					=@CONJUGE,
				RAZAO_SOCIAL			=@RAZAO_SOCIAL,
				LOGRADOURO				=@LOGRADOURO,
				NUMERO					=@NUMERO,
				COMPLEMENTO				=@COMPLEMENTO,
				BAIRRO					=@BAIRRO,
				CEP						=@CEP,
				DATA_ADMISSAO_TERREIRO	=@DATA_ADMISSAO_TERREIRO,
				USUARIO_OPERACAO		=@USUARIO_OPERACAO,
				DATA_OPERACAO			=GETDATE()
			WHERE ID_PESSOA	=@ID_PESSOA
		COMMIT TRAN

		-- PESSOA_PLANO --
		BEGIN TRAN
			IF @ID_PLANO > 0
				BEGIN
					IF @ID_PESSOA_PLANO > 0
						BEGIN
							UPDATE [sis].[PESSOA_PLANO] SET
								ID_PESSOA 		 = @ID_PESSOA,
								ID_PLANO 		 = @ID_PLANO,
								REFER_INICIO	 = @PLANO_REFER_INICIO,
								REFER_FIM		 = @PLANO_REFER_FIM,
								USUARIO_OPERACAO = @USUARIO_OPERACAO,
								DATA_OPERACAO 	 = GETDATE()
							WHERE ID_PESSOA_PLANO = @ID_PESSOA_PLANO
						END
					ELSE
						BEGIN
							INSERT INTO [sis].[PESSOA_PLANO] ( ID_PESSOA, ID_PLANO, REFER_INICIO, REFER_FIM, USUARIO_OPERACAO, DATA_OPERACAO)
							VALUES ( @ID_PESSOA, @ID_PLANO, @PLANO_REFER_INICIO, @PLANO_REFER_FIM, @USUARIO_OPERACAO, GETDATE())
						END
				END
		COMMIT TRAN

		-- PESSOA_FILANTROPIA --
		BEGIN TRAN
			IF @ID_FILANTROPIA > 0
				BEGIN
					IF @ID_PESSOA_FILANTROPIA > 0
						BEGIN
							UPDATE [sis].[PESSOA_FILANTROPIA] SET
								ID_PESSOA 		 = @ID_PESSOA,
								ID_FILANTROPIA 	 = @ID_FILANTROPIA,
								REFER_INICIO	 = @FILANTROPIA_REFER_INICIO,
								REFER_FIM		 = @FILANTROPIA_REFER_FIM,
								USUARIO_OPERACAO = @USUARIO_OPERACAO,
								DATA_OPERACAO 	 = GETDATE()
							WHERE ID_PESSOA_FILANTROPIA = @ID_PESSOA_FILANTROPIA
						END
					ELSE
						BEGIN
							INSERT INTO [sis].[PESSOA_FILANTROPIA] ( ID_PESSOA, ID_FILANTROPIA, REFER_INICIO, REFER_FIM, USUARIO_OPERACAO, DATA_OPERACAO)
							VALUES ( @ID_PESSOA, @ID_FILANTROPIA, @FILANTROPIA_REFER_INICIO, @FILANTROPIA_REFER_FIM, @USUARIO_OPERACAO, GETDATE())
						END
				END
		COMMIT TRAN

		-- FINANCEIRO --
		BEGIN TRAN
			SET @ANO = SUBSTRING( @PLANO_REFER_INICIO, 3, 4 )

			DELETE FROM [sis].[FINANCEIRO] WHERE ID_PESSOA = @ID_PESSOA AND SUBSTRING( REFER, 3, 4 ) = @ANO

			SET @QTDE	  = CAST( SUBSTRING( @PLANO_REFER_INICIO, 1, 2 ) AS INT )
			SET @VALOR	  = ( SELECT VALOR FROM [sis].[PLANO] WHERE ID_PLANO =@ID_PLANO )
			SET @QTDE_FIM = CAST( SUBSTRING( @PLANO_REFER_FIM, 1, 2 ) AS INT )

			WHILE @QTDE <= @QTDE_FIM
				BEGIN
					SET @MES		= REPLICATE( '0', 2 - LEN( CAST( @QTDE AS VARCHAR(2) ) ) ) + CAST( @QTDE AS VARCHAR(2) )
					SET @DIA		= ( SELECT COALESCE( REPLICATE( '0', 2 - LEN( FIN_DIA_VENCIMENTO ) ) + FIN_DIA_VENCIMENTO, '10' ) FROM [cfg].[CONFIGURACAO] WHERE ATIVO = 1 )
					SET @REFER		= @MES + @ANO
					SET @VENCIMENTO = CAST(((@ANO + '-' + @DIA + '-' + @MES) + ' 00:00:00') AS SMALLDATETIME)

					SET @COUNT = ( SELECT COUNT(ID_FINANCEIRO) FROM [sis].[FINANCEIRO] WHERE ID_PESSOA =@ID_PESSOA AND REFER = @REFER )

					IF @COUNT = 0
						SET @ID_FINANCEIRO = 0
					ELSE
						SET @ID_FINANCEIRO = ( SELECT ID_FINANCEIRO FROM [sis].[FINANCEIRO] WHERE ID_PESSOA =@ID_PESSOA AND REFER = @REFER )

					IF @ID_FINANCEIRO = 0
						BEGIN
							EXEC [sis].[P_FINANCEIRO_INSERT] @ID_PESSOA, @REFER, @VENCIMENTO, @VALOR, NULL, NULL, @USUARIO_OPERACAO
						END
					ELSE
						BEGIN
							EXEC [sis].[P_FINANCEIRO_UPDATE] @ID_FINANCEIRO, @ID_PESSOA, @REFER, @VENCIMENTO, @VALOR, NULL, NULL, @USUARIO_OPERACAO
						END

					SET @QTDE = @QTDE + 1
				END
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO
GO


CREATE PROCEDURE [sis].[P_PESSOA_INSERT] (
	@MATRICULA					VARCHAR(10),
	@ID_CLASSIFICACAO			INT,
	@NOME						VARCHAR(100),
	@DT_NASCIMENTO				SMALLDATETIME,
	@ID_ATIVIDADE				INT,
	@ID_PLANO					INT,
	@PLANO_REFER_INICIO			CHAR(6),
	@PLANO_REFER_FIM			CHAR(6),
	@ID_FILANTROPIA				INT,
	@FILANTROPIA_REFER_INICIO	CHAR(6),
	@FILANTROPIA_REFER_FIM		CHAR(6),
	@ID_ESTADO_CIVIL			INTEGER,
	@ID_CIDADE					INTEGER,
	@PAI						VARCHAR(100),
	@MAE						VARCHAR(100),
	@PROFISSAO					VARCHAR(100),
	@CONJUGE					VARCHAR(100),
	@RAZAO_SOCIAL				VARCHAR(100),
	@LOGRADOURO					VARCHAR(40),
	@NUMERO						VARCHAR(10),
	@COMPLEMENTO				VARCHAR(20),
	@BAIRRO						VARCHAR(50),
	@CEP						VARCHAR(8),
	@DATA_ADMISSAO_TERREIRO		SMALLDATETIME,
	@USUARIO_OPERACAO			VARCHAR(20) )
AS
BEGIN
	DECLARE @ID_PESSOA		INT,
			@COUNT			INT,
			@QTDE			INT,
			@DIA			CHAR(2),
			@MES			CHAR(2),
			@ANO			CHAR(4),
			@QTDE_FIM		INT,
			@REFER			CHAR(6),
			@VENCIMENTO		CHAR(100),
			@VALOR			SMALLMONEY,
			@REFER_DESCONTO	CHAR(6),
			@VL_DESCONTO	SMALLMONEY

	SET NOCOUNT ON;

	BEGIN TRY
		-- PESSOA --
		BEGIN TRAN
			INSERT INTO [sis].[PESSOA] ( ID_CLASSIFICACAO, ID_ATIVIDADE, ID_ESTADO_CIVIL, ID_CIDADE, MATRICULA, NOME, DT_NASCIMENTO, ATIVO, PAI, MAE, PROFISSAO, CONJUGE, 
			                             RAZAO_SOCIAL, LOGRADOURO, NUMERO, COMPLEMENTO, BAIRRO, CEP, DATA_ADMISSAO_TERREIRO, USUARIO_OPERACAO, DATA_OPERACAO )
			VALUES ( @ID_CLASSIFICACAO, @ID_ATIVIDADE, @ID_ESTADO_CIVIL, @ID_CIDADE, @MATRICULA, @NOME, @DT_NASCIMENTO, 1, @PAI, @MAE, @PROFISSAO, @CONJUGE, 
			         @RAZAO_SOCIAL, @LOGRADOURO, @NUMERO, @COMPLEMENTO, @BAIRRO, @CEP, @DATA_ADMISSAO_TERREIRO, @USUARIO_OPERACAO, GETDATE() )

			SET @COUNT = ( SELECT COUNT(ID_PESSOA) FROM [sis].[PESSOA] WHERE NOME =@NOME )

			IF @COUNT = 0
				SET @ID_PESSOA = ( SELECT ( MAX(ID_PESSOA) + 1 ) FROM [sis].[PESSOA] )
			ELSE
				SET @ID_PESSOA = ( SELECT ID_PESSOA FROM [sis].[PESSOA] WHERE NOME =@NOME )
		COMMIT TRAN

		-- PLANO --
		BEGIN TRAN
			IF @ID_PLANO > 0
				BEGIN
					INSERT INTO [sis].[PESSOA_PLANO] ( ID_PESSOA, ID_PLANO, REFER_INICIO, REFER_FIM, USUARIO_OPERACAO, DATA_OPERACAO)
					VALUES ( @ID_PESSOA, @ID_PLANO, @PLANO_REFER_INICIO, @PLANO_REFER_FIM, @USUARIO_OPERACAO, GETDATE())
				END
		COMMIT TRAN

		-- FILANTROPIA --
		BEGIN TRAN
			IF @ID_FILANTROPIA > 0
				BEGIN
					INSERT INTO [sis].[PESSOA_FILANTROPIA] ( ID_PESSOA, ID_FILANTROPIA, REFER_INICIO, REFER_FIM, USUARIO_OPERACAO, DATA_OPERACAO)
					VALUES ( @ID_PESSOA, @ID_FILANTROPIA, @FILANTROPIA_REFER_INICIO, @FILANTROPIA_REFER_FIM, @USUARIO_OPERACAO, GETDATE())
				END
		COMMIT TRAN

		-- FINANCEIRO --
		BEGIN TRAN
			SET @QTDE	  = CAST( SUBSTRING( @PLANO_REFER_INICIO, 1, 2 ) AS INT )
			SET @ANO	  = SUBSTRING( @PLANO_REFER_INICIO, 3, 4 )
			SET @VALOR	  = ( SELECT VALOR FROM [sis].[PLANO] WHERE ID_PLANO =@ID_PLANO )
			SET @QTDE_FIM = CAST( SUBSTRING( @PLANO_REFER_FIM, 1, 2 ) AS INT )

			WHILE @QTDE <= @QTDE_FIM
				BEGIN
					SET @MES		 = REPLICATE( '0', 2 - LEN( CAST( @QTDE AS VARCHAR(2) ) ) ) + CAST( @QTDE AS VARCHAR(2) )
					SET @DIA		 = ( SELECT COALESCE( REPLICATE( '0', 2 - LEN( FIN_DIA_VENCIMENTO ) ) + FIN_DIA_VENCIMENTO, '10' ) FROM [cfg].[CONFIGURACAO] WHERE ATIVO = 1 )
					SET @REFER		 = @MES + @ANO
					SET @VENCIMENTO  = @ANO + '-' + @MES + '-' + @DIA
					SET @VL_DESCONTO = 0

					IF @ID_FILANTROPIA > 0
						BEGIN
							SET @REFER_DESCONTO = @FILANTROPIA_REFER_INICIO

							WHILE CAST(@REFER_DESCONTO AS INT) <= CAST(@FILANTROPIA_REFER_FIM AS INT)
								BEGIN
									IF @REFER = @REFER_DESCONTO
										SET @VL_DESCONTO = ( SELECT CASE
																		WHEN VALOR > 0 THEN VALOR
																		WHEN PERCENTUAL > 0 THEN ( @VALOR * PERCENTUAL ) / 100
																	ELSE 0 END
															 FROM [sis].[FILANTROPIA]
															 WHERE ID_FILANTROPIA =@ID_FILANTROPIA )

									SET @REFER_DESCONTO = REPLICATE('0', 6 - LEN((CAST(@REFER_DESCONTO AS INT) + 10000))) + CAST((CAST(@REFER_DESCONTO AS INT) + 10000) AS CHAR(6))
								END
						END

					EXEC [sis].[P_FINANCEIRO_INSERT] @ID_PESSOA, @REFER, @VENCIMENTO, @VALOR, @VL_DESCONTO, NULL, NULL, @USUARIO_OPERACAO

					SET @QTDE = @QTDE + 1
				END
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO
GO


CREATE   PROCEDURE [sis].[P_PESSOA_DESATIVAR] (
	@ID_PESSOA			int,
	@USUARIO_OPERACAO	varchar(20) )
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			UPDATE [sis].[PESSOA] SET
				[ATIVO]				= 0,
				[USUARIO_OPERACAO]	= @USUARIO_OPERACAO,
				[DATA_OPERACAO]		= GETDATE()
			WHERE ID_PESSOA = @ID_PESSOA
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE   PROCEDURE [sis].[P_PESSOA_ATIVAR] (
	@ID_PESSOA			int,
	@USUARIO_OPERACAO	varchar(20) )
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			UPDATE [sis].[PESSOA] SET
				[ATIVO]				= 1,
				[USUARIO_OPERACAO]	= @USUARIO_OPERACAO,
				[DATA_OPERACAO]		= GETDATE()
			WHERE ID_PESSOA = @ID_PESSOA
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE   PROCEDURE [sis].[P_PLANO_UPDATE] (
	@ID_PLANO			int,
	@DESCRICAO			varchar(100),
	@VALOR				smallmoney,
	@USUARIO_OPERACAO	varchar(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN

		UPDATE [sis].[PLANO] SET
			DESCRICAO 		 = @DESCRICAO,
			VALOR 			 = @VALOR,
			USUARIO_OPERACAO = @USUARIO_OPERACAO,
			DATA_OPERACAO 	 = GETDATE()
		WHERE ID_PLANO = @ID_PLANO

		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE   PROCEDURE [sis].[P_PLANO_INSERT] (
	@DESCRICAO			varchar(100),
	@VALOR				smallmoney,
	@USUARIO_OPERACAO	varchar(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN

		INSERT INTO [sis].[PLANO] ( DESCRICAO, VALOR, ATIVO, USUARIO_OPERACAO, DATA_OPERACAO)
		VALUES ( @DESCRICAO, @VALOR, 1, @USUARIO_OPERACAO, GETDATE())

		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE   PROCEDURE [sis].[P_PLANO_ATIVAR] (
	@ID_PLANO			INT,
	@USUARIO_OPERACAO	VARCHAR(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			UPDATE [sis].[PLANO] SET
				[ATIVO]				= 1,
				[USUARIO_OPERACAO]	= @USUARIO_OPERACAO,
				[DATA_OPERACAO]		= GETDATE()
			WHERE ID_PLANO = @ID_PLANO
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE   PROCEDURE [sis].[P_PLANO_DESATIVAR] (
	@ID_PLANO			INT,
	@USUARIO_OPERACAO	VARCHAR(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			UPDATE [sis].[PLANO] SET
				[ATIVO]				= 0,
				[USUARIO_OPERACAO]	= @USUARIO_OPERACAO,
				[DATA_OPERACAO]		= GETDATE()
			WHERE ID_PLANO = @ID_PLANO
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE   PROCEDURE [sis].[P_FILANTROPIA_ATIVAR] (
	@ID_FILANTROPIA			INT,
	@USUARIO_OPERACAO	VARCHAR(20)
)
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY

		BEGIN TRAN
			UPDATE [sis].[FILANTROPIA] SET
				[ATIVO]				= 1,
				[USUARIO_OPERACAO]	= @USUARIO_OPERACAO,
				[DATA_OPERACAO]		= GETDATE()
			WHERE ID_FILANTROPIA = @ID_FILANTROPIA
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE   PROCEDURE [sis].[P_FILANTROPIA_DESATIVAR] (
	@ID_FILANTROPIA			INT,
	@USUARIO_OPERACAO	VARCHAR(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			UPDATE [sis].[FILANTROPIA] SET
				[ATIVO]				= 0,
				[USUARIO_OPERACAO]	= @USUARIO_OPERACAO,
				[DATA_OPERACAO]		= GETDATE()
			WHERE ID_FILANTROPIA = @ID_FILANTROPIA
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE   PROCEDURE [sis].[P_FILANTROPIA_INSERT] (
	@DESCRICAO			VARCHAR(100),
	@PERCENTUAL			SMALLMONEY,
	@VALOR				SMALLMONEY,
	@USUARIO_OPERACAO	VARCHAR(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN

		INSERT INTO [sis].[FILANTROPIA] ( DESCRICAO, PERCENTUAL, VALOR, ATIVO, USUARIO_OPERACAO, DATA_OPERACAO)
		VALUES ( @DESCRICAO, @PERCENTUAL, @VALOR, 1, @USUARIO_OPERACAO, GETDATE())

		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE   PROCEDURE [sis].[P_FILANTROPIA_UPDATE] (
	@ID_FILANTROPIA		INT,
	@DESCRICAO			VARCHAR(100),
	@PERCENTUAL			SMALLMONEY,
	@VALOR				SMALLMONEY,
	@USUARIO_OPERACAO	VARCHAR(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN

		UPDATE [sis].[FILANTROPIA] SET
			DESCRICAO 			=@DESCRICAO,
			PERCENTUAL 			=@PERCENTUAL,
			VALOR 				=@VALOR,
			USUARIO_OPERACAO	=@USUARIO_OPERACAO,
			DATA_OPERACAO 	 	= GETDATE()
		WHERE ID_FILANTROPIA = @ID_FILANTROPIA

		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE   PROCEDURE [sis].[P_PESSOA_PLANO_FILANTROPIA_DELETE] (
	@ID_PESSOA_PLANO		INT,
	@ID_PESSOA_FILANTROPIA	INT,
	@USUARIO_OPERACAO		VARCHAR(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN

			IF @ID_PESSOA_PLANO > 0
				BEGIN
					INSERT INTO [log].[PESSOA_PLANO] ( ID_PESSOA_PLANO, ID_PESSOA, ID_PLANO, REFER_INICIO, REFER_FIM, [USUARIO_OPERACAO], [DATA_OPERACAO], [STATUS_OPERACAO] )
					SELECT @ID_PESSOA_PLANO, ID_PESSOA, ID_PLANO, REFER_INICIO, REFER_FIM, @USUARIO_OPERACAO, GETDATE(), 'DELETE' FROM PESSOA_PLANO WHERE ID_PESSOA_PLANO = @ID_PESSOA_PLANO

					DELETE FROM [sis].[PESSOA_PLANO]
					WHERE ID_PESSOA_PLANO = @ID_PESSOA_PLANO
				END

			IF @ID_PESSOA_FILANTROPIA > 0
				BEGIN
					INSERT INTO [log].[PESSOA_FILANTROPIA] ( ID_PESSOA_FILANTROPIA, ID_PESSOA, ID_FILANTROPIA, REFER_INICIO, REFER_FIM, [USUARIO_OPERACAO], [DATA_OPERACAO], [STATUS_OPERACAO] )
					SELECT @ID_PESSOA_FILANTROPIA, ID_PESSOA, ID_FILANTROPIA, REFER_INICIO, REFER_FIM, @USUARIO_OPERACAO, GETDATE(), 'DELETE' FROM PESSOA_FILANTROPIA WHERE ID_PESSOA_FILANTROPIA = @ID_PESSOA_FILANTROPIA

					DELETE FROM [sis].[PESSOA_FILANTROPIA]
					WHERE ID_PESSOA_FILANTROPIA = @ID_PESSOA_FILANTROPIA
				END

		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE   PROCEDURE [sis].[P_PESSOA_PLANO_FILANTROPIA_INSERT] (
	@ID_PESSOA					INT,
	@ID_PLANO					INT,
	@PLANO_REFER_INICIO			VARCHAR(6),
	@PLANO_REFER_FIM			VARCHAR(6),
	@ID_FILANTROPIA				INT,
	@FILANTROPIA_REFER_INICIO	VARCHAR(6),
	@FILANTROPIA_REFER_FIM		VARCHAR(6),
	@USUARIO_OPERACAO			VARCHAR(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN

			IF @ID_PLANO > 0
				BEGIN
					INSERT INTO [sis].[PESSOA_PLANO] ( ID_PESSOA, ID_PLANO, REFER_INICIO, REFER_FIM, [USUARIO_OPERACAO], [DATA_OPERACAO] )
					VALUES ( @ID_PESSOA, @ID_PLANO, @PLANO_REFER_INICIO, @PLANO_REFER_FIM, @USUARIO_OPERACAO, GETDATE() )
				END

			IF @ID_FILANTROPIA > 0
				BEGIN
					INSERT INTO [sis].[PESSOA_FILANTROPIA] ( ID_PESSOA, ID_FILANTROPIA, REFER_INICIO, REFER_FIM, [USUARIO_OPERACAO], [DATA_OPERACAO] )
					VALUES ( @ID_PESSOA, @ID_FILANTROPIA, @FILANTROPIA_REFER_INICIO, @FILANTROPIA_REFER_FIM, @USUARIO_OPERACAO, GETDATE() )
				END

		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE   PROCEDURE [sis].[P_FINANCEIRO_INSERT] (
	@ID_PESSOA			INT,
	@REFER				CHAR(6),
	@DT_VENCIMENTO		SMALLDATETIME,
	@VL_REFER			SMALLMONEY,
	@VL_DESCONTO		SMALLMONEY,
	@DT_PAGAMENTO		SMALLDATETIME,
	@VL_PAGO			SMALLMONEY,
	@USUARIO_OPERACAO	VARCHAR(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN

		INSERT INTO [sis].[FINANCEIRO] ( ID_PESSOA, REFER, DT_VENCIMENTO, VL_REFER, VL_DESCONTO, DT_PAGAMENTO, VL_PAGO, USUARIO_OPERACAO, DATA_OPERACAO )
		VALUES ( @ID_PESSOA, @REFER, @DT_VENCIMENTO, @VL_REFER, @VL_DESCONTO, @DT_PAGAMENTO, @VL_PAGO, @USUARIO_OPERACAO,  GETDATE() )

		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE   PROCEDURE [sis].[P_FINANCEIRO_UPDATE] (
	@ID_FINANCEIRO		INT,
	@ID_PESSOA			INT,
	@REFER				CHAR(6),
	@DT_VENCIMENTO		SMALLDATETIME,
	@VL_REFER			SMALLMONEY,
	@VL_DESCONTO		SMALLMONEY,
	@DT_PAGAMENTO		SMALLDATETIME,
	@VL_PAGO			SMALLMONEY,
	@USUARIO_OPERACAO	VARCHAR(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN

		UPDATE [sis].[FINANCEIRO] SET
			ID_PESSOA			=@ID_PESSOA,
			REFER				=@REFER,
			DT_VENCIMENTO		=@DT_VENCIMENTO,
			VL_REFER			=@VL_REFER,
			VL_DESCONTO			=@VL_DESCONTO,
			DT_PAGAMENTO		=@DT_PAGAMENTO,
			VL_PAGO				=@VL_PAGO,
			USUARIO_OPERACAO	=@USUARIO_OPERACAO,
			DATA_OPERACAO		=GETDATE()
		WHERE ID_FINANCEIRO =@ID_FINANCEIRO

		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE   PROCEDURE [sis].[P_TIPO_ENDERECO_INSERT] (
	@DESCRICAO			VARCHAR(100),
	@USUARIO_OPERACAO	VARCHAR(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN

		INSERT INTO [sis].[TIPO_ENDERECO] ( DESCRICAO, ATIVO, USUARIO_OPERACAO, DATA_OPERACAO)
		VALUES ( @DESCRICAO, 1, @USUARIO_OPERACAO, GETDATE())

		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE   PROCEDURE [sis].[P_TIPO_ENDERECO_UPDATE] (
	@ID_TIPO_ENDERECO	INT,
	@DESCRICAO			VARCHAR(100),
	@USUARIO_OPERACAO	VARCHAR(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN

		UPDATE [sis].[TIPO_ENDERECO] SET
			DESCRICAO		 =@DESCRICAO,
			USUARIO_OPERACAO =@USUARIO_OPERACAO,
			DATA_OPERACAO 	 = GETDATE()
		WHERE ID_TIPO_ENDERECO =@ID_TIPO_ENDERECO

		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE   PROCEDURE [sis].[P_TIPO_CONTATO_INSERT] (
	@DESCRICAO			VARCHAR(100),
	@USUARIO_OPERACAO	VARCHAR(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN

		INSERT INTO [sis].[TIPO_CONTATO] ( DESCRICAO, ATIVO, USUARIO_OPERACAO, DATA_OPERACAO)
		VALUES ( @DESCRICAO, 1, @USUARIO_OPERACAO, GETDATE())

		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE   PROCEDURE [sis].[P_TIPO_CONTATO_UPDATE] (
	@ID_TIPO_CONTATO	INT,
	@DESCRICAO			VARCHAR(100),
	@USUARIO_OPERACAO	VARCHAR(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN

		UPDATE [sis].[TIPO_CONTATO] SET
			DESCRICAO		 =@DESCRICAO,
			USUARIO_OPERACAO =@USUARIO_OPERACAO,
			DATA_OPERACAO 	 = GETDATE()
		WHERE ID_TIPO_CONTATO =@ID_TIPO_CONTATO

		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE   PROCEDURE [sis].[P_TIPO_ENDERECO_ATIVAR] (
	@ID_TIPO_ENDERECO	INT,
	@USUARIO_OPERACAO	VARCHAR(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			UPDATE [sis].[TIPO_ENDERECO] SET
				[ATIVO]				= 1,
				[USUARIO_OPERACAO]	= @USUARIO_OPERACAO,
				[DATA_OPERACAO]		= GETDATE()
			WHERE ID_TIPO_ENDERECO = @ID_TIPO_ENDERECO
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE   PROCEDURE [sis].[P_TIPO_CONTATO_ATIVAR] (
	@ID_TIPO_CONTATO	INT,
	@USUARIO_OPERACAO	VARCHAR(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			UPDATE [sis].[TIPO_CONTATO] SET
				[ATIVO]				= 1,
				[USUARIO_OPERACAO]	= @USUARIO_OPERACAO,
				[DATA_OPERACAO]		= GETDATE()
			WHERE ID_TIPO_CONTATO = @ID_TIPO_CONTATO
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE   PROCEDURE [sis].[P_TIPO_CONTATO_DESATIVAR] (
	@ID_TIPO_CONTATO	INT,
	@USUARIO_OPERACAO	VARCHAR(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			UPDATE [sis].[TIPO_CONTATO] SET
				[ATIVO]				= 0,
				[USUARIO_OPERACAO]	= @USUARIO_OPERACAO,
				[DATA_OPERACAO]		= GETDATE()
			WHERE ID_TIPO_CONTATO = @ID_TIPO_CONTATO
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE   PROCEDURE [sis].[P_TIPO_ENDERECO_DESATIVAR] (
	@ID_TIPO_ENDERECO	INT,
	@USUARIO_OPERACAO	VARCHAR(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			UPDATE [sis].[TIPO_ENDERECO] SET
				[ATIVO]				= 0,
				[USUARIO_OPERACAO]	= @USUARIO_OPERACAO,
				[DATA_OPERACAO]		= GETDATE()
			WHERE ID_TIPO_ENDERECO = @ID_TIPO_ENDERECO
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE   PROCEDURE [sis].[P_TIPO_ENDERECO_DELETE] (
	@ID_TIPO_ENDERECO	INT,
	@USUARIO_OPERACAO	VARCHAR(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN

			INSERT INTO [log].[TIPO_ENDERECO] ( ID_TIPO_ENDERECO, DESCRICAO, ATIVO, USUARIO_OPERACAO, DATA_OPERACAO, STATUS_OPERACAO )
			SELECT @ID_TIPO_ENDERECO, DESCRICAO, ATIVO, @USUARIO_OPERACAO, GETDATE(), 'DELETE' FROM [sis].[TIPO_ENDERECO] WHERE ID_TIPO_ENDERECO =@ID_TIPO_ENDERECO

			DELETE FROM [sis].[TIPO_ENDERECO]
			WHERE ID_TIPO_ENDERECO = @ID_TIPO_ENDERECO

		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE   PROCEDURE [sis].[P_TIPO_CONTATO_DELETE] (
	@ID_TIPO_CONTATO	INT,
	@USUARIO_OPERACAO	VARCHAR(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN

			INSERT INTO [log].[TIPO_CONTATO] ( ID_TIPO_CONTATO, DESCRICAO, ATIVO, USUARIO_OPERACAO, DATA_OPERACAO, STATUS_OPERACAO )
			SELECT @ID_TIPO_CONTATO, DESCRICAO, ATIVO, @USUARIO_OPERACAO, GETDATE(), 'DELETE' FROM [sis].[TIPO_CONTATO] WHERE ID_TIPO_CONTATO =@ID_TIPO_CONTATO

			DELETE FROM [sis].[TIPO_CONTATO]
			WHERE ID_TIPO_CONTATO = @ID_TIPO_CONTATO

		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE   PROCEDURE [sis].[P_CONTATO_INSERT] (
	@ID_PESSOA			INT,
	@ID_TIPO_CONTATO	INT,
	@DESCRICAO			VARCHAR(100),
	@USUARIO_OPERACAO	VARCHAR(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN

			INSERT INTO [sis].[CONTATO] ( ID_PESSOA, ID_TIPO_CONTATO, DESCRICAO, ATIVO, USUARIO_OPERACAO, DATA_OPERACAO )
			VALUES ( @ID_PESSOA, @ID_TIPO_CONTATO, @DESCRICAO, 1, @USUARIO_OPERACAO, GETDATE() )

		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE   PROCEDURE [sis].[P_ENDERECO_INSERT] (
	@ID_PESSOA			INT,
	@ID_TIPO_ENDERECO	INT,
	@ID_CIDADE			INT,
	@LOGRADOURO			VARCHAR(100),
	@NUMERO				VARCHAR(10),
	@COMPLEMENTO		VARCHAR(20),
	@BAIRRO				VARCHAR(50),
	@CEP				VARCHAR(8),
	@USUARIO_OPERACAO	VARCHAR(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN

			INSERT INTO [sis].[ENDERECO] ( ID_PESSOA, ID_TIPO_ENDERECO, ID_CIDADE, LOGRADOURO, NUMERO, COMPLEMENTO, BAIRRO, CEP, ATIVO, USUARIO_OPERACAO, DATA_OPERACAO )
			VALUES ( @ID_PESSOA, @ID_TIPO_ENDERECO, @ID_CIDADE, @LOGRADOURO, @NUMERO, @COMPLEMENTO, @BAIRRO, @CEP, 1, @USUARIO_OPERACAO, GETDATE() )

		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE   PROCEDURE [sis].[P_CONTATO_DELETE] (
	@ID_PESSOA			INT,
	@USUARIO_OPERACAO	VARCHAR(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN

			INSERT INTO [log].[CONTATO] ( ID_CONTATO, ID_PESSOA, ID_TIPO_CONTATO, DESCRICAO, ATIVO, USUARIO_OPERACAO, DATA_OPERACAO, STATUS_OPERACAO )
			SELECT ID_CONTATO, @ID_PESSOA, ID_TIPO_CONTATO, DESCRICAO, ATIVO, @USUARIO_OPERACAO, GETDATE(), 'DELETE' FROM [sis].[CONTATO] WHERE ID_PESSOA =@ID_PESSOA

			DELETE FROM [sis].[CONTATO]
			WHERE ID_PESSOA =@ID_PESSOA

		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO
GO


CREATE   PROCEDURE [sis].[P_ENDERECO_DELETE] (
	@ID_PESSOA			INT,
	@USUARIO_OPERACAO	VARCHAR(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN

			INSERT INTO [log].[ENDERECO] ( ID_ENDERECO, ID_PESSOA, ID_TIPO_ENDERECO, ID_CIDADE, LOGRADOURO, NUMERO, COMPLEMENTO, BAIRRO, CEP, ATIVO, USUARIO_OPERACAO, DATA_OPERACAO, STATUS_OPERACAO )
			SELECT ID_ENDERECO, @ID_PESSOA, ID_TIPO_ENDERECO, ID_CIDADE, LOGRADOURO, NUMERO, COMPLEMENTO, BAIRRO, CEP, ATIVO, @USUARIO_OPERACAO, GETDATE(), 'DELETE' FROM [sis].[ENDERECO] WHERE ID_PESSOA =@ID_PESSOA

			DELETE FROM [sis].[ENDERECO]
			WHERE ID_PESSOA =@ID_PESSOA

		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO
GO


CREATE   PROCEDURE [sis].[P_DOCUMENTO_INSERT] (
	@ID_PESSOA			INT,
	@ID_TIPO_DOCUMENTO	INT,
	@DESCRICAO			VARCHAR(100),
	@USUARIO_OPERACAO	VARCHAR(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN

			INSERT INTO [sis].[DOCUMENTO] ( ID_PESSOA, ID_TIPO_DOCUMENTO, DESCRICAO, ATIVO, USUARIO_OPERACAO, DATA_OPERACAO )
			VALUES ( @ID_PESSOA, @ID_TIPO_DOCUMENTO, @DESCRICAO, 1, @USUARIO_OPERACAO, GETDATE() )

		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE     PROCEDURE [sis].[P_TIPO_DOCUMENTO_DESATIVAR] (
	@ID_TIPO_DOCUMENTO	INT,
	@USUARIO_OPERACAO	VARCHAR(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			UPDATE [sis].[TIPO_DOCUMENTO] SET
				[ATIVO]				= 0,
				[USUARIO_OPERACAO]	= @USUARIO_OPERACAO,
				[DATA_OPERACAO]		= GETDATE()
			WHERE ID_TIPO_DOCUMENTO = @ID_TIPO_DOCUMENTO
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE     PROCEDURE [sis].[P_TIPO_DOCUMENTO_ATIVAR] (
	@ID_TIPO_DOCUMENTO	INT,
	@USUARIO_OPERACAO	VARCHAR(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			UPDATE [sis].[TIPO_DOCUMENTO] SET
				[ATIVO]				= 1,
				[USUARIO_OPERACAO]	= @USUARIO_OPERACAO,
				[DATA_OPERACAO]		= GETDATE()
			WHERE ID_TIPO_DOCUMENTO = @ID_TIPO_DOCUMENTO
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE     PROCEDURE [sis].[P_TIPO_DOCUMENTO_DELETE] (
	@ID_TIPO_DOCUMENTO	INT,
	@USUARIO_OPERACAO	VARCHAR(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN

			INSERT INTO [log].[TIPO_DOCUMENTO] ( ID_TIPO_DOCUMENTO, DESCRICAO, ATIVO, USUARIO_OPERACAO, DATA_OPERACAO, STATUS_OPERACAO )
			SELECT @ID_TIPO_DOCUMENTO, DESCRICAO, ATIVO, @USUARIO_OPERACAO, GETDATE(), 'DELETE' FROM [sis].[TIPO_DOCUMENTO] WHERE ID_TIPO_DOCUMENTO =@ID_TIPO_DOCUMENTO

			DELETE FROM [sis].[TIPO_DOCUMENTO]
			WHERE ID_TIPO_DOCUMENTO = @ID_TIPO_DOCUMENTO

		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE     PROCEDURE [sis].[P_TIPO_DOCUMENTO_UPDATE] (
	@ID_TIPO_DOCUMENTO	INT,
	@DESCRICAO			VARCHAR(100),
	@USUARIO_OPERACAO	VARCHAR(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN

		UPDATE [sis].[TIPO_DOCUMENTO] SET
			DESCRICAO		 =@DESCRICAO,
			USUARIO_OPERACAO =@USUARIO_OPERACAO,
			DATA_OPERACAO 	 = GETDATE()
		WHERE ID_TIPO_DOCUMENTO =@ID_TIPO_DOCUMENTO

		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE     PROCEDURE [sis].[P_TIPO_DOCUMENTO_INSERT] (
	@DESCRICAO			VARCHAR(100),
	@USUARIO_OPERACAO	VARCHAR(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN

		INSERT INTO [sis].[TIPO_DOCUMENTO] ( DESCRICAO, ATIVO, USUARIO_OPERACAO, DATA_OPERACAO)
		VALUES ( @DESCRICAO, 1, @USUARIO_OPERACAO, GETDATE())

		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE     PROCEDURE [sis].[P_DOCUMENTO_DELETE] (
	@ID_PESSOA			INT,
	@USUARIO_OPERACAO	VARCHAR(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN

			INSERT INTO [log].[DOCUMENTO] ( ID_DOCUMENTO, ID_PESSOA, ID_TIPO_DOCUMENTO, DESCRICAO, ATIVO, USUARIO_OPERACAO, DATA_OPERACAO, STATUS_OPERACAO )
			SELECT ID_DOCUMENTO, @ID_PESSOA, ID_TIPO_DOCUMENTO, DESCRICAO, ATIVO, @USUARIO_OPERACAO, GETDATE(), 'DELETE' FROM [sis].[DOCUMENTO] WHERE ID_PESSOA =@ID_PESSOA

			DELETE FROM [sis].[DOCUMENTO]
			WHERE ID_PESSOA =@ID_PESSOA

		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO
GO


CREATE   PROCEDURE [sis].[P_CLASSIFICACAO_INSERT] (
	@DESCRICAO			VARCHAR(100),
	@USUARIO_OPERACAO	VARCHAR(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN

		INSERT INTO [sis].[CLASSIFICACAO] ( DESCRICAO, ATIVO, USUARIO_OPERACAO, DATA_OPERACAO)
		VALUES ( @DESCRICAO, 1, @USUARIO_OPERACAO, GETDATE())

		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE   PROCEDURE [sis].[P_CLASSIFICACAO_UPDATE] (
	@ID_CLASSIFICACAO	INT,
	@DESCRICAO			VARCHAR(100),
	@USUARIO_OPERACAO	VARCHAR(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN

		UPDATE [sis].[CLASSIFICACAO] SET
			DESCRICAO		 =@DESCRICAO,
			USUARIO_OPERACAO =@USUARIO_OPERACAO,
			DATA_OPERACAO 	 = GETDATE()
		WHERE ID_CLASSIFICACAO =@ID_CLASSIFICACAO

		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE   PROCEDURE [sis].[P_CLASSIFICACAO_DELETE] (
	@ID_CLASSIFICACAO	INT,
	@USUARIO_OPERACAO	VARCHAR(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN

			INSERT INTO [log].[CLASSIFICACAO] ( ID_CLASSIFICACAO, DESCRICAO, ATIVO, USUARIO_OPERACAO, DATA_OPERACAO, STATUS_OPERACAO )
			SELECT @ID_CLASSIFICACAO, DESCRICAO, ATIVO, @USUARIO_OPERACAO, GETDATE(), 'DELETE' FROM [sis].[CLASSIFICACAO] WHERE ID_CLASSIFICACAO =@ID_CLASSIFICACAO

			DELETE FROM [sis].[CLASSIFICACAO]
			WHERE ID_CLASSIFICACAO = @ID_CLASSIFICACAO

		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE   PROCEDURE [sis].[P_CLASSIFICACAO_ATIVAR] (
	@ID_CLASSIFICACAO	INT,
	@USUARIO_OPERACAO	VARCHAR(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			UPDATE [sis].[CLASSIFICACAO] SET
				[ATIVO]				= 1,
				[USUARIO_OPERACAO]	= @USUARIO_OPERACAO,
				[DATA_OPERACAO]		= GETDATE()
			WHERE ID_CLASSIFICACAO = @ID_CLASSIFICACAO
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE   PROCEDURE [sis].[P_CLASSIFICACAO_DESATIVAR] (
	@ID_CLASSIFICACAO	INT,
	@USUARIO_OPERACAO	VARCHAR(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			UPDATE [sis].[CLASSIFICACAO] SET
				[ATIVO]				= 0,
				[USUARIO_OPERACAO]	= @USUARIO_OPERACAO,
				[DATA_OPERACAO]		= GETDATE()
			WHERE ID_CLASSIFICACAO = @ID_CLASSIFICACAO
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE   PROCEDURE [sis].[P_ATIVIDADE_INSERT] (
	@DESCRICAO			VARCHAR(100),
	@USUARIO_OPERACAO	VARCHAR(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN

		INSERT INTO [sis].[ATIVIDADE] ( DESCRICAO, ATIVO, USUARIO_OPERACAO, DATA_OPERACAO)
		VALUES ( @DESCRICAO, 1, @USUARIO_OPERACAO, GETDATE())

		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE   PROCEDURE [sis].[P_ATIVIDADE_DESATIVAR] (
	@ID_ATIVIDADE	INT,
	@USUARIO_OPERACAO	VARCHAR(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			UPDATE [sis].[ATIVIDADE] SET
				[ATIVO]				= 0,
				[USUARIO_OPERACAO]	= @USUARIO_OPERACAO,
				[DATA_OPERACAO]		= GETDATE()
			WHERE ID_ATIVIDADE = @ID_ATIVIDADE
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE   PROCEDURE [sis].[P_ATIVIDADE_ATIVAR] (
	@ID_ATIVIDADE	INT,
	@USUARIO_OPERACAO	VARCHAR(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			UPDATE [sis].[ATIVIDADE] SET
				[ATIVO]				= 1,
				[USUARIO_OPERACAO]	= @USUARIO_OPERACAO,
				[DATA_OPERACAO]		= GETDATE()
			WHERE ID_ATIVIDADE = @ID_ATIVIDADE
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE   PROCEDURE [sis].[P_ATIVIDADE_DELETE] (
	@ID_ATIVIDADE	INT,
	@USUARIO_OPERACAO	VARCHAR(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN

			INSERT INTO [log].[ATIVIDADE] ( ID_ATIVIDADE, DESCRICAO, ATIVO, USUARIO_OPERACAO, DATA_OPERACAO, STATUS_OPERACAO )
			SELECT @ID_ATIVIDADE, DESCRICAO, ATIVO, @USUARIO_OPERACAO, GETDATE(), 'DELETE' FROM [sis].[ATIVIDADE] WHERE ID_ATIVIDADE =@ID_ATIVIDADE

			DELETE FROM [sis].[ATIVIDADE]
			WHERE ID_ATIVIDADE = @ID_ATIVIDADE

		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE   PROCEDURE [sis].[P_ATIVIDADE_UPDATE] (
	@ID_ATIVIDADE	INT,
	@DESCRICAO			VARCHAR(100),
	@USUARIO_OPERACAO	VARCHAR(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN

		UPDATE [sis].[ATIVIDADE] SET
			DESCRICAO		 =@DESCRICAO,
			USUARIO_OPERACAO =@USUARIO_OPERACAO,
			DATA_OPERACAO 	 = GETDATE()
		WHERE ID_ATIVIDADE =@ID_ATIVIDADE

		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE   PROCEDURE [cfg].[P_CONFIGURACAO_DELETE] (
	@ID_CONFIGURACAO	INT,
	@USUARIO_OPERACAO	VARCHAR(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN

		INSERT INTO [log].[CONFIGURACAO] ( ID_CONFIGURACAO, FIN_ANO_CONTABIL, FIN_DIA_VENCIMENTO, FIN_JUROS_DIA, ATIVO, USUARIO_OPERACAO, DATA_OPERACAO, STATUS_OPERACAO )
		SELECT ID_CONFIGURACAO, FIN_ANO_CONTABIL, FIN_DIA_VENCIMENTO, FIN_JUROS_DIA, ATIVO, @USUARIO_OPERACAO, GETDATE(), 'DELETE' FROM [cfg].[CONFIGURACAO] WHERE ID_CONFIGURACAO =@ID_CONFIGURACAO

		DELETE FROM [cfg].[CONFIGURACAO]
		WHERE ID_CONFIGURACAO =@ID_CONFIGURACAO

		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE   FUNCTION [sis].[F_REFERENCIA](
	@ANO_ATUAL CHAR(4) )
RETURNS @tbl TABLE(ANO CHAR(4), REFER CHAR(6))
AS
BEGIN
	DECLARE
		@QTDE	INT,
		@I		INT,
		@ANO	VARCHAR(4)

	SET @QTDE = ( SELECT COUNT(FIN_ANO_CONTABIL) FROM [cfg].[CONFIGURACAO] WHERE FIN_ANO_CONTABIL >= @ANO_ATUAL AND FIN_ANO_CONTABIL NOT IN ( SELECT ANO FROM @tbl ) )

	WHILE @QTDE > 0
		BEGIN
			SET @ANO = ( SELECT TOP 1 FIN_ANO_CONTABIL FROM [cfg].[CONFIGURACAO] WHERE FIN_ANO_CONTABIL >= @ANO_ATUAL AND FIN_ANO_CONTABIL NOT IN ( SELECT ANO FROM @tbl ) ORDER BY FIN_ANO_CONTABIL ASC )
			SET @I = 1

			WHILE @I <= 12
				BEGIN
					INSERT INTO @tbl ( ANO, REFER ) VALUES ( @ANO, REPLICATE( '0', (2 - LEN(@I) ) ) + CAST( @I AS varchar(2) ) + @ANO )

					SET @I = @I + 1
				END

			SET @QTDE = ( SELECT COUNT(FIN_ANO_CONTABIL) FROM [cfg].[CONFIGURACAO] WHERE FIN_ANO_CONTABIL >= @ANO_ATUAL AND FIN_ANO_CONTABIL NOT IN ( SELECT ANO FROM @tbl ) )
		END

	RETURN
END
GO


CREATE   PROCEDURE [sis].[P_CONCESSAO_DESCONTO] (
	@ID_PESSOA			INT,
	@REFER				CHAR(6),
	@DT_VENCIMENTO		SMALLDATETIME,
	@VL_REFER			SMALLMONEY,
	@VL_DESCONTO		SMALLMONEY,
	@USUARIO_OPERACAO	VARCHAR(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @ID_FINANCEIRO INT

	BEGIN TRY
		BEGIN TRAN
			SET @ID_FINANCEIRO = ( SELECT COALESCE( ( SELECT ID_FINANCEIRO FROM [sis].[FINANCEIRO] WHERE ID_PESSOA =@ID_PESSOA AND REFER = @REFER ), 0 ) )

			IF @ID_FINANCEIRO = 0
				BEGIN
					EXEC [sis].[P_FINANCEIRO_INSERT] @ID_PESSOA, @REFER, @DT_VENCIMENTO, @VL_REFER, @VL_DESCONTO, NULL, NULL, @USUARIO_OPERACAO
				END
			ELSE
				BEGIN
					EXEC [sis].[P_FINANCEIRO_UPDATE] @ID_FINANCEIRO, @ID_PESSOA, @REFER, @DT_VENCIMENTO, @VL_REFER, @VL_DESCONTO, NULL, NULL, @USUARIO_OPERACAO
				END
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE   PROCEDURE [sis].[P_FINANCEIRO_BAIXA] (
	@ID_FINANCEIRO		INT,
	@ID_FORMA_PAGAMENTO	INT,
	@DT_PAGAMENTO		SMALLDATETIME,
	@VL_PAGO			SMALLMONEY,
	@USUARIO_OPERACAO	VARCHAR(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN

		UPDATE [sis].[FINANCEIRO] SET
			ID_FORMA_PAGAMENTO  =@ID_FORMA_PAGAMENTO,
			DT_PAGAMENTO		=@DT_PAGAMENTO,
			VL_PAGO				=@VL_PAGO,
			USUARIO_OPERACAO	=@USUARIO_OPERACAO,
			DATA_OPERACAO		=GETDATE()
		WHERE ID_FINANCEIRO =@ID_FINANCEIRO

		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE     PROCEDURE [sis].[P_FINANCEIRO_ESTORNO_INSERT] (
	@ID_FINANCEIRO		int,
	@OBSERVACAO			varchar(200),
	@USUARIO_OPERACAO	varchar(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			INSERT INTO [sis].[FINANCEIRO_ESTORNO] (ID_FINANCEIRO, OBSERVACAO, USUARIO_OPERACAO, DATA_OPERACAO)
			VALUES ( @ID_FINANCEIRO, @OBSERVACAO, @USUARIO_OPERACAO, GETDATE())
		COMMIT TRAN

		BEGIN TRAN
			UPDATE [sis].[FINANCEIRO] SET
				DT_PAGAMENTO = NULL,
				VL_PAGO = NULL
			WHERE ID_FINANCEIRO = @ID_FINANCEIRO
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE     PROCEDURE [sis].[P_FINANCEIRO_ALTERACAO_INSERT] (
	@ID_FINANCEIRO			INT,
	@DT_VENCIMENTO			SMALLDATETIME,
	@VL_DESCONTO_ORIGINAL	SMALLMONEY,
	@VL_DESCONTO			SMALLMONEY,
	@VL_JUROS_ORIGINAL		SMALLMONEY,
	@VL_JUROS				SMALLMONEY,
	@OBSERVACAO				VARCHAR(200),
	@USUARIO_OPERACAO		VARCHAR(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			INSERT INTO [sis].[FINANCEIRO_ALTERACAO] (ID_FINANCEIRO, DT_VENCIMENTO, VL_DESCONTO_ORIGINAL, VL_DESCONTO, VL_JUROS_ORIGINAL, VL_JUROS, OBSERVACAO, USUARIO_OPERACAO, DATA_OPERACAO)
			VALUES ( @ID_FINANCEIRO, @DT_VENCIMENTO, @VL_DESCONTO_ORIGINAL, @VL_DESCONTO, @VL_JUROS_ORIGINAL, @VL_JUROS, @OBSERVACAO, @USUARIO_OPERACAO, GETDATE())
		COMMIT TRAN

		BEGIN TRAN
			UPDATE [sis].[FINANCEIRO] SET
				DT_VENCIMENTO = CONVERT(VARCHAR, @DT_VENCIMENTO, 23),
				VL_DESCONTO	  = @VL_DESCONTO,
				@VL_JUROS     = @VL_JUROS
			WHERE ID_FINANCEIRO = @ID_FINANCEIRO
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE PROCEDURE [cfg].[P_ESTADO_CIVIL_INSERT] (   
	@DESCRICAO			varchar(100),
	@USUARIO_OPERACAO	varchar(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN

		INSERT INTO [cfg].[ESTADO_CIVIL] ( DESCRICAO, ATIVO, USUARIO_OPERACAO, DATA_OPERACAO)
		VALUES ( @DESCRICAO, 1, @USUARIO_OPERACAO, GETDATE())

		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO
GO


CREATE PROCEDURE [cfg].[P_ESTADO_CIVIL_UPDATE] (
	@ID_ESTADO_CIVIL	int,    
	@DESCRICAO			varchar(100),
	@USUARIO_OPERACAO	varchar(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN

		UPDATE [cfg].[ESTADO_CIVIL] SET    
			DESCRICAO 		 = @DESCRICAO,
			USUARIO_OPERACAO = @USUARIO_OPERACAO,
			DATA_OPERACAO 	 = GETDATE()
		WHERE ID_ESTADO_CIVIL = @ID_ESTADO_CIVIL

		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO
GO


CREATE PROCEDURE [cfg].[P_ESTADO_CIVIL_ATIVAR] (
	@ID_ESTADO_CIVIL	INT,
	@USUARIO_OPERACAO	VARCHAR(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			UPDATE [cfg].[ESTADO_CIVIL] SET
				[ATIVO]				= 1,
				[USUARIO_OPERACAO]	= @USUARIO_OPERACAO,
				[DATA_OPERACAO]		= GETDATE()
			WHERE ID_ESTADO_CIVIL = @ID_ESTADO_CIVIL
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO
GO


CREATE PROCEDURE [cfg].[P_ESTADO_CIVIL_DESATIVAR] (
	@ID_ESTADO_CIVIL			INT,
	@USUARIO_OPERACAO	VARCHAR(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			UPDATE [cfg].[ESTADO_CIVIL] SET
				[ATIVO]				= 0,
				[USUARIO_OPERACAO]	= @USUARIO_OPERACAO,
				[DATA_OPERACAO]		= GETDATE()
			WHERE ID_ESTADO_CIVIL = @ID_ESTADO_CIVIL
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO
GO


CREATE PROCEDURE [sis].[P_SANTO_INSERT] (
	@ID_PESSOA			INT,
	@DESCRICAO			VARCHAR(100),
	@USUARIO_OPERACAO	VARCHAR(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN

			INSERT INTO [sis].[SANTO] ( ID_PESSOA, DESCRICAO, USUARIO_OPERACAO, DATA_OPERACAO )
			VALUES ( @ID_PESSOA, @DESCRICAO, @USUARIO_OPERACAO, GETDATE() )

		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO
GO


CREATE PROCEDURE [sis].[P_SANTO_DELETE] (
	@ID_PESSOA			INT,
	@USUARIO_OPERACAO	VARCHAR(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN

			INSERT INTO [log].[SANTO] ( ID_SANTO, ID_PESSOA, DESCRICAO, USUARIO_OPERACAO, DATA_OPERACAO, STATUS_OPERACAO )
			SELECT ID_SANTO, @ID_PESSOA, DESCRICAO, @USUARIO_OPERACAO, GETDATE(), 'DELETE' FROM [sis].[SANTO] WHERE ID_PESSOA =@ID_PESSOA

			DELETE FROM [sis].[SANTO]
			WHERE ID_PESSOA =@ID_PESSOA

		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO
GO


CREATE PROCEDURE [sis].[P_OBRIGACAO_INSERT] (
	@ID_PESSOA			INT,
	@DESCRICAO			VARCHAR(100),
	@DATA				SMALLDATETIME,
	@USUARIO_OPERACAO	VARCHAR(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN

			INSERT INTO [sis].[OBRIGACAO] ( ID_PESSOA, DESCRICAO, [DATA], USUARIO_OPERACAO, DATA_OPERACAO )
			VALUES ( @ID_PESSOA, @DESCRICAO, @DATA, @USUARIO_OPERACAO, GETDATE() )

		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO
GO


CREATE PROCEDURE [sis].[P_OBRIGACAO_DELETE] (
	@ID_PESSOA			INT,
	@USUARIO_OPERACAO	VARCHAR(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN

			INSERT INTO [log].[OBRIGACAO] ( ID_OBRIGACAO, ID_PESSOA, DESCRICAO, [DATA], USUARIO_OPERACAO, DATA_OPERACAO, STATUS_OPERACAO )
			SELECT ID_OBRIGACAO, @ID_PESSOA, DESCRICAO, [DATA], @USUARIO_OPERACAO, GETDATE(), 'DELETE' FROM [sis].[OBRIGACAO] WHERE ID_PESSOA =@ID_PESSOA

			DELETE FROM [sis].[OBRIGACAO]
			WHERE ID_PESSOA =@ID_PESSOA

		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO
GO


CREATE PROCEDURE [sis].[P_CONCESSAO_DESCONTO_FILANTROPIA] (
	@ID_PESSOA			INT,
	@REFER				CHAR(6),	
	@TIPO_DESCONTO		INT,
	@VL_DESCONTO		SMALLMONEY,
	@USUARIO_OPERACAO	VARCHAR(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @ID_FINANCEIRO	INT,
			@DT_VENCIMENTO	SMALLDATETIME,
			@VL_REFER		SMALLMONEY,
			@DESCONTO		SMALLMONEY

	BEGIN TRY
		BEGIN TRAN
			SET @ID_FINANCEIRO = ( SELECT COALESCE( ( SELECT ID_FINANCEIRO FROM [sis].[FINANCEIRO] WHERE ID_PESSOA =@ID_PESSOA AND REFER = @REFER ), 0 ) )
			SET @DT_VENCIMENTO = ( SELECT DT_VENCIMENTO FROM [sis].[FINANCEIRO] WHERE ID_FINANCEIRO =@ID_FINANCEIRO )
			SET @VL_REFER      = ( SELECT VL_REFER FROM [sis].[FINANCEIRO] WHERE ID_FINANCEIRO =@ID_FINANCEIRO )

			IF @TIPO_DESCONTO = 0 --PERCENTUAL
				SET @DESCONTO = ( @VL_REFER * @VL_DESCONTO ) / 100	
			ELSE --VALOR
				SET @DESCONTO = @VL_DESCONTO

			IF @ID_FINANCEIRO = 0
				BEGIN
					EXEC [sis].[P_FINANCEIRO_INSERT] @ID_PESSOA, @REFER, @DT_VENCIMENTO, @VL_REFER, @DESCONTO, NULL, NULL, @USUARIO_OPERACAO
				END
			ELSE
				BEGIN
					EXEC [sis].[P_FINANCEIRO_UPDATE] @ID_FINANCEIRO, @ID_PESSOA, @REFER, @DT_VENCIMENTO, @VL_REFER, @DESCONTO, NULL, NULL, @USUARIO_OPERACAO
				END
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO
GO


CREATE PROCEDURE [sis].[P_FORMA_PAGAMENTO_INSERT] (
	@DESCRICAO			varchar(100),
	@USUARIO_OPERACAO	varchar(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN

		INSERT INTO [sis].[FORMA_PAGAMENTO] ( DESCRICAO, ATIVO, USUARIO_OPERACAO, DATA_OPERACAO)
		VALUES ( @DESCRICAO, 1, @USUARIO_OPERACAO, GETDATE())

		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO
GO


CREATE PROCEDURE [sis].[P_FORMA_PAGAMENTO_UPDATE] (
	@ID_FORMA_PAGAMENTO	int,
	@DESCRICAO			varchar(100),
	@USUARIO_OPERACAO	varchar(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN

		UPDATE [sis].[FORMA_PAGAMENTO] SET
			DESCRICAO 		 = @DESCRICAO,
			USUARIO_OPERACAO = @USUARIO_OPERACAO,
			DATA_OPERACAO 	 = GETDATE()
		WHERE ID_FORMA_PAGAMENTO = @ID_FORMA_PAGAMENTO

		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO
GO


CREATE PROCEDURE [sis].[P_FORMA_PAGAMENTO_DESATIVAR] (
	@ID_FORMA_PAGAMENTO			INT,
	@USUARIO_OPERACAO	VARCHAR(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			UPDATE [sis].[FORMA_PAGAMENTO] SET
				[ATIVO]				= 0,
				[USUARIO_OPERACAO]	= @USUARIO_OPERACAO,
				[DATA_OPERACAO]		= GETDATE()
			WHERE ID_FORMA_PAGAMENTO = @ID_FORMA_PAGAMENTO
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO
GO


CREATE   PROCEDURE [sis].[P_FORMA_PAGAMENTO_ATIVAR] (
	@ID_FORMA_PAGAMENTO			INT,
	@USUARIO_OPERACAO	VARCHAR(20)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			UPDATE [sis].[FORMA_PAGAMENTO] SET
				[ATIVO]				= 1,
				[USUARIO_OPERACAO]	= @USUARIO_OPERACAO,
				[DATA_OPERACAO]		= GETDATE()
			WHERE ID_FORMA_PAGAMENTO = @ID_FORMA_PAGAMENTO
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO
GO


CREATE PROCEDURE [sis].[P_PAGAMENTO_DIVERSO_INSERT] (    
	@ID_PESSOA			INT,
	@ID_FORMA_PAGAMENTO	INT,
	@DATA_PAGAMENTO		SMALLDATETIME,
	@VALOR				SMALLMONEY,
	@DESCRICAO			VARCHAR(100),
	@USUARIO_OPERACAO	VARCHAR(20) )
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN

		INSERT INTO [sis].[PAGAMENTO_DIVERSO] (ID_PESSOA, ID_FORMA_PAGAMENTO, DATA_PAGAMENTO, VALOR, DESCRICAO, USUARIO_OPERACAO, DATA_OPERACAO)
		VALUES ( @ID_PESSOA, @ID_FORMA_PAGAMENTO, @DATA_PAGAMENTO, @VALOR, @DESCRICAO, @USUARIO_OPERACAO, GETDATE())

		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE PROCEDURE [sis].[P_PAGAMENTO_DIVERSO_UPDATE] (     
	@ID_PAGAMENTO_DIVERSO	INT,  
	@ID_PESSOA				INT,
	@ID_FORMA_PAGAMENTO		INT,	
	@DATA_PAGAMENTO			SMALLDATETIME,
	@VALOR					SMALLMONEY,
	@DESCRICAO				VARCHAR(100),
	@USUARIO_OPERACAO		VARCHAR(20) )
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN

		UPDATE [sis].[PAGAMENTO_DIVERSO] SET
			ID_PESSOA			=@ID_PESSOA,
			ID_FORMA_PAGAMENTO  =@ID_FORMA_PAGAMENTO, 
			DATA_PAGAMENTO		=@DATA_PAGAMENTO, 
			VALOR				=@VALOR,
			DESCRICAO			=@DESCRICAO,
			USUARIO_OPERACAO	=@USUARIO_OPERACAO,
			DATA_OPERACAO		=GETDATE()
		WHERE ID_PAGAMENTO_DIVERSO =@ID_PAGAMENTO_DIVERSO

		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE PROCEDURE [sis].[P_PAGAMENTO_DIVERSO_DELETE] (
	@ID_PAGAMENTO_DIVERSO	INT,
	@USUARIO_OPERACAO		VARCHAR(20) )
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			
			INSERT INTO [log].[PAGAMENTO_DIVERSO] (ID_PAGAMENTO_DIVERSO, ID_PESSOA, ID_FORMA_PAGAMENTO, DATA_PAGAMENTO, VALOR, DESCRICAO, USUARIO_OPERACAO, DATA_OPERACAO, STATUS_OPERACAO)
			SELECT ID_PAGAMENTO_DIVERSO, ID_PESSOA, ID_FORMA_PAGAMENTO, DATA_PAGAMENTO, VALOR, DESCRICAO, @USUARIO_OPERACAO, GETDATE(), 'DELETE' FROM [sis].[PAGAMENTO_DIVERSO] WHERE ID_PAGAMENTO_DIVERSO =@ID_PAGAMENTO_DIVERSO

		COMMIT TRAN
		
		BEGIN TRAN

		DELETE FROM [sis].[PAGAMENTO_DIVERSO] WHERE ID_PAGAMENTO_DIVERSO =@ID_PAGAMENTO_DIVERSO

		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


/* ---------------------------------------------------------------------- */
/* Add triggers                                                           */
/* ---------------------------------------------------------------------- */

GO


CREATE TRIGGER [cfg].[T_USUARIO_INSERT]
   ON  [cfg].[USUARIO]
   AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			INSERT INTO [log].[USUARIO] ( [ID_USUARIO], [LOGIN], [SENHA], [NOME], [DT_NASCIMENTO], [ATIVO], [USUARIO_OPERACAO], [DATA_OPERACAO], [STATUS_OPERACAO] )
			SELECT [ID_USUARIO], [LOGIN], [SENHA], [NOME], [DT_NASCIMENTO], [ATIVO], [USUARIO_OPERACAO], GETDATE(), 'INSERT' FROM INSERTED
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE   TRIGGER [cfg].[T_USUARIO_UPDATE]
   ON  [cfg].[USUARIO]
   AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			INSERT INTO [log].[USUARIO] ( [ID_USUARIO], [LOGIN], [SENHA], [NOME], [DT_NASCIMENTO], [ATIVO], [USUARIO_OPERACAO], [DATA_OPERACAO], [STATUS_OPERACAO] )
			SELECT [ID_USUARIO], [LOGIN], [SENHA], [NOME], [DT_NASCIMENTO], [ATIVO], [USUARIO_OPERACAO], GETDATE(), 'UPDATE' FROM INSERTED
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE TRIGGER [cfg].[T_MODULO_INSERT]
   ON  [cfg].[MODULO]
   AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			INSERT INTO [log].[MODULO] ( [ID_MODULO], ID_MODULO_PAI, [DESCRICAO], [COMPONENTE], [ATIVO], [USUARIO_OPERACAO], [DATA_OPERACAO], [STATUS_OPERACAO] )
			SELECT [ID_MODULO], ID_MODULO_PAI, [DESCRICAO], [COMPONENTE], [ATIVO], [USUARIO_OPERACAO], GETDATE(), 'INSERT' FROM INSERTED
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE TRIGGER [cfg].[T_MODULO_UPDATE]
   ON  [cfg].[MODULO]
   AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			INSERT INTO [log].[MODULO] ( [ID_MODULO], ID_MODULO_PAI, [DESCRICAO], [COMPONENTE], [ATIVO], [USUARIO_OPERACAO], [DATA_OPERACAO], [STATUS_OPERACAO] )
			SELECT [ID_MODULO], ID_MODULO_PAI, [DESCRICAO], [COMPONENTE], [ATIVO], [USUARIO_OPERACAO], GETDATE(), 'UPDATE' FROM INSERTED
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE TRIGGER [cfg].[T_USUARIO_MODULO_INSERT]
   ON  [cfg].[USUARIO_MODULO]
   AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			INSERT INTO [log].[USUARIO_MODULO] ( ID_USUARIO_MODULO, ID_USUARIO, ID_MODULO, PERMISSAO, BLOQUEADO, [USUARIO_OPERACAO], [DATA_OPERACAO], [STATUS_OPERACAO] )
			SELECT ID_USUARIO_MODULO, ID_USUARIO, ID_MODULO, PERMISSAO, BLOQUEADO, [USUARIO_OPERACAO], GETDATE(), 'INSERT' FROM INSERTED
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE TRIGGER [cfg].[T_USUARIO_MODULO_UPDATE]
   ON  [cfg].[USUARIO_MODULO]
   AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			INSERT INTO [log].[USUARIO_MODULO] ( ID_USUARIO_MODULO, ID_USUARIO, ID_MODULO, PERMISSAO, BLOQUEADO, [USUARIO_OPERACAO], [DATA_OPERACAO], [STATUS_OPERACAO] )
			SELECT ID_USUARIO_MODULO, ID_USUARIO, ID_MODULO, PERMISSAO, BLOQUEADO, [USUARIO_OPERACAO], GETDATE(), 'INSERT' FROM INSERTED
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE TRIGGER [sis].[T_ENDERECO_INSERT]
   ON  [sis].[ENDERECO]
   AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			INSERT INTO [log].[ENDERECO] ( ID_ENDERECO, ID_PESSOA, ID_TIPO_ENDERECO, ID_CIDADE, LOGRADOURO, NUMERO, COMPLEMENTO, BAIRRO, CEP, ATIVO, USUARIO_OPERACAO, DATA_OPERACAO, STATUS_OPERACAO )
			SELECT ID_ENDERECO, ID_PESSOA, ID_TIPO_ENDERECO, ID_CIDADE, LOGRADOURO, NUMERO, COMPLEMENTO, BAIRRO, CEP, ATIVO, USUARIO_OPERACAO, GETDATE(), 'INSERT' FROM INSERTED
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE TRIGGER [sis].[T_ENDERECO_UPDATE]
   ON  [sis].[ENDERECO]
   AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			INSERT INTO [log].[ENDERECO] ( ID_ENDERECO, ID_PESSOA, ID_TIPO_ENDERECO, ID_CIDADE, LOGRADOURO, NUMERO, COMPLEMENTO, BAIRRO, CEP, ATIVO, USUARIO_OPERACAO, DATA_OPERACAO, STATUS_OPERACAO )
			SELECT ID_ENDERECO, ID_PESSOA, ID_TIPO_ENDERECO, ID_CIDADE, LOGRADOURO, NUMERO, COMPLEMENTO, BAIRRO, CEP, ATIVO, USUARIO_OPERACAO, GETDATE(), 'UPDATE' FROM INSERTED
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE TRIGGER [sis].[T_CONTATO_INSERT]
   ON  [sis].[CONTATO]
   AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			INSERT INTO [log].[CONTATO] ( ID_CONTATO, ID_PESSOA, ID_TIPO_CONTATO, DESCRICAO, ATIVO, USUARIO_OPERACAO, DATA_OPERACAO, STATUS_OPERACAO )
			SELECT ID_CONTATO, ID_PESSOA, ID_TIPO_CONTATO, DESCRICAO, ATIVO, USUARIO_OPERACAO, GETDATE(), 'INSERT' FROM INSERTED
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE TRIGGER [sis].[T_CONTATO_UPDATE]
   ON  [sis].[CONTATO]
   AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			INSERT INTO [log].[CONTATO] ( ID_CONTATO, ID_PESSOA, ID_TIPO_CONTATO, DESCRICAO, ATIVO, USUARIO_OPERACAO, DATA_OPERACAO, STATUS_OPERACAO )
			SELECT ID_CONTATO, ID_PESSOA, ID_TIPO_CONTATO, DESCRICAO, ATIVO, USUARIO_OPERACAO, GETDATE(), 'UPDATE' FROM INSERTED
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE TRIGGER [sis].[T_PESSOA_INSERT]
   ON  sis.PESSOA
   AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			INSERT INTO [log].[PESSOA] ( ID_PESSOA, ID_CLASSIFICACAO, ID_ATIVIDADE, ID_ESTADO_CIVIL, ID_CIDADE, MATRICULA, NOME, DT_NASCIMENTO, ATIVO, PAI, MAE, PROFISSAO, CONJUGE, 
			                             RAZAO_SOCIAL, LOGRADOURO, NUMERO, COMPLEMENTO, BAIRRO, CEP, DATA_ADMISSAO_TERREIRO, USUARIO_OPERACAO, DATA_OPERACAO, STATUS_OPERACAO  )
			SELECT ID_PESSOA, ID_CLASSIFICACAO, ID_ATIVIDADE, ID_ESTADO_CIVIL, ID_CIDADE, MATRICULA, NOME, DT_NASCIMENTO, ATIVO, PAI, MAE, PROFISSAO, CONJUGE, 
                   RAZAO_SOCIAL, LOGRADOURO, NUMERO, COMPLEMENTO, BAIRRO, CEP, DATA_ADMISSAO_TERREIRO, USUARIO_OPERACAO, GETDATE(), 'INSERT' FROM INSERTED 
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE TRIGGER [sis].[T_PESSOA_UPDATE]
   ON  sis.PESSOA
   AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN			
			INSERT INTO [log].[PESSOA] ( ID_PESSOA, ID_CLASSIFICACAO, ID_ATIVIDADE, ID_ESTADO_CIVIL, ID_CIDADE, MATRICULA, NOME, DT_NASCIMENTO, ATIVO, PAI, MAE, PROFISSAO, CONJUGE, 
			                             RAZAO_SOCIAL, LOGRADOURO, NUMERO, COMPLEMENTO, BAIRRO, CEP, DATA_ADMISSAO_TERREIRO, USUARIO_OPERACAO, DATA_OPERACAO, STATUS_OPERACAO  )
			SELECT ID_PESSOA, ID_CLASSIFICACAO, ID_ATIVIDADE, ID_ESTADO_CIVIL, ID_CIDADE, MATRICULA, NOME, DT_NASCIMENTO, ATIVO, PAI, MAE, PROFISSAO, CONJUGE, 
                   RAZAO_SOCIAL, LOGRADOURO, NUMERO, COMPLEMENTO, BAIRRO, CEP, DATA_ADMISSAO_TERREIRO, USUARIO_OPERACAO, GETDATE(), 'UPDATE' FROM INSERTED 
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE TRIGGER [sis].[T_TIPO_CONTATO_INSERT]
   ON  [sis].[TIPO_CONTATO]
   AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			INSERT INTO [log].[TIPO_CONTATO] ( ID_TIPO_CONTATO, DESCRICAO, ATIVO, USUARIO_OPERACAO, DATA_OPERACAO, STATUS_OPERACAO )
			SELECT ID_TIPO_CONTATO, DESCRICAO, ATIVO, USUARIO_OPERACAO, GETDATE(), 'INSERT' FROM INSERTED
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE TRIGGER [sis].[T_TIPO_CONTATO_UPDATE]
   ON  [sis].[TIPO_CONTATO]
   AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			INSERT INTO [log].[TIPO_CONTATO] ( ID_TIPO_CONTATO, DESCRICAO, ATIVO, USUARIO_OPERACAO, DATA_OPERACAO, STATUS_OPERACAO )
			SELECT ID_TIPO_CONTATO, DESCRICAO, ATIVO, USUARIO_OPERACAO, GETDATE(), 'UPDATE' FROM INSERTED
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE TRIGGER [sis].[T_TIPO_ENDERECO_INSERT]
   ON  [sis].[TIPO_ENDERECO]
   AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			INSERT INTO [log].[TIPO_ENDERECO] ( ID_TIPO_ENDERECO, DESCRICAO, ATIVO, USUARIO_OPERACAO, DATA_OPERACAO, STATUS_OPERACAO )
			SELECT ID_TIPO_ENDERECO, DESCRICAO, ATIVO, USUARIO_OPERACAO, GETDATE(), 'INSERT' FROM INSERTED
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE TRIGGER [sis].[T_TIPO_ENDERECO_UPDATE]
   ON  [sis].[TIPO_ENDERECO]
   AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			INSERT INTO [log].[TIPO_ENDERECO] ( ID_TIPO_ENDERECO, DESCRICAO, ATIVO, USUARIO_OPERACAO, DATA_OPERACAO, STATUS_OPERACAO )
			SELECT ID_TIPO_ENDERECO, DESCRICAO, ATIVO, USUARIO_OPERACAO, GETDATE(), 'UPDATE' FROM INSERTED
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE TRIGGER [sis].[T_DOCUMENTO_INSERT]
   ON  [sis].[DOCUMENTO]
   AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			INSERT INTO [log].[DOCUMENTO] ( ID_DOCUMENTO, ID_PESSOA, ID_TIPO_DOCUMENTO, DESCRICAO, ATIVO, USUARIO_OPERACAO, DATA_OPERACAO, STATUS_OPERACAO )
			SELECT ID_DOCUMENTO, ID_PESSOA, ID_TIPO_DOCUMENTO, DESCRICAO, ATIVO, USUARIO_OPERACAO, GETDATE(), 'INSERT' FROM INSERTED
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE TRIGGER [sis].[T_DOCUMENTO_UPDATE]
   ON  [sis].[DOCUMENTO]
   AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			INSERT INTO [log].[DOCUMENTO] ( ID_DOCUMENTO, ID_PESSOA, ID_TIPO_DOCUMENTO, DESCRICAO, ATIVO, USUARIO_OPERACAO, DATA_OPERACAO, STATUS_OPERACAO )
			SELECT ID_DOCUMENTO, ID_PESSOA, ID_TIPO_DOCUMENTO, DESCRICAO, ATIVO, USUARIO_OPERACAO, GETDATE(), 'UPDATE' FROM INSERTED
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE TRIGGER [sis].[T_TIPO_DOCUMENTO_INSERT]
   ON  [sis].[TIPO_DOCUMENTO]
   AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			INSERT INTO [log].[TIPO_DOCUMENTO] ( ID_TIPO_DOCUMENTO, DESCRICAO, ATIVO, USUARIO_OPERACAO, DATA_OPERACAO, STATUS_OPERACAO )
			SELECT ID_TIPO_DOCUMENTO, DESCRICAO, ATIVO, USUARIO_OPERACAO, GETDATE(), 'INSERT' FROM INSERTED
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE TRIGGER [sis].[T_TIPO_DOCUMENTO_UPDATE]
   ON  [sis].[TIPO_DOCUMENTO]
   AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			INSERT INTO [log].[TIPO_DOCUMENTO] ( ID_TIPO_DOCUMENTO, DESCRICAO, ATIVO, USUARIO_OPERACAO, DATA_OPERACAO, STATUS_OPERACAO )
			SELECT ID_TIPO_DOCUMENTO, DESCRICAO, ATIVO, USUARIO_OPERACAO, GETDATE(), 'UPDATE' FROM INSERTED
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE   TRIGGER [sis].[T_ATIVIDADE_INSERT]
   ON  [sis].[ATIVIDADE]
   AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			INSERT INTO [log].[ATIVIDADE] ( ID_ATIVIDADE, DESCRICAO, ATIVO, USUARIO_OPERACAO, DATA_OPERACAO, STATUS_OPERACAO )
			SELECT ID_ATIVIDADE, DESCRICAO, ATIVO, USUARIO_OPERACAO, GETDATE(), 'INSERT' FROM INSERTED
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE   TRIGGER [sis].[T_ATIVIDADE_UPDATE]
   ON  [sis].[ATIVIDADE]
   AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			INSERT INTO [log].[ATIVIDADE] ( ID_ATIVIDADE, DESCRICAO, ATIVO, USUARIO_OPERACAO, DATA_OPERACAO, STATUS_OPERACAO )
			SELECT ID_ATIVIDADE, DESCRICAO, ATIVO, USUARIO_OPERACAO, GETDATE(), 'UPDATE' FROM INSERTED
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE   TRIGGER [sis].[T_CLASSIFICACAO_INSERT]
   ON  [sis].[CLASSIFICACAO]
   AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			INSERT INTO [log].[CLASSIFICACAO] ( ID_CLASSIFICACAO, DESCRICAO, ATIVO, USUARIO_OPERACAO, DATA_OPERACAO, STATUS_OPERACAO )
			SELECT ID_CLASSIFICACAO, DESCRICAO, ATIVO, USUARIO_OPERACAO, GETDATE(), 'INSERT' FROM INSERTED
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE   TRIGGER [sis].[T_CLASSIFICACAO_UPDATE]
   ON  [sis].[CLASSIFICACAO]
   AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			INSERT INTO [log].[CLASSIFICACAO] ( ID_CLASSIFICACAO, DESCRICAO, ATIVO, USUARIO_OPERACAO, DATA_OPERACAO, STATUS_OPERACAO )
			SELECT ID_CLASSIFICACAO, DESCRICAO, ATIVO, USUARIO_OPERACAO, GETDATE(), 'UPDATE' FROM INSERTED
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE   TRIGGER [cfg].[T_CONFIGURACAO_UPDATE]
   ON  [cfg].[CONFIGURACAO]
   AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			INSERT INTO [log].[CONFIGURACAO] ( ID_CONFIGURACAO, FIN_ANO_CONTABIL, FIN_DIA_VENCIMENTO, FIN_JUROS_DIA, ATIVO, [USUARIO_OPERACAO], [DATA_OPERACAO], [STATUS_OPERACAO] )
			SELECT ID_CONFIGURACAO, FIN_ANO_CONTABIL, FIN_DIA_VENCIMENTO, FIN_JUROS_DIA, ATIVO, [USUARIO_OPERACAO], GETDATE(), 'UPDATE' FROM INSERTED
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE   TRIGGER [cfg].[T_CONFIGURACAO_INSERT]
   ON  [cfg].[CONFIGURACAO]
   AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			INSERT INTO [log].[CONFIGURACAO] ( ID_CONFIGURACAO, FIN_ANO_CONTABIL, FIN_DIA_VENCIMENTO, FIN_JUROS_DIA, [USUARIO_OPERACAO], [DATA_OPERACAO], [STATUS_OPERACAO] )
			SELECT ID_CONFIGURACAO, FIN_ANO_CONTABIL, FIN_DIA_VENCIMENTO, FIN_JUROS_DIA, [USUARIO_OPERACAO], GETDATE(), 'INSERT' FROM INSERTED
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE TRIGGER [sis].[T_FILANTROPIA_INSERT]
   ON  [sis].[FILANTROPIA]
   AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			INSERT INTO [log].[FILANTROPIA] ( ID_FILANTROPIA, DESCRICAO, PERCENTUAL,VALOR, ATIVO, [USUARIO_OPERACAO], [DATA_OPERACAO], [STATUS_OPERACAO] )
			SELECT ID_FILANTROPIA, DESCRICAO, PERCENTUAL, VALOR, ATIVO, [USUARIO_OPERACAO], GETDATE(), 'INSERT' FROM INSERTED
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE TRIGGER [sis].[T_FILANTROPIA_UPDATE]
   ON  [sis].[FILANTROPIA]
   AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			INSERT INTO [log].[FILANTROPIA] ( ID_FILANTROPIA, DESCRICAO, PERCENTUAL, VALOR, ATIVO, [USUARIO_OPERACAO], [DATA_OPERACAO], [STATUS_OPERACAO] )
			SELECT ID_FILANTROPIA, DESCRICAO, PERCENTUAL, VALOR, ATIVO, [USUARIO_OPERACAO], GETDATE(), 'UPDATE' FROM INSERTED
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE TRIGGER [sis].[T_FINANCEIRO_INSERT]
   ON  [sis].[FINANCEIRO]
   AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			INSERT INTO [log].[FINANCEIRO] ( ID_FINANCEIRO, ID_PESSOA, REFER, DT_VENCIMENTO, VL_REFER, VL_DESCONTO, DT_PAGAMENTO, VL_PAGO, USUARIO_OPERACAO, DATA_OPERACAO, STATUS_OPERACAO )
			SELECT ID_FINANCEIRO, ID_PESSOA, REFER, DT_VENCIMENTO, VL_REFER, VL_DESCONTO, DT_PAGAMENTO, VL_PAGO, USUARIO_OPERACAO, GETDATE(), 'INSERT' FROM INSERTED
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE TRIGGER [sis].[T_FINANCEIRO_UPDATE]
   ON  [sis].[FINANCEIRO]
   AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			INSERT INTO [log].[FINANCEIRO] ( ID_FINANCEIRO, ID_PESSOA, REFER, DT_VENCIMENTO, VL_REFER, VL_DESCONTO, DT_PAGAMENTO, VL_PAGO, USUARIO_OPERACAO, DATA_OPERACAO, STATUS_OPERACAO )
			SELECT ID_FINANCEIRO, ID_PESSOA, REFER, DT_VENCIMENTO, VL_REFER, VL_DESCONTO, DT_PAGAMENTO, VL_PAGO, USUARIO_OPERACAO, GETDATE(), 'UPDATE' FROM INSERTED
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE   TRIGGER [sis].[T_FINANCEIRO_ALTERACAO_INSERT]
   ON  [sis].[FINANCEIRO_ALTERACAO]
   AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			INSERT INTO [log].[FINANCEIRO_ALTERACAO] ( ID_FINANCEIRO_ALTERACAO, ID_FINANCEIRO, DT_VENCIMENTO, VL_DESCONTO_ORIGINAL, VL_DESCONTO, VL_JUROS_ORIGINAL, VL_JUROS, OBSERVACAO, USUARIO_OPERACAO, DATA_OPERACAO, STATUS_OPERACAO )
			SELECT ID_FINANCEIRO_ALTERACAO, ID_FINANCEIRO, DT_VENCIMENTO, VL_DESCONTO_ORIGINAL, VL_DESCONTO, VL_JUROS_ORIGINAL, VL_JUROS, OBSERVACAO, USUARIO_OPERACAO, GETDATE(), 'INSERT' FROM INSERTED
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE   TRIGGER [sis].[T_FINANCEIRO_ESTORNO_INSERT]
   ON  [sis].[FINANCEIRO_ESTORNO]
   AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			INSERT INTO [log].[FINANCEIRO_ESTORNO] ( ID_FINANCEIRO_ESTORNO, ID_FINANCEIRO, OBSERVACAO, USUARIO_OPERACAO, DATA_OPERACAO, STATUS_OPERACAO )
			SELECT ID_FINANCEIRO_ESTORNO, ID_FINANCEIRO, OBSERVACAO, USUARIO_OPERACAO, GETDATE(), 'INSERT' FROM INSERTED
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE   TRIGGER [sis].[T_FINANCEIRO_ESTORNO_UPDATE]
   ON  [sis].[FINANCEIRO_ESTORNO]
   AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			INSERT INTO [log].[FINANCEIRO_ESTORNO] ( ID_FINANCEIRO_ESTORNO, ID_FINANCEIRO, OBSERVACAO, USUARIO_OPERACAO, DATA_OPERACAO, STATUS_OPERACAO )
			SELECT ID_FINANCEIRO_ESTORNO, ID_FINANCEIRO, OBSERVACAO, USUARIO_OPERACAO, GETDATE(), 'UPDATE' FROM INSERTED
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE TRIGGER [sis].[T_PESSOA_FILANTROPIA_INSERT]
   ON  [sis].[PESSOA_FILANTROPIA]
   AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			INSERT INTO [log].[PESSOA_FILANTROPIA] ( ID_PESSOA_FILANTROPIA, ID_PESSOA, ID_FILANTROPIA, REFER_INICIO, REFER_FIM, [USUARIO_OPERACAO], [DATA_OPERACAO], [STATUS_OPERACAO] )
			SELECT ID_PESSOA_FILANTROPIA, ID_PESSOA, ID_FILANTROPIA, REFER_INICIO, REFER_FIM, [USUARIO_OPERACAO], GETDATE(), 'INSERT' FROM INSERTED
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE TRIGGER [sis].[T_PESSOA_FILANTROPIA_UPDATE]
   ON  [sis].[PESSOA_FILANTROPIA]
   AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			INSERT INTO [log].[PESSOA_FILANTROPIA] ( ID_PESSOA_FILANTROPIA, ID_PESSOA, ID_FILANTROPIA, REFER_INICIO, REFER_FIM, [USUARIO_OPERACAO], [DATA_OPERACAO], [STATUS_OPERACAO] )
			SELECT ID_PESSOA_FILANTROPIA, ID_PESSOA, ID_FILANTROPIA, REFER_INICIO, REFER_FIM, [USUARIO_OPERACAO], GETDATE(), 'UPDATE' FROM INSERTED
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE TRIGGER [sis].[T_PESSOA_PLANO_INSERT]
   ON  [sis].[PESSOA_PLANO]
   AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			INSERT INTO [log].[PESSOA_PLANO] ( ID_PESSOA_PLANO, ID_PESSOA, ID_PLANO, REFER_INICIO, REFER_FIM, [USUARIO_OPERACAO], [DATA_OPERACAO], [STATUS_OPERACAO] )
			SELECT ID_PESSOA_PLANO, ID_PESSOA, ID_PLANO, REFER_INICIO, REFER_FIM, [USUARIO_OPERACAO], GETDATE(), 'INSERT' FROM INSERTED
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE TRIGGER [sis].[T_PESSOA_PLANO_UPDATE]
   ON  [sis].[PESSOA_PLANO]
   AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			INSERT INTO [log].[PESSOA_PLANO] ( ID_PESSOA_PLANO, ID_PESSOA, ID_PLANO, REFER_INICIO, REFER_FIM, [USUARIO_OPERACAO], [DATA_OPERACAO], [STATUS_OPERACAO] )
			SELECT ID_PESSOA_PLANO, ID_PESSOA, ID_PLANO, REFER_INICIO, REFER_FIM, [USUARIO_OPERACAO], GETDATE(), 'UPDATE' FROM INSERTED
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE TRIGGER [sis].[T_PLANO_INSERT]
   ON  [sis].[PLANO]
   AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			INSERT INTO [log].[PLANO] ( ID_PLANO, DESCRICAO, VALOR, ATIVO, USUARIO_OPERACAO, DATA_OPERACAO, STATUS_OPERACAO )
			SELECT ID_PLANO, DESCRICAO, VALOR, ATIVO, USUARIO_OPERACAO, GETDATE(), 'INSERT' FROM INSERTED
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE TRIGGER [sis].[T_PLANO_UPDATE]
   ON  [sis].[PLANO]
   AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			INSERT INTO [log].[PLANO] ( ID_PLANO, DESCRICAO, VALOR, ATIVO, USUARIO_OPERACAO, DATA_OPERACAO, STATUS_OPERACAO )
			SELECT ID_PLANO, DESCRICAO, VALOR, ATIVO, USUARIO_OPERACAO, GETDATE(), 'UPDATE' FROM INSERTED
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE TRIGGER [cfg].[T_ESTADO_CIVIL_INSERT]
   ON  [cfg].[ESTADO_CIVIL]
   AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			INSERT INTO [log].[ESTADO_CIVIL] ( ID_ESTADO_CIVIL, DESCRICAO, ATIVO, USUARIO_OPERACAO, DATA_OPERACAO, STATUS_OPERACAO )
			SELECT ID_ESTADO_CIVIL, DESCRICAO, ATIVO, USUARIO_OPERACAO, GETDATE(), 'INSERT' FROM INSERTED
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO

ALTER TABLE [cfg].[ESTADO_CIVIL] ENABLE TRIGGER [T_ESTADO_CIVIL_INSERT]
GO
GO


CREATE TRIGGER [cfg].[T_ESTADO_CIVIL_UPDATE]
   ON  [cfg].[ESTADO_CIVIL]
   AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			INSERT INTO [log].[ESTADO_CIVIL] ( ID_ESTADO_CIVIL, DESCRICAO, ATIVO, USUARIO_OPERACAO, DATA_OPERACAO, STATUS_OPERACAO )
			SELECT ID_ESTADO_CIVIL, DESCRICAO, ATIVO, USUARIO_OPERACAO, GETDATE(), 'UPDATE' FROM INSERTED
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO

ALTER TABLE [cfg].[ESTADO_CIVIL] ENABLE TRIGGER [T_ESTADO_CIVIL_UPDATE]
GO
GO


CREATE TRIGGER [sis].[T_SANTO_INSERT]
   ON  [sis].[SANTO]
   AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			INSERT INTO [log].[SANTO] ( ID_SANTO, ID_PESSOA, DESCRICAO, USUARIO_OPERACAO, DATA_OPERACAO, STATUS_OPERACAO )
			SELECT ID_SANTO, ID_PESSOA, DESCRICAO, USUARIO_OPERACAO, GETDATE(), 'INSERT' FROM INSERTED
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE TRIGGER [sis].[T_SANTO_UPDATE]
   ON  [sis].[SANTO]
   AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			INSERT INTO [log].[SANTO] ( ID_SANTO, ID_PESSOA, DESCRICAO, USUARIO_OPERACAO, DATA_OPERACAO, STATUS_OPERACAO )
			SELECT ID_SANTO, ID_PESSOA, DESCRICAO, USUARIO_OPERACAO, GETDATE(), 'UPDATE' FROM INSERTED
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE TRIGGER [sis].[T_OBRIGACAO_INSERT]
   ON  [sis].[OBRIGACAO]
   AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			INSERT INTO [log].[OBRIGACAO] ( ID_OBRIGACAO, ID_PESSOA, [DATA], DESCRICAO, USUARIO_OPERACAO, DATA_OPERACAO, STATUS_OPERACAO )
			SELECT ID_OBRIGACAO, ID_PESSOA, [DATA], DESCRICAO, USUARIO_OPERACAO, GETDATE(), 'INSERT' FROM INSERTED
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE TRIGGER [sis].[T_OBRIGACAO_UPDATE]
   ON  [sis].[OBRIGACAO]
   AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			INSERT INTO [log].[OBRIGACAO] ( ID_OBRIGACAO, ID_PESSOA, [DATA], DESCRICAO, USUARIO_OPERACAO, DATA_OPERACAO, STATUS_OPERACAO )
			SELECT ID_OBRIGACAO, ID_PESSOA, [DATA], DESCRICAO, USUARIO_OPERACAO, GETDATE(), 'UPDATE' FROM INSERTED
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE TRIGGER [sis].[T_FORMA_PAGAMENTO_INSERT]
   ON  [sis].[FORMA_PAGAMENTO]
   AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			INSERT INTO [log].[FORMA_PAGAMENTO] ( ID_FORMA_PAGAMENTO, DESCRICAO, ATIVO, USUARIO_OPERACAO, DATA_OPERACAO, STATUS_OPERACAO )
			SELECT ID_FORMA_PAGAMENTO, DESCRICAO, ATIVO, USUARIO_OPERACAO, GETDATE(), 'INSERT' FROM INSERTED
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE TRIGGER [sis].[T_FORMA_PAGAMENTO_UPDATE]
   ON  [sis].[FORMA_PAGAMENTO]
   AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			INSERT INTO [log].[FORMA_PAGAMENTO] ( ID_FORMA_PAGAMENTO, DESCRICAO, ATIVO, USUARIO_OPERACAO, DATA_OPERACAO, STATUS_OPERACAO )
			SELECT ID_FORMA_PAGAMENTO, DESCRICAO, ATIVO, USUARIO_OPERACAO, GETDATE(), 'UPDATE' FROM INSERTED
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE TRIGGER [sis].[T_PAGAMENTO_DIVERSO_INSERT]
   ON  [sis].[PAGAMENTO_DIVERSO]
   AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			INSERT INTO [log].[PAGAMENTO_DIVERSO] ( ID_PAGAMENTO_DIVERSO, ID_PESSOA, ID_FORMA_PAGAMENTO, DATA_PAGAMENTO, VALOR, DESCRICAO, USUARIO_OPERACAO, DATA_OPERACAO, STATUS_OPERACAO )
			SELECT ID_PAGAMENTO_DIVERSO, ID_PESSOA, ID_FORMA_PAGAMENTO, DATA_PAGAMENTO, VALOR, DESCRICAO, USUARIO_OPERACAO, GETDATE(), 'INSERT' FROM INSERTED
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO


CREATE TRIGGER [sis].[T_PAGAMENTO_DIVERSO_UPDATE]
   ON  [sis].[PAGAMENTO_DIVERSO]
   AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN
			INSERT INTO [log].[PAGAMENTO_DIVERSO] ( ID_PAGAMENTO_DIVERSO, ID_PESSOA, ID_FORMA_PAGAMENTO, DATA_PAGAMENTO, VALOR, DESCRICAO, USUARIO_OPERACAO, DATA_OPERACAO, STATUS_OPERACAO )
			SELECT ID_PAGAMENTO_DIVERSO, ID_PESSOA, ID_FORMA_PAGAMENTO, DATA_PAGAMENTO, VALOR, DESCRICAO, USUARIO_OPERACAO, GETDATE(), 'UPDATE' FROM INSERTED
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ERRORNUMBER,
			ERROR_SEVERITY() AS ERRORSEVERITY,
			ERROR_STATE() AS ERRORSTATE,
			ERROR_PROCEDURE() AS ERRORPROCEDURE,
			ERROR_LINE() AS ERRORLINE,
			ERROR_MESSAGE() AS ERRORMESSAGE;

		ROLLBACK TRAN
	END CATCH

	SET NOCOUNT OFF;
END
GO

