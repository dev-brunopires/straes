USE STRAES_XM
GO

/*Cadastro do usu�rio Administrador*/
EXEC [cfg].[P_USUARIO_INSERT] 'admin',   'admin',   'Administrador', '1985-01-12', 'admin'
EXEC [cfg].[P_USUARIO_INSERT] 'usuario', 'usuario', 'Usu�rio Comum', '1985-12-01', 'admin'

/*Cadastro dos bot�es da �rea principal*/
EXEC [cfg].[P_MODULO_INSERT] NULL, '�rea Principal - Cadastro de Usu�rio',		'BtnMnuUsuario',			'admin'
EXEC [cfg].[P_MODULO_INSERT] NULL, '�rea Principal - Cadastro de M�dulo',		'BtnMnuModulo',				'admin'
EXEC [cfg].[P_MODULO_INSERT] NULL, '�rea Principal - Permiss�o de Acesso',		'BtnMnuPermissao',			'admin'
EXEC [cfg].[P_MODULO_INSERT] NULL, '�rea Principal - Cadastro de Pessoa',		'BtnMnuPessoa',				'admin'
EXEC [cfg].[P_MODULO_INSERT] NULL, '�rea Principal - Cadastro de Plano',		'BtnMnuPlano',				'admin'
EXEC [cfg].[P_MODULO_INSERT] NULL, '�rea Principal - Cadastro de Filantropia',  'BtnMnuFilantropia',		'admin'
EXEC [cfg].[P_MODULO_INSERT] NULL, '�rea Principal - Concess�o de Desconto',	'BtnMnuDesconto',			'admin'
EXEC [cfg].[P_MODULO_INSERT] NULL, '�rea Principal - Tesouraria',				'BtnMnuTesouraria',			'admin'
EXEC [cfg].[P_MODULO_INSERT] NULL, '�rea Principal - Pagamento Diversos',		'BtnMnuPagamentoDiversos',	'admin'

/*Cadastro Menu*/
EXEC [cfg].[P_MODULO_INSERT] NULL, 'Menu Principal - Menu Cadastro',				'mnuCad',		'admin'
EXEC [cfg].[P_MODULO_INSERT] 9,    'Menu Cadastro - Usu�rio',						'mnuCadUsu',	'admin'
EXEC [cfg].[P_MODULO_INSERT] 9,    'Menu Cadastro - Classifica��o',					'mnuCadCla',	'admin'
EXEC [cfg].[P_MODULO_INSERT] 9,    'Menu Cadastro - Atividade',						'mnuCadAti',	'admin'
EXEC [cfg].[P_MODULO_INSERT] 9,    'Menu Cadastro - Tipo de Contato',				'mnuCadTpC',	'admin'
EXEC [cfg].[P_MODULO_INSERT] 9,    'Menu Cadastro - Tipo de Endere�o',				'mnuCadTpD',	'admin'
EXEC [cfg].[P_MODULO_INSERT] 9,    'Menu Cadastro - Tipo de Endere�o',				'mnuCadTpE',	'admin'
EXEC [cfg].[P_MODULO_INSERT] 9,    'Menu Cadastro - Plano',							'mnuCadPla',	'admin'
EXEC [cfg].[P_MODULO_INSERT] 9,    'Menu Cadastro - Filantropia',					'mnuCadFil',	'admin'
EXEC [cfg].[P_MODULO_INSERT] 9,    'Menu Cadastro - Estado Civil',					'mnuCadEst',	'admin'
EXEC [cfg].[P_MODULO_INSERT] 9,    'Menu Cadastro - Forma de Pagamento',			'mnuCadFor',	'admin'
EXEC [cfg].[P_MODULO_INSERT] 9,    'Menu Cadastro - Pessoa',						'mnuCadPes',	'admin'

EXEC [cfg].[P_MODULO_INSERT] NULL, 'Menu Principal - Menu Par�metros',				'mnuPar',		'admin'
EXEC [cfg].[P_MODULO_INSERT] 19,   'Menu Par�metros - Cadastro de M�dulo',			'mnuParMod',	'admin'
EXEC [cfg].[P_MODULO_INSERT] 19,   'Menu Par�metros - Cadastro de M�dulo',			'mnuParPer',	'admin'
EXEC [cfg].[P_MODULO_INSERT] 19,   'Menu Par�metros - Configura��es do Sistema',	'mnuParCon',	'admin'

