USE STRAES_XM;

DROP TABLE [old].[origempagamento];

CREATE TABLE [old].[origempagamento] (
  idorigem int,
  origemPagamento varchar(30) )

INSERT INTO [old].[origempagamento]
VALUES (5,'Obrigação/Bichos'),
	   (4,'Doação'),
	   (3,'Biblioteca'),
	   (2,'Bazar'),
	   (1,'Mensalidades'),
	   (10,'Outros'),
	   (9,'Venda de sucatas'),
	   (8,'Reembolso de Despesas'),
	   (7,'Obrigação/Manutenção'),
	   (6,'Obrigação/Lavagem de Roupas');