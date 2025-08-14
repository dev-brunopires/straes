/* ---------------------------------------------------------------------- */
/* Script generated with: DeZign for Databases V10.0.2                    */
/* Target DBMS:           MS SQL Server 2016                              */
/* Project file:          Der STRAES_XM.dez                               */
/* Project name:          Banco de Dados STRAES_XM                        */
/* Author:                Wellington Marques                              */
/* Script type:           Database drop script                            */
/* Created on:            2020-08-06 18:05                                */
/* ---------------------------------------------------------------------- */


/* ---------------------------------------------------------------------- */
/* Drop triggers                                                          */
/* ---------------------------------------------------------------------- */

GO


DROP TRIGGER [cfg].[T_USUARIO_INSERT]
GO


DROP TRIGGER [cfg].[T_USUARIO_UPDATE]
GO


DROP TRIGGER [cfg].[T_MODULO_INSERT]
GO


DROP TRIGGER [cfg].[T_MODULO_UPDATE]
GO


DROP TRIGGER [cfg].[T_USUARIO_MODULO_INSERT]
GO


DROP TRIGGER [cfg].[T_USUARIO_MODULO_UPDATE]
GO


DROP TRIGGER [sis].[T_ENDERECO_INSERT]
GO


DROP TRIGGER [sis].[T_ENDERECO_UPDATE]
GO


DROP TRIGGER [sis].[T_CONTATO_INSERT]
GO


DROP TRIGGER [sis].[T_CONTATO_UPDATE]
GO


DROP TRIGGER [sis].[T_PESSOA_INSERT]
GO


DROP TRIGGER [sis].[T_PESSOA_UPDATE]
GO


DROP TRIGGER [sis].[T_TIPO_CONTATO_INSERT]
GO


DROP TRIGGER [sis].[T_TIPO_CONTATO_UPDATE]
GO


DROP TRIGGER [sis].[T_TIPO_ENDERECO_INSERT]
GO


DROP TRIGGER [sis].[T_TIPO_ENDERECO_UPDATE]
GO


DROP TRIGGER [sis].[T_DOCUMENTO_INSERT]
GO


DROP TRIGGER [sis].[T_DOCUMENTO_UPDATE]
GO


DROP TRIGGER [sis].[T_TIPO_DOCUMENTO_INSERT]
GO


DROP TRIGGER [sis].[T_TIPO_DOCUMENTO_UPDATE]
GO


DROP TRIGGER [sis].[T_ATIVIDADE_INSERT]
GO


DROP TRIGGER [sis].[T_ATIVIDADE_UPDATE]
GO


DROP TRIGGER [sis].[T_CLASSIFICACAO_INSERT]
GO


DROP TRIGGER [sis].[T_CLASSIFICACAO_UPDATE]
GO


DROP TRIGGER [cfg].[T_CONFIGURACAO_UPDATE]
GO


DROP TRIGGER [cfg].[T_CONFIGURACAO_INSERT]
GO


DROP TRIGGER [sis].[T_FILANTROPIA_INSERT]
GO


DROP TRIGGER [sis].[T_FILANTROPIA_UPDATE]
GO


DROP TRIGGER [sis].[T_FINANCEIRO_INSERT]
GO


DROP TRIGGER [sis].[T_FINANCEIRO_UPDATE]
GO


DROP TRIGGER [sis].[T_FINANCEIRO_ALTERACAO_INSERT]
GO


DROP TRIGGER [sis].[T_FINANCEIRO_ESTORNO_INSERT]
GO


DROP TRIGGER [sis].[T_FINANCEIRO_ESTORNO_UPDATE]
GO


DROP TRIGGER [sis].[T_PESSOA_FILANTROPIA_INSERT]
GO


DROP TRIGGER [sis].[T_PESSOA_FILANTROPIA_UPDATE]
GO


DROP TRIGGER [sis].[T_PESSOA_PLANO_INSERT]
GO


DROP TRIGGER [sis].[T_PESSOA_PLANO_UPDATE]
GO


DROP TRIGGER [sis].[T_PLANO_INSERT]
GO


DROP TRIGGER [sis].[T_PLANO_UPDATE]
GO


DROP TRIGGER [cfg].[T_ESTADO_CIVIL_INSERT]
GO


DROP TRIGGER [cfg].[T_ESTADO_CIVIL_UPDATE]
GO


DROP TRIGGER [sis].[T_SANTO_INSERT]
GO


DROP TRIGGER [sis].[T_SANTO_UPDATE]
GO


DROP TRIGGER [sis].[T_OBRIGACAO_INSERT]
GO


DROP TRIGGER [sis].[T_OBRIGACAO_UPDATE]
GO


DROP TRIGGER [sis].[T_FORMA_PAGAMENTO_INSERT]
GO


DROP TRIGGER [sis].[T_FORMA_PAGAMENTO_UPDATE]
GO


DROP TRIGGER [sis].[T_PAGAMENTO_DIVERSO_INSERT]
GO


DROP TRIGGER [sis].[T_PAGAMENTO_DIVERSO_UPDATE]
GO


/* ---------------------------------------------------------------------- */
/* Drop procedures                                                        */
/* ---------------------------------------------------------------------- */

GO


DROP PROCEDURE [cfg].[P_CONFIGURACAO_UPDATE]
GO