EXEC [cfg].[P_MODULO_INSERT] NULL, 'Menu Principal - Menu Financeiro',				'mnuFin',		'admin'
EXEC [cfg].[P_MODULO_INSERT] 23,   'Menu Financeiro - Concess�o de Desconto',		'mnuFinDes',	'admin'
EXEC [cfg].[P_MODULO_INSERT] 23,   'Menu Financeiro - Tesouraria',					'mnuFinTes',	'admin'
EXEC [cfg].[P_MODULO_INSERT] 23,   'Menu Financeiro - Pagamento Diversos',			'mnuFinDiv',	'admin'

EXEC [cfg].[P_MODULO_INSERT] NULL, 'Menu Principal - Menu Sistema',					'mnuSis',		'admin'
EXEC [cfg].[P_MODULO_INSERT] 26,   'Menu Sistema - Sobre',							'mnuSisSob',	'admin'
EXEC [cfg].[P_MODULO_INSERT] 26,   'Menu Sistema - Sair',							'mnuSisSai',	'admin'


/*V�nculo dos M�dulos x Usu�rios*/
--Administrador
--Bot�es
EXEC [cfg].[P_USUARIO_MODULO_INSERT] 1, 1,   1, 0, 'admin' --�rea Principal - Cadastro de Usu�rio
EXEC [cfg].[P_USUARIO_MODULO_INSERT] 1, 2,   1, 0, 'admin' --�rea Principal - Cadastro de Modulo
EXEC [cfg].[P_USUARIO_MODULO_INSERT] 1, 3,   1, 0, 'admin' --�rea Principal - Permiss�o de Acesso
EXEC [cfg].[P_USUARIO_MODULO_INSERT] 1, 4,   1, 0, 'admin' --�rea Principal - Cadastro de Pessoa
EXEC [cfg].[P_USUARIO_MODULO_INSERT] 1, 5,   1, 0, 'admin' --�rea Principal - Cadastro de Plano
EXEC [cfg].[P_USUARIO_MODULO_INSERT] 1, 6,   1, 0, 'admin' --�rea Principal - Cadastro de Filantropia
EXEC [cfg].[P_USUARIO_MODULO_INSERT] 1, 7,   1, 0, 'admin' --�rea Principal - Concess�o de Desconto
EXEC [cfg].[P_USUARIO_MODULO_INSERT] 1, 8,   1, 0, 'admin' --�rea Principal - Tesouraria
EXEC [cfg].[P_USUARIO_MODULO_INSERT] 1, 9,   1, 0, 'admin' --�rea Principal - Pagamentos Diversos

--Menu
EXEC [cfg].[P_USUARIO_MODULO_INSERT] 1, 10,   1, 1, 'admin' --Menu Principal - Cadastro
EXEC [cfg].[P_USUARIO_MODULO_INSERT] 1, 11,  1, 0, 'admin' --Menu Cadastro - Usu�rio
EXEC [cfg].[P_USUARIO_MODULO_INSERT] 1, 12,  1, 0, 'admin' --Menu Cadastro - Classifica��o
EXEC [cfg].[P_USUARIO_MODULO_INSERT] 1, 13,  1, 0, 'admin' --Menu Cadastro - Atividade
EXEC [cfg].[P_USUARIO_MODULO_INSERT] 1, 14,  1, 0, 'admin' --Menu Cadastro - Tipo de Contato
EXEC [cfg].[P_USUARIO_MODULO_INSERT] 1, 15,  1, 0, 'admin' --Menu Cadastro - Tipo de ENDERECO
EXEC [cfg].[P_USUARIO_MODULO_INSERT] 1, 16,  1, 0, 'admin' --Menu Cadastro - Tipo de Endere�o
EXEC [cfg].[P_USUARIO_MODULO_INSERT] 1, 17,  1, 0, 'admin' --Menu Cadastro - Plano
EXEC [cfg].[P_USUARIO_MODULO_INSERT] 1, 18,  1, 0, 'admin' --Menu Cadastro - Filantropia
EXEC [cfg].[P_USUARIO_MODULO_INSERT] 1, 19,  1, 0, 'admin' --Menu Cadastro - Estado Civil
EXEC [cfg].[P_USUARIO_MODULO_INSERT] 1, 20,  1, 0, 'admin' --Menu Cadastro - Forma de Pagamento
EXEC [cfg].[P_USUARIO_MODULO_INSERT] 1, 21,  1, 0, 'admin' --Menu Cadastro - Pessoa

EXEC [cfg].[P_USUARIO_MODULO_INSERT] 1, 22,  1, 1, 'admin' --Menu Principal - Menu Par�metros
EXEC [cfg].[P_USUARIO_MODULO_INSERT] 1, 23,  1, 0, 'admin' --Menu Par�metros - Cadastro de M�dulo
EXEC [cfg].[P_USUARIO_MODULO_INSERT] 1, 24,  1, 0, 'admin' --Menu Par�metros - Permiss�o de Acesso
EXEC [cfg].[P_USUARIO_MODULO_INSERT] 1, 25,  1, 0, 'admin' --Menu Par�metros - Configura��es do Sistema

EXEC [cfg].[P_USUARIO_MODULO_INSERT] 1, 26,  1, 1, 'admin' --Menu Principal - Menu Financeiro
EXEC [cfg].[P_USUARIO_MODULO_INSERT] 1, 27,  1, 0, 'admin' --Menu Financeiro - Concess�o de Desconto
EXEC [cfg].[P_USUARIO_MODULO_INSERT] 1, 28,  1, 0, 'admin' --Menu Financeiro - Tesouraria
EXEC [cfg].[P_USUARIO_MODULO_INSERT] 1, 29,  1, 0, 'admin' --Menu Financeiro - Pagamentos Diversos

EXEC [cfg].[P_USUARIO_MODULO_INSERT] 1, 30,  1, 1, 'admin' --Menu Principal - Sistema
EXEC [cfg].[P_USUARIO_MODULO_INSERT] 1, 31,  1, 0, 'admin' --Menu Sistema - Sobre
EXEC [cfg].[P_USUARIO_MODULO_INSERT] 1, 32,  1, 0, 'admin' --Menu Sistema - Sair

/*Atividade*/
EXEC [sis].[P_ATIVIDADE_INSERT] 'Importa��o',	'admin'
EXEC [sis].[P_ATIVIDADE_INSERT] 'Consulente',	'admin'
EXEC [sis].[P_ATIVIDADE_INSERT]	'Trabalhador',	'admin'
EXEC [sis].[P_ATIVIDADE_INSERT]	'Visitante',	'admin'

/*Classifica��o*/
EXEC [sis].[P_CLASSIFICACAO_INSERT] 'Pessoa F�sica',	'admin'
EXEC [sis].[P_CLASSIFICACAO_INSERT]	'Pessoa Jur�dica',	'admin'

/*Tipo Contato*/
EXEC [sis].[P_TIPO_CONTATO_INSERT] 'E-mail',			'admin'
EXEC [sis].[P_TIPO_CONTATO_INSERT] 'Site',				'admin'
EXEC [sis].[P_TIPO_CONTATO_INSERT] 'Telefone Fixo',		'admin'
EXEC [sis].[P_TIPO_CONTATO_INSERT] 'Telefone Celular',	'admin'

/*Tipo DOCUMENTO*/
EXEC [sis].[P_TIPO_DOCUMENTO_INSERT] 'CPF',					'admin'
EXEC [sis].[P_TIPO_DOCUMENTO_INSERT] 'RG',					'admin'
EXEC [sis].[P_TIPO_DOCUMENTO_INSERT] 'CNPJ',				'admin'
EXEC [sis].[P_TIPO_DOCUMENTO_INSERT] 'Inscri��o Municipal',	'admin'
EXEC [sis].[P_TIPO_DOCUMENTO_INSERT] 'Inscri��o Estadual',	'admin'

/*Tipo Endere�o*/
EXEC [sis].[P_TIPO_ENDERECO_INSERT] 'Comercial',	'admin'
EXEC [sis].[P_TIPO_ENDERECO_INSERT] 'Residencial',	'admin'

/*Plano*/
EXEC [sis].[P_PLANO_INSERT] 'Importa��o',				   0,   'admin'
EXEC [sis].[P_PLANO_INSERT] 'Contribui��o Consulente',	   25,  'admin'
EXEC [sis].[P_PLANO_INSERT] 'Contribui��o Filho de Santo', 50,  'admin'
EXEC [sis].[P_PLANO_INSERT] 'Contribui��o Pai de Santo',   100, 'admin'

