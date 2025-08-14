unit uGlobal;

interface

var
	//CONFIGURA��O
   glbAnoContabil, glbDiaVencimento : String;
   glbJurosDia : Currency;
   glbIdConfiguracao	: Integer;

   //DADOS PARA CONEX�O COM O BANCO DE DADOS
   glbDatabase, glbPassword, glbUser, glbLocal : String;

   //DADOS DO USU�RIO DO SISTEMA
   glbIdUsuario : Integer;
   glbUsuario, glbNomeUsuario, glbConsCodigo, glbConsNomeUsuario : String;

   //DADOS DO M�DULO
   glbIdModulo : Integer;
   glbComponente : String;

   //DADOS DO PLANO
   glbIdPlano : Integer;

   //DADOS PESSOA PLANO
   glbIdPessoaPlano, glbPlanoQtdeRegistro : Integer;
   glbConsMatricula, glbConsNomePessoa : String;

   //DADOS PESSOA_FILANTROPIA
   glbIdPessoaFilantropia, glbFilantropoaQtdeRegistro : Integer;

   //DADOS DO FILANTROPIA
   glbIdFilantropia : Integer;

   //DADOS PARA OPERA��ES DE INCLUS�O, ALTERA��O E EXCLUS�O
   glbOperacao, glbOperacaoAux : String;

   //DADOS DA PESSOA
   glbIdPessoa : Integer;
   glbMatricula, glbMatriculaOld, glbNomePessoa, glbDataNascimentoPessoa, glbClassificacao, glbAtividade, glbStatusFinanceiro : String;
   glbMotivoStatus, glbStatusPessoa : Boolean;

   //CLASSIFICA��O
   glbIdClassificacao : Integer;

   //ATIVIDADE
   glbIdAtividade : Integer;

   //DADOS DO TIPO DE CONTATO
   glbIdTipoContato : Integer;

   //DADOS CONTATO
   glbIdContato : Integer;

   //DADOS DO TIPO DE DOCUMENTO
   glbIdTipoDocumento : Integer;

   //DOCUMENTO
   glbIdDocumento : Integer;

   //DADOS DO TIPO DE ENDERE�O
   glbIdTipoEndereco : Integer;

   //ENDERE�O
   glbIdEndereco : Integer;

   //FINANCEIRO
   glbIdFinanceiro : Integer;
   glbValor, glbDesconto, glbJuros : Currency;
   glbLabelTotal, glbLabelDesconto, glbLabelJuros : String;
   glbFinalizaPagamento : Boolean;
   glbDataPagamento : TDateTime;

   //ESTADO CIVIL
   glbIdEstadoCivil : Integer;

   //FORMA PAGAMENTO
   glbIdFormaPagamento : Integer;

   //PAGAMENTO DIVERSO
   glbIdPagamentoDiverso : Integer;
   glbFormaPagamento : String;

   //TIPO_PAGAMENTO_DIVERSO
   glbIdTipoPagamentoDiverso : Integer;

   //DADOS DA BAIXA DO BOLETO
   {glbNossoNumero, glbRefer : String;
   glbValor, glbDesconto, glbJuros, glbTotal : Currency;
   glbDiasAtraso : Integer;
   glbVencimento : TDateTime;

   glbConfigPageIndex : Integer;}

const
 	glbVersao : String = 'Vers�o 3.2';

implementation

end.