DROP PROCEDURE [cfg].[P_CONFIGURACAO_INSERT]
GO


DROP PROCEDURE [cfg].[P_USUARIO_INSERT]
GO


DROP PROCEDURE [cfg].[P_USUARIO_UPDATE]
GO


DROP PROCEDURE [cfg].[P_USUARIO_ATIVAR]
GO


DROP PROCEDURE [cfg].[P_USUARIO_SENHA_UPDATE]
GO


DROP PROCEDURE [cfg].[P_USUARIO_DESATIVAR]
GO


DROP PROCEDURE [cfg].[P_MODULO_INSERT]
GO


DROP PROCEDURE [cfg].[P_MODULO_UPDATE]
GO


DROP PROCEDURE [cfg].[P_MODULO_ATIVAR]
GO


DROP PROCEDURE [cfg].[P_MODULO_DESATIVAR]
GO


DROP PROCEDURE [cfg].[P_USUARIO_MODULO_INSERT]
GO


DROP PROCEDURE [cfg].[P_USUARIO_MODULO_UPDATE]
GO


DROP PROCEDURE [sis].[P_PESSOA_UPDATE]
GO


DROP PROCEDURE [sis].[P_PESSOA_INSERT]
GO


DROP PROCEDURE [sis].[P_PESSOA_DESATIVAR]
GO


DROP PROCEDURE [sis].[P_PESSOA_ATIVAR]
GO


DROP PROCEDURE [sis].[P_PLANO_UPDATE]
GO


DROP PROCEDURE [sis].[P_PLANO_INSERT]
GO


DROP PROCEDURE [sis].[P_PLANO_ATIVAR]
GO


DROP PROCEDURE [sis].[P_PLANO_DESATIVAR]
GO


DROP PROCEDURE [sis].[P_FILANTROPIA_ATIVAR]
GO


DROP PROCEDURE [sis].[P_FILANTROPIA_DESATIVAR]
GO


DROP PROCEDURE [sis].[P_FILANTROPIA_INSERT]
GO


DROP PROCEDURE [sis].[P_FILANTROPIA_UPDATE]
GO


DROP PROCEDURE [sis].[P_PESSOA_PLANO_FILANTROPIA_DELETE]
GO


DROP PROCEDURE [sis].[P_PESSOA_PLANO_FILANTROPIA_INSERT]
GO


DROP PROCEDURE [sis].[P_FINANCEIRO_INSERT]
GO


DROP PROCEDURE [sis].[P_FINANCEIRO_UPDATE]
GO


DROP PROCEDURE [sis].[P_TIPO_ENDERECO_INSERT]
GO


DROP PROCEDURE [sis].[P_TIPO_ENDERECO_UPDATE]
GO


DROP PROCEDURE [sis].[P_TIPO_CONTATO_INSERT]
GO


DROP PROCEDURE [sis].[P_TIPO_CONTATO_UPDATE]
GO


DROP PROCEDURE [sis].[P_TIPO_ENDERECO_ATIVAR]
GO


DROP PROCEDURE [sis].[P_TIPO_CONTATO_ATIVAR]
GO


DROP PROCEDURE [sis].[P_TIPO_CONTATO_DESATIVAR]
GO


DROP PROCEDURE [sis].[P_TIPO_ENDERECO_DESATIVAR]
GO


DROP PROCEDURE [sis].[P_TIPO_ENDERECO_DELETE]
GO


DROP PROCEDURE [sis].[P_TIPO_CONTATO_DELETE]
GO


DROP PROCEDURE [sis].[P_CONTATO_INSERT]
GO


DROP PROCEDURE [sis].[P_ENDERECO_INSERT]
GO


DROP PROCEDURE [sis].[P_CONTATO_DELETE]
GO


DROP PROCEDURE [sis].[P_ENDERECO_DELETE]
GO


DROP PROCEDURE [sis].[P_DOCUMENTO_INSERT]
GO


DROP PROCEDURE [sis].[P_TIPO_DOCUMENTO_DESATIVAR]
GO


DROP PROCEDURE [sis].[P_TIPO_DOCUMENTO_ATIVAR]
GO


DROP PROCEDURE [sis].[P_TIPO_DOCUMENTO_DELETE]
GO


DROP PROCEDURE [sis].[P_TIPO_DOCUMENTO_UPDATE]
GO


DROP PROCEDURE [sis].[P_TIPO_DOCUMENTO_INSERT]
GO


DROP PROCEDURE [sis].[P_DOCUMENTO_DELETE]
GO


DROP PROCEDURE [sis].[P_CLASSIFICACAO_INSERT]
GO


DROP PROCEDURE [sis].[P_CLASSIFICACAO_UPDATE]
GO


DROP PROCEDURE [sis].[P_CLASSIFICACAO_DELETE]
GO


DROP PROCEDURE [sis].[P_CLASSIFICACAO_ATIVAR]
GO


DROP PROCEDURE [sis].[P_CLASSIFICACAO_DESATIVAR]
GO


DROP PROCEDURE [sis].[P_ATIVIDADE_INSERT]
GO


DROP PROCEDURE [sis].[P_ATIVIDADE_DESATIVAR]
GO


DROP PROCEDURE [sis].[P_ATIVIDADE_ATIVAR]
GO


DROP PROCEDURE [sis].[P_ATIVIDADE_DELETE]
GO