/*Filantropia*/
EXEC [sis].[P_FILANTROPIA_INSERT] 'Importa��o',						0,  0, 'admin'
EXEC [sis].[P_FILANTROPIA_INSERT] 'Sem Filantropia R$ 0,00 e 0%',   0,  0, 'admin'
EXEC [sis].[P_FILANTROPIA_INSERT] 'Filantropia R$ 5,00',            0,  5, 'admin'
EXEC [sis].[P_FILANTROPIA_INSERT] 'Filantropia R$ 10,00',		    0, 10, 'admin'
EXEC [sis].[P_FILANTROPIA_INSERT] 'Filantropia R$ 15,00',		    0, 15, 'admin'
EXEC [sis].[P_FILANTROPIA_INSERT] 'Filantropia R$ 20,00',		    0, 20, 'admin'
EXEC [sis].[P_FILANTROPIA_INSERT] 'Filantropia 15%',			   15,  0, 'admin'
EXEC [sis].[P_FILANTROPIA_INSERT] 'Filantropia 30%',			   30,  0, 'admin'
EXEC [sis].[P_FILANTROPIA_INSERT] 'Filantropia 50%',			   50,  0, 'admin'
EXEC [sis].[P_FILANTROPIA_INSERT] 'Filantropia 100%',			  100,  0, 'admin'

/*configuracao*/
EXEC [cfg].[P_CONFIGURACAO_INSERT] '2019', '10', 0.50, 0, 'admin'
EXEC [cfg].[P_CONFIGURACAO_INSERT] '2020', '10', 1.00, 1, 'admin'
EXEC [cfg].[P_CONFIGURACAO_INSERT] '2021', '10', 1.50, 0, 'admin'

EXEC [cfg].[P_ESTADO_CIVIL_INSERT] 'Solteiro(a)',	'admin'
EXEC [cfg].[P_ESTADO_CIVIL_INSERT] 'Casado(a)',		'admin'
EXEC [cfg].[P_ESTADO_CIVIL_INSERT] 'Divorciado(a)', 'admin'
EXEC [cfg].[P_ESTADO_CIVIL_INSERT] 'Vi�vo(a)',		'admin'
EXEC [cfg].[P_ESTADO_CIVIL_INSERT] 'Separado(a)',	'admin'

EXEC [sis].[P_FORMA_PAGAMENTO_INSERT] 'Importa��o',						'admin'
EXEC [sis].[P_FORMA_PAGAMENTO_INSERT] 'Cart�o/Cr�dito/American Express','admin'
EXEC [sis].[P_FORMA_PAGAMENTO_INSERT] 'Cart�o/Cr�dito/Master',			'admin'
EXEC [sis].[P_FORMA_PAGAMENTO_INSERT] 'Cart�o/Cr�dito/Visa',			'admin'
EXEC [sis].[P_FORMA_PAGAMENTO_INSERT] 'Cart�o/D�bito/American Express',	'admin'
EXEC [sis].[P_FORMA_PAGAMENTO_INSERT] 'Cart�o/D�bito/Master',			'admin'
EXEC [sis].[P_FORMA_PAGAMENTO_INSERT] 'Cart�o/D�bito/Visa',				'admin'
EXEC [sis].[P_FORMA_PAGAMENTO_INSERT] 'Cart�o/Master',					'admin'
EXEC [sis].[P_FORMA_PAGAMENTO_INSERT] 'Cart�o/Visa',					'admin'
EXEC [sis].[P_FORMA_PAGAMENTO_INSERT] 'Cheque',							'admin'
EXEC [sis].[P_FORMA_PAGAMENTO_INSERT] 'DEP�SITO C/C',					'admin'
EXEC [sis].[P_FORMA_PAGAMENTO_INSERT] 'Dinheiro',						'admin'

/*Pessoa*/
/*EXEC [sis].[P_PESSOA_INSERT] '999999', 1, 'Wellington de Sousa Marques',								'1985-01-12', 1, 1, '012020', '122020', 1, '012020', '012020',	null, null, null, null, null, null, null, null, null, null, null, null, null, 'admin'
EXEC [sis].[P_PESSOA_INSERT] null,	   1, 'Estev�o Marques',								'2018-06-11', 2, 2, '022020', '062020', 0, null,	  null,		null, null, null, null, null, null, null, null, null, null, null, null, null, 'admin'
EXEC [sis].[P_PESSOA_INSERT] '000002', 1, 'Izabele Brito',									'1983-09-05', 1, 1, '032020', '062020', 0, null,	  null,		null, null, null, null, null, null, null, null, null, null, null, null, null, 'admin'
EXEC [sis].[P_PESSOA_INSERT] null,     1, 'Stephanie Marques',								'2007-03-06', 2, 2, '072020', '122020', 2, '072020', '122020',	null, null, null, null, null, null, null, null, null, null, null, null, null, 'admin'
EXEC [sis].[P_PESSOA_INSERT] '000003', 2, 'Marques Solu��es em Tecnologia da Informa��o',	'2018-08-01', 3, 1, '012020', '122020', 0, null,	  null ,	null, null, null, null, null, null, null, null, null, null, null, null, null, 'admin'*/