unit uCadastroPessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroPadrao, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, cxControls,
  dxBarBuiltInMenu, cxClasses, cxLocalization, ACBrBase, ACBrEnterTab, cxPC,
  Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxDropDownEdit, cxRadioGroup, cxMaskEdit, cxCalendar,
  cxTextEdit, cxLabel, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxCheckBox, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridCustomView,
  cxGrid, cxCurrencyEdit, Datasnap.DBClient, System.ImageList, Vcl.ImgList,
  Vcl.DBCtrls, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter;

type
  TfrmCadastroPessoa = class(TfrmCadastroPadrao)
    cxLabel1: TcxLabel;
    edtNome: TcxTextEdit;
    lblTextoMatricula: TcxLabel;
    cxLabel3: TcxLabel;
    edtDataNascimento: TcxDateEdit;
    tsDocumento: TcxTabSheet;
    cxLabel6: TcxLabel;
    btnVoltarDocumento: TcxButton;
    btnAvancarPrincipal: TcxButton;
    tsPlano: TcxTabSheet;
    btnAvancarDocumento: TcxButton;
    btnVoltarPlano: TcxButton;
    cxLabel24: TcxLabel;
    cmbPlano: TcxComboBox;
    btnCadPlano: TcxButton;
    btnAltPlano: TcxButton;
    cxLabel26: TcxLabel;
    cxLabel27: TcxLabel;
    cmbPlanoDtInicio: TcxComboBox;
    cmbPlanoDtFinal: TcxComboBox;
    cmbClassificacao: TcxComboBox;
    btnCadClassificacao: TcxButton;
    btnAltClassificacao: TcxButton;
    tsContato: TcxTabSheet;
    btnVoltarContato: TcxButton;
    btnAvançarContato: TcxButton;
    cxLabel32: TcxLabel;
    cmbTipoContato: TcxComboBox;
    btnCadTipoContato: TcxButton;
    btnAltTipoContato: TcxButton;
    edtDescricaoContato: TcxTextEdit;
    cxLabel34: TcxLabel;
    dbgContato: TcxGrid;
    dbgContatoDBTableView1: TcxGridDBTableView;
    dbgContatoLevel1: TcxGridLevel;
    btnAdicionarContato: TcxButton;
    cxLabel7: TcxLabel;
    cmbTipoDocumento: TcxComboBox;
    btnCadTipoDocumento: TcxButton;
    btnAltTipoDocumento: TcxButton;
    edtDescricaoDocumento: TcxTextEdit;
    cxLabel8: TcxLabel;
    dbgDocumento: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    btnAdicionarDocumento: TcxButton;
    tsEndereco: TcxTabSheet;
    edtLogradouro: TcxTextEdit;
    cxLabel14: TcxLabel;
    cxLabel15: TcxLabel;
    edtNumero: TcxTextEdit;
    cxLabel16: TcxLabel;
    edtComplemento: TcxTextEdit;
    edtBairro: TcxTextEdit;
    cxLabel17: TcxLabel;
    cxLabel18: TcxLabel;
    cxLabel19: TcxLabel;
    edtCep: TcxMaskEdit;
    cxLabel20: TcxLabel;
    cxLabel4: TcxLabel;
    cmbTipoEndereco: TcxComboBox;
    btnCadTipoEndereco: TcxButton;
    btbAltTipoEndereco: TcxButton;
    btnAdicionarEndereco: TcxButton;
    dbgEndereco: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    btnVoltarEndereco: TcxButton;
    btnAvancarEndereco: TcxButton;
    GroupBox1: TGroupBox;
    cxLabel30: TcxLabel;
    lblPlanoValor: TcxLabel;
    cxLabel25: TcxLabel;
    cmbFilantropia: TcxComboBox;
    btnCadFilantropia: TcxButton;
    btnAltFilantropia: TcxButton;
    cxLabel28: TcxLabel;
    cmbFilantropiaDtInicio: TcxComboBox;
    cxLabel29: TcxLabel;
    cmbFilantropiaDtFinal: TcxComboBox;
    GroupBox2: TGroupBox;
    cxLabel31: TcxLabel;
    lblFilantropiaValor: TcxLabel;
    cxLabel33: TcxLabel;
    lblFilantropiaPercentual: TcxLabel;
    dsContato: TDataSource;
    ImageList: TImageList;
    dsDocumento: TDataSource;
    btnRemoverContato: TcxButton;
    btnRemoverDocumento: TcxButton;
    btnRemoverEndereco: TcxButton;
    dsEndereco: TDataSource;
    cxLabel5: TcxLabel;
    cmbAtividade: TcxComboBox;
    btnCadAtividade: TcxButton;
    btnAltAtividade: TcxButton;
    cbUtilizaMatricula: TcxCheckBox;
    tsEspiritual: TcxTabSheet;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    cxLabel11: TcxLabel;
    cxLabel12: TcxLabel;
    cxLabel13: TcxLabel;
    edtNomePai: TcxTextEdit;
    edtNomeMae: TcxTextEdit;
    cmbEstadoCivil: TcxComboBox;
    tsEmpresa: TcxTabSheet;
    cxLabel22: TcxLabel;
    edtEmpLogradouro: TcxTextEdit;
    cxLabel23: TcxLabel;
    edtEmpNumero: TcxTextEdit;
    cxLabel36: TcxLabel;
    edtEmpBairro: TcxTextEdit;
    cxLabel38: TcxLabel;
    cxLabel35: TcxLabel;
    edtEmpComplemento: TcxTextEdit;
    cxLabel37: TcxLabel;
    cxLabel39: TcxLabel;
    edtEmpCep: TcxMaskEdit;
    edtConjuge: TcxTextEdit;
    edtProfissao: TcxTextEdit;
    cxLabel21: TcxLabel;
    edtRazaoSocial: TcxTextEdit;
    btnCadEstadoCivil: TcxButton;
    btnAltEstadoCivil: TcxButton;
    btnVoltarEmpresa: TcxButton;
    btnAvancarEmpresa: TcxButton;
    btnAvancarPlano: TcxButton;
    btnVoltarEspiritual: TcxButton;
    btnEditarContato: TcxButton;
    btnEditarDocumento: TcxButton;
    btnEditarEndereco: TcxButton;
    cdsSanto: TClientDataSet;
    cdsObrigacao: TClientDataSet;
    dsSanto: TDataSource;
    dsObrigacao: TDataSource;
    pcEspiritual: TPageControl;
    tsSanto: TTabSheet;
    tsObrigacao: TTabSheet;
    edtDataAdmissao: TcxDateEdit;
    cxLabel40: TcxLabel;
    cxLabel41: TcxLabel;
    edtNomeSanto: TcxTextEdit;
    btnAdicionarSanto: TcxButton;
    btnEditarSanto: TcxButton;
    btnRemoverSanto: TcxButton;
    cxGrid1: TcxGrid;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridLevel3: TcxGridLevel;
    cxLabel42: TcxLabel;
    edtDescricaoObrigacao: TcxTextEdit;
    edtDataObrigacao: TcxDateEdit;
    cxLabel43: TcxLabel;
    btnAdicionarObrigacao: TcxButton;
    btnEditarAtualizacao: TcxButton;
    btnRemoverObrigacao: TcxButton;
    cxGrid2: TcxGrid;
    cxGridDBTableView4: TcxGridDBTableView;
    cxGridLevel4: TcxGridLevel;
    cdsContato: TClientDataSet;
    cdsContatoTIPO_CONTATO: TStringField;
    cdsContatoDESCRICAO: TStringField;
    dbgContatoDBTableView1TIPO_CONTATO1: TcxGridDBColumn;
    dbgContatoDBTableView1DESCRICAO1: TcxGridDBColumn;
    cdsDocumento: TClientDataSet;
    cdsDocumentoTIPO_DOCUMENTO: TStringField;
    cdsDocumentoDOCUMENTO: TStringField;
    cxGridDBTableView1TIPO_DOCUMENTO: TcxGridDBColumn;
    cxGridDBTableView1DOCUMENTO: TcxGridDBColumn;
    cdsEndereco: TClientDataSet;
    cdsEnderecoTIPO_ENDERECO: TStringField;
    cdsEnderecoLOGRADOURO: TStringField;
    cdsEnderecoNUMERO: TStringField;
    cdsEnderecoCOMPLEMENTO: TStringField;
    cdsEnderecoBAIRRO: TStringField;
    cdsEnderecoUF: TStringField;
    cdsEnderecoCIDADE: TStringField;
    cdsEnderecoCEP: TStringField;
    cxGridDBTableView2TIPO_ENDERECO1: TcxGridDBColumn;
    cxGridDBTableView2LOGRADOURO1: TcxGridDBColumn;
    cxGridDBTableView2NUMERO1: TcxGridDBColumn;
    cxGridDBTableView2COMPLEMENTO1: TcxGridDBColumn;
    cxGridDBTableView2BAIRRO1: TcxGridDBColumn;
    cxGridDBTableView2UF1: TcxGridDBColumn;
    cxGridDBTableView2CIDADE1: TcxGridDBColumn;
    cxGridDBTableView2CEP1: TcxGridDBColumn;
    cdsSantoDESCRICAO: TStringField;
    cxGridDBTableView3DESCRICAO: TcxGridDBColumn;
    cdsObrigacaoDESCRICAO: TStringField;
    cdsObrigacaoDATA: TDateField;
    cxGridDBTableView4DESCRICAO: TcxGridDBColumn;
    cxGridDBTableView4DATA: TcxGridDBColumn;
    cmbEmpUF: TcxComboBox;
    cmbEmpCidade: TcxComboBox;
    cmbUf: TcxComboBox;
    cmbCidade: TcxComboBox;
    edtMatricula: TcxTextEdit;
    lblInativo: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnCadClassificacaoClick(Sender: TObject);
    procedure btnAltClassificacaoClick(Sender: TObject);
    procedure btnCadTipoContatoClick(Sender: TObject);
    procedure btnAltTipoContatoClick(Sender: TObject);
    procedure btnCadTipoDocumentoClick(Sender: TObject);
    procedure btnAltTipoDocumentoClick(Sender: TObject);
    procedure btnCadTipoEnderecoClick(Sender: TObject);
    procedure btbAltTipoEnderecoClick(Sender: TObject);
    procedure btnVoltarDocumentoClick(Sender: TObject);
    procedure btnAvancarPrincipalClick(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure btnAvancarDocumentoClick(Sender: TObject);
    procedure btnVoltarPlanoClick(Sender: TObject);
    procedure btnVoltarFilantropiaClick(Sender: TObject);
    procedure btnCadFilantropiaClick(Sender: TObject);
    procedure btnCadPlanoClick(Sender: TObject);
    procedure btnAltPlanoClick(Sender: TObject);
    procedure btnAltFilantropiaClick(Sender: TObject);
    procedure cmbPlanoPropertiesChange(Sender: TObject);
    procedure cmbFilantropiaPropertiesChange(Sender: TObject);
    procedure btnAvançarContatoClick(Sender: TObject);
    procedure btnAvancarEnderecoClick(Sender: TObject);
    procedure btnVoltarEnderecoClick(Sender: TObject);
    procedure btnVoltarContatoClick(Sender: TObject);
    procedure btnAdicionarContatoClick(Sender: TObject);
    procedure btnAdicionarDocumentoClick(Sender: TObject);
    procedure btnAdicionarEnderecoClick(Sender: TObject);
    procedure btnCadAtividadeClick(Sender: TObject);
    procedure btnAltAtividadeClick(Sender: TObject);
    procedure mnuContatoRemoverClick(Sender: TObject);
    procedure btnRemoverContatoClick(Sender: TObject);
    procedure btnRemoverDocumentoClick(Sender: TObject);
    procedure cbUtilizaMatriculaClick(Sender: TObject);
    procedure btnCadEstadoCivilClick(Sender: TObject);
    procedure btnAltEstadoCivilClick(Sender: TObject);
    procedure btnEditarContatoClick(Sender: TObject);
    procedure btnEditarDocumentoClick(Sender: TObject);
    procedure btnRemoverEnderecoClick(Sender: TObject);
    procedure btnEditarEnderecoClick(Sender: TObject);
    procedure cmbEmpUFPropertiesChange(Sender: TObject);
    procedure cmbUfPropertiesChange(Sender: TObject);
    procedure btnAdicionarSantoClick(Sender: TObject);
    procedure btnRemoverSantoClick(Sender: TObject);
    procedure btnEditarSantoClick(Sender: TObject);
    procedure btnAdicionarObrigacaoClick(Sender: TObject);
    procedure btnRemoverObrigacaoClick(Sender: TObject);
    procedure btnEditarAtualizacaoClick(Sender: TObject);
    procedure btnVoltarEmpresaClick(Sender: TObject);
    procedure btnAvancarEmpresaClick(Sender: TObject);
    procedure btnAvancarPlanoClick(Sender: TObject);
    procedure btnVoltarEspiritualClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtMatriculaExit(Sender: TObject);
  private
    { Private declarations }
    procedure CarregaInformacoes;
    procedure CarregaInformacoesPlanoFilantropia;
    procedure CarregaInformacoesPessoa;
    procedure CarregaInformacoesContato;
    procedure CarregaInformacoesDocumento;
    procedure CarregaInformacoesEndereco;
    procedure CarregaInformacoesSanto;
    procedure CarregaInformacoesObrigacao;

    procedure RetornaValorPlano( varDescricao : TcxComboBox; varValor : TcxLabel );
    procedure RetornaValorFilantropia( varDescricao : TcxComboBox; varValor, varPercentual : TcxLabel );

    procedure GravaPessoaPlanoFilantropia;
    procedure GravaContato( varIdPessoa : Integer );
    procedure GravaDocumento( varIdPessoa : Integer );
    procedure GravaEndereco( varIdPessoa : Integer );
    procedure GravaSanto( varIdPessoa : Integer );
    procedure GravaObrigacao( varIdPessoa : Integer );


    function ValidaCampos : Boolean;
    function VerificaMatriculaExiste( varMatriculaOld, varMatricula : String ) : Boolean;
  public
    { Public declarations }
  end;

var
  frmCadastroPessoa: TfrmCadastroPessoa;

implementation

{$R *.dfm}

uses uFuncao, uGlobal, uModule, uCadastroPlano, uCadastroFilantropia, uSplash,
  uCadastroClassificacao, uCadastroTipoContato, uCadastroTipoDocumento,
  uCadastroTipoEndereco, uCadastroAtividade, uCadastroEstadoCivil;

procedure TfrmCadastroPessoa.btnAvancarDocumentoClick(Sender: TObject);
begin
  inherited;

   pcDados.ActivePage := tsEndereco;
	cmbTipoEndereco.SetFocus;
end;

procedure TfrmCadastroPessoa.btnAvancarEmpresaClick(Sender: TObject);
begin
  inherited;

   pcDados.ActivePage := tsContato;
   cmbTipoContato.SetFocus;
end;

procedure TfrmCadastroPessoa.btnAvancarEnderecoClick(Sender: TObject);
begin
  inherited;

   pcDados.ActivePage := tsPlano;

   if cmbPlano.Enabled = True then
   	cmbPlano.SetFocus;
end;

procedure TfrmCadastroPessoa.btnAvancarPlanoClick(Sender: TObject);
begin
  inherited;

   pcDados.ActivePage := tsEspiritual;
   edtDataAdmissao.SetFocus;
end;

procedure TfrmCadastroPessoa.btnAvancarPrincipalClick(Sender: TObject);
begin
  inherited;

   pcDados.ActivePage := tsEmpresa;
	edtRazaoSocial.SetFocus;
end;

procedure TfrmCadastroPessoa.btnAvançarContatoClick(Sender: TObject);
begin
  inherited;

   pcDados.ActivePage := tsDocumento;
	cmbTipoDocumento.SetFocus;
end;

procedure TfrmCadastroPessoa.btnCadPlanoClick(Sender: TObject);
begin
  inherited;

	BtnCad(TfrmCadastroPlano, frmCadastroPlano, cmbPlano, 'Plano', 'Cadastro de Plano');
end;

procedure TfrmCadastroPessoa.btnCadTipoContatoClick(Sender: TObject);
begin
  inherited;

  	BtnCad(TfrmCadastroTipoContato, frmCadastroTipoContato, cmbTipoContato, 'Tipo de Contato', 'Tipo de Contato');
end;

procedure TfrmCadastroPessoa.btnCadTipoDocumentoClick(Sender: TObject);
begin
  inherited;

  	BtnCad(TfrmCadastroTipoDocumento, frmCadastroTipoDocumento, cmbTipoDocumento, 'Tipo de Documento', 'Tipo de Documento');
end;

procedure TfrmCadastroPessoa.btnCadTipoEnderecoClick(Sender: TObject);
begin
  inherited;

  	BtnCad(TfrmCadastroTipoEndereco, frmCadastroTipoEndereco, cmbTipoEndereco, 'Tipo de Endereço', 'Tipo de Endereço');
end;

procedure TfrmCadastroPessoa.btnAltPlanoClick(Sender: TObject);
begin
  inherited;

  	BtnAlt(TfrmCadastroPlano, frmCadastroPlano, cmbPlano, 'Plano', 'Cadastro de Plano', 'Informe um plano para ser alterado.');
end;

procedure TfrmCadastroPessoa.btnAltTipoContatoClick(Sender: TObject);
begin
  inherited;

  	BtnAlt(TfrmCadastroTipoContato, frmCadastroTipoContato, cmbTipoContato, 'Tipo de Contato', 'Cadastro de Tipo de Contato', 'Informe um tipo de contato para ser alterado.');
end;

procedure TfrmCadastroPessoa.btnAltTipoDocumentoClick(Sender: TObject);
begin
  inherited;

  	BtnAlt(TfrmCadastroTipoDocumento, frmCadastroTipoDocumento, cmbTipoDocumento, 'Tipo de Documento', 'Cadastro de Tipo de Documento', 'Informe um tipo de documento para ser alterado.');
end;

procedure TfrmCadastroPessoa.btnCadAtividadeClick(Sender: TObject);
begin
  inherited;

  	BtnCad(TfrmCadastroAtividade, frmCadastroAtividade, cmbAtividade, 'Atividade', 'Cadastro de Ativadade');
end;

procedure TfrmCadastroPessoa.btnCadClassificacaoClick(Sender: TObject);
begin
  inherited;

  	BtnCad(TfrmCadastroClassificacao, frmCadastroClassificacao, cmbClassificacao, 'Classificação', 'Cadastro de Classificação');
end;

procedure TfrmCadastroPessoa.btnCadFilantropiaClick(Sender: TObject);
begin
  inherited;

  	BtnCad(TfrmCadastroFilantropia, frmCadastroFilantropia, cmbFilantropia, 'Filantropia', 'Cadastro de Filantropia');
end;

procedure TfrmCadastroPessoa.btbAltTipoEnderecoClick(Sender: TObject);
begin
  inherited;

  	BtnAlt(TfrmCadastroTipoEndereco, frmCadastroTipoEndereco, cmbTipoEndereco, 'Tipo de Endereço', 'Cadastro de Tipo de Endereço', 'Informe um tipo de endereço para ser alterado.');
end;

procedure TfrmCadastroPessoa.btnAdicionarContatoClick(Sender: TObject);
begin
  inherited;

	with cdsContato do
   	begin
      	if cmbTipoContato.ItemIndex = -1 then
         	begin
            	Notificacao('Informe o tipo de contato.');
               cmbTipoContato.SetFocus;
            end
         else if edtDescricaoContato.Text = '' then
         	begin
               Notificacao('Informe a descrição do contato.');
               edtDescricaoContato.SetFocus;
            end
         else
         	begin
               try
               	Append;

                  FieldByname('TIPO_CONTATO').Value := cmbTipoContato.Text;
                  FieldByname('DESCRICAO').Value 	 := edtDescricaoContato.Text;

                  Post;
               except
                  on E : Exception do
                     Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
               end;

               edtDescricaoContato.Clear;
               cmbTipoContato.ItemIndex := -1;
               cmbTipoContato.SetFocus;
            end;
      end;
end;

procedure TfrmCadastroPessoa.btnAdicionarDocumentoClick(Sender: TObject);
begin
  inherited;

	with cdsDocumento do
   	begin
      	if cmbTipoDocumento.ItemIndex = -1 then
         	begin
            	Notificacao('Informe o tipo de documento.');
               cmbTipoDocumento.SetFocus;
            end
         else if edtDescricaoDocumento.Text = '' then
         	begin
               Notificacao('Informe a descrição do documento.');
               edtDescricaoDocumento.SetFocus;
            end
         else
         	begin
               try
               	Append;

                  FieldByname('TIPO_DOCUMENTO').Value := cmbTipoDocumento.Text;
                  FieldByname('DOCUMENTO').Value 	  	:= edtDescricaoDocumento.Text;

                  Post;
               except
                  on E : Exception do
                     Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
               end;

               edtDescricaoDocumento.Clear;
               cmbTipoDocumento.ItemIndex := -1;
               cmbTipoDocumento.SetFocus;
            end;
      end;
end;

procedure TfrmCadastroPessoa.btnAdicionarEnderecoClick(Sender: TObject);
begin
  inherited;

	with cdsEndereco do
   	begin
      	if cmbTipoEndereco.ItemIndex = -1 then
         	begin
            	Notificacao('Informe o tipo de endereço.');
               cmbTipoEndereco.SetFocus;
            end
         else if edtLogradouro.Text = '' then
         	begin
               Notificacao('Informe o logradouro do endereço.');
               edtLogradouro.SetFocus;
            end
         else if edtNumero.Text = '' then
         	begin
               Notificacao('Informe o número do logradouro do endereço.');
               edtNumero.SetFocus;
            end
         else if edtBairro.Text = '' then
         	begin
               Notificacao('Informe o bairro do endereço.');
               edtBairro.SetFocus;
            end
         else if cmbUf.Text = '' then
         	begin
               Notificacao('Informe a unidade federativa do endereço.');
               cmbUf.SetFocus;
            end
         else if cmbCidade.Text = '' then
         	begin
               Notificacao('Informe a cidade do endereço.');
               cmbCidade.SetFocus;
            end
         else
         	begin
               try
               	Append;

                  FieldByname('TIPO_ENDERECO').Value := cmbTipoEndereco.Text;
                  FieldByname('LOGRADOURO').Value 	  := edtLogradouro.Text;
                  FieldByname('NUMERO').Value 	  	  := edtNumero.Text;
                  FieldByname('COMPLEMENTO').Value   := edtComplemento.Text;
                  FieldByname('BAIRRO').Value 	  	  := edtBairro.Text;
                  FieldByname('UF').Value 	  	 	  := cmbUf.Text;
                  FieldByname('CIDADE').Value 	  	  := cmbCidade.Text;
                  FieldByname('CEP').Value 	  	 	  := edtCep.Text;

                  Post;
               except
                  on E : Exception do
                     Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
               end;

               cmbTipoEndereco.ItemIndex := -1;
               edtLogradouro.Clear;
               edtNumero.Clear;
               edtComplemento.Clear;
               edtBairro.Clear;
               cmbUf.ItemIndex := -1;
               cmbCidade.ItemIndex := -1;
               edtCep.Clear;
					cmbTipoEndereco.SetFocus;
            end;
      end;
end;

procedure TfrmCadastroPessoa.btnAdicionarObrigacaoClick(Sender: TObject);
begin
  inherited;

   with cdsObrigacao do
      begin
         if edtDescricaoObrigacao.Text = '' then
            begin
               Notificacao('Informe a descrição da obrigação.');
               edtDescricaoObrigacao.SetFocus;
            end
         else if ( edtDataObrigacao.Text = '' ) then
            begin
               Notificacao('Informe a data da obrigação.');
               edtDataObrigacao.SetFocus;
            end
         else
            begin
               try
                  Append;

                  FieldByname('DESCRICAO').Value := edtDescricaoObrigacao.Text;
                  FieldByname('DATA').Value      := edtDataObrigacao.Text;

                  Post;
               except
                  on E : Exception do
                     Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
               end;

               edtDescricaoObrigacao.Clear;
               edtDataObrigacao.Clear;
               edtDescricaoObrigacao.SetFocus;
            end;
      end;
end;

procedure TfrmCadastroPessoa.btnAdicionarSantoClick(Sender: TObject);
begin
  inherited;

   with cdsSanto do
      begin
         if edtNomeSanto.Text = '' then
            begin
               Notificacao('Informe o nome do santo.');
               edtNomeSanto.SetFocus;
            end
         else
            begin
               try
                  Append;

                  FieldByname('DESCRICAO').Value := edtNomeSanto.Text;

                  Post;
               except
                  on E : Exception do
                     Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
               end;

               edtNomeSanto.Clear;
               edtNomeSanto.SetFocus;
            end;
      end;
end;

procedure TfrmCadastroPessoa.btnAltAtividadeClick(Sender: TObject);
begin
  inherited;

  	BtnAlt(TfrmCadastroAtividade, frmCadastroAtividade, cmbAtividade, 'Atividade', 'Cadastro de Atividade', 'Informe uma atividade para ser alterada.');
end;

procedure TfrmCadastroPessoa.btnAltClassificacaoClick(Sender: TObject);
begin
  inherited;

  	BtnAlt(TfrmCadastroClassificacao, frmCadastroClassificacao, cmbClassificacao, 'Classificação', 'Cadastro de Classificação', 'Informe uma classificação para ser alterada.');
end;

procedure TfrmCadastroPessoa.btnAltEstadoCivilClick(Sender: TObject);
begin
  inherited;

  	BtnAlt(TfrmCadastroEstadoCivil, frmCadastroEstadoCivil, cmbEstadoCivil, 'Estado Civil', 'Cadastro de Estado Civil', 'Informe um estado civil para ser alterado.');
end;

procedure TfrmCadastroPessoa.btnAltFilantropiaClick(Sender: TObject);
begin
  inherited;

	BtnAlt(TfrmCadastroFilantropia, frmCadastroFilantropia, cmbFilantropia, 'Filantropia', 'Cadastro de Filantropia', 'Informe uma filantropia para ser alterada.');
end;

procedure TfrmCadastroPessoa.btnCancelarClick(Sender: TObject);
begin
  inherited;

  	Close;
end;

procedure TfrmCadastroPessoa.btnEditarAtualizacaoClick(Sender: TObject);
begin
  inherited;

   with cdsObrigacao do
      begin
         if not IsEmpty then
            begin
               edtDescricaoObrigacao.Text := FieldBYName('DESCRICAO').AsString;
               edtDataObrigacao.Date      := FieldByName('DATA').AsDateTime;

               try
                  Delete;
               except
                  on E : Exception do
                     Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
               end;

               edtDescricaoObrigacao.SetFocus;
            end
         else
            Notificacao('Nenhum registro encontrado para alteração.');
      end;
end;

procedure TfrmCadastroPessoa.btnEditarContatoClick(Sender: TObject);
begin
  inherited;

   with cdsContato do
      begin
         if not IsEmpty then
            begin
               cmbTipoContato.ItemIndex := cmbTipoContato.Properties.Items.IndexOf(FieldByName('TIPO_CONTATO').AsString);
               edtDescricaoContato.Text := FieldByName('DESCRICAO').AsString;

               cmbTipoContato.SetFocus;

               btnRemoverContato.OnClick(Self);
            end
         else
            Notificacao('Nenhum registro encontrado para alteração.');
      end;
end;

procedure TfrmCadastroPessoa.btnEditarDocumentoClick(Sender: TObject);
begin
  inherited;

   with cdsDocumento do
      begin
         if not IsEmpty then
            begin
               cmbTipoDocumento.ItemIndex := cmbTipoDocumento.Properties.Items.IndexOf(FieldByName('TIPO_DOCUMENTO').AsString);
               edtDescricaoDocumento.Text := FieldByName('DOCUMENTO').AsString;

               cmbTipoDocumento.SetFocus;

               btnRemoverDocumento.OnClick(Self);
            end
         else
            Notificacao('Nenhum registro encontrado para alteração.');
      end;
end;

procedure TfrmCadastroPessoa.btnEditarEnderecoClick(Sender: TObject);
begin
  inherited;

   with cdsEndereco do
      begin
         if not IsEmpty then
            begin
               cmbTipoEndereco.ItemIndex := cmbTipoEndereco.Properties.Items.IndexOf(FieldByName('TIPO_ENDERECO').AsString);
               edtLogradouro.Text        := FieldByName('LOGRADOURO').AsString;
               edtNumero.Text            := FieldByName('NUMERO').AsString;
               edtComplemento.Text       := FieldByName('COMPLEMENTO').AsString;
               edtBairro.Text            := FieldByName('BAIRRO').AsString;
               cmbUf.ItemIndex           := cmbUf.Properties.Items.IndexOf(FieldByName('UF').AsString);
               cmbUf.Properties.OnChange(Self);
               cmbCidade.ItemIndex       := cmbCidade.Properties.Items.IndexOf(FieldByName('CIDADE').AsString);
               edtCep.Text               := FieldByName('CEP').AsString;

               cmbTipoEndereco.SetFocus;

               btnRemoverEndereco.OnClick(Self);
            end
         else
            Notificacao('Nenhum registro encontrado para alteração.');
      end;
end;

procedure TfrmCadastroPessoa.btnEditarSantoClick(Sender: TObject);
begin
  inherited;

   with cdsSanto do
      begin
         if not IsEmpty then
            begin
               edtNomeSanto.Text := FieldByName('DESCRICAO').AsString;

               try
                  Delete;
               except
                  on E : Exception do
                     Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
               end;

               edtNomeSanto.SetFocus;
            end
         else
            Notificacao('Nenhum registro encontrado para alteração.');
      end;
end;

procedure TfrmCadastroPessoa.btnRemoverContatoClick(Sender: TObject);
begin
  inherited;

  	with cdsContato do
   	begin
         if not IsEmpty then
         	begin
               try
                  Delete;
               except
                  on E : Exception do
                     Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
               end;

               cmbTipoContato.SetFocus;
            end
         else
            Notificacao('Nenhum registro encontrado.');
      end;
end;

procedure TfrmCadastroPessoa.btnRemoverDocumentoClick(Sender: TObject);
begin
  inherited;

  	with cdsDocumento do
   	begin
         if not IsEmpty then
         	begin
               try
                  Delete;
               except
                  on E : Exception do
                     Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
               end;

               cmbTipoDocumento.SetFocus;
            end
         else
            Notificacao('Nenhum registro encontrado.');
      end;
end;

procedure TfrmCadastroPessoa.btnRemoverEnderecoClick(Sender: TObject);
begin
  inherited;

  with cdsEndereco do
   	begin
         if not IsEmpty then
         	begin
               try
                  Delete;
               except
                  on E : Exception do
                     Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
               end;

               cmbTipoEndereco.SetFocus;
            end
         else
            Notificacao('Nenhum registro encontrado.');
      end;
end;

procedure TfrmCadastroPessoa.btnRemoverObrigacaoClick(Sender: TObject);
begin
  inherited;

   with cdsObrigacao do
      begin
         if not IsEmpty then
            begin
               try
                  Delete;
               except
                  on E : Exception do
                     Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
               end;

               edtDescricaoObrigacao.SetFocus;
            end
         else
            Notificacao('Nenhum registro encontrado.');
      end;
end;

procedure TfrmCadastroPessoa.btnRemoverSantoClick(Sender: TObject);
begin
  inherited;

   with cdsSanto do
      begin
         if not IsEmpty then
            begin
               try
                  Delete;
               except
                  on E : Exception do
                     Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
               end;

               edtNomeSanto.SetFocus;
            end
         else
            Notificacao('Nenhum registro encontrado.');
      end;
end;

procedure TfrmCadastroPessoa.btnVoltarContatoClick(Sender: TObject);
begin
  inherited;

   pcDados.ActivePage := tsEmpresa;
	edtRazaoSocial.SetFocus;
end;

procedure TfrmCadastroPessoa.btnVoltarDocumentoClick(Sender: TObject);
begin
  inherited;

   pcDados.ActivePage := tsContato;
	cmbTipoContato.SetFocus;
end;

procedure TfrmCadastroPessoa.btnVoltarEmpresaClick(Sender: TObject);
begin
  inherited;

   pcDados.ActivePage := tsPrincipal;
	cmbClassificacao.SetFocus;
end;

procedure TfrmCadastroPessoa.btnVoltarEnderecoClick(Sender: TObject);
begin
  inherited;

   pcDados.ActivePage := tsDocumento;
	cmbTipoDocumento.SetFocus;
end;

procedure TfrmCadastroPessoa.btnVoltarEspiritualClick(Sender: TObject);
begin
  inherited;

   pcDados.ActivePage := tsPlano;

   if cmbPlano.Enabled = True then
   	cmbPlano.SetFocus;
end;

procedure TfrmCadastroPessoa.btnVoltarFilantropiaClick(Sender: TObject);
begin
  inherited;

   pcDados.ActivePage := tsPlano;
	cmbPlano.SetFocus;
end;

procedure TfrmCadastroPessoa.btnVoltarPlanoClick(Sender: TObject);
begin
  inherited;

   pcDados.ActivePage := tsEndereco;
	cmbTipoEndereco.SetFocus;
end;

procedure TfrmCadastroPessoa.GravaPessoaPlanoFilantropia;
begin
	try
      with dtModule, ADOStoredProc do
         begin
            if glbOperacao = 'I' then
               begin
                  ProcedureName := '[sis].[P_PESSOA_INSERT]';
                  Parameters.Refresh;
               end
            else if glbOperacao = 'A' then
               begin
                  ProcedureName := '[sis].[P_PESSOA_UPDATE]';
                  Parameters.Refresh;
                  Parameters.ParamByName('@ID_PESSOA').Value       		 := glbIdPessoa;
                  Parameters.ParamByName('@ID_PESSOA_PLANO').Value 		 := glbIdPessoaPlano;
                  Parameters.ParamByName('@ID_PESSOA_FILANTROPIA').Value := glbIdPessoaFilantropia;
               end;

            if edtMatricula.Text <> '' then
               Parameters.ParamByName('@MATRICULA').Value 	  := Trim(edtMatricula.Text)
            else
               Parameters.ParamByName('@MATRICULA').Value 	  := Null;

            Parameters.ParamByName('@ID_CLASSIFICACAO').Value := RetornaIdClassificacao(cmbClassificacao.Text);
            Parameters.ParamByName('@NOME').Value 			  	  := Trim(edtNome.Text);

            if edtDataNascimento.Text <> '' then
               Parameters.ParamByName('@DT_NASCIMENTO').Value := edtDataNascimento.Date
            else
               Parameters.ParamByName('@DT_NASCIMENTO').Value := Null;

            Parameters.ParamByName('@ID_ATIVIDADE').Value := RetornaIdAtividade(cmbAtividade.Text);

            if cmbPlano.ItemIndex > -1 then
               begin
                  Parameters.ParamByName('@ID_PLANO').Value 		    := RetornaIdPlano(cmbPlano.Text);
                  Parameters.ParamByName('@PLANO_REFER_INICIO').Value := cmbPlanoDtInicio.Text;
                  Parameters.ParamByName('@PLANO_REFER_FIM').Value 	 := cmbPlanoDtFinal.Text;
               end
            else
               begin
                  Parameters.ParamByName('@ID_PLANO').Value 		    := 0;
                  Parameters.ParamByName('@PLANO_REFER_INICIO').Value := Null;
                  Parameters.ParamByName('@PLANO_REFER_FIM').Value 	 := Null;
               end;

            if cmbFilantropia.ItemIndex > -1 then
               begin
                  Parameters.ParamByName('@ID_FILANTROPIA').Value 		    := RetornaIdFilantropia(cmbFilantropia.Text);
                  Parameters.ParamByName('@FILANTROPIA_REFER_INICIO').Value := cmbFilantropiaDtInicio.Text;
                  Parameters.ParamByName('@FILANTROPIA_REFER_FIM').Value 	 := cmbFilantropiaDtFinal.Text;
               end
            else
               begin
                  Parameters.ParamByName('@ID_FILANTROPIA').Value 		    := 0;
                  Parameters.ParamByName('@FILANTROPIA_REFER_INICIO').Value := Null;
                  Parameters.ParamByName('@FILANTROPIA_REFER_FIM').Value 	 := Null;
               end;

            if cmbEstadoCivil.ItemIndex > -1 then
               Parameters.ParamByName('@ID_ESTADO_CIVIL').Value := RetornaIdEstadoCivil(cmbEstadoCivil.Text)
            else
               Parameters.ParamByName('@ID_ESTADO_CIVIL').Value := Null;

            if cmbEmpCidade.ItemIndex > -1 then
               Parameters.ParamByName('@ID_CIDADE').Value := RetornaIdCidade(cmbEmpCidade.Text)
            else
               Parameters.ParamByName('@ID_CIDADE').Value := Null;

            if Trim(edtNomePai.Text) <> '' then
               Parameters.ParamByName('@PAI').Value := Trim(edtNomePai.Text)
            else
               Parameters.ParamByName('@PAI').Value := Null;

            if Trim(edtNomeMae.Text) <> '' then
               Parameters.ParamByName('@MAE').Value := Trim(edtNomeMae.Text)
            else
               Parameters.ParamByName('@MAE').Value := Null;

            if Trim(edtProfissao.Text) <> '' then
               Parameters.ParamByName('@PROFISSAO').Value := Trim(edtProfissao.Text)
            else
               Parameters.ParamByName('@PROFISSAO').Value := Null;

            if Trim(edtConjuge.Text) <> '' then
               Parameters.ParamByName('@CONJUGE').Value := Trim(edtConjuge.Text)
            else
               Parameters.ParamByName('@CONJUGE').Value := Null;

            if Trim(edtRazaoSocial.Text) <> '' then
               Parameters.ParamByName('@RAZAO_SOCIAL').Value := Trim(edtRazaoSocial.Text)
            else
               Parameters.ParamByName('@RAZAO_SOCIAL').Value := Null;

            if Trim(edtEmpLogradouro.Text) <> '' then
               Parameters.ParamByName('@LOGRADOURO').Value := Trim(edtEmpLogradouro.Text)
            else
               Parameters.ParamByName('@LOGRADOURO').Value := Null;

            if Trim(edtEmpNumero.Text) <> '' then
               Parameters.ParamByName('@NUMERO').Value := Trim(edtEmpNumero.Text)
            else
               Parameters.ParamByName('@NUMERO').Value := Null;

            if Trim(edtEmpComplemento.Text) <> '' then
               Parameters.ParamByName('@COMPLEMENTO').Value := Trim(edtEmpComplemento.Text)
            else
               Parameters.ParamByName('@COMPLEMENTO').Value := Null;

            if Trim(edtEmpBairro.Text) <> '' then
               Parameters.ParamByName('@BAIRRO').Value := Trim(edtEmpBairro.Text)
            else
               Parameters.ParamByName('@BAIRRO').Value := Null;

            if Trim(edtEmpCep.Text) <> '' then
               Parameters.ParamByName('@CEP').Value := Trim(edtEmpCep.Text)
            else
               Parameters.ParamByName('@CEP').Value := Null;

            if Trim(edtDataAdmissao.Text) <> '' then
               Parameters.ParamByName('@DATA_ADMISSAO_TERREIRO').Value := edtDataAdmissao.Date
            else
               Parameters.ParamByName('@DATA_ADMISSAO_TERREIRO').Value := Null;

            Parameters.ParamByName('@USUARIO_OPERACAO').Value := glbUsuario;

            ExecProc;
         end;
   except
      on E : Exception do
         Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
   end;
end;

procedure TfrmCadastroPessoa.GravaContato( varIdPessoa : Integer );
begin
   cdsContato.DisableControls;

   try
      with dtModule, ADOStoredProc do
         begin
            ProcedureName := '[sis].[P_CONTATO_DELETE]';
            Parameters.Refresh;

            Parameters.ParamByName('@ID_PESSOA').Value        := glbIdPessoa;
            Parameters.ParamByName('@USUARIO_OPERACAO').Value := glbUsuario;

            ExecProc;
         end;
   except
      on E : Exception do
         Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
   end;

   if not cdsContato.IsEmpty then
      begin
         cdsContato.First;

         while not cdsContato.Eof do
            begin
               try
                  with dtModule, ADOStoredProc do
                     begin
                        ProcedureName := '[sis].[P_CONTATO_INSERT]';
                        Parameters.Refresh;

                        Parameters.ParamByName('@ID_PESSOA').Value        := glbIdPessoa;
                        Parameters.ParamByName('@ID_TIPO_CONTATO').Value  := RetornaIdTipoContato(cdsContato.FieldByName('TIPO_CONTATO').AsString);
                        Parameters.ParamByName('@DESCRICAO').Value 		  := cdsContato.FieldByName('DESCRICAO').Value;
                        Parameters.ParamByName('@USUARIO_OPERACAO').Value := glbUsuario;

                        ExecProc;
                     end;
               except
                  on E : Exception do
                     Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
               end;

               cdsContato.Next;
            end;
      end;

   cdsContato.EnableControls;
end;

procedure TfrmCadastroPessoa.GravaDocumento( varIdPessoa : Integer );
begin
   cdsDocumento.DisableControls;

    try
      with dtModule, ADOStoredProc do
         begin
            ProcedureName := '[sis].[P_DOCUMENTO_DELETE]';
            Parameters.Refresh;

            Parameters.ParamByName('@ID_PESSOA').Value        := glbIdPessoa;
            Parameters.ParamByName('@USUARIO_OPERACAO').Value := glbUsuario;

            ExecProc;
         end;
   except
      on E : Exception do
         Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
   end;

   if not cdsDocumento.IsEmpty then
      begin
         cdsDocumento.First;

         while not cdsDocumento.Eof do
            begin
               try
                  with dtModule, ADOStoredProc do
                     begin
                        ProcedureName := '[sis].[P_DOCUMENTO_INSERT]';
                        Parameters.Refresh;

                        Parameters.ParamByName('@ID_PESSOA').Value         := glbIdPessoa;
                        Parameters.ParamByName('@ID_TIPO_DOCUMENTO').Value := RetornaIdTipoDocumento(cdsDocumento.FieldByName('TIPO_DOCUMENTO').AsString);
                        Parameters.ParamByName('@DESCRICAO').Value 		   := cdsDocumento.FieldByName('DOCUMENTO').Value;
                        Parameters.ParamByName('@USUARIO_OPERACAO').Value  := glbUsuario;

                        ExecProc;
                     end;
               except
                  on E : Exception do
                     Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
               end;

               cdsDocumento.Next;
            end;
      end;

   cdsDocumento.EnableControls;
end;

procedure TfrmCadastroPessoa.GravaEndereco( varIdPessoa : Integer );
begin
   cdsEndereco.DisableControls;

    try
      with dtModule, ADOStoredProc do
         begin
            ProcedureName := '[sis].[P_ENDERECO_DELETE]';
            Parameters.Refresh;

            Parameters.ParamByName('@ID_PESSOA').Value        := glbIdPessoa;
            Parameters.ParamByName('@USUARIO_OPERACAO').Value := glbUsuario;

            ExecProc;
         end;
   except
      on E : Exception do
         Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
   end;

   if not cdsEndereco.IsEmpty then
      begin
         cdsEndereco.First;

         while not cdsEndereco.Eof do
            begin
               try
                  with dtModule, ADOStoredProc do
                     begin
                        ProcedureName := '[sis].[P_ENDERECO_INSERT]';
                        Parameters.Refresh;

                        Parameters.ParamByName('@ID_PESSOA').Value        := glbIdPessoa;
                        Parameters.ParamByName('@ID_TIPO_ENDERECO').Value := RetornaIdTipoEndereco(cdsEndereco.FieldByName('TIPO_ENDERECO').AsString);
                        Parameters.ParamByName('@ID_CIDADE').Value        := RetornaIdCidade(cdsEndereco.FieldByName('CIDADE').AsString);
                        Parameters.ParamByName('@LOGRADOURO').Value       := cdsEndereco.FieldByName('LOGRADOURO').Value;
                        Parameters.ParamByName('@NUMERO').Value        	  := cdsEndereco.FieldByName('NUMERO').Value;
                        Parameters.ParamByName('@COMPLEMENTO').Value      := cdsEndereco.FieldByName('COMPLEMENTO').Value;
                        Parameters.ParamByName('@BAIRRO').Value           := cdsEndereco.FieldByName('BAIRRO').Value;
                        Parameters.ParamByName('@CEP').Value        		  := cdsEndereco.FieldByName('CEP').Value;
                        Parameters.ParamByName('@USUARIO_OPERACAO').Value := glbUsuario;

                        ExecProc;
                     end;
               except
                  on E : Exception do
                     Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
               end;

               cdsEndereco.Next;
            end;
      end;

   cdsEndereco.EnableControls;
end;

procedure TfrmCadastroPessoa.GravaSanto(varIdPessoa: Integer);
begin
   cdsSanto.DisableControls;

    try
      with dtModule, ADOStoredProc do
         begin
            ProcedureName := '[sis].[P_SANTO_DELETE]';
            Parameters.Refresh;

            Parameters.ParamByName('@ID_PESSOA').Value        := glbIdPessoa;
            Parameters.ParamByName('@USUARIO_OPERACAO').Value := glbUsuario;

            ExecProc;
         end;
   except
      on E : Exception do
         Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
   end;

   if not cdsSanto.IsEmpty then
      begin
         cdsSanto.First;

         while not cdsSanto.Eof do
            begin
               try
                  with dtModule, ADOStoredProc do
                     begin
                        ProcedureName := '[sis].[P_SANTO_INSERT]';
                        Parameters.Refresh;

                        Parameters.ParamByName('@ID_PESSOA').Value        := glbIdPessoa;
                        Parameters.ParamByName('@DESCRICAO').Value        := cdsSanto.FieldByName('DESCRICAO').Value;
                        Parameters.ParamByName('@USUARIO_OPERACAO').Value := glbUsuario;

                        ExecProc;
                     end;
               except
                  on E : Exception do
                     Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
               end;

               cdsSanto.Next;
            end;
      end;

   cdsSanto.EnableControls;
end;

procedure TfrmCadastroPessoa.GravaObrigacao(varIdPessoa: Integer);
begin
   cdsObrigacao.DisableControls;

    try
      with dtModule, ADOStoredProc do
         begin
            ProcedureName := '[sis].[P_OBRIGACAO_DELETE]';
            Parameters.Refresh;

            Parameters.ParamByName('@ID_PESSOA').Value        := glbIdPessoa;
            Parameters.ParamByName('@USUARIO_OPERACAO').Value := glbUsuario;

            ExecProc;
         end;
   except
      on E : Exception do
         Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
   end;

   if not cdsObrigacao.IsEmpty then
      begin
         cdsObrigacao.First;

         while not cdsObrigacao.Eof do
            begin
               try
                  with dtModule, ADOStoredProc do
                     begin
                        ProcedureName := '[sis].[P_OBRIGACAO_INSERT]';
                        Parameters.Refresh;

                        Parameters.ParamByName('@ID_PESSOA').Value        := glbIdPessoa;
                        Parameters.ParamByName('@DESCRICAO').Value        := cdsObrigacao.FieldByName('DESCRICAO').AsString;
                        Parameters.ParamByName('@DATA').Value             := cdsObrigacao.FieldByName('DATA').Value;
                        Parameters.ParamByName('@USUARIO_OPERACAO').Value := glbUsuario;

                        ExecProc;
                     end;
               except
                  on E : Exception do
                     Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
               end;

               cdsObrigacao.Next;
            end;
      end;

   cdsObrigacao.EnableControls;
end;

procedure TfrmCadastroPessoa.btnSalvarClick(Sender: TObject);
begin
  inherited;

  	if ValidaCampos then
   	begin
         GravaPessoaPlanoFilantropia;

         dtModule.sisPessoa.Active := False;
         dtModule.sisPessoa.Active := True;

         if edtNome.Text <> '' then
            begin
               glbIdPessoa := RetornaIdPessoa(edtNome.Text);

               if glbIdPessoa > 0 then
                  begin
                     GravaContato( glbIdPessoa );

                     GravaDocumento( glbIdPessoa );

                     GravaEndereco( glbIdPessoa );

                     GravaSanto( glbIdPessoa );

                     GravaObrigacao( glbIdPessoa );
                  end;
            end;

         Notificacao('Operação realizada com sucesso!');
         btnCancelar.OnClick(Self);
      end;
end;

procedure TfrmCadastroPessoa.CarregaInformacoes;
begin
   CarregaInformacoesPessoa;
   CarregaInformacoesContato;
   CarregaInformacoesDocumento;
   CarregaInformacoesEndereco;
   CarregaInformacoesPlanoFilantropia;
   CarregaInformacoesSanto;
   CarregaInformacoesObrigacao;
end;

procedure TfrmCadastroPessoa.CarregaInformacoesPessoa;
begin
	with dtModule do
      begin
         sisVDadosPessoa.Active := False;
         sisVDadosPessoa.Active := True;

      	sisVDadosPessoa.DisableControls;

         sisVDadosPessoa.Filtered := False;
         sisVDadosPessoa.Filter   := 'ID_PESSOA = ' + IntToStr(glbIdPessoa);
         sisVDadosPessoa.Filtered := True;

         if not sisVDadosPessoa.IsEmpty then
            begin
               glbMatriculaOld            := sisVDadosPessoa.FieldByName('MATRICULA').AsString;
               edtMatricula.Text    		:= glbMatriculaOld;
               cmbClassificacao.ItemIndex := cmbClassificacao.Properties.Items.IndexOf(sisVDadosPessoa.FieldByName('CLASSIFICACAO').AsString);
               edtNome.Text 			  		:= sisVDadosPessoa.FieldByName('NOME').AsString;
               edtDataNascimento.Date 		:= sisVDadosPessoa.FieldByName('DT_NASCIMENTO').AsDateTime;
               cmbAtividade.ItemIndex 		:= cmbAtividade.Properties.Items.IndexOf(sisVDadosPessoa.FieldByName('ATIVIDADE').AsString);
               edtNomePai.Text            := sisVDadosPessoa.FieldByName('PAI').AsString;
               edtNomeMae.Text            := sisVDadosPessoa.FieldByName('MAE').AsString;
               edtProfissao.Text          := sisVDadosPessoa.FieldByName('PROFISSAO').AsString;
               cmbEstadoCivil.ItemIndex   := cmbEstadoCivil.Properties.Items.IndexOf(sisVDadosPessoa.FieldByName('ESTADO_CIVIL').AsString);
               edtConjuge.Text            := sisVDadosPessoa.FieldByName('CONJUGE').AsString;
               edtRazaoSocial.Text        := sisVDadosPessoa.FieldByName('RAZAO_SOCIAL').AsString;
               edtEmpLogradouro.Text      := sisVDadosPessoa.FieldByName('EMPRESA_LOGRADOURO').AsString;
               edtEmpNumero.Text          := sisVDadosPessoa.FieldByName('EMPRESA_NUMERO').AsString;
               edtEmpComplemento.Text     := sisVDadosPessoa.FieldByName('EMPRESA_COMPLEMENTO').AsString;
               edtEmpBairro.Text          := sisVDadosPessoa.FieldByName('EMPRESA_BAIRRO').AsString;
               cmbEmpUF.ItemIndex         := cmbEmpUF.Properties.Items.IndexOf(sisVDadosPessoa.FieldByName('EMPRESA_ESTADO').AsString);
               cmbEmpCidade.ItemIndex     := cmbEmpCidade.Properties.Items.IndexOf(sisVDadosPessoa.FieldByName('EMPRESA_CIDADE').AsString);
               edtEmpCep.Text             := sisVDadosPessoa.FieldByName('EMPRESA_CEP').AsString;

               if sisVDadosPessoa.FieldByName('DATA_ADMISSAO_TERREIRO').Value = Null then
                  edtDataAdmissao.Text := ''
               else
                  edtDataAdmissao.Date := sisVDadosPessoa.FieldByName('DATA_ADMISSAO_TERREIRO').AsDateTime;

               //PLANO
					ADOQueryAux.Close;
               ADOQueryAux.SQL.Clear;

               ADOQueryAux.SQL.Add(' SELECT TOP 1                                ');
	            ADOQueryAux.SQL.Add(' 	DESCRICAO,                                ');
               ADOQueryAux.SQL.Add(' 	VALOR,                                    ');
               ADOQueryAux.SQL.Add(' 	SUBSTRING(REFER_INICIO, 3, 4) AS ANO,     ');
               ADOQueryAux.SQL.Add(' 	REFER_INICIO,                             ');
               ADOQueryAux.SQL.Add(' 	REFER_FIM                                 ');
               ADOQueryAux.SQL.Add(' FROM [sis].[V_PESSOA_PLANO]                 ');
               ADOQueryAux.SQL.Add(' WHERE ID_PESSOA = ' + IntToStr(glbIdPessoa)  );
               ADOQueryAux.SQL.Add(' ORDER BY REFER_INICIO ASC                   ');

               ADOQueryAux.Open;

               if not ADOQueryAux.IsEmpty then
               	begin
                     //Plano
                     CarregaPlano(cmbPlano);
                     CarregaReferencia(cmbPlanoDtInicio, cmbPlanoDtFinal, ADOQueryAux.FieldByName('ANO').AsString);

                  	cmbPlano.ItemIndex 			:= cmbPlano.Properties.Items.IndexOf(ADOQueryAux.FieldByName('DESCRICAO').AsString);
                     cmbPlanoDtInicio.ItemIndex := cmbPlanoDtInicio.Properties.Items.IndexOf(ADOQueryAux.FieldByName('REFER_INICIO').AsString);
                     cmbPlanoDtFinal.ItemIndex 	:= cmbPlanoDtFinal.Properties.Items.IndexOf(ADOQueryAux.FieldByName('REFER_FIM').AsString);
                     lblPlanoValor.Caption := 'R$ ' + FormatFloat( '#,##0.00', ADOQueryAux.FieldByName('VALOR').AsCurrency );

                     cmbPlano.Enabled         := False;
                     cmbPlanoDtInicio.Enabled := False;
                     cmbPlanoDtFinal.Enabled  := False;
                     btnCadPlano.Enabled  	 := False;
                     btnAltPlano.Enabled  	 := False;
                  end
               else
                  begin
                     CarregaPlano(cmbPlano);
                     CarregaReferencia(cmbPlanoDtInicio, cmbPlanoDtFinal, glbAnoContabil);

                     cmbPlano.ItemIndex         := -1;
                     cmbPlanoDtInicio.ItemIndex := -1;
                     cmbPlanoDtFinal.ItemIndex  := -1;
                     lblPlanoValor.Caption      := 'R$ 0.00';
                  end;

               //FILANTROPIA
               ADOQueryAux.Close;
               ADOQueryAux.SQL.Clear;

               ADOQueryAux.SQL.Add(' SELECT TOP 1                                ');
	            ADOQueryAux.SQL.Add(' 	DESCRICAO,                                ');
               ADOQueryAux.SQL.Add(' 	VALOR,                                    ');
               ADOQueryAux.SQL.Add(' 	PERCENTUAL,                               ');
               ADOQueryAux.SQL.Add(' 	SUBSTRING(REFER_INICIO, 3, 4) AS ANO,     ');
               ADOQueryAux.SQL.Add(' 	REFER_INICIO,                             ');
               ADOQueryAux.SQL.Add(' 	REFER_FIM                                 ');
               ADOQueryAux.SQL.Add(' FROM [sis].[V_PESSOA_FILANTROPIA]           ');
               ADOQueryAux.SQL.Add(' WHERE ID_PESSOA = ' + IntToStr(glbIdPessoa)  );
               ADOQueryAux.SQL.Add(' ORDER BY REFER_INICIO ASC                   ');

               ADOQueryAux.Open;

               if not ADOQueryAux.IsEmpty then
               	begin
                     //Filantropia
                     CarregaFilantropia(cmbFilantropia);
                     CarregaReferencia(cmbFilantropiaDtInicio, cmbFilantropiaDtFinal, ADOQueryAux.FieldByName('ANO').AsString);

                  	cmbFilantropia.ItemIndex 			:= cmbFilantropia.Properties.Items.IndexOf(ADOQueryAux.FieldByName('DESCRICAO').AsString);
                     cmbFilantropiaDtInicio.ItemIndex := cmbFilantropiaDtInicio.Properties.Items.IndexOf(ADOQueryAux.FieldByName('REFER_INICIO').AsString);
                     cmbFilantropiaDtFinal.ItemIndex 	:= cmbFilantropiaDtFinal.Properties.Items.IndexOf(ADOQueryAux.FieldByName('REFER_FIM').AsString);
                     lblFilantropiaValor.Caption 		:= 'R$ ' + FormatFloat( '#,##0.00', ADOQueryAux.FieldByName('VALOR').AsCurrency );
                     lblFilantropiaPercentual.Caption := FormatFloat( '#,##0.00', ADOQueryAux.FieldByName('PERCENTUAL').AsCurrency ) + ' %';

                     cmbFilantropia.Enabled         := False;
                     cmbFilantropiaDtInicio.Enabled := False;
                     cmbFilantropiaDtFinal.Enabled  := False;
                     btnCadFilantropia.Enabled  	 := False;
                     btnAltFilantropia.Enabled  	 := False;
                  end
               else
                  begin
                     CarregaFilantropia(cmbFilantropia);
                     CarregaReferencia(cmbFilantropiaDtInicio, cmbFilantropiaDtFinal, glbAnoContabil);

                     cmbFilantropia.ItemIndex         := -1;
                     cmbFilantropiaDtInicio.ItemIndex := -1;
                     cmbFilantropiaDtFinal.ItemIndex  := -1;
                     lblFilantropiaValor.Caption 		:= 'R$ 0.00';
                     lblFilantropiaPercentual.Caption := '0.00 %';
                  end;

               ADOQueryAux.Close;
            end;

         sisVDadosPessoa.Active   := False;
         sisVDadosPessoa.Filtered := False;
         sisVDadosPessoa.EnableControls;
      end;
end;

procedure TfrmCadastroPessoa.CarregaInformacoesContato;
begin
	with dtModule do
      begin
         sisVDadosPessoaContato.Active := False;
         sisVDadosPessoaContato.Active := True;

      	sisVDadosPessoaContato.DisableControls;

         sisVDadosPessoaContato.Filtered := False;
         sisVDadosPessoaContato.Filter   := 'ID_PESSOA = ' + IntToStr( glbIdPessoa );
         sisVDadosPessoaContato.Filtered := True;

         if not sisVDadosPessoaContato.IsEmpty then
            begin
            	cdsContato.DisableControls;
            	cdsContato.EmptyDataSet;

            	sisVDadosPessoaContato.First;

               while not sisVDadosPessoaContato.Eof do
               	begin
                  	try
                        cdsContato.Append;

                        cdsContato.FieldByname('TIPO_CONTATO').Value := sisVDadosPessoaContato.FieldByname('DESCRICAO_TIPO_CONTATO').Value;
                        cdsContato.FieldByname('DESCRICAO').Value 	:= sisVDadosPessoaContato.FieldByname('DESCRICAO_CONTATO').Value;

                        cdsContato.Post;
                     except
                        on E : Exception do
                           Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
                     end;

                  	sisVDadosPessoaContato.Next;
                  end;

               cdsContato.EnableControls;
            end;

         sisVDadosPessoaContato.Active   := False;
         sisVDadosPessoaContato.Filtered := False;
         sisVDadosPessoaContato.EnableControls;
      end;
end;

procedure TfrmCadastroPessoa.CarregaInformacoesDocumento;
begin
	with dtModule do
      begin
         sisVDadosPessoaDocumento.Active := False;
         sisVDadosPessoaDocumento.Active := True;

      	sisVDadosPessoaDocumento.DisableControls;

         sisVDadosPessoaDocumento.Filtered := False;
         sisVDadosPessoaDocumento.Filter   := 'ID_PESSOA = ' + IntToStr( glbIdPessoa );
         sisVDadosPessoaDocumento.Filtered := True;

         if not sisVDadosPessoaDocumento.IsEmpty then
            begin
            	cdsDocumento.DisableControls;
            	cdsDocumento.EmptyDataSet;

            	sisVDadosPessoaDocumento.First;

               while not sisVDadosPessoaDocumento.Eof do
               	begin
                  	try
                        cdsDocumento.Append;

                        cdsDocumento.FieldByname('TIPO_DOCUMENTO').Value := sisVDadosPessoaDocumento.FieldByname('DESCRICAO_TIPO_DOCUMENTO').Value;
                        cdsDocumento.FieldByname('DOCUMENTO').Value 	    := sisVDadosPessoaDocumento.FieldByname('DESCRICAO_DOCUMENTO').Value;

                        cdsDocumento.Post;
                     except
                        on E : Exception do
                           Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
                     end;

                  	sisVDadosPessoaDocumento.Next;
                  end;

               cdsDocumento.EnableControls;
            end;

         sisVDadosPessoaDocumento.Active   := False;
         sisVDadosPessoaDocumento.Filtered := False;
         sisVDadosPessoaDocumento.EnableControls;
      end;
end;

procedure TfrmCadastroPessoa.CarregaInformacoesEndereco;
begin
	with dtModule do
      begin
         sisVDadosPessoaEndereco.Active := False;
         sisVDadosPessoaEndereco.Active := True;

      	sisVDadosPessoaEndereco.DisableControls;

         sisVDadosPessoaEndereco.Filtered := False;
         sisVDadosPessoaEndereco.Filter   := 'ID_PESSOA = ' + IntToStr( glbIdPessoa );
         sisVDadosPessoaEndereco.Filtered := True;

         if not sisVDadosPessoaEndereco.IsEmpty then
            begin
            	cdsEndereco.DisableControls;
            	cdsEndereco.EmptyDataSet;

            	sisVDadosPessoaEndereco.First;

               while not sisVDadosPessoaEndereco.Eof do
               	begin
                  	try
                        cdsEndereco.Append;

                        cdsEndereco.FieldByname('TIPO_ENDERECO').Value := sisVDadosPessoaEndereco.FieldByname('DESCRICAO_TIPO_ENDERECO').Value;
                        cdsEndereco.FieldByname('UF').Value 		     := sisVDadosPessoaEndereco.FieldByname('ESTADO').Value;
								cdsEndereco.FieldByname('CIDADE').Value 		  := sisVDadosPessoaEndereco.FieldByname('CIDADE').Value;
                        cdsEndereco.FieldByname('LOGRADOURO').Value 	  := sisVDadosPessoaEndereco.FieldByname('LOGRADOURO').Value;
                        cdsEndereco.FieldByname('NUMERO').Value 		  := sisVDadosPessoaEndereco.FieldByname('NUMERO').Value;
                        cdsEndereco.FieldByname('COMPLEMENTO').Value   := sisVDadosPessoaEndereco.FieldByname('COMPLEMENTO').Value;
                        cdsEndereco.FieldByname('BAIRRO').Value 		  := sisVDadosPessoaEndereco.FieldByname('BAIRRO').Value;
                        cdsEndereco.FieldByname('CEP').Value 			  := sisVDadosPessoaEndereco.FieldByname('CEP').Value;

                        cdsEndereco.Post;
                     except
                        on E : Exception do
                           Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
                     end;

                  	sisVDadosPessoaEndereco.Next;
                  end;

               cdsEndereco.EnableControls;
            end;

         sisVDadosPessoaEndereco.Active   := False;
         sisVDadosPessoaEndereco.Filtered := False;
         sisVDadosPessoaEndereco.EnableControls;
      end;
end;

procedure TfrmCadastroPessoa.CarregaInformacoesPlanoFilantropia;
begin
   with dtModule do
      begin
         //PLANO
         sisVPessoaPlano.Active := False;
         sisVPessoaPlano.Active := True;

         sisVPessoaPlano.DisableControls;

         sisVPessoaPlano.Filtered := False;
         sisVPessoaPlano.Filter   := 'ID_PESSOA = ' + IntToStr( glbIdPessoa );
         sisVPessoaPlano.Filtered := True;

         if not sisVPessoaPlano.IsEmpty then
            begin
               cmbPlano.ItemIndex         := cmbPlano.Properties.Items.IndexOf(sisVPessoaPlano.FieldByName('DESCRICAO').AsString);
               cmbPlanoDtInicio.ItemIndex := cmbPlanoDtInicio.Properties.Items.IndexOf(sisVPessoaPlano.FieldByName('REFER_INICIO').AsString);
               cmbPlanoDtFinal.ItemIndex  := cmbPlanoDtFinal.Properties.Items.IndexOf(sisVPessoaPlano.FieldByName('REFER_FIM').AsString);
               lblPlanoValor.Caption      := 'R$ ' + FormatFloat( '#,##0.00', sisVPessoaPlano.FieldByName('VALOR').AsCurrency );
            end
         else
            Notificacao('Matrícula sem plano cadastrado.');

         sisVPessoaPlano.Filtered := False;
         sisVPessoaPlano.Active   := False;

         sisVPessoaPlano.EnableControls;

         //FILANTROPIA
         sisVPessoaFilantropia.Active := False;
         sisVPessoaFilantropia.Active := True;

         sisVPessoaFilantropia.DisableControls;

         sisVPessoaFilantropia.Filtered := False;
         sisVPessoaFilantropia.Filter   := 'ID_PESSOA = ' + IntToStr( glbIdPessoa );
         sisVPessoaFilantropia.Filtered := True;

         if not sisVPessoaFilantropia.IsEmpty then
            begin
               cmbFilantropia.ItemIndex         := cmbFilantropia.Properties.Items.IndexOf(sisVPessoaFilantropia.FieldByName('DESCRICAO').AsString);
               cmbFilantropiaDtInicio.ItemIndex := cmbFilantropiaDtInicio.Properties.Items.IndexOf(sisVPessoaFilantropia.FieldByName('REFER_INICIO').AsString);
               cmbFilantropiaDtFinal.ItemIndex  := cmbFilantropiaDtFinal.Properties.Items.IndexOf(sisVPessoaFilantropia.FieldByName('REFER_FIM').AsString);
               lblFilantropiaValor.Caption 		:= 'R$ ' + FormatFloat( '#,##0.00', sisVPessoaFilantropia.FieldByName('VALOR').AsCurrency );
               lblFilantropiaPercentual.Caption := FormatFloat( '#,##0.00', sisVPessoaFilantropia.FieldByName('PERCENTUAL').AsCurrency ) + ' %';
            end
         else
            begin
               cmbFilantropia.ItemIndex         := -1;
               cmbFilantropiaDtInicio.ItemIndex := -1;
               cmbFilantropiaDtFinal.ItemIndex  := -1;
               lblFilantropiaValor.Caption 		:= 'R$ 0.00';
               lblFilantropiaPercentual.Caption := '0.00 %';
            end;

         sisVPessoaFilantropia.Filtered := False;
         sisVPessoaFilantropia.Active   := False;

         sisVPessoaFilantropia.EnableControls;
      end;
end;

procedure TfrmCadastroPessoa.CarregaInformacoesSanto;
begin
	with dtModule do
      begin
         sisVDadosPessoaSanto.Active := False;
         sisVDadosPessoaSanto.Active := True;

      	sisVDadosPessoaSanto.DisableControls;

         sisVDadosPessoaSanto.Filtered := False;
         sisVDadosPessoaSanto.Filter   := 'ID_PESSOA = ' + IntToStr( glbIdPessoa );
         sisVDadosPessoaSanto.Filtered := True;

         if not sisVDadosPessoaSanto.IsEmpty then
            begin
            	cdsSanto.DisableControls;
            	cdsSanto.EmptyDataSet;

            	sisVDadosPessoaSanto.First;

               while not sisVDadosPessoaSanto.Eof do
               	begin
                  	try
                        cdsSanto.Append;

                        cdsSanto.FieldByname('DESCRICAO').Value := sisVDadosPessoaSanto.FieldByname('DESCRICAO').Value;

                        cdsSanto.Post;
                     except
                        on E : Exception do
                           Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
                     end;

                  	sisVDadosPessoaSanto.Next;
                  end;

               cdsSanto.EnableControls;
            end;

         sisVDadosPessoaSanto.Active   := False;
         sisVDadosPessoaSanto.Filtered := False;
         sisVDadosPessoaSanto.EnableControls;
      end;
end;

procedure TfrmCadastroPessoa.CarregaInformacoesObrigacao;
begin
	with dtModule do
      begin
         sisVDadosPessoaObrigacao.Active := False;
         sisVDadosPessoaObrigacao.Active := True;

      	sisVDadosPessoaObrigacao.DisableControls;

         sisVDadosPessoaObrigacao.Filtered := False;
         sisVDadosPessoaObrigacao.Filter   := 'ID_PESSOA = ' + IntToStr( glbIdPessoa );
         sisVDadosPessoaObrigacao.Filtered := True;

         if not sisVDadosPessoaObrigacao.IsEmpty then
            begin
            	cdsObrigacao.DisableControls;
            	cdsObrigacao.EmptyDataSet;

            	sisVDadosPessoaObrigacao.First;

               while not sisVDadosPessoaObrigacao.Eof do
               	begin
                  	try
                        cdsObrigacao.Append;

                        cdsObrigacao.FieldByname('DESCRICAO').Value := sisVDadosPessoaObrigacao.FieldByname('DESCRICAO').Value;
                        cdsObrigacao.FieldByname('DATA').Value      := sisVDadosPessoaObrigacao.FieldByname('DATA').Value;

                        cdsObrigacao.Post;
                     except
                        on E : Exception do
                           Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
                     end;

                  	sisVDadosPessoaObrigacao.Next;
                  end;

               cdsObrigacao.EnableControls;
            end;

         sisVDadosPessoaObrigacao.Active   := False;
         sisVDadosPessoaObrigacao.Filtered := False;
         sisVDadosPessoaObrigacao.EnableControls;
      end;
end;

procedure TfrmCadastroPessoa.cbUtilizaMatriculaClick(Sender: TObject);
begin
  inherited;

   lblTextoMatricula.Visible := cbUtilizaMatricula.Checked;
   edtMatricula.Visible      := cbUtilizaMatricula.Checked;

   if cbUtilizaMatricula.Checked then
      edtMatricula.Text := RetornaCodigoMatricula
   else
      edtMatricula.Text := '';
end;

procedure TfrmCadastroPessoa.cmbEmpUFPropertiesChange(Sender: TObject);
begin
  inherited;

   if cmbEmpUF.ItemIndex > -1 then
      CarregaCidade(cmbEmpUF, cmbEmpCidade);
end;

procedure TfrmCadastroPessoa.cmbFilantropiaPropertiesChange(Sender: TObject);
begin
  inherited;

  	RetornaValorFilantropia(cmbFilantropia, lblFilantropiaValor, lblFilantropiaPercentual);
end;

procedure TfrmCadastroPessoa.cmbPlanoPropertiesChange(Sender: TObject);
begin
  inherited;

  	RetornaValorPlano( cmbPlano, lblPlanoValor );
end;

procedure TfrmCadastroPessoa.cmbUfPropertiesChange(Sender: TObject);
begin
  inherited;

   if cmbUF.ItemIndex > -1 then
      CarregaCidade(cmbUf, cmbCidade);
end;

procedure TfrmCadastroPessoa.btnCadEstadoCivilClick(Sender: TObject);
begin
  inherited;

  	BtnCad(TfrmCadastroEstadoCivil, frmCadastroEstadoCivil, cmbEstadoCivil, 'Estado Civil', 'Cadastro de Estado Civil');
end;

procedure TfrmCadastroPessoa.cxButton2Click(Sender: TObject);
begin
  inherited;

   pcDados.ActivePage := tsDocumento;
	//cmbTipo.SetFocus;
end;

procedure TfrmCadastroPessoa.edtMatriculaExit(Sender: TObject);
var lclValor : Integer;
    lclMatriculaOld : String;
begin
  inherited;

   if (Trim(edtMatricula.Text) <> '') then
      begin
         lclValor := StrToInt(Trim(edtMatricula.Text));
         edtMatricula.Text := Format('%6.6d', [lclValor]);

         if VerificaMatriculaExiste( glbMatriculaOld, Trim(edtMatricula.Text) ) then
            begin
               if glbOperacao = 'I' then
                  begin
                     if ( Application.MessageBox('O número de matrícula informado já está cadastrado no sistema. Deseja utilizar a geração automática?', PChar(Application.Title), MB_YESNO Or MB_ICONQUESTION ) = IDYES ) then
                        edtMatricula.Text := RetornaCodigoMatricula;
                  end
               else if glbOperacao = 'A' then
                  Notificacao('O número de matrícula informado já está cadastrado no sistema.');

               edtMatricula.SetFocus;
            end;
      end
   else
      edtMatricula.Text := RetornaCodigoMatricula;
end;

procedure TfrmCadastroPessoa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

   dtModule.cfgCidade.Active := False;
   dtModule.cfgEstado.Active := False;
end;

procedure TfrmCadastroPessoa.FormCreate(Sender: TObject);
begin
  inherited;

	Brush.Style := bsClear;

   TraducaoFormulario('TraduçãoDev.ini', locCargo);
end;

procedure TfrmCadastroPessoa.FormShow(Sender: TObject);
begin
  inherited;

   dtModule.cfgEstado.Active := False;
   dtModule.cfgEstado.Active := True;

   dtModule.cfgCidade.Active := False;
   dtModule.cfgCidade.Active := True;

  	//Principal
   CarregaClassificacao(cmbClassificacao);
   CarregaAtividade(cmbAtividade);
   CarregaEstadoCivil(cmbEstadoCivil);

   //Empresa
   CarregaEstado(cmbEmpUF);

   //Contato
   CarregaTipoContato(cmbTipoContato);

   //Documento
   CarregaTipoDocumento(cmbTipoDocumento);

   //Endereço
   CarregaTipoEndereco(cmbTipoEndereco);
   CarregaEstado(cmbUf);

   if glbOperacao = 'I' then
   	begin
         CarregaPlano(cmbPlano);
         CarregaReferencia(cmbPlanoDtInicio, cmbPlanoDtFinal, glbAnoContabil);

         CarregaFilantropia(cmbFilantropia);
         CarregaReferencia(cmbFilantropiaDtInicio, cmbFilantropiaDtFinal, glbAnoContabil);

         glbMatriculaOld := '';
         glbIdContato    := 0;
         glbIdPessoa     := 0;

         edtMatricula.Text := RetornaCodigoMatricula;

         //Aba Principal
         cmbClassificacao.ItemIndex       := -1;
         cmbAtividade.ItemIndex       		:= -1;
         cmbEstadoCivil.ItemIndex         := -1;

         //Aba Empresa
         cmbEmpUf.ItemIndex     				:= -1;
		   cmbEmpCidade.ItemIndex   		   := -1;

         //Aba Contato
         cmbTipoContato.ItemIndex       	:= -1;

         //Aba Documentação
         cmbTipoDocumento.ItemIndex       := -1;

         //Aba Endereço
         cmbTipoEndereco.ItemIndex        := -1;
         cmbUf.ItemIndex     					:= -1;
		   cmbCidade.ItemIndex 				   := -1;

         //Aba Plano
         cmbPlano.ItemIndex               := -1;
         cmbPlanoDtInicio.ItemIndex       := -1;
         cmbPlanoDtFinal.ItemIndex        := -1;
         cmbFilantropia.ItemIndex         := -1;
         cmbFilantropiaDtInicio.ItemIndex := -1;
         cmbFilantropiaDtFinal.ItemIndex  := -1;
      end
   else if glbOperacao = 'A' then
   	begin
      	CarregaInformacoes;

         lblInativo.Visible := not glbStatusPessoa;

         {cmbPlano.Enabled         := False;
         cmbPlanoDtInicio.Enabled := False;
         cmbPlanoDtFinal.Enabled  := False;
         btnCadPlano.Enabled  	 := False;
         btnAltPlano.Enabled  	 := False;

         cmbFilantropia.Enabled         := False;
         cmbFilantropiaDtInicio.Enabled := False;
         cmbFilantropiaDtFinal.Enabled  := False;
         btnCadFilantropia.Enabled  	 := False;
         btnAltFilantropia.Enabled  	 := False;}
      end;

   pcDados.ActivePage := tsPrincipal;
   cmbClassificacao.SetFocus;
end;

procedure TfrmCadastroPessoa.RetornaValorPlano(varDescricao: TcxComboBox; varValor : TcxLabel);
begin
	with dtModule.sisPlano do
   	begin
         Filtered := False;

         if not IsEmpty then
         	begin
               if Locate('DESCRICAO', Trim(varDescricao.Text), [loPartialKey, loCaseInsensitive]) then
						varValor.Caption := 'R$ ' + FormatFloat( '#,##0.00', FieldByName('VALOR').AsCurrency )
               else
               	varValor.Caption := 'R$ ' + FormatFloat( '#,##0.00', 0 );
            end;
      end;
end;

procedure TfrmCadastroPessoa.mnuContatoRemoverClick(Sender: TObject);
begin
  inherited;

	btnRemoverContato.OnClick(Self);
end;

procedure TfrmCadastroPessoa.RetornaValorFilantropia(varDescricao: TcxComboBox; varValor, varPercentual : TcxLabel);
begin
	with dtModule.sisFilantropia do
   	begin
         Filtered := False;

         if not IsEmpty then
         	begin
               if Locate('DESCRICAO', Trim(varDescricao.Text), [loPartialKey, loCaseInsensitive]) then
               	begin
							varValor.Caption      := 'R$ ' + FormatFloat( '#,##0.00', FieldByName('VALOR').AsCurrency );
                     varPercentual.Caption := FormatFloat( '#,##0.00', FieldByName('PERCENTUAL').AsCurrency ) + ' %';
                  end
               else
               	begin
							varValor.Caption      := 'R$ ' + FormatFloat( '#,##0.00', 0 );
                     varPercentual.Caption := FormatFloat( '#,##0.00', 0 ) + ' %';
                  end;
            end;
      end;
end;

function TfrmCadastroPessoa.ValidaCampos: Boolean;
begin
	Result := False;

   if cmbClassificacao.ItemIndex = -1 then
   	begin
         Notificacao('Informe a classificação da pessoa.');
         pcDados.ActivePage := tsPrincipal;
         cmbClassificacao.SetFocus;
      end
   else if edtNome.Text = '' then
   	begin
         Notificacao('Informe o nome da pessoa.');
         pcDados.ActivePage := tsPrincipal;
         edtNome.SetFocus;
      end
   else if ( edtDataNascimento.Text = '' ) and ( cmbClassificacao.ItemIndex = 0 ) then
   	begin
         Notificacao('Informe a data de nascimento da pessoa.');
         pcDados.ActivePage := tsPrincipal;
         edtNome.SetFocus;
      end
   else if ( cmbAtividade.ItemIndex = -1 ) then
      begin
         Notificacao('Informe a atividade.');
         pcDados.ActivePage := tsPrincipal;
         cmbAtividade.SetFocus;
      end
   else if cdsContato.IsEmpty then
   	begin
         Notificacao('Informe ao menos um meio de contato da pessoa.');
         pcDados.ActivePage := tsContato;
         cmbTipoContato.SetFocus;
      end
   else if cmbPlano.ItemIndex = -1 then
   	begin
      	Notificacao('Informe o plano da pessoa.');
         pcDados.ActivePage := tsPlano;
         cmbPlano.SetFocus;
      end
   else if cmbPlanoDtInicio.ItemIndex = -1 then
   	begin
         Notificacao('Informe a referência inicial do plano.');
         pcDados.ActivePage := tsPlano;
         cmbPlanoDtInicio.SetFocus;
      end
   else if cmbPlanoDtFinal.ItemIndex = -1 then
   	begin
         Notificacao('Informe a referência final do plano.');
         pcDados.ActivePage := tsPlano;
         cmbPlanoDtFinal.SetFocus;
      end
   else
   	Result := True;
end;

function TfrmCadastroPessoa.VerificaMatriculaExiste( varMatriculaOld, varMatricula : String ): Boolean;
begin
   with dtModule.ADOQuery, SQL do
      begin
         Close;
         Clear;

         Add(' SELECT ID_PESSOA FROM [sis].[PESSOA] WHERE MATRICULA = ' + QuotedStr( varMatricula ) + ' AND MATRICULA <> ' + QuotedStr( varMatriculaOld ) );

         Open;

         if not IsEmpty then
            Result := True
         else
            Result := False;

         Close;
      end;
end;

end.