DROP PROCEDURE [sis].[P_ATIVIDADE_UPDATE]
GO


DROP PROCEDURE [cfg].[P_CONFIGURACAO_DELETE]
GO


DROP FUNCTION [sis].[F_REFERENCIA]
GO


DROP PROCEDURE [sis].[P_CONCESSAO_DESCONTO]
GO


DROP PROCEDURE [sis].[P_FINANCEIRO_BAIXA]
GO


DROP PROCEDURE [sis].[P_FINANCEIRO_ESTORNO_INSERT]
GO


DROP PROCEDURE [sis].[P_FINANCEIRO_ALTERACAO_INSERT]
GO


DROP PROCEDURE [cfg].[P_ESTADO_CIVIL_INSERT]
GO


DROP PROCEDURE [cfg].[P_ESTADO_CIVIL_UPDATE]
GO


DROP PROCEDURE [cfg].[P_ESTADO_CIVIL_ATIVAR]
GO


DROP PROCEDURE [cfg].[P_ESTADO_CIVIL_DESATIVAR]
GO


DROP PROCEDURE [sis].[P_SANTO_INSERT]
GO


DROP PROCEDURE [sis].[P_SANTO_DELETE]
GO


DROP PROCEDURE [sis].[P_OBRIGACAO_INSERT]
GO


DROP PROCEDURE [sis].[P_OBRIGACAO_DELETE]
GO


DROP PROCEDURE [sis].[P_CONCESSAO_DESCONTO_FILANTROPIA]
GO


DROP PROCEDURE [sis].[P_FORMA_PAGAMENTO_INSERT]
GO


DROP PROCEDURE [sis].[P_FORMA_PAGAMENTO_UPDATE]
GO


DROP PROCEDURE [sis].[P_FORMA_PAGAMENTO_DESATIVAR]
GO


DROP PROCEDURE [sis].[P_FORMA_PAGAMENTO_ATIVAR]
GO


DROP PROCEDURE [sis].[P_PAGAMENTO_DIVERSO_INSERT]
GO


DROP PROCEDURE [sis].[P_PAGAMENTO_DIVERSO_UPDATE]
GO


DROP PROCEDURE [sis].[P_PAGAMENTO_DIVERSO_DELETE]
GO


/* ---------------------------------------------------------------------- */
/* Drop views                                                             */
/* ---------------------------------------------------------------------- */

GO


DROP VIEW [cfg].[V_PERMISSAO]
GO


DROP VIEW [cfg].[V_USUARIO_MODULO]
GO


DROP VIEW [sis].[V_NOVA_MATRICULA]
GO


DROP VIEW [sis].[V_PESSOA_PLANO]
GO


DROP VIEW [sis].[V_PESSOA_FILANTROPIA]
GO


DROP VIEW [sis].[V_PESSOA_PLANO_FILANTROPIA]
GO


DROP VIEW [sis].[V_DADOS_PESSOA]
GO


DROP VIEW [sis].[V_DADOS_PESSOA_CONTATO]
GO


DROP VIEW [sis].[V_DADOS_PESSOA_DOCUMENTO]
GO


DROP VIEW [sis].[V_DADOS_PESSOA_ENDERECO]
GO


DROP VIEW [sis].[V_DADOS_PESSOA_FINANCEIRO]
GO


DROP VIEW [sis].[V_DADOS_FINANCEIRO]
GO


DROP VIEW [cfg].[V_MODULO]
GO


DROP VIEW [sis].[V_DADOS_PESSOA_SANTO]
GO


DROP VIEW [sis].[V_DADOS_PESSOA_OBRIGACAO]
GO


DROP VIEW [sis].[V_DADOS_PAGAMENTO_DIVERSO]
GO


DROP VIEW [old].[V_DADOS_MENSALIDADE_ANTIGOS]
GO


DROP VIEW [old].[V_DADOS_PAGAMENTOS_ANTIGOS]
GO


/* ---------------------------------------------------------------------- */
/* Drop foreign key constraints                                           */
/* ---------------------------------------------------------------------- */

GO


ALTER TABLE [cfg].[MODULO] DROP CONSTRAINT [FK_MODULO_MODULO]
GO


ALTER TABLE [cfg].[USUARIO_MODULO] DROP CONSTRAINT [FK_USUARIO_USUARIO_MODULO]
GO


ALTER TABLE [cfg].[USUARIO_MODULO] DROP CONSTRAINT [FK_MODULO_USUARIO_MODULO]
GO


ALTER TABLE [cfg].[CIDADE] DROP CONSTRAINT [FK_ESTADO_CIDADE]
GO


ALTER TABLE [cfg].[ESTADO] DROP CONSTRAINT [FK_PAIS_ESTADO]
GO


ALTER TABLE [sis].[ENDERECO] DROP CONSTRAINT [FK_CIDADE_ENDERECO]
GO


ALTER TABLE [sis].[ENDERECO] DROP CONSTRAINT [FK_PESSOA_ENDERECO]
GO


ALTER TABLE [sis].[ENDERECO] DROP CONSTRAINT [FK_TIPO_ENDERECO_ENDERECO]
GO


ALTER TABLE [sis].[CONTATO] DROP CONSTRAINT [FK_PESSOA_CONTATO]
GO


ALTER TABLE [sis].[CONTATO] DROP CONSTRAINT [FK_TIPO_CONTATO_CONTATO]
GO


