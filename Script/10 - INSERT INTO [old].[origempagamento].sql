USE STRAES_XM;

DROP TABLE [old].[origempagamento];

CREATE TABLE [old].[origempagamento] (
  idorigem int,
  origemPagamento varchar(30) )

INSERT INTO [old].[origempagamento]
VALUES (5,'Obriga��o/Bichos'),
	   (4,'Doa��o'),
	   (3,'Biblioteca'),
	   (2,'Bazar'),
	   (1,'Mensalidades'),
	   (10,'Outros'),
	   (9,'Venda de sucatas'),
	   (8,'Reembolso de Despesas'),
	   (7,'Obriga��o/Manuten��o'),
	   (6,'Obriga��o/Lavagem de Roupas');