unit uGlobal;

interface

var
	//CONFIGURAÇÃO
   glbAnoContabil, glbDiaVencimento : String;
   glbJurosDia : Currency;
   glbIdConfiguracao	: Integer;

   //DADOS PARA CONEXÃO COM O BANCO DE DADOS
   glbDatabase, glbPassword, glbUser, glbLocal : String;

   //DADOS DO USUÁRIO DO SISTEMA
   glbIdUsuario : Integer;
   glbUsuario, glbNomeUsuario, glbConsCodigo, glbConsNomeUsuario : String;

   //DADOS DO MÓDULO
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

   //DADOS PARA OPERAÇÕES DE INCLUSÃO, ALTERAÇÃO E EXCLUSÃO
   glbOperacao, glbOperacaoAux : String;

   //DADOS DA PESSOA
   glbIdPessoa : Integer;
   glbMatricula, glbMatriculaOld, glbNomePessoa, glbDataNascimentoPessoa, glbClassificacao, glbAtividade, glbStatusFinanceiro : String;
   glbMotivoStatus, glbStatusPessoa : Boolean;

   //CLASSIFICAÇÃO
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

   //DADOS DO TIPO DE ENDEREÇO
   glbIdTipoEndereco : Integer;

   //ENDEREÇO
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
 	glbVersao : String = 'Versão 3.2';

implementation

end.