ALTER TABLE [sis].[PESSOA] DROP CONSTRAINT [FK_ATIVIDADE_PESSOA]
GO


ALTER TABLE [sis].[PESSOA] DROP CONSTRAINT [FK_CLASSIFICACAO_PESSOA]
GO


ALTER TABLE [sis].[PESSOA] DROP CONSTRAINT [ESTADO_CIVIL_PESSOA]
GO


ALTER TABLE [sis].[PESSOA] DROP CONSTRAINT [CIDADE_PESSOA]
GO


ALTER TABLE [sis].[DOCUMENTO] DROP CONSTRAINT [FK_PESSOA_DOCUMENTO]
GO


ALTER TABLE [sis].[DOCUMENTO] DROP CONSTRAINT [FK_TIPO_DOCUMENTO_DOCUMENTO]
GO


ALTER TABLE [sis].[FINANCEIRO] DROP CONSTRAINT [FK_PESSOA_FINANCEIRO]
GO


ALTER TABLE [sis].[FINANCEIRO] DROP CONSTRAINT [FORMA_PAGAMENTO_FINANCEIRO]
GO


ALTER TABLE [sis].[FINANCEIRO_ALTERACAO] DROP CONSTRAINT [FK_FINANCEIRO_FINANCEIRO_ALTERACAO]
GO


ALTER TABLE [sis].[FINANCEIRO_ESTORNO] DROP CONSTRAINT [FK_FINANCEIRO_FINANCEIRO_ESTORNO]
GO


ALTER TABLE [sis].[PESSOA_FILANTROPIA] DROP CONSTRAINT [FK_FILANTROPIA_PESSOA_FILANTROPIA]
GO


ALTER TABLE [sis].[PESSOA_FILANTROPIA] DROP CONSTRAINT [FK_PESSOA_PESSOA_FILANTROPIA]
GO


ALTER TABLE [sis].[PESSOA_PLANO] DROP CONSTRAINT [FK_PESSOA_PESSOA_PLANO]
GO


ALTER TABLE [sis].[PESSOA_PLANO] DROP CONSTRAINT [FK_PLANO_PESSOA_PLANO]
GO


ALTER TABLE [sis].[SANTO] DROP CONSTRAINT [PESSOA_SANTO]
GO


ALTER TABLE [sis].[OBRIGACAO] DROP CONSTRAINT [PESSOA_OBRIGACAO]
GO


ALTER TABLE [sis].[PAGAMENTO_DIVERSO] DROP CONSTRAINT [FORMA_PAGAMENTO_PAGAMENTO_DIVERSO]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "sis.CONTATO"                                               */
/* ---------------------------------------------------------------------- */

GO


/* Drop constraints */

ALTER TABLE [sis].[CONTATO] DROP CONSTRAINT [DF_CONTATO_ATIVO]
GO


ALTER TABLE [sis].[CONTATO] DROP CONSTRAINT [DEF_CONTATO_DATA_OPERACAO]
GO


ALTER TABLE [sis].[CONTATO] DROP CONSTRAINT [PK_CONTATO]
GO


ALTER TABLE [sis].[CONTATO] DROP CONSTRAINT [CC_CONTATO_ATIVO]
GO


ALTER TABLE [sis].[CONTATO] DROP CONSTRAINT [TUC_CONTATO_DESCRICAO]
GO


DROP TABLE [sis].[CONTATO]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "sis.ENDERECO"                                              */
/* ---------------------------------------------------------------------- */

GO


/* Drop constraints */

ALTER TABLE [sis].[ENDERECO] DROP CONSTRAINT [DF_ENDERECO_ATIVO]
GO


ALTER TABLE [sis].[ENDERECO] DROP CONSTRAINT [DEF_ENDERECO_DATA_OPERACAO]
GO


ALTER TABLE [sis].[ENDERECO] DROP CONSTRAINT [PK_ENDERECO]
GO


ALTER TABLE [sis].[ENDERECO] DROP CONSTRAINT [CC_ENDERECO_ATIVO]
GO


DROP TABLE [sis].[ENDERECO]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "sis.OBRIGACAO"                                             */
/* ---------------------------------------------------------------------- */

GO


/* Drop constraints */

ALTER TABLE [sis].[OBRIGACAO] DROP CONSTRAINT [DEF_OBRIGACAO_DATA_OPERACAO]
GO


ALTER TABLE [sis].[OBRIGACAO] DROP CONSTRAINT [PK_OBRIGACAO]
GO


ALTER TABLE [sis].[OBRIGACAO] DROP CONSTRAINT [TUC_OBRIGACAO_DESCRICAO]
GO


DROP TABLE [sis].[OBRIGACAO]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "sis.SANTO"                                                 */
/* ---------------------------------------------------------------------- */

GO


/* Drop constraints */

ALTER TABLE [sis].[SANTO] DROP CONSTRAINT [DEF_SANTO_DATA_OPERACAO]
GO


ALTER TABLE [sis].[SANTO] DROP CONSTRAINT [PK_SANTO]
GO


ALTER TABLE [sis].[SANTO] DROP CONSTRAINT [TUC_SANTO_DESCRICAO]
GO


DROP TABLE [sis].[SANTO]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "sis.PESSOA_PLANO"                                          */
/* ---------------------------------------------------------------------- */

GO


/* Drop constraints */

ALTER TABLE [sis].[PESSOA_PLANO] DROP CONSTRAINT [DEF_PESSOA_PLANO_DATA_OPERACAO]
GO


ALTER TABLE [sis].[PESSOA_PLANO] DROP CONSTRAINT [PK_PESSOA_PLANO]
GO


DROP TABLE [sis].[PESSOA_PLANO]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "sis.PESSOA_FILANTROPIA"                                    */
/* ---------------------------------------------------------------------- */

GO


/* Drop constraints */

ALTER TABLE [sis].[PESSOA_FILANTROPIA] DROP CONSTRAINT [DEF_PESSOA_FILANTROPIA_DATA_OPERACAO]
GO


ALTER TABLE [sis].[PESSOA_FILANTROPIA] DROP CONSTRAINT [PK_PESSOA_FILANTROPIA]
GO


DROP TABLE [sis].[PESSOA_FILANTROPIA]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "sis.FINANCEIRO_ESTORNO"                                    */
/* ---------------------------------------------------------------------- */

GO


/* Drop constraints */

ALTER TABLE [sis].[FINANCEIRO_ESTORNO] DROP CONSTRAINT [DEF_FINANCEIRO_ESTORNO_DATA_OPERACAO]
GO


ALTER TABLE [sis].[FINANCEIRO_ESTORNO] DROP CONSTRAINT [PK_FINANCEIRO_ESTORNO]
GO


DROP TABLE [sis].[FINANCEIRO_ESTORNO]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "sis.FINANCEIRO_ALTERACAO"                                  */
/* ---------------------------------------------------------------------- */

GO


/* Drop constraints */

ALTER TABLE [sis].[FINANCEIRO_ALTERACAO] DROP CONSTRAINT [DEF_FINANCEIRO_ALTERACAO_DATA_OPERACAO]
GO


ALTER TABLE [sis].[FINANCEIRO_ALTERACAO] DROP CONSTRAINT [PK_FINANCEIRO_ALTERACAO]
GO


DROP TABLE [sis].[FINANCEIRO_ALTERACAO]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "sis.FINANCEIRO"                                            */
/* ---------------------------------------------------------------------- */

GO


/* Drop constraints */

ALTER TABLE [sis].[FINANCEIRO] DROP CONSTRAINT [DEF_FINANCEIRO_DATA_OPERACAO]
GO


ALTER TABLE [sis].[FINANCEIRO] DROP CONSTRAINT [PK_FINANCEIRO]
GO


DROP TABLE [sis].[FINANCEIRO]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "sis.DOCUMENTO"                                             */
/* ---------------------------------------------------------------------- */

GO


/* Drop constraints */

ALTER TABLE [sis].[DOCUMENTO] DROP CONSTRAINT [DF_DOCUMENTO_ATIVO]
GO


ALTER TABLE [sis].[DOCUMENTO] DROP CONSTRAINT [DEF_DOCUMENTO_DATA_OPERACAO]
GO


ALTER TABLE [sis].[DOCUMENTO] DROP CONSTRAINT [PK_DOCUMENTO]
GO


ALTER TABLE [sis].[DOCUMENTO] DROP CONSTRAINT [CC_DOCUMENTO_ATIVO]
GO


ALTER TABLE [sis].[DOCUMENTO] DROP CONSTRAINT [TUC_DOCUMENTO_DESCRICAO]
GO


DROP TABLE [sis].[DOCUMENTO]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "sis.PESSOA"                                                */
/* ---------------------------------------------------------------------- */

GO


/* Drop constraints */

ALTER TABLE [sis].[PESSOA] DROP CONSTRAINT [DF_PESSOA_ATIVO]
GO


ALTER TABLE [sis].[PESSOA] DROP CONSTRAINT [DEF_PESSOA_DATA_OPERACAO]
GO


ALTER TABLE [sis].[PESSOA] DROP CONSTRAINT [PK_PESSOA]
GO


ALTER TABLE [sis].[PESSOA] DROP CONSTRAINT [CC_PESSOA_ATIVO]
GO


DROP TABLE [sis].[PESSOA]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "cfg.CIDADE"                                                */
/* ---------------------------------------------------------------------- */

GO


/* Drop constraints */

ALTER TABLE [cfg].[CIDADE] DROP CONSTRAINT [PK_CIDADE]
GO


DROP TABLE [cfg].[CIDADE]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "cfg.ESTADO"                                                */
/* ---------------------------------------------------------------------- */

GO


/* Drop constraints */

ALTER TABLE [cfg].[ESTADO] DROP CONSTRAINT [PK_ESTADO]
GO


DROP TABLE [cfg].[ESTADO]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "log.PAGAMENTO_DIVERSO"                                     */
/* ---------------------------------------------------------------------- */

GO


DROP TABLE [log].[PAGAMENTO_DIVERSO]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "sis.PAGAMENTO_DIVERSO"                                     */
/* ---------------------------------------------------------------------- */

GO


/* Drop constraints */

ALTER TABLE [sis].[PAGAMENTO_DIVERSO] DROP CONSTRAINT [DEF_PAGAMENTO_DIVERSO_DATA_OPERACAO]
GO


ALTER TABLE [sis].[PAGAMENTO_DIVERSO] DROP CONSTRAINT [PK_PAGAMENTO_DIVERSO]
GO


DROP TABLE [sis].[PAGAMENTO_DIVERSO]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "log.FORMA_PAGAMENTO"                                       */
/* ---------------------------------------------------------------------- */

GO


DROP TABLE [log].[FORMA_PAGAMENTO]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "sis.FORMA_PAGAMENTO"                                       */
/* ---------------------------------------------------------------------- */

GO


/* Drop constraints */

ALTER TABLE [sis].[FORMA_PAGAMENTO] DROP CONSTRAINT [DEF_FORMA_PAGAMENTO_ATIVO]
GO


ALTER TABLE [sis].[FORMA_PAGAMENTO] DROP CONSTRAINT [DEF_FORMA_PAGAMENTO_DATA_OPERACAO]
GO


ALTER TABLE [sis].[FORMA_PAGAMENTO] DROP CONSTRAINT [PK_FORMA_PAGAMENTO]
GO


ALTER TABLE [sis].[FORMA_PAGAMENTO] DROP CONSTRAINT [TUC_FORMA_PAGAMENTO_DESCRICAO]
GO


DROP TABLE [sis].[FORMA_PAGAMENTO]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "log.PESSOA"                                                */
/* ---------------------------------------------------------------------- */

GO


DROP TABLE [log].[PESSOA]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "log.OBRIGACAO"                                             */
/* ---------------------------------------------------------------------- */

GO


DROP TABLE [log].[OBRIGACAO]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "log.SANTO"                                                 */
/* ---------------------------------------------------------------------- */

GO


DROP TABLE [log].[SANTO]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "log.ESTADO_CIVIL"                                          */
/* ---------------------------------------------------------------------- */

GO


DROP TABLE [log].[ESTADO_CIVIL]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "cfg.ESTADO_CIVIL"                                          */
/* ---------------------------------------------------------------------- */

GO


/* Drop constraints */

ALTER TABLE [cfg].[ESTADO_CIVIL] DROP CONSTRAINT [DEF_ESTADO_CIVIL_ATIVO]
GO


ALTER TABLE [cfg].[ESTADO_CIVIL] DROP CONSTRAINT [DEF_ESTADO_CIVIL_DATA_OPERACAO]
GO


ALTER TABLE [cfg].[ESTADO_CIVIL] DROP CONSTRAINT [PK_ESTADO_CIVIL]
GO


ALTER TABLE [cfg].[ESTADO_CIVIL] DROP CONSTRAINT [TUC_ESTADO_CIVIL_DESCRICAO]
GO


DROP TABLE [cfg].[ESTADO_CIVIL]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "sis.PLANO"                                                 */
/* ---------------------------------------------------------------------- */

GO


/* Drop constraints */

ALTER TABLE [sis].[PLANO] DROP CONSTRAINT [DF_PLANO_ATIVO]
GO


ALTER TABLE [sis].[PLANO] DROP CONSTRAINT [DEF_PLANO_DATA_OPERACAO]
GO


ALTER TABLE [sis].[PLANO] DROP CONSTRAINT [PK_PLANO]
GO


ALTER TABLE [sis].[PLANO] DROP CONSTRAINT [CC_PLANO_ATIVO]
GO


ALTER TABLE [sis].[PLANO] DROP CONSTRAINT [TUC_PLANO_DESCRICAO]
GO


DROP TABLE [sis].[PLANO]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "log.PLANO"                                                 */
/* ---------------------------------------------------------------------- */

GO


DROP TABLE [log].[PLANO]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "log.PESSOA_PLANO"                                          */
/* ---------------------------------------------------------------------- */

GO


DROP TABLE [log].[PESSOA_PLANO]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "log.PESSOA_FILANTROPIA"                                    */
/* ---------------------------------------------------------------------- */

GO


DROP TABLE [log].[PESSOA_FILANTROPIA]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "log.FINANCEIRO_ESTORNO"                                    */
/* ---------------------------------------------------------------------- */

GO


DROP TABLE [log].[FINANCEIRO_ESTORNO]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "log.FINANCEIRO_ALTERACAO"                                  */
/* ---------------------------------------------------------------------- */

GO


DROP TABLE [log].[FINANCEIRO_ALTERACAO]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "log.FINANCEIRO"                                            */
/* ---------------------------------------------------------------------- */

GO


DROP TABLE [log].[FINANCEIRO]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "sis.FILANTROPIA"                                           */
/* ---------------------------------------------------------------------- */

GO


/* Drop constraints */

ALTER TABLE [sis].[FILANTROPIA] DROP CONSTRAINT [DF_FILANTROPIA_ATIVO]
GO


ALTER TABLE [sis].[FILANTROPIA] DROP CONSTRAINT [DEF_FILANTROPIA_DATA_OPERACAO]
GO


ALTER TABLE [sis].[FILANTROPIA] DROP CONSTRAINT [PK_FILANTROPIA]
GO


ALTER TABLE [sis].[FILANTROPIA] DROP CONSTRAINT [TUC_FILANTROPIA_DESCRICAO]
GO


DROP TABLE [sis].[FILANTROPIA]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "log.FILANTROPIA"                                           */
/* ---------------------------------------------------------------------- */

GO


DROP TABLE [log].[FILANTROPIA]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "log.CONFIGURACAO"                                          */
/* ---------------------------------------------------------------------- */

GO


DROP TABLE [log].[CONFIGURACAO]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "cfg.CONFIGURACAO"                                          */
/* ---------------------------------------------------------------------- */

GO


/* Drop constraints */

ALTER TABLE [cfg].[CONFIGURACAO] DROP CONSTRAINT [DEF_CONFIGURACAO_FIN_JUROS_DIA]
GO


ALTER TABLE [cfg].[CONFIGURACAO] DROP CONSTRAINT [DEF_CONFIGURACAO_ATIVO]
GO


ALTER TABLE [cfg].[CONFIGURACAO] DROP CONSTRAINT [DEF_CONFIGURACAO_DATA_OPERACAO]
GO


ALTER TABLE [cfg].[CONFIGURACAO] DROP CONSTRAINT [PK__CONFIGUR__83C33A775AF93CFD]
GO


ALTER TABLE [cfg].[CONFIGURACAO] DROP CONSTRAINT [CC_CONFIGURACAO_ATIVO]
GO


DROP TABLE [cfg].[CONFIGURACAO]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "sis.CLASSIFICACAO"                                         */
/* ---------------------------------------------------------------------- */

GO


/* Drop constraints */

ALTER TABLE [sis].[CLASSIFICACAO] DROP CONSTRAINT [DF_CLASSIFICACAO_ATIVO]
GO


ALTER TABLE [sis].[CLASSIFICACAO] DROP CONSTRAINT [DEF_CLASSIFICACAO_DATA_OPERACAO]
GO


ALTER TABLE [sis].[CLASSIFICACAO] DROP CONSTRAINT [PK_CLASSIFICACAO]
GO


ALTER TABLE [sis].[CLASSIFICACAO] DROP CONSTRAINT [CC_CLASSIFICACAO_ATIVO]
GO


ALTER TABLE [sis].[CLASSIFICACAO] DROP CONSTRAINT [TUC_CLASSIFICACAO_DESCRICAO]
GO


DROP TABLE [sis].[CLASSIFICACAO]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "log.CLASSIFICACAO"                                         */
/* ---------------------------------------------------------------------- */

GO


DROP TABLE [log].[CLASSIFICACAO]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "sis.ATIVIDADE"                                             */
/* ---------------------------------------------------------------------- */

GO


/* Drop constraints */

ALTER TABLE [sis].[ATIVIDADE] DROP CONSTRAINT [DEF_ATIVIDADE_ATIVO]
GO


ALTER TABLE [sis].[ATIVIDADE] DROP CONSTRAINT [DEF_ATIVIDADE_DATA_OPERACAO]
GO


ALTER TABLE [sis].[ATIVIDADE] DROP CONSTRAINT [PK_ATIVIDADE]
GO


ALTER TABLE [sis].[ATIVIDADE] DROP CONSTRAINT [CC_ATIVIDADE_ATIVO]
GO


ALTER TABLE [sis].[ATIVIDADE] DROP CONSTRAINT [TUC_ATIVIDADE_1]
GO


DROP TABLE [sis].[ATIVIDADE]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "log.ATIVIDADE"                                             */
/* ---------------------------------------------------------------------- */

GO


DROP TABLE [log].[ATIVIDADE]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "log.TIPO_DOCUMENTO"                                        */
/* ---------------------------------------------------------------------- */

GO


DROP TABLE [log].[TIPO_DOCUMENTO]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "log.DOCUMENTO"                                             */
/* ---------------------------------------------------------------------- */

GO


DROP TABLE [log].[DOCUMENTO]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "sis.TIPO_DOCUMENTO"                                        */
/* ---------------------------------------------------------------------- */

GO


/* Drop constraints */

ALTER TABLE [sis].[TIPO_DOCUMENTO] DROP CONSTRAINT [DF_TIPO_DOCUMENTO_ATIVO]
GO


ALTER TABLE [sis].[TIPO_DOCUMENTO] DROP CONSTRAINT [DEF_TIPO_DOCUMENTO_DATA_OPERACAO]
GO


ALTER TABLE [sis].[TIPO_DOCUMENTO] DROP CONSTRAINT [PK_TIPO_DOCUMENTO]
GO


ALTER TABLE [sis].[TIPO_DOCUMENTO] DROP CONSTRAINT [CC_TIPO_DOCUMENTO_ATIVO]
GO


ALTER TABLE [sis].[TIPO_DOCUMENTO] DROP CONSTRAINT [TUC_TIPO_DOCUMENTO_DESCRICAO]
GO


DROP TABLE [sis].[TIPO_DOCUMENTO]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "log.USUARIO_MODULO"                                        */
/* ---------------------------------------------------------------------- */

GO


DROP TABLE [log].[USUARIO_MODULO]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "log.USUARIO"                                               */
/* ---------------------------------------------------------------------- */

GO


DROP TABLE [log].[USUARIO]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "sis.TIPO_ENDERECO"                                         */
/* ---------------------------------------------------------------------- */

GO


/* Drop constraints */

ALTER TABLE [sis].[TIPO_ENDERECO] DROP CONSTRAINT [DEF_TIPO_ENDERECO_ATIVO]
GO


ALTER TABLE [sis].[TIPO_ENDERECO] DROP CONSTRAINT [DEF_TIPO_ENDERECO_DATA_OPERACAO]
GO


ALTER TABLE [sis].[TIPO_ENDERECO] DROP CONSTRAINT [PK_TIPO_ENDERECO]
GO


ALTER TABLE [sis].[TIPO_ENDERECO] DROP CONSTRAINT [CC_TIPO_ENDERECO_ATIVO]
GO


ALTER TABLE [sis].[TIPO_ENDERECO] DROP CONSTRAINT [TUC_TIPO_ENDERECO_DESCRICAO]
GO


DROP TABLE [sis].[TIPO_ENDERECO]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "log.TIPO_ENDERECO"                                         */
/* ---------------------------------------------------------------------- */

GO


/* Drop constraints */

DROP TABLE [log].[TIPO_ENDERECO]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "sis.TIPO_CONTATO"                                          */
/* ---------------------------------------------------------------------- */

GO


/* Drop constraints */

ALTER TABLE [sis].[TIPO_CONTATO] DROP CONSTRAINT [DEF_TIPO_CONTATO_ATIVO]
GO


ALTER TABLE [sis].[TIPO_CONTATO] DROP CONSTRAINT [DEF_TIPO_CONTATO_DATA_OPERACAO]
GO


ALTER TABLE [sis].[TIPO_CONTATO] DROP CONSTRAINT [PK_TIPO_CONTATO]
GO


ALTER TABLE [sis].[TIPO_CONTATO] DROP CONSTRAINT [CC_TIPO_CONTATO_ATIVO]
GO


ALTER TABLE [sis].[TIPO_CONTATO] DROP CONSTRAINT [TUC_TIPO_CONTATO_DESCRICAO]
GO


DROP TABLE [sis].[TIPO_CONTATO]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "log.TIPO_CONTATO"                                          */
/* ---------------------------------------------------------------------- */

GO


DROP TABLE [log].[TIPO_CONTATO]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "log.MODULO"                                                */
/* ---------------------------------------------------------------------- */

GO


DROP TABLE [log].[MODULO]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "log.CONTATO"                                               */
/* ---------------------------------------------------------------------- */

GO


DROP TABLE [log].[CONTATO]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "log.ENDERECO"                                              */
/* ---------------------------------------------------------------------- */

GO


DROP TABLE [log].[ENDERECO]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "cfg.PAIS"                                                  */
/* ---------------------------------------------------------------------- */

GO


/* Drop constraints */

ALTER TABLE [cfg].[PAIS] DROP CONSTRAINT [PK_PAIS]
GO


DROP TABLE [cfg].[PAIS]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "cfg.USUARIO_MODULO"                                        */
/* ---------------------------------------------------------------------- */

GO


/* Drop constraints */

ALTER TABLE [cfg].[USUARIO_MODULO] DROP CONSTRAINT [DEF_USUARIO_MODULO_PERMISSAO]
GO


ALTER TABLE [cfg].[USUARIO_MODULO] DROP CONSTRAINT [DEF_USUARIO_MODULO_BLOQUEADO]
GO


ALTER TABLE [cfg].[USUARIO_MODULO] DROP CONSTRAINT [DEF_USUARIO_MODULO_DATA_OPERACAO]
GO


ALTER TABLE [cfg].[USUARIO_MODULO] DROP CONSTRAINT [PK_USUARIO_MODULO]
GO


ALTER TABLE [cfg].[USUARIO_MODULO] DROP CONSTRAINT [CC_USUARIO_MODULO_BLOQUEADO]
GO


ALTER TABLE [cfg].[USUARIO_MODULO] DROP CONSTRAINT [CC_USUARIO_MODULO_PERMISSAO]
GO


DROP TABLE [cfg].[USUARIO_MODULO]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "cfg.MODULO"                                                */
/* ---------------------------------------------------------------------- */

GO


/* Drop constraints */

ALTER TABLE [cfg].[MODULO] DROP CONSTRAINT [DF_MODULO_ATIVO]
GO


ALTER TABLE [cfg].[MODULO] DROP CONSTRAINT [DEF_MODULO_DATA_OPERACAO]
GO


ALTER TABLE [cfg].[MODULO] DROP CONSTRAINT [PK_MODULO]
GO


ALTER TABLE [cfg].[MODULO] DROP CONSTRAINT [CC_MODULO_ATIVO]
GO


ALTER TABLE [cfg].[MODULO] DROP CONSTRAINT [TUC_MODULO_COMPONENTE]
GO


DROP TABLE [cfg].[MODULO]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "cfg.USUARIO"                                               */
/* ---------------------------------------------------------------------- */

GO


/* Drop constraints */

ALTER TABLE [cfg].[USUARIO] DROP CONSTRAINT [DF_USUARIO_ATIVO]
GO


ALTER TABLE [cfg].[USUARIO] DROP CONSTRAINT [DEF_USUARIO_DATA_OPERACAO]
GO


ALTER TABLE [cfg].[USUARIO] DROP CONSTRAINT [PK_USUARIO]
GO


ALTER TABLE [cfg].[USUARIO] DROP CONSTRAINT [CC_USUARIO_%column%]
GO


ALTER TABLE [cfg].[USUARIO] DROP CONSTRAINT [CC_USUARIO_ATIVO]
GO


ALTER TABLE [cfg].[USUARIO] DROP CONSTRAINT [CK_USUARIO_%column%]
GO


ALTER TABLE [cfg].[USUARIO] DROP CONSTRAINT [TUC_USUARIO_LOGIN]
GO


DROP TABLE [cfg].[USUARIO]
GO

