unit uFuncao;

interface

uses
  System.SysUtils, System.Classes, System.IniFiles, System.Notification,
  System.Variants, System.TypInfo, System.DateUtils,

  Printers,

  Vcl.Forms, Vcl.Graphics, Vcl.Controls, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls, Vcl.Menus, cxLabel,

  IdSMTP, IdSSLOpenSSL, IdMessage, IdText, IdAttachmentFile,
  IdExplicitTLSClientServerBase,

  Winapi.Windows, Winapi.Messages,

  cxLocalization, cxControls, cxPC, cxButtons, cxContainer, cxEdit, cxDateUtils,
  cxDropDownEdit, cxGroupBox, cxTextEdit, cxMaskEdit, cxCalendar, cxCurrencyEdit,
  cxClasses, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, cxCustomData,
  cxGridCustomView, cxStyles, cxFilter, cxData, cxDataStorage, cxNavigator,
  cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, {cxLocalization, cxLabel,}

  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, dxBarBuiltInMenu, dxCore, dxCustomTileControl,
  dxTileControl, dxGDIPlusClasses,

  ShellApi,

  {uFreeBoleto, uFreeBoletoImage,}

  Datasnap.DBClient,

  {RxToolEdit, RxCurrEdit,}

  Data.DB,

  Data.Win.ADODB;

   procedure GravaIni(varDatabase, varPassword, varUser, varLocal, varNomeArquivo: String);
   procedure CarregaArquivoIni( varNomeArquivo : String; varConn : TADOConnection );
   procedure ConectaTabelas;
   procedure ReconectaTabela( varTable : TADOTable );
   procedure AtualizaTabelas;
   procedure LimpaCampos( Form : TForm; varTag : Integer );
   procedure HabilitaCampos( Form : TForm );
   procedure TituloForm( Form : TForm; varTitulo, varOperacao : String );
   procedure Notificacao( varMensagem : String );
   procedure AberturaJanela( varTForm : TComponentClass; varForm : TForm; varTituloForm : String );
   procedure AberturaJanelaConfiguracao( varPageIndex : Integer );
   procedure TraducaoFormulario( varArquivo : String; varLocalizer : TcxLocalizer );
   procedure EnviarEmail(varForm : TForm; varDestinatario, varCorpo : String; varConfirmacao, varMensagem : Boolean);
   procedure CarregaPermissaoAcessoMenu( varUsuario : String );
   procedure CarregaPermissaoAcessoBotao( varUsuario : String );
   procedure CarregaConfiguracao;
   procedure CarregaReferencia(varComboBoxInicio, varComboBoxFinal : TcxComboBox; varAno : String);
   procedure CarregaDtInicioFinal(varI : Integer; varComboBoxInicio, varComboBoxFinal : TcxComboBox);
   procedure CarregaEstado(varComboBox: TcxComboBox);
   procedure CarregaCidade(varComboBoxUf, varComboBoxCidade: TcxComboBox);
   procedure CarregaPlano( varComboBox : TcxComboBox );
   procedure CarregaFilantropia( varComboBox : TcxComboBox );
   procedure CloneProperties(SourceComp, DestComp: TObject);
   procedure CarregaUsuario( varComboBox : TcxComboBox );
   procedure CarregaClassificacao( varComboBox : TcxComboBox );
   procedure CarregaAtividade( varComboBox : TcxComboBox );
   procedure CarregaEstadoCivil( varComboBox : TcxComboBox );
   procedure CarregaTipoContato( varComboBox : TcxComboBox );
   procedure CarregaTipoDocumento( varComboBox : TcxComboBox );
   procedure CarregaTipoEndereco( varComboBox : TcxComboBox );
   procedure CarregaPessoa( varComboBox : TcxComboBox );
   procedure CarregaModuloPai( varComboBox : TcxComboBox );
   procedure CarregaModulo( varComboBox : TcxComboBox );
   procedure CarregaFormaPagamento(varComboBox : TcxComboBox);
   procedure CarregaTipoPagamentoDiverso(varComboBox : TcxComboBox);
   procedure CarregaUsuarioModulo( varUsuario : String; varTextEdit : TcxTextEdit; varLabel : TcxLabel; varGrid : TcxGrid );
   procedure CarregaPagamentoDiversos( varTable : TClientDataSet );
   procedure BtnCad( varTForm : TComponentClass; varForm : TForm; varComboBox : TcxComboBox; varMod, varTit : String );
   procedure BtnCadCons( varTForm : TComponentClass; varForm : TForm; varTit : String );
   procedure BtnAlt( varTForm : TComponentClass; varForm : TForm; varComboBox : TcxComboBox; varMod, varTit, varMsg : String );
   procedure BtnAltCons( varTForm : TComponentClass; varForm : TForm; varTabela: TADOTable; varMod, varParamentro, varTit, varMsg : String );
   procedure FiltroConsulta( varTabela: TADOTable; varComboBoxPesquisa: TcxComboBox; varCampoCodigo, varCampoDescricao, varTexto: String );
   procedure ImprimeCupomTesouraria(varMatricula, varNome, varRefer, varVencimento, varValor, VarPagamento, varFormaPagamento : String);
   procedure ImprimeCupomPagamentoDiverso(varMatricula, varNome, varDescricao, varValor, VarPagamento, varFormaPagamento : String);

   function DataDirectory : String;
   function ValidaCPF( varCPF : String ) : Boolean;
   function ValidaCNPJ( varCNPJ : String ) : Boolean;
   function ValidaEMail( varEmail : String): Boolean;
   function ValidaEmailCadastrado( varUsuario, varEmail : String): Boolean;
   function ValidaLoginCadastrado( varIdUsuario : Integer; varLogin : String ) : Boolean;
   function ValidaPlanoCadastrado( varIdPlano : Integer; varDescricao : String ) : Boolean;
   function ValidaTipoPagamentoDiversoCadastrado( varIdTipoPagamentoDiverso : Integer; varDescricao : String ) : Boolean;
   function ValidaFilantropiaCadastrado( varIdFilantropia : Integer; varDescricao : String ) : Boolean;
   function ValidaComponenteCadastrado( varIdModulo : Integer; varComponente : String ) : Boolean;
   function ValidaClassificacaoCadastrado( varIdClassificacao : Integer; varDescricao : String ) : Boolean;
   function ValidaAtividadeCadastrado( varIdAtividade : Integer; varDescricao : String ) : Boolean;
   function ValidaTipoContatoCadastrado( varIdTipoContato : Integer; varDescricao : String ) : Boolean;
   function ValidaTipoDocumentoCadastrado( varIdTipoDocumento : Integer; varDescricao : String ) : Boolean;
   function ValidaTipoEnderecoCadastrado( varIdTipoEndereco : Integer; varDescricao : String ) : Boolean;
   function ValidaEstadoCivilCadastrado( varIdEstadoCivil : Integer; varDescricao : String ) : Boolean;
   function RetornaIdUsuario( varNome : String ) : Integer;
   function RetornaIdPessoa( varNome : String ) : Integer;
   function RetornaIdPessoaMatricula( varMatricula : String ) : Integer;
   function RetornaNomePessoa( varIdPessoa : Integer ) : String;
   function RetornaNomeUsuario( varIdUsuario : Integer ) : String;
   function RetornaUltimoIdPessoa : Integer;
   function RetornaIdModulo( varDescricao : String ) : Integer;
   function RetornaIdFormaPagamento( varDescricao : String ) : Integer;
   function RetornaIdTipoPagamentoDiverso( varDescricao : String ) : Integer;
   function RetornaIdCidade( varNome : String ) : Integer;
   function RetornaIdClassificacao( varDescricao : String ) : Integer;
   function RetornaIdAtividade( varDescricao : String ) : Integer;
   function RetornaIdEstadoCivil( varDescricao : String ) : Integer;
   function RetornaIdTipoContato( varDescricao : String ) : Integer;
   function RetornaIdTipoDocumento( varDescricao : String ) : Integer;
   function RetornaIdTipoEndereco( varDescricao : String ) : Integer;
   function RetornaIdPlano( varDescricao : String ) : Integer;
   function RetornaValorPlano( varDescricao : String ) : Currency;
   function RetornaValorPlanoMatricula( varNomePessoa : String ) : Currency;
   function RetornaValorMensalidade( varNomePessoa : String ) : Currency;
   function RetornaIdFilantropia( varDescricao : String ) : Integer;
   function RetornaIdFinanceiro( varIdPessoa, varReferencia : String ) : Integer;
   function RetornaValorFilantropia( varDescricao : String ) : Currency;
   function RetornaPercentualFilantropia( varDescricao : String ) : Currency;
   function RetornaCodigoMatricula : String;
   function RetornaMatricula( varNome : String ) : String;
   function CarregaPessoaUsuario( varNome : String ) : Boolean;
   function VerificaAcesso( varUsuario, varSenha : String ) : Boolean;
   function StrZeros(Texto: String; Qtde: Integer): String;
   function SubtracaoData(varDataMaior, varDataMenor : TDateTime) : Integer;
   function VerificaAphaNumerico(varTexto: String): Boolean;
   function VerificaMatriculaAtiva(varMatricula : String) : Boolean;

implementation

uses uGlobal, uModule, uConexao, uConfiguracao, uPrincipal;

procedure GravaIni(varDatabase, varPassword, varUser, varLocal, varNomeArquivo: String);
var
   Arq : TIniFile;
   NovoNome : String;
begin
   (* Cria arquivo ini *)
   NovoNome := DataDirectory + varNomeArquivo;

   if not FileExists(NovoNome) then
      begin
         Arq := TIniFile.Create(NovoNome);

         try
            Arq.WriteString('ConexaoBanco', 'Database', varDatabase);
            Arq.WriteString('ConexaoBanco', 'Password', varPassword);
            Arq.WriteString('ConexaoBanco', 'User', varUser);
            Arq.WriteString('ConexaoBanco', 'Local', varLocal);
         finally
            FreeAndNil(Arq);
         end;
      end;
end;

procedure CarregaArquivoIni( varNomeArquivo : String; varConn : TADOConnection );
var
   CaminhoINI: String;
   Arq: TIniFile;
   ListaAtributos: TStrings;
   NovoNome: string;
begin
   //Se não tiver gravado o INI no diretorio então cria o INI

   (* Cria arquivo ini *)
   NovoNome := DataDirectory + varNomeArquivo;

   if not FileExists(NovoNome) then
      begin
         Arq := TIniFile.Create(NovoNome);

         try
            Application.CreateForm(TfrmConexao, frmConexao);
            frmConexao.ShowModal;

            if ( frmConexao.lclDadosConexao ) then
               GravaIni(glbDatabase, glbPassword, glbUser, glbLocal, 'STRAES_FLUENT.dll')
            else
               Application.Terminate;
         finally
            frmConexao.Free;
            FreeAndNil(Arq);
         end;
      end
   else
      begin
         //Lista e carrega o INI no sistema
         ListaAtributos := TStringList.Create;

         CaminhoINI := DataDirectory + varNomeArquivo;

         //Se existe o INI então conecta
         if not FileExists(CaminhoINI) then
            raise Exception.Create('Atenção! Não foram informados os parâmetros para conexão com o banco de dados!')
         else
            begin
            	if varConn.Connected then
               	varConn.Connected := False;

               (* Le o arquivo INI *)
               Arq := TIniFile.Create(CaminhoINI);

               Arq.ReadSectionValues('ConexaoBanco', ListaAtributos);

               glbDatabase  := Arq.ReadString('ConexaoBanco','Database','');
               glbPassword  := Arq.ReadString('ConexaoBanco','Password','');
               glbUser      := Arq.ReadString('ConexaoBanco','User','');
               glbLocal     := Arq.ReadString('ConexaoBanco','Local','');

               varConn.ConnectionString := 'Provider=SQLOLEDB.1;Password=' + glbPassword +
                                           ';Persist Security Info=True;User ID=' + glbUser +
                                           ';Initial Catalog=' + glbDatabase +
                                           ';Data Source=' + glbLocal;

               varConn.Connected := True;

               ConectaTabelas;
            end;

         Arq.Free;

         ListaAtributos.Free;
      end;
end;

procedure ConectaTabelas;
begin
   with dtModule do
      begin
         {cfgConfiguracao.Active := True;
         cfgUsuario.Active := True;
         cfgPais.Active := True;
         cfgEstado.Active := True;
         cfgCidade.Active := True;
         cfgModulo.Active := True;
         cfgUsuarioModulo.Active := True;
         cfgVUsuarioModulo.Active := True;
         cfgEstadoCivil.Active := True;
         cfgVModulo.Active := True;

         sisPessoa.Active := True;
         sisPlano.Active := True;
         sisFilantropia.Active := True;
         sisPessoaPlano.Active := True;
         sisPessoaFilantropia.Active := True;
         sisVPessoaPlano.Active := True;
         sisVPessoaFilantropia.Active := True;
         sisVDadosPessoa.Active := True;
         sisVPessoaPlanoFilantropia.Active := True;
         sisFinanceiro.Active := True;
         sisTipoContato.Active := True;
         sisTipoDocumento.Active := True;
         sisTipoEndereco.Active := True;
         sisClassificacao.Active := True;
         sisAtividade.Active := True;
         sisContato.Active := True;
         sisDocumento.Active := True;
         sisEndereco.Active := True;
         sisVDadosPessoaContato.Active := True;
         sisVDadosPessoaDocumento.Active := True;
         sisVDadosPessoaEndereco.Active := True;
         sisVDadosPessoaFinanceiro.Active := True;
         sisVDadosFinanceiro.Active := True;
         sisVDadosPessoaSanto.Active := True;
         sisVDadosPessoaObrigacao.Active := True;
         sisFormaPagamento.Active := True;
         sisVDadosPagamentoDiverso.Active := True;

         oldVDadosAntigoCompleto.Active := True;}
      end;
end;

procedure ReconectaTabela( varTable : TADOTable );
begin
	varTable.Active := False;
   varTable.Active := True;
end;

procedure AtualizaTabelas;
begin
   with dtModule do
   	begin
      	{ReconectaTabela( cfgConfiguracao );
      	ReconectaTabela( cfgUsuario );
      	ReconectaTabela( cfgPais );
      	ReconectaTabela( cfgEstado );
      	ReconectaTabela( cfgCidade );
      	ReconectaTabela( cfgModulo );
      	ReconectaTabela( cfgUsuarioModulo );
      	ReconectaTabela( cfgVUsuarioModulo );
      	ReconectaTabela( cfgEstadoCivil );
      	ReconectaTabela( cfgVModulo );

      	ReconectaTabela( sisPessoa );
      	ReconectaTabela( sisPlano );
      	ReconectaTabela( sisFilantropia );
      	ReconectaTabela( sisPessoaPlano );
      	ReconectaTabela( sisPessoaFilantropia );
      	ReconectaTabela( sisVPessoaPlano );
      	ReconectaTabela( sisVPessoaFilantropia );
      	ReconectaTabela( sisVDadosPessoa );
      	ReconectaTabela( sisVPessoaPlanoFilantropia );
      	ReconectaTabela( sisFinanceiro );
      	ReconectaTabela( sisTipoContato );
      	ReconectaTabela( sisTipoDocumento );
      	ReconectaTabela( sisTipoEndereco );
      	ReconectaTabela( sisClassificacao );
      	ReconectaTabela( sisAtividade );
      	ReconectaTabela( sisContato );
      	ReconectaTabela( sisDocumento );
      	ReconectaTabela( sisEndereco );
      	ReconectaTabela( sisVDadosPessoaContato );
      	ReconectaTabela( sisVDadosPessoaDocumento );
      	ReconectaTabela( sisVDadosPessoaEndereco );
      	ReconectaTabela( sisVDadosPessoaFinanceiro );
      	ReconectaTabela( sisVDadosFinanceiro );
      	ReconectaTabela( sisVDadosPessoaSanto );
      	ReconectaTabela( sisVDadosPessoaObrigacao );
      	ReconectaTabela( sisFormaPagamento );
      	ReconectaTabela( sisVDadosPagamentoDiverso );

      	ReconectaTabela( oldVDadosAntigoCompleto );}
      end;
end;

procedure LimpaCampos( Form : TForm; varTag : Integer );
var i : Integer;
begin
   for i := 0 to Form.ComponentCount - 1 do
      if ( Form.Components[i].Tag = varTag ) then
         begin
            if ( Form.Components[i] is TEdit ) then
               ( Form.Components[i] as TEdit ).Clear
            else if ( Form.Components[i] is TComboBox ) then
               ( Form.Components[i] as TComboBox ).ItemIndex := -1
            else if ( Form.Components[i] is TMaskEdit ) then
               ( Form.Components[i] as TMaskEdit ).Clear
            else if ( Form.Components[i] is TCheckBox ) then
               ( Form.Components[i] as TCheckBox ).Checked := False
            else if ( Form.Components[i] is TDateTimePicker ) then
               ( Form.Components[i] as TDateTimePicker ).Date := Now
            else if ( Form.Components[i] is TcxCurrencyEdit ) then
               ( Form.Components[i] as TcxCurrencyEdit ).Value := 0
            else if ( Form.Components[i] is TcxLabel ) then
               ( Form.Components[i] as TcxLabel ).Clear
            else if ( Form.Components[i] is TcxMaskEdit ) then
               ( Form.Components[i] as TcxMaskEdit ).Clear;
         end;
end;

procedure HabilitaCampos( Form : TForm );
var i : Integer;
begin
   for i := 0 to Form.ComponentCount - 1 do
      if ( Form.Components[i].Tag = 1 ) then
         begin
            if ( Form.Components[i] is TSpeedButton ) then
               ( Form.Components[i] as TSpeedButton ).Enabled := not ( Form.Components[i] as TSpeedButton ).Enabled
            else if ( Form.Components[i] is TComboBox ) then
               ( Form.Components[i] as TComboBox ).Enabled := not ( Form.Components[i] as TComboBox ).Enabled
            else if ( Form.Components[i] is TEdit ) then
               ( Form.Components[i] as TEdit ).Enabled := not ( Form.Components[i] as TEdit ).Enabled
            else if ( Form.Components[i] is TMaskEdit ) then
               ( Form.Components[i] as TMaskEdit ).Enabled := not ( Form.Components[i] as TMaskEdit ).Enabled
            else if ( Form.Components[i] is TCheckBox ) then
               ( Form.Components[i] as TCheckBox ).Enabled := not ( Form.Components[i] as TCheckBox ).Enabled
            else if ( Form.Components[i] is TcxComboBox ) then
               ( Form.Components[i] as TcxComboBox ).Enabled := not ( Form.Components[i] as TcxComboBox ).Enabled
            else if ( Form.Components[i] is TcxButton ) then
               ( Form.Components[i] as TcxButton ).Enabled := not ( Form.Components[i] as TcxButton ).Enabled;
         end;
end;

procedure TituloForm( Form : TForm; varTitulo, varOperacao : String );
begin
   if varOperacao = 'I' then
      Form.Caption := PChar(Application.Title) + '| ' + varTitulo + ' | INCLUSÃO'
   else if varOperacao = 'A' then
      Form.Caption := PChar(Application.Title) + '| ' + varTitulo + ' | ALTERAÇÃO'
   else if varOperacao = 'E' then
      Form.Caption := PChar(Application.Title) + '| ' + varTitulo + ' | EXCLUSÃO'
   else
      begin
         if varTitulo = '' then
            Form.Caption := PChar(Application.Title) + varTitulo
         else
            Form.Caption := PChar(Application.Title) + ' | ' + varTitulo;
      end;
end;

procedure Notificacao( varMensagem : String );
begin
   Application.MessageBox(Pchar(varMensagem),Pchar(Application.Title), MB_ICONINFORMATION);
end;

procedure AberturaJanela( varTForm : TComponentClass; varForm : TForm; varTituloForm : String );
begin
   try
   	//AtualizaTabelas;

      Application.CreateForm(varTForm, varForm);
      TituloForm(varForm, varTituloForm, glbOperacao);
      varForm.ShowModal;
   finally
      varForm.Free;

      //AtualizaTabelas;
   end;
end;

procedure AberturaJanelaConfiguracao( varPageIndex : Integer );
begin
   try
   	AtualizaTabelas;

      Application.CreateForm(TfrmConfiguracao, frmConfiguracao);
      TituloForm(frmConfiguracao, 'Configuracao', '');
      frmConfiguracao.ShowModal;
   finally
      frmConfiguracao.Free;

      AtualizaTabelas;
   end;
end;

procedure TraducaoFormulario( varArquivo : String; varLocalizer : TcxLocalizer );
begin
	//VERIFICA SE EXISTE O ARQUIVO DENTRO DA PASTA
   if FileExists(ExtractFilePath(Application.ExeName) + '\' + varArquivo) then
      begin
         varLocalizer.LoadFromFile(ExtractFilePath(Application.ExeName) + '\' + varArquivo);

         //MUDA DE LINGUAGEM
         varLocalizer.LanguageIndex := 1;

         //ATIVA O COMPONENTE
         varLocalizer.Active := True;
      end;
end;

procedure EnviarEmail(varForm : TForm; varDestinatario, varCorpo : String; varConfirmacao, varMensagem : Boolean);
//variáveis e objetos necessários para o envio
var IdSSLIOHandlerSocket : TIdSSLIOHandlerSocketOpenSSL;
    IdSMTP               : TIdSMTP;
    IdMessage            : TIdMessage;
    IdText               : TIdText;
    sAnexo               : string;
begin
   //instanciação dos objetos
   IdSSLIOHandlerSocket := TIdSSLIOHandlerSocketOpenSSL.Create(varForm);
   IdSMTP               := TIdSMTP.Create(varForm);
   IdMessage            := TIdMessage.Create(varForm);

   try
      //Configuração do protocolo SSL (TIdSSLIOHandlerSocketOpenSSL)
      IdSSLIOHandlerSocket.SSLOptions.Method := sslvSSLv23;
      IdSSLIOHandlerSocket.SSLOptions.Mode   := sslmClient;

      //Configuração do servidor SMTP (TIdSMTP)
      IdSMTP.IOHandler := IdSSLIOHandlerSocket;
      IdSMTP.UseTLS    := utUseImplicitTLS;
      IdSMTP.AuthType  := satDefault;
      IdSMTP.Port      := 465;
      IdSMTP.Host      := 'mail.stimarques.com.br';
      IdSMTP.Username  := 'suporte@stimarques.com.br';
      IdSMTP.Password  := 'F51TP455w0rd+-';

      //Configuração da mensagem (TIdMessage)
      IdMessage.From.Address           := 'suporte@stimarques.com.br';
      IdMessage.From.Name              := 'Marques Soluções em TI';
      IdMessage.ReplyTo.EMailAddresses := IdMessage.From.Address;
      IdMessage.Recipients.Add.Text    := varDestinatario;
      IdMessage.Subject                := 'Recuperação de Senha';
      IdMessage.Encoding               := meMIME;

      if varConfirmacao then
         IdMessage.ReceiptRecipient.Text := IdMessage.From.Text;

      //Configuração do corpo do email (TIdText)
      IdText := TIdText.Create(IdMessage.MessageParts);
      IdText.Body.Add(varCorpo);
      IdText.ContentType := 'text/plain; charset=iso-8859-1';

      //Opcional - Anexo da mensagem (TIdAttachmentFile)
      {sAnexo := varAnexo;

      if FileExists(sAnexo) then
         TIdAttachmentFile.Create(IdMessage.MessageParts, sAnexo);}

      //Conexão e autenticação
      try
         IdSMTP.Connect;
         IdSMTP.Authenticate;
      except
         on E:Exception do
            begin
               MessageDlg('Erro na conexão ou autenticação: ' + E.Message, mtWarning, [mbOK], 0);
               Exit;
            end;
      end;

      //Envio da mensagem
      try
         IdSMTP.Send(IdMessage);

         if varMensagem then
            MessageDlg('Mensagem enviada com sucesso!', mtInformation, [mbOK], 0);
      except
         On E:Exception do
         begin
            MessageDlg('Erro ao enviar a mensagem: ' + E.Message, mtWarning, [mbOK], 0);
         end;
      end;
   finally
      //desconecta do servidor
      IdSMTP.Disconnect;

      //liberação da DLL
      UnLoadOpenSSLLibrary;

      //liberação dos objetos da memória
      FreeAndNil(IdMessage);
      FreeAndNil(IdSSLIOHandlerSocket);
      FreeAndNil(IdSMTP);
   end;
end;

procedure CarregaPermissaoAcessoMenu( varUsuario : String );
var i, j : Integer;
begin
   dtModule.ADOQueryPermissao.Close;
   dtModule.ADOQueryPermissao.SQL.Clear;

   dtModule.ADOQueryPermissao.SQL.Add(' SELECT ID_MODULO, COMPONENTE,             ');
   dtModule.ADOQueryPermissao.SQL.Add(' CAST( PERMISSAO AS INT ) AS PERMISSAO     ');
   dtModule.ADOQueryPermissao.SQL.Add(' FROM [cfg].[V_PERMISSAO]                  ');
   dtModule.ADOQueryPermissao.SQL.Add(' WHERE ID_MODULO_PAI IS NULL               ');
   dtModule.ADOQueryPermissao.SQL.Add(' AND LOGIN = ' + QuotedStr( glbUsuario )    );
   dtModule.ADOQueryPermissao.SQL.Add(' AND COMPONENTE LIKE ' + QuotedStr('Mnu%')  );
   dtModule.ADOQueryPermissao.SQL.Add(' ORDER BY COMPONENTE        					 ');

   dtModule.ADOQueryPermissao.Open;

   if not dtModule.ADOQueryPermissao.IsEmpty then
      begin
         dtModule.ADOQueryPermissao.First;

         while not dtModule.ADOQueryPermissao.Eof do
            begin
            	glbIdModulo := dtModule.ADOQueryPermissao.FieldByName('ID_MODULO').AsInteger;

               for i := 0 to dtModule.ADOQueryPermissao.RecordCount -1 do
                  begin
                     if ( frmPrincipal.mmPrincipal.Items[i].Name = dtModule.ADOQueryPermissao.FieldByName('COMPONENTE').AsString ) then
                        begin
                           if dtModule.ADOQueryPermissao.FieldByName('PERMISSAO').AsInteger = 1 then
                              frmPrincipal.mmPrincipal.Items[i].Visible := True
                           else
                              frmPrincipal.mmPrincipal.Items[i].Visible := False;

                           dtModule.ADOQueryAux.Close;
                           dtModule.ADOQueryAux.SQL.Clear;

                           dtModule.ADOQueryAux.SQL.Add(' SELECT COMPONENTE, CAST( PERMISSAO AS INT ) AS PERMISSAO ');
                           dtModule.ADOQueryAux.SQL.Add(' FROM [cfg].[V_PERMISSAO]                          		 ');
                           dtModule.ADOQueryAux.SQL.Add(' WHERE ID_MODULO_PAI = ' + IntToStr( glbIdModulo )  		  );
                           dtModule.ADOQueryAux.SQL.Add(' AND LOGIN = ' + QuotedStr( glbUsuario )  			 		  );
                           dtModule.ADOQueryAux.SQL.Add(' AND COMPONENTE LIKE ' + QuotedStr('Mnu%')  			 		  );
                           dtModule.ADOQueryAux.SQL.Add(' ORDER BY COMPONENTE        										 ');

                           dtModule.ADOQueryAux.Open;

                           if not dtModule.ADOQueryAux.IsEmpty then
                              begin
                                 dtModule.ADOQueryAux.First;

                                 while not dtModule.ADOQueryAux.Eof do
                                    begin
                                       for j := 0 to dtModule.ADOQueryAux.RecordCount -1 do
                                          begin
                                             if frmPrincipal.mmPrincipal.Items[i].Items[j].Name = dtModule.ADOQueryAux.FieldByName('COMPONENTE').AsString then
                                                begin
                                                   if dtModule.ADOQueryAux.FieldByName('PERMISSAO').AsInteger = 1 then
                                                      frmPrincipal.mmPrincipal.Items[i].Items[j].Visible := True
                                                   else
                                                      frmPrincipal.mmPrincipal.Items[i].Items[j].Visible := False;
                                                end;
                                          end;

                                       dtModule.ADOQueryAux.Next;
                                    end;
                              end;

                           dtModule.ADOQueryAux.Close;
                        end;
                  end;

               dtModule.ADOQueryPermissao.Next;
            end;
      end;

   dtModule.ADOQueryPermissao.Close;
end;

procedure CarregaPermissaoAcessoBotao( varUsuario : String );
var i : Integer;
begin
   with dtModule.ADOQueryPermissao, SQL do
      begin
         Close;
         Clear;

         Add(' SELECT COMPONENTE, CAST( PERMISSAO AS INT ) AS PERMISSAO ');
         Add(' FROM [cfg].[V_PERMISSAO]                                 ');
         Add(' WHERE LOGIN = ' + QuotedStr( glbUsuario )      			    );
         Add(' AND COMPONENTE LIKE ' + QuotedStr('Btn%')              	 );
         Add(' ORDER BY COMPONENTE                                   	');

         Open;

         if not IsEmpty then
            begin
               First;

               while not Eof do
                  begin
                     for i := 0 to RecordCount - 1 do
                        begin
                           if frmPrincipal.dxTileControlPrincipal.Items[i].Name = FieldByName('COMPONENTE').AsString then
                              frmPrincipal.dxTileControlPrincipal.Items[i].Visible := FieldByName('PERMISSAO').Value = 1;
                        end;

                     Next;
                  end;
            end;

         Close;
      end;
end;

procedure CarregaConfiguracao;
begin
	with dtModule.cfgConfiguracao do
   	begin
         Active := False;
         Active := True;


      	if not IsEmpty then
         	begin
            	Filtered := False;
               Filter   := 'ATIVO = 1';
               Filtered := True;

               glbAnoContabil   := FieldByName('FIN_ANO_CONTABIL').AsString;
               glbDiaVencimento := FieldByName('FIN_DIA_VENCIMENTO').AsString;
               glbJurosDia      := FieldByName('FIN_JUROS_DIA').AsCurrency;

               Filtered := False;
            end;

         Active := False;
		end;
end;

procedure CarregaReferencia(varComboBoxInicio, varComboBoxFinal : TcxComboBox; varAno : String);
begin
	With dtModule.ADOQuery, SQL do
   	begin
         Close;
         Clear;

         if varAno = 'Atual' then
            Add(' SELECT REFER FROM [sis].[F_REFERENCIA] (' + QuotedStr( glbAnoContabil ) + ') WHERE ANO = ' + QuotedStr( glbAnoContabil ) + ' ORDER BY REFER ASC ')
         else
            Add(' SELECT REFER FROM [sis].[F_REFERENCIA] (' + QuotedStr( varAno ) + ') WHERE ANO = ' + QuotedStr( varAno ) + ' ORDER BY REFER ASC ');

         Open;

         if not IsEmpty then
         	begin
            	DisableControls;

               varComboBoxInicio.Enabled := True;
		         varComboBoxFinal.Enabled  := True;

					varComboBoxInicio.Properties.Items.Clear;
		         varComboBoxFinal.Properties.Items.Clear;

               First;

               while not Eof do
               	begin
							varComboBoxInicio.Properties.Items.Add( FieldByName('REFER').AsString );
		               varComboBoxFinal.Properties.Items.Add( FieldByName('REFER').AsString );

                     Next;
                  end;

               EnableControls;
            end
         else
         	begin
					varComboBoxInicio.Enabled := False;
		         varComboBoxFinal.Enabled  := False;
            end;

         Close;
      end;
end;

procedure CarregaDtInicioFinal(varI : Integer; varComboBoxInicio, varComboBoxFinal : TcxComboBox);
var
  i: Integer;
begin
   if glbAnoContabil <> '' then
   	begin
      	varComboBoxInicio.Clear;
         varComboBoxFinal.Clear;

         for i := varI to 12 do
         	begin
         		varComboBoxInicio.Properties.Items.Add( StrZeros( IntToStr(i), 2 ) + glbAnoContabil );
               varComboBoxFinal.Properties.Items.Add( StrZeros( IntToStr(i), 2 ) + glbAnoContabil );
            end;

         varComboBoxInicio.ItemIndex := 0;
         varComboBoxFinal.ItemIndex  := varComboBoxFinal.Properties.Items.Count - 1;
      end;
end;

procedure CarregaEstado(varComboBox: TcxComboBox);
begin
	with dtModule.cfgEstado do
   	begin
      	DisableControls;

         varComboBox.Properties.Items.Clear;

         First;

         while not Eof do
         	begin
					varComboBox.Properties.Items.Add(FieldByName('NOME').AsString);

               Next;
            end;

         EnableControls;

         varComboBox.ItemIndex := -1;
      end;
end;

procedure CarregaCidade(varComboBoxUf, varComboBoxCidade: TcxComboBox);
begin
	with dtModule, cfgCidade do
   	begin
      	DisableControls;

         varComboBoxCidade.Properties.Items.Clear;

         cfgEstado.Locate('NOME', varComboBoxUf.Text, [loPartialKey, loCaseInsensitive]);

         First;

         while not Eof do
         	begin
					varComboBoxCidade.Properties.Items.Add(FieldByName('NOME').AsString);

               Next;
            end;

         EnableControls;

         varComboBoxCidade.ItemIndex := -1;
      end;
end;

procedure CarregaPlano(varComboBox: TcxComboBox);
begin
	with dtModule.sisPlano do
   	begin
      	Active := False;
         Active := True;

         varComboBox.Properties.Items.Clear;

         First;

         while not Eof do
         	begin
					varComboBox.Properties.Items.Add(FieldByName('DESCRICAO').AsString);

               Next;
            end;

         varComboBox.ItemIndex := -1;
      end;
end;

procedure CarregaFilantropia(varComboBox: TcxComboBox);
begin
	with dtModule.sisFilantropia do
   	begin
      	Active := False;
         Active := True;

         varComboBox.Properties.Items.Clear;

         First;

         while not Eof do
         	begin
					varComboBox.Properties.Items.Add(FieldByName('DESCRICAO').AsString);

               Next;
            end;

         varComboBox.ItemIndex := -1;
      end;
end;

procedure CarregaUsuario( varComboBox : TcxComboBox );
begin
	with dtModule.cfgUsuario do
   	begin
      	Active := False;
         Active := True;

         Filtered := False;
         Filter   := 'ATIVO = 1';
			Filtered := True;

         IndexFieldNames := 'NOME';

         varComboBox.Properties.Items.Clear;

         First;

         while not Eof do
         	begin
					varComboBox.Properties.Items.Add(FieldByName('NOME').AsString);

               Next;
            end;

         Filtered := False;

         varComboBox.ItemIndex := -1;
      end;
end;

procedure CarregaClassificacao( varComboBox : TcxComboBox );
begin
	with dtModule.sisClassificacao do
   	begin
      	Active := False;
         Active := True;

         Filtered := False;
         Filter   := 'ATIVO = 1';
			Filtered := True;

         IndexFieldNames := 'DESCRICAO';

         varComboBox.Properties.Items.Clear;

         First;

         while not Eof do
         	begin
					varComboBox.Properties.Items.Add(FieldByName('DESCRICAO').AsString);

               Next;
            end;

         Filtered := False;

         varComboBox.ItemIndex := -1;
      end;
end;

procedure CarregaAtividade( varComboBox : TcxComboBox );
begin
	with dtModule.sisAtividade do
   	begin
      	Active := False;
         Active := True;

         Filtered := False;
         Filter   := 'ATIVO = 1';
			Filtered := True;

         IndexFieldNames := 'DESCRICAO';

         varComboBox.Properties.Items.Clear;

         First;

         while not Eof do
         	begin
					varComboBox.Properties.Items.Add(FieldByName('DESCRICAO').AsString);

               Next;
            end;

         Filtered := False;

         varComboBox.ItemIndex := -1;
      end;
end;

procedure CarregaEstadoCivil( varComboBox : TcxComboBox );
begin
	with dtModule.cfgEstadoCivil do
   	begin
      	Active := False;
         Active := True;

         Filtered := False;
         Filter   := 'ATIVO = 1';
			Filtered := True;

         IndexFieldNames := 'DESCRICAO';

         varComboBox.Properties.Items.Clear;

         First;

         while not Eof do
         	begin
					varComboBox.Properties.Items.Add(FieldByName('DESCRICAO').AsString);

               Next;
            end;

         Filtered := False;

         varComboBox.ItemIndex := -1;
      end;
end;

procedure CarregaTipoContato( varComboBox : TcxComboBox );
begin
	with dtModule.sisTipoContato do
   	begin
      	Active := False;
         Active := True;

         Filtered := False;
         Filter   := 'ATIVO = 1';
			Filtered := True;

         IndexFieldNames := 'DESCRICAO';

         varComboBox.Properties.Items.Clear;

         First;

         while not Eof do
         	begin
					varComboBox.Properties.Items.Add(FieldByName('DESCRICAO').AsString);

               Next;
            end;

         Filtered := False;

         varComboBox.ItemIndex := -1;
      end;
end;

procedure CarregaTipoDocumento( varComboBox : TcxComboBox );
begin
	with dtModule.sisTipoDocumento do
   	begin
      	Active := False;
         Active := True;

         Filtered := False;
         Filter   := 'ATIVO = 1';
			Filtered := True;

         IndexFieldNames := 'DESCRICAO';

         varComboBox.Properties.Items.Clear;

         First;

         while not Eof do
         	begin
					varComboBox.Properties.Items.Add(FieldByName('DESCRICAO').AsString);

               Next;
            end;

         Filtered := False;

         varComboBox.ItemIndex := -1;
      end;
end;

procedure CarregaTipoEndereco( varComboBox : TcxComboBox );
begin
	with dtModule.sisTipoEndereco do
   	begin
      	Active := False;
         Active := True;

         Filtered := False;
         Filter   := 'ATIVO = 1';
			Filtered := True;

         IndexFieldNames := 'DESCRICAO';

         varComboBox.Properties.Items.Clear;

         First;

         while not Eof do
         	begin
					varComboBox.Properties.Items.Add(FieldByName('DESCRICAO').AsString);

               Next;
            end;

         Filtered := False;

         varComboBox.ItemIndex := -1;
      end;
end;

procedure CarregaPessoa( varComboBox : TcxComboBox );
begin
		with dtModule.sisPessoa do
   	begin
      	Active := False;
         Active := True;

         Filtered := False;
         Filter   := 'ATIVO = 1';
			Filtered := True;

         IndexFieldNames := 'NOME';

         varComboBox.Properties.Items.Clear;

         First;

         while not Eof do
         	begin
					varComboBox.Properties.Items.Add(FieldByName('NOME').AsString);

               Next;
            end;

         Filtered := False;

         varComboBox.ItemIndex := -1;
      end;
end;

procedure CarregaModuloPai( varComboBox : TcxComboBox );
begin
	with dtModule.cfgVModulo do
   	begin
      	Active := False;
         Active := True;

         Filtered := False;
         Filter   := 'ID_MODULO_PAI = NULL AND COMPONENTE LIKE ' + QuotedStr('Mnu%');
			Filtered := True;

         IndexFieldNames := 'DESCRICAO';

         varComboBox.Properties.Items.Clear;

         First;

         while not Eof do
         	begin
					varComboBox.Properties.Items.Add(FieldByName('DESCRICAO').AsString);

               Next;
            end;

         Filter   := '';
         Filtered := False;

         varComboBox.ItemIndex := -1;
      end;
end;

procedure CarregaModulo( varComboBox : TcxComboBox );
begin
	with dtModule.cfgVModulo do
   	begin
      	Active := False;
         Active := True;

         Filtered := False;
         Filter   := 'ATIVO = 1';
			Filtered := True;

         IndexFieldNames := 'COMPONENTE';

         varComboBox.Properties.Items.Clear;

         First;

         while not Eof do
         	begin
					varComboBox.Properties.Items.Add(FieldByName('DESCRICAO').AsString);

               Next;
            end;

         Filtered := False;

         varComboBox.ItemIndex := -1;
      end;
end;

procedure CarregaFormaPagamento(varComboBox : TcxComboBox);
begin
	with dtModule.sisFormaPagamento do
   	begin
      	Active := False;
         Active := True;

         Filtered := False;
         Filter   := 'ATIVO = 1';
			Filtered := True;

         IndexFieldNames := 'DESCRICAO';

         varComboBox.Properties.Items.Clear;

         First;

         while not Eof do
         	begin
					varComboBox.Properties.Items.Add(FieldByName('DESCRICAO').AsString);

               Next;
            end;

         Filtered := False;

         varComboBox.ItemIndex := -1;
      end;
end;

procedure CarregaTipoPagamentoDiverso(varComboBox : TcxComboBox);
begin
	with dtModule.sisTipoPagamentoDiverso do
   	begin
      	Active := False;
         Active := True;

         Filtered := False;
         Filter   := 'ATIVO = 1';
			Filtered := True;

         IndexFieldNames := 'DESCRICAO';

         varComboBox.Properties.Items.Clear;

         First;

         while not Eof do
         	begin
					varComboBox.Properties.Items.Add(FieldByName('DESCRICAO').AsString);

               Next;
            end;

         Filtered := False;

         varComboBox.ItemIndex := -1;
      end;
end;

procedure CarregaUsuarioModulo( varUsuario : String; varTextEdit : TcxTextEdit; varLabel : TcxLabel; varGrid : TcxGrid );
var lclRetorno : Boolean;
begin
   with dtModule, ADOStoredProc do
   	begin
         {dtModule.cfgUsuarioModulo.Active := False;
         dtModule.cfgUsuarioModulo.Active := True;}

         dtModule.cfgUsuario.Active := False;
         dtModule.cfgUsuario.Active := True;

         dtModule.cfgVModulo.Active := False;
         dtModule.cfgVModulo.Active := True;

      	if cfgUsuario.Locate('NOME', varUsuario, [loPartialKey, loCaseInsensitive]) then
         	begin
               lclRetorno := True;

            	glbIdUsuario := cfgUsuario.FieldByName('ID_USUARIO').AsInteger;

               cfgVModulo.Filtered := False;
               cfgVModulo.Filter   := 'ATIVO = 1';
               cfgVModulo.Filtered := True;

               cfgVModulo.First;

               while not cfgVModulo.Eof do
               	begin
                  	glbIdModulo := cfgVModulo.FieldByName('ID_MODULO').AsInteger;

                     try
                        ProcedureName := '[cfg].[P_USUARIO_MODULO_INSERT]';
                        Parameters.Refresh;

                        Parameters.ParamByName('@ID_USUARIO').Value   	  := glbIdUsuario;
                        Parameters.ParamByName('@ID_MODULO').Value   	  := glbIdModulo;
                        Parameters.ParamByName('@PERMISSAO').Value   	  := 0;
                        Parameters.ParamByName('@BLOQUEADO').Value   	  := 0;
                        Parameters.ParamByName('@USUARIO_OPERACAO').Value := glbUsuario;

                        ExecProc;
                     except
                        on E : Exception do
                           Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
                     end;

                     cfgVModulo.Next;
                  end;

               cfgVModulo.Filtered := False;

               cfgVUsuarioModulo.Active := False;
               cfgVUsuarioModulo.Active := True;

               cfgVUsuarioModulo.Filtered := False;
               cfgVUsuarioModulo.Filter   := 'ID_USUARIO = ' + QuotedStr(IntToStr(glbIdUsuario));
               cfgVUsuarioModulo.Filtered := True;

               cfgVUsuarioModulo.First;

               varGrid.SetFocus;
            end
         else
            begin
               Notificacao('Usuário não encontrado.');
               cfgVUsuarioModulo.Active := False;
               varTextEdit.Clear;
               varLabel.Clear;
               varTextEdit.SetFocus;
            end;
      end;
end;

procedure CarregaPagamentoDiversos( varTable : TClientDataSet );
begin
   with dtModule.ADOQuery, SQL do
      begin
         Close;
         Clear;

         Add(' SELECT                             ');
         Add(' 	ID_PESSOA,                      ');
         Add(' 	MATRICULA,                      ');
         Add(' 	NOME,                           ');
         Add(' 	ID_PAGAMENTO_DIVERSO,           ');
         Add(' 	ID_FORMA_PAGAMENTO,             ');
         Add(' 	FORMA_PAGAMENTO,                ');
         Add(' 	DATA_PAGAMENTO,                 ');
         Add(' 	VALOR,                          ');
         Add(' 	DESCRICAO,                      ');
         Add(' 	USUARIO_OPERACAO,               ');
         Add(' 	DATA_OPERACAO                   ');
         Add(' FROM SIS.V_DADOS_PAGAMENTO_DIVERSO ');

         Open;

         if not IsEmpty then
            begin
               varTable.EmptyDataSet;

               First;

               while not Eof do
                  begin
                     try
                        varTable.Append;

                        varTable.FieldByName('ID_PESSOA').Value            := FieldByName('ID_PESSOA').Value;
                        varTable.FieldByName('MATRICULA').Value            := FieldByName('MATRICULA').Value;
                        varTable.FieldByName('NOME').Value                 := FieldByName('NOME').Value;
                        varTable.FieldByName('ID_PAGAMENTO_DIVERSO').Value := FieldByName('ID_PAGAMENTO_DIVERSO').Value;
                        varTable.FieldByName('ID_FORMA_PAGAMENTO').Value   := FieldByName('ID_FORMA_PAGAMENTO').Value;
                        varTable.FieldByName('FORMA_PAGAMENTO').Value      := FieldByName('FORMA_PAGAMENTO').Value;
                        varTable.FieldByName('DATA_PAGAMENTO').Value       := FieldByName('DATA_PAGAMENTO').Value;
                        varTable.FieldByName('VALOR').Value                := FieldByName('VALOR').Value;
                        varTable.FieldByName('DESCRICAO').Value            := FieldByName('DESCRICAO').Value;
                        varTable.FieldByName('USUARIO_OPERACAO').Value     := FieldByName('USUARIO_OPERACAO').Value;
                        varTable.FieldByName('DATA_OPERACAO').Value        := FieldByName('DATA_OPERACAO').Value;

                        varTable.Post;
                     except
                        on E : Exception do
                           Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
                     end;


                     Next;
                  end;
            end;

         Close;
      end;
end;

Procedure CloneProperties(SourceComp, DestComp: TObject);
var
  Propinfo: PPropInfo;
  Properties: PPropList;
  FCount: Integer;
  FSize: Integer;
  i: Integer;
  PropName: String;
  SourcePropObject: TObject;
  DestPropObject: TObject;
begin
   FCount := GetPropList(SourceComp.ClassInfo, tkAny, nil);
   FSize  := FCount * SizeOf(Pointer);

   GetMem(Properties, FSize);
   GetPropList(SourceComp.ClassInfo, tkAny, Properties);

   for i := 0 to FCount-1 do
      begin
         PropName := Properties^[i].Name;
         PropInfo := GetPropInfo(DestComp.ClassInfo, PropName);

         if (PropInfo = nil) or (UpperCase(PropName) = 'NAME') then
            Continue;

         case PropType(SourceComp, PropName) of
            tkInteger, tkWChar, tkSet, tkChar : SetOrdProp(DestComp,PropName,GetOrdProp(SourceComp,PropName));
            tkString, tkLString, tkWString    : SetStrProp(DestComp,PropName,GetStrProp(SourceComp,PropName));
            tkEnumeration                     : SetEnumProp(DestComp,PropName,GetEnumProp(SourceComp,PropName));
            tkFloat                           : SetFloatProp(DestComp,PropName,GetFloatProp(SourceComp,PropName));
            tkUString                         : SetStrProp(DestComp,PropName,GetStrProp(SourceComp,PropName)); //Se estiver usando Delphi < 2009, comente essa linha
            tkClass                           :
            begin
               SourcePropObject := GetObjectProp(SourceComp,PropName);
               DestPropObject   := GetObjectProp(DestComp,PropName);

               if (SourcePropObject<>nil) and (DestPropObject<>nil) and (SourcePropObject.ClassType.ClassParent.ClassName='TPersistent') then
                  CloneProperties(SourcePropObject,DestPropObject)
               else
                  SetObjectProp(DestComp,PropName,GetObjectProp(SourceComp,PropName));
               end;
            end;
      end;

   if Properties <> nil then
      FreeMem(Properties, FSize);
end;

procedure BtnCad( varTForm : TComponentClass; varForm : TForm; varComboBox : TcxComboBox; varMod, varTit : String );
begin
	glbOperacaoAux := glbOperacao;
   glbOperacao    := 'I';

   AberturaJanela(varTForm, varForm, varTit);

   AtualizaTabelas;

   if varMod = 'Classificação' then
      CarregaClassificacao(varComboBox)
   else if varMod = 'Atividade' then
      CarregaAtividade(varComboBox)
   else if varMod = 'Estado Civil' then
      CarregaEstadoCivil(varComboBox)
   else if varMod = 'Tipo de Contato' then
      CarregaTipoContato(varComboBox)
   else if varMod = 'Tipo de Documento' then
      CarregaTipoDocumento(varComboBox)
   else if varMod = 'Tipo de Endereço' then
      CarregaTipoEndereco(varComboBox)
   else if varMod = 'Plano' then
      CarregaPlano(varComboBox)
   else if varMod = 'Filantropia' then
      CarregaFilantropia(varComboBox)
   else if varMod = 'Usuario' then
      CarregaUsuario(varComboBox)
   else if varMod = 'Pessoa' then
      CarregaPessoa(varComboBox)
   else if varMod = 'ModuloPai' then
      CarregaModuloPai(varComboBox)
   else if varMod = 'Modulo' then
      CarregaModulo(varComboBox)
   else if varMod = 'Forma de Pagamento' then
      CarregaFormaPagamento(varComboBox)
   else if varMod = 'Tipo de Pagamentos Diversos' then
      CarregaTipoPagamentoDiverso(varComboBox);

   glbOperacao := glbOperacaoAux;

   varComboBox.SetFocus;
end;

procedure BtnCadCons( varTForm : TComponentClass; varForm : TForm; varTit : String );
begin
   glbOperacao := 'I';

   AberturaJanela(varTForm, varForm, varTit);

   AtualizaTabelas;
end;

procedure BtnAlt( varTForm : TComponentClass; varForm : TForm; varComboBox : TcxComboBox; varMod, varTit, varMsg : String );
begin
  if varComboBox.ItemIndex > -1 then
    begin
         glbOperacaoAux := glbOperacao;
         glbOperacao    := 'A';

         if varMod = 'Classificação' then
            glbIdClassificacao := RetornaIdClassificacao(varComboBox.Text)
         else if varMod = 'Atividade' then
            glbIdAtividade := RetornaIdAtividade(varComboBox.Text)
         else if varMod = 'Estado Civil' then
            glbIdEstadoCivil := RetornaIdEstadoCivil(varComboBox.Text)
         else if varMod = 'Tipo de Contato' then
            glbIdTipoContato := RetornaIdTipoContato(varComboBox.Text)
         else if varMod = 'Tipo de Documento' then
            glbIdTipoDocumento := RetornaIdTipoDocumento(varComboBox.Text)
         else if varMod = 'Tipo de Endereço' then
            glbIdTipoEndereco := RetornaIdTipoEndereco(varComboBox.Text)
         else if varMod = 'Plano' then
            glbIdPlano := RetornaIdPlano(varComboBox.Text)
         else if varMod = 'Filantropia' then
            glbIdFilantropia := RetornaIdFilantropia(varComboBox.Text)
         else if varMod = 'Usuario' then
            glbIdUsuario := RetornaIdUsuario(varComboBox.Text)
         else if varMod = 'Pessoa' then
            glbIdPessoa := RetornaIdPessoa(varComboBox.Text)
         else if varMod = 'ModuloPai' then
            glbIdModulo := RetornaIdModulo(varComboBox.Text)
         else if varMod = 'Modulo' then
            glbIdModulo := RetornaIdModulo(varComboBox.Text)
         else if varMod = 'Forma de Pagamento' then
            glbIdFormaPagamento := RetornaIdFormaPagamento(varComboBox.Text)
         else if varMod = 'Tipo de Pagamentos Diversos' then
            glbIdTipoPagamentoDiverso := RetornaIdTipoPagamentoDiverso(varComboBox.Text);

         AberturaJanela(varTForm, varForm, varTit);

         AtualizaTabelas;

         if varMod = 'Classificação' then
            CarregaClassificacao(varComboBox)
         else if varMod = 'Atividade' then
      		CarregaAtividade(varComboBox)
         else if varMod = 'Estado Civil' then
            CarregaEstadoCivil(varComboBox)
         else if varMod = 'Tipo de Contato' then
            CarregaTipoContato(varComboBox)
         else if varMod = 'Tipo de Documento' then
            CarregaTipoDocumento(varComboBox)
         else if varMod = 'Tipo de Endereço' then
            CarregaTipoEndereco(varComboBox)
         else if varMod = 'Plano' then
            CarregaPlano(varComboBox)
         else if varMod = 'Filantropia' then
            CarregaFilantropia(varComboBox)
         else if varMod = 'Usuario' then
            CarregaUsuario(varComboBox)
         else if varMod = 'Pessoa' then
            CarregaPessoa(varComboBox)
         else if varMod = 'ModuloPai' then
            CarregaModuloPai(varComboBox)
         else if varMod = 'Modulo' then
            CarregaModulo(varComboBox)
         else if varMod = 'Forma de Pagamento' then
            CarregaFormaPagamento(varComboBox)
         else if varMod = 'Tipo de Pagamentos Diversos' then
            CarregaTipoPagamentoDiverso(varComboBox);

         glbOperacao := glbOperacaoAux;
      end
   else
    Notificacao(Pchar(varMsg));
end;

procedure BtnAltCons( varTForm : TComponentClass; varForm : TForm; varTabela: TADOTable; varMod, varParamentro, varTit, varMsg : String );
begin
  if not varTabela.IsEmpty then
    begin
         glbOperacao := 'A';

         if varMod = 'Classificação' then
            glbIdClassificacao := RetornaIdClassificacao(varParamentro)
         else if varMod = 'Atividade' then
            glbIdAtividade := RetornaIdAtividade(varParamentro)
         else if varMod = 'Estado Civil' then
            glbIdEstadoCivil := RetornaIdEstadoCivil(varParamentro)
         else if varMod = 'Tipo de Contato' then
            glbIdTipoContato := RetornaIdTipoContato(varParamentro)
         else if varMod = 'Tipo de Documento' then
            glbIdTipoDocumento := RetornaIdTipoDocumento(varParamentro)
         else if varMod = 'Tipo de Endereço' then
            glbIdTipoEndereco := RetornaIdTipoEndereco(varParamentro)
         else if varMod = 'Plano' then
            glbIdPlano := RetornaIdPlano(varParamentro)
         else if varMod = 'Filantropia' then
            glbIdFilantropia := RetornaIdFilantropia(varParamentro)
         else if varMod = 'Usuario' then
            glbIdUsuario := RetornaIdUsuario(varParamentro)
         else if varMod = 'Pessoa' then
            glbIdPessoa := RetornaIdPessoa(varParamentro)
         else if varMod = 'ModuloPai' then
            glbIdModulo := RetornaIdModulo(varParamentro)
         else if varMod = 'Modulo' then
            glbIdModulo := RetornaIdModulo(varParamentro)
         else if varMod = 'Forma de Pagamento' then
            glbIdFormaPagamento := RetornaIdFormaPagamento(varParamentro);

         AberturaJanela(varTForm, varForm, varTit);

         AtualizaTabelas;
      end
   else
    Notificacao(Pchar(varMsg));
end;

procedure FiltroConsulta( varTabela: TADOTable; varComboBoxPesquisa: TcxComboBox; varCampoCodigo, varCampoDescricao, varTexto: String );
begin
   with varTabela do
      begin
         if not IsEmpty then
            begin
               if varComboBoxPesquisa.ItemIndex = 0 then
                  begin
                     if VerificaAphaNumerico( varTexto ) then
                        Locate(varCampoCodigo, varTexto, [loPartialKey, loCaseInsensitive]);
                  end
               else if varComboBoxPesquisa.ItemIndex = 1 then
                  begin
                     Filtered := False;
                     Filter   := varCampoDescricao + ' LIKE ' + QuotedStr('%' + LowerCase(varTexto) + '%');
                     Filtered := True;
                  end;
            end;
      end;
end;

procedure ImprimeCupomTesouraria(varMatricula, varNome, varRefer, varVencimento, varValor, VarPagamento, varFormaPagamento : String);
var iPrinter   : TPrinter;
    PrinterY   : Integer;
    TargetRect : TRect;
begin
   iPrinter:= TPrinter.Create;

   PrinterY :=  0;

   iPrinter.Title := PChar(Application.Title);

   While Printer.Printing Do
      Sleep(100);

   iPrinter.BeginDoc;

   iPrinter.Canvas.Font.Name := 'Courier';
   iPrinter.Canvas.Font.Style := [fsBold];
   iPrinter.Canvas.Font.Size  := 8;

   iPrinter.Canvas.TextOut(25, PrinterY, 'XANGÔ MENINO - INSTITUIÇÃO UMBANDISTA');
   Inc(PrinterY,30);
   iPrinter.Canvas.TextOut(200, PrinterY, 'FILANTROPICA');
   Inc(PrinterY,30);

   iPrinter.Canvas.TextOut(0,PrinterY,'------------------------------------------------------------------------------------');
   Inc(PrinterY,30);
   iPrinter.Canvas.TextOut(0,PrinterY,'Rua Xangô Menino, 96 - Miramar - Macaé, RJ, Brasil');
   Inc(PrinterY,30);
   iPrinter.Canvas.TextOut(250,PrinterY,'27.943-520');
   iPrinter.Canvas.TextOut(0,PrinterY,'------------------------------------------------------------------------------------');

   Inc(PrinterY,60);
   iPrinter.Canvas.TextOut(240,PrinterY,'RECIBO');
   Inc(PrinterY,60);

   iPrinter.Canvas.Font.Style := [];
   iPrinter.Canvas.Font.Size  := 7;

   if varMatricula <> '' then
      begin
         iPrinter.Canvas.TextOut(0,PrinterY,'MATRÍCULA: ' + varMatricula);
         Inc(PrinterY,30);
      end;

   iPrinter.Canvas.TextOut(0,PrinterY,'NOME: ' + varNome);
   Inc(PrinterY,30);

   iPrinter.Canvas.TextOut(0,PrinterY,'REFERÊNCIA: ' + varRefer);
   Inc(PrinterY,30);
   iPrinter.Canvas.TextOut(0,PrinterY,'VENCIMENTO: ' + varVencimento);
   Inc(PrinterY,30);
   iPrinter.Canvas.TextOut(0,PrinterY,'VALOR: ' + varValor);
   Inc(PrinterY,30);
   iPrinter.Canvas.TextOut(0,PrinterY,'DATA DO PAGAMENTO: ' + VarPagamento);
   Inc(PrinterY,30);
   iPrinter.Canvas.TextOut(0,PrinterY,'FORMA DE PAGAMENTO: ' + VarFormaPagamento);
   Inc(PrinterY,60);

   iPrinter.Canvas.TextOut(225,PrinterY,FormatDateTime('dd/mm/yyyy', Date()));

   iPrinter.EndDoc;

   iPrinter.Free;
end;

procedure ImprimeCupomPagamentoDiverso(varMatricula, varNome, varDescricao, varValor, VarPagamento, varFormaPagamento : String);
var iPrinter   : TPrinter;
    PrinterY   : Integer;
    TargetRect : TRect;
begin
   iPrinter:= TPrinter.Create;

   PrinterY :=  0;

   iPrinter.Title := PChar(Application.Title);

   While Printer.Printing Do
      Sleep(100);

   iPrinter.BeginDoc;

   iPrinter.Canvas.Font.Name := 'Courier';
   iPrinter.Canvas.Font.Style := [fsBold];
   iPrinter.Canvas.Font.Size  := 8;

   iPrinter.Canvas.TextOut(25, PrinterY, 'XANGÔ MENINO - INSTITUIÇÃO UMBANDISTA');
   Inc(PrinterY,30);
   iPrinter.Canvas.TextOut(200, PrinterY, 'FILANTROPICA');
   Inc(PrinterY,30);

   iPrinter.Canvas.TextOut(0,PrinterY,'------------------------------------------------------------------------------------');
   Inc(PrinterY,30);
   iPrinter.Canvas.TextOut(0,PrinterY,'Rua Xangô Menino, 96 - Miramar - Macaé, RJ, Brasil');
   Inc(PrinterY,30);
   iPrinter.Canvas.TextOut(250,PrinterY,'27.943-520');
   iPrinter.Canvas.TextOut(0,PrinterY,'------------------------------------------------------------------------------------');

   Inc(PrinterY,60);
   iPrinter.Canvas.TextOut(240,PrinterY,'RECIBO');
   Inc(PrinterY,60);

   iPrinter.Canvas.Font.Style := [];
   iPrinter.Canvas.Font.Size  := 7;

   if varMatricula <> '' then
      begin
         iPrinter.Canvas.TextOut(0,PrinterY,'MATRÍCULA: ' + varMatricula);
         Inc(PrinterY,30);
      end;

   if varNome <> '' then
      begin
         iPrinter.Canvas.TextOut(0,PrinterY,'NOME: ' + varNome);
         Inc(PrinterY,30);
      end;

   iPrinter.Canvas.TextOut(0,PrinterY,'DESCRIÇÃO: ' + varDescricao);
   Inc(PrinterY,30);
   iPrinter.Canvas.TextOut(0,PrinterY,'VALOR: ' + varValor);
   Inc(PrinterY,30);
   iPrinter.Canvas.TextOut(0,PrinterY,'DATA DO PAGAMENTO: ' + VarPagamento);
   Inc(PrinterY,30);
   iPrinter.Canvas.TextOut(0,PrinterY,'FORMA DE PAGAMENTO: ' + VarFormaPagamento);
   Inc(PrinterY,60);

   iPrinter.Canvas.TextOut(225,PrinterY,FormatDateTime('dd/mm/yyyy', Date()));

   iPrinter.EndDoc;

   iPrinter.Free;
end;

function DataDirectory: String;
begin
   Result := ExtractFilePath(Application.ExeName);
end;

function ValidaCPF( varCPF : String ) : Boolean;
var
   //dig10, dig11: String;
   dig10, dig11  : ShortString;
   s, i, r, peso : Integer;
begin
   //length - retorna o tamanho da string (CPF é um número formado por 11 dígitos)
   if ((varCPF = '00000000000') or (varCPF = '11111111111') or
       (varCPF = '22222222222') or (varCPF = '33333333333') or
       (varCPF = '44444444444') or (varCPF = '55555555555') or
       (varCPF = '66666666666') or (varCPF = '77777777777') or
       (varCPF = '88888888888') or (varCPF = '99999999999') or
       (length(varCPF) <> 11)) then
       begin
         ValidaCPF := False;

         exit;
       end;

   //try - protege o código para eventuais erros de conversão de tipo na função StrToInt
   try
      {Cálculo do 1o. Digito Verificador}
      s    := 0;
      peso := 10;

      for i := 1 to 9 do
         begin
            //StrToInt converte o i-ésimo caractere do CPF em um número
            s    := s + (StrToInt(varCPF[i]) * peso);
            peso := peso - 1;
         end;

      r := 11 - (s mod 11);

      if ((r = 10) or (r = 11)) then
         dig10 := '0'
      else
         str(r:1, dig10); //converte um número no respectivo caractere numérico

      {Cálculo do 2o. Digito Verificador}
      s := 0;
      peso := 11;

      for i := 1 to 10 do
         begin
            s := s + (StrToInt(varCPF[i]) * peso);
            peso := peso - 1;
         end;

      r := 11 - (s mod 11);

      if ((r = 10) or (r = 11)) then
         dig11 := '0'
      else
         str(r:1, dig11);

      {Verifica se os digitos calculados conferem com os digitos informados}
      if ((String(dig10) = varCPF[10]) and (String(dig11) = varCPF[11])) then
         ValidaCPF := true
      else
         ValidaCPF := false;
   except
      ValidaCPF := false
   end;
end;

function ValidaCNPJ( varCNPJ : String ) : Boolean;
var
   //dig13, dig14   : string;
   dig13, dig14   : ShortString;
   sm, i, r, peso : integer;
begin
   //length - retorna o tamanho da string do CNPJ (CNPJ é um número formado por 14 dígitos)
  if ((varCNPJ = '00000000000000') or (varCNPJ = '11111111111111') or
      (varCNPJ = '22222222222222') or (varCNPJ = '33333333333333') or
      (varCNPJ = '44444444444444') or (varCNPJ = '55555555555555') or
      (varCNPJ = '66666666666666') or (varCNPJ = '77777777777777') or
      (varCNPJ = '88888888888888') or (varCNPJ = '99999999999999') or
      (length(varCNPJ) <> 14)) then
      begin
         ValidaCNPJ := false;
         exit;
      end;

   //"try" - protege o código para eventuais erros de conversão de tipo através da função "StrToInt"
   try
      {Cálculo do 1o. Digito Verificador}
      sm := 0;
      peso := 2;

      for i := 12 downto 1 do
         begin
            //StrToInt converte o i-ésimo caractere do CNPJ em um número
            sm := sm + (StrToInt(varCNPJ[i]) * peso);
            peso := peso + 1;

            if (peso = 10) then
               peso := 2;
         end;

      r := sm mod 11;

      if ((r = 0) or (r = 1)) then
         dig13 := '0'
      else
         str((11-r):1, dig13); //converte um número no respectivo caractere numérico

      {Cálculo do 2o. Digito Verificador}
      sm := 0;
      peso := 2;

      for i := 13 downto 1 do
         begin
            sm := sm + (StrToInt(varCNPJ[i]) * peso);
            peso := peso + 1;

            if (peso = 10) then
               peso := 2;
         end;

      r := sm mod 11;

      if ((r = 0) or (r = 1)) then
         dig14 := '0'
      else
         str((11-r):1, dig14);

      { Verifica se os digitos calculados conferem com os digitos informados. }
      if ((String(dig13) = varCNPJ[13]) and (String(dig14) = varCNPJ[14])) then
         ValidaCNPJ := true
      else
         ValidaCNPJ := false;
   except
      ValidaCNPJ := false
   end;
end;

function ValidaEMail( varEmail : String): Boolean;
begin
   varEmail := Trim(UpperCase(varEmail));

   if Pos('@', varEmail) > 1 then
      begin
         Delete(varEmail, 1, pos('@', varEmail));

         Result := (Length(varEmail) > 0) and (Pos('.', varEmail) > 2);
      end
   else
      Result := False;
end;

function ValidaEmailCadastrado( varUsuario, varEmail : String): Boolean;
begin
   with dtModule.ADOQuery, SQL do
      begin
         Close;
         Clear;

         Add(' SELECT ID_USUARIO                            ');
         Add(' FROM [cfg].[USUARIO]                         ');
         Add(' WHERE LOGIN = ' + 	QuotedStr( varUsuario )  );
         Add(' AND EMAIL = ' + QuotedStr( varEmail )         );

         Open;

         if not IsEmpty then
            Result := True
         else
            Result := False;

         Close;
      end;
end;

function ValidaLoginCadastrado( varIdUsuario : Integer; varLogin : String ) : Boolean;
begin
   with dtModule.ADOQuery, SQL do
   	begin
         Close;
         Clear;

         Add(' SELECT ID_USUARIO FROM [cfg].[USUARIO] WHERE LOGIN = ' + QuotedStr( varLogin ) + ' AND ID_USUARIO <> ' + IntToStr(varIdUsuario));

         Open;

         if not IsEmpty then
         	Result := False
         else
         	Result := True;

         Close;
      end;
end;

function ValidaPlanoCadastrado( varIdPlano : Integer; varDescricao : String ) : Boolean;
begin
   with dtModule.ADOQuery, SQL do
   	begin
         Close;
         Clear;

         Add(' SELECT ID_PLANO FROM [sis].[PLANO] WHERE DESCRICAO = ' + QuotedStr( varDescricao ) + ' AND ID_PLANO <> ' + IntToStr(varIdPlano));

         Open;

         if not IsEmpty then
         	Result := False
         else
         	Result := True;

         Close;
      end;
end;

function ValidaTipoPagamentoDiversoCadastrado( varIdTipoPagamentoDiverso : Integer; varDescricao : String ) : Boolean;
begin
   with dtModule.ADOQuery, SQL do
   	begin
         Close;
         Clear;

         Add(' SELECT ID_TIPO_PAGAMENTO_DIVERSO FROM [sis].[TIPO_PAGAMENTO_DIVERSO] WHERE DESCRICAO = ' + QuotedStr( varDescricao ) + ' AND ID_TIPO_PAGAMENTO_DIVERSO <> ' + IntToStr(varIdTipoPagamentoDiverso));

         Open;

         if not IsEmpty then
         	Result := False
         else
         	Result := True;

         Close;
      end;
end;

function ValidaFilantropiaCadastrado( varIdFilantropia : Integer; varDescricao : String ) : Boolean;
begin
   with dtModule.ADOQuery, SQL do
   	begin
         Close;
         Clear;

         Add(' SELECT ID_FILANTROPIA FROM [sis].[FILANTROPIA] WHERE DESCRICAO = ' + QuotedStr( varDescricao ) + ' AND ID_FILANTROPIA <> ' + IntToStr(varIdFilantropia));

         Open;

         if not IsEmpty then
         	Result := False
         else
         	Result := True;

         Close;
      end;
end;

function ValidaComponenteCadastrado( varIdModulo : Integer; varComponente : String ) : Boolean;
begin
   with dtModule.ADOQuery, SQL do
   	begin
         Close;
         Clear;

         Add(' SELECT ID_MODULO FROM [cfg].[MODULO] WHERE COMPONENTE = ' + QuotedStr( varComponente ) + ' AND ID_MODULO <> ' + IntToStr(varIdModulo) );

         Open;

         if not IsEmpty then
         	Result := False
         else
         	Result := True;

         Close;
      end;
end;

function ValidaClassificacaoCadastrado( varIdClassificacao : Integer; varDescricao : String ) : Boolean;
begin
   with dtModule.ADOQuery, SQL do
   	begin
         Close;
         Clear;

         Add(' SELECT ID_CLASSIFICACAO FROM [sis].[CLASSIFICACAO] WHERE DESCRICAO = ' + QuotedStr( varDescricao ) + ' AND ID_CLASSIFICACAO <> ' + IntToStr(varIdClassificacao) );

         Open;

         if not IsEmpty then
         	Result := False
         else
         	Result := True;

         Close;
      end;
end;

function ValidaAtividadeCadastrado( varIdAtividade : Integer; varDescricao : String ) : Boolean;
begin
   with dtModule.ADOQuery, SQL do
   	begin
         Close;
         Clear;

         Add(' SELECT ID_ATIVIDADE FROM [sis].[ATIVIDADE] WHERE DESCRICAO = ' + QuotedStr( varDescricao ) + ' AND ID_ATIVIDADE <> ' + IntToStr(varIdAtividade) );

         Open;

         if not IsEmpty then
         	Result := False
         else
         	Result := True;

         Close;
      end;
end;

function ValidaTipoContatoCadastrado( varIdTipoContato : Integer; varDescricao : String ) : Boolean;
begin
   with dtModule.ADOQuery, SQL do
   	begin
         Close;
         Clear;

         Add(' SELECT ID_TIPO_CONTATO FROM [sis].[TIPO_CONTATO] WHERE DESCRICAO = ' + QuotedStr( varDescricao ) + ' AND ID_TIPO_CONTATO <> ' + IntToStr(varIdTipoContato) );

         Open;

         if not IsEmpty then
         	Result := False
         else
         	Result := True;

         Close;
      end;
end;

function ValidaTipoDocumentoCadastrado( varIdTipoDocumento : Integer; varDescricao : String ) : Boolean;
begin
   with dtModule.ADOQuery, SQL do
   	begin
         Close;
         Clear;

         Add(' SELECT ID_TIPO_DOCUMENTO FROM [sis].[TIPO_DOCUMENTO] WHERE DESCRICAO = ' + QuotedStr( varDescricao ) + ' AND ID_TIPO_DOCUMENTO <> ' + IntToStr(varIdTipoDocumento) );

         Open;

         if not IsEmpty then
         	Result := False
         else
         	Result := True;

         Close;
      end;
end;

function ValidaTipoEnderecoCadastrado( varIdTipoEndereco : Integer; varDescricao : String ) : Boolean;
begin
   with dtModule.ADOQuery, SQL do
   	begin
         Close;
         Clear;

         Add(' SELECT ID_TIPO_ENDERECO FROM [sis].[TIPO_ENDERECO] WHERE DESCRICAO = ' + QuotedStr( varDescricao ) + ' AND ID_TIPO_ENDERECO <> ' + IntToStr(varIdTipoEndereco) );

         Open;

         if not IsEmpty then
         	Result := False
         else
         	Result := True;

         Close;
      end;
end;

function ValidaEstadoCivilCadastrado( varIdEstadoCivil : Integer; varDescricao : String ) : Boolean;
begin
   with dtModule.ADOQuery, SQL do
   	begin
         Close;
         Clear;

         Add(' SELECT ID_ESTADO_CIVIL FROM [cfg].[ESTADO_CIVIL] WHERE DESCRICAO = ' + QuotedStr( varDescricao ) );

         Open;

         if not IsEmpty then
         	Result := False
         else
         	Result := True;

         Close;
      end;
end;

function ValidaFormaPagamentoCadastrado(varIdFormaPagamento : Integer; varDescricao : String) : Boolean;
begin
   with dtModule.ADOQuery, SQL do
   	begin
         Close;
         Clear;

         Add(' SELECT ID_FORMA_PAGAMENTO FROM [sis].[FORMA_PAGAMENTO] WHERE DESCRICAO = ' + QuotedStr( varDescricao ) );

         Open;

         if not IsEmpty then
         	Result := False
         else
         	Result := True;

         Close;
      end;
end;

function RetornaIdUsuario( varNome : String ) : Integer;
begin
   with dtModule.cfgUsuario do
      begin
         if not Active then
            Active := True;

      	Filtered := False;

         if not IsEmpty then
         	begin
               if Locate('NOME', Trim(varNome), [loPartialKey, loCaseInsensitive]) then
                  Result := FieldByName('ID_USUARIO').AsInteger;
            end;

         Filtered := True;
      end;
end;

function RetornaIdPessoa( varNome : String ) : Integer;
begin
   with dtModule.sisPessoa do
      begin
         if not Active then
            Active := True;

      	Filtered := False;

         if not IsEmpty then
         	begin
               if Locate('NOME', Trim(varNome), [loPartialKey, loCaseInsensitive]) then
                  Result := FieldByName('ID_PESSOA').AsInteger;
            end;

         Filtered := True;
      end;
end;

function RetornaIdPessoaMatricula( varMatricula : String ) : Integer;
begin
   with dtModule.sisPessoa do
      begin
         if not Active then
            Active := True;

      	Filtered := False;

         if not IsEmpty then
         	begin
               if Locate('MATRICULA', Trim(varMatricula), [loPartialKey, loCaseInsensitive]) then
                  Result := FieldByName('ID_PESSOA').AsInteger;
            end;

         Filtered := True;
      end;
end;

function RetornaNomePessoa( varIdPessoa : Integer ) : String;
begin
   with dtModule.sisPessoa do
      begin
         if not Active then
            Active := True;

      	Filtered := False;

         if not IsEmpty then
         	begin
               if Locate('ID_PESSOA', varIdPessoa, [loPartialKey, loCaseInsensitive]) then
                  Result := FieldByName('NOME').AsString;
            end;

         Filtered := True;
      end;
end;

function RetornaNomeUsuario( varIdUsuario : Integer ) : String;
begin
   with dtModule.cfgUsuario do
      begin
         if not Active then
            Active := True;

      	Filtered := False;

         if not IsEmpty then
         	begin
               if Locate('ID_USUARIO', varIdUsuario, [loPartialKey, loCaseInsensitive]) then
                  Result := FieldByName('NOME').AsString;
            end;

         Filtered := True;
      end;
end;

function RetornaUltimoIdPessoa : Integer;
begin
   with dtModule.ADOQuery, SQL do
   	begin
         Close;
         Clear;

         Add(' SELECT ( MAX(ID_PESSOA) + 1 ) AS ID FROM [sis].[PESSOA] ');

         Open;

         if not IsEmpty then
         	Result := FieldByName('ID').AsInteger;

         Close;
      end;
end;

function RetornaIdModulo( varDescricao : String ) : Integer;
begin
   with dtModule.cfgVModulo do
      begin
         if not Active then
            Active := True;

      	Filtered := False;

         if not IsEmpty then
         	begin
               if Locate('DESCRICAO', Trim(varDescricao), [loPartialKey, loCaseInsensitive]) then
                  Result := FieldByName('ID_MODULO').AsInteger;
            end;

         Filtered := True;
      end;
end;

function RetornaIdFormaPagamento( varDescricao : String ) : Integer;
begin
   with dtModule.sisFormaPagamento do
      begin
         if not Active then
            Active := True;

      	Filtered := False;

         if not IsEmpty then
         	begin
               if Locate('DESCRICAO', Trim(varDescricao), [loPartialKey, loCaseInsensitive]) then
                  Result := FieldByName('ID_FORMA_PAGAMENTO').AsInteger;
            end;

         Filtered := True;
      end;
end;

function RetornaIdTipoPagamentoDiverso( varDescricao : String ) : Integer;
begin
   with dtModule.sisTipoPagamentoDiverso do
      begin
         if not Active then
            Active := True;

      	Filtered := False;

         if not IsEmpty then
         	begin
               if Locate('DESCRICAO', Trim(varDescricao), [loPartialKey, loCaseInsensitive]) then
                  Result := FieldByName('ID_TIPO_PAGAMENTO_DIVERSO').AsInteger;
            end;

         Filtered := True;
      end;
end;

function RetornaIdCidade( varNome : String ) : Integer;
begin
   with dtModule.ADOQuery, SQL do
      begin
         Close;
         Clear;

         Add(' SELECT ID_CIDADE FROM [cfg].[CIDADE] WHERE NOME = ' + QuotedStr(Trim(varNome)));

         Open;

         if not IsEmpty then
            Result := FieldByName('ID_CIDADE').AsInteger;

         Close;
      end;
end;

function RetornaIdClassificacao( varDescricao : String ) : Integer;
begin
	with dtModule.sisClassificacao do
   	begin
         if not Active then
            Active := True;

         Filtered := False;

         if not IsEmpty then
         	begin
               if Locate('DESCRICAO', Trim(varDescricao), [loPartialKey, loCaseInsensitive]) then
						Result := FieldByName('ID_CLASSIFICACAO').AsInteger
            end;
      end;
end;

function RetornaIdAtividade( varDescricao : String ) : Integer;
begin
	with dtModule.sisAtividade do
   	begin
         if not Active then
            Active := True;

         Filtered := False;

         if not IsEmpty then
         	begin
               if Locate('DESCRICAO', Trim(varDescricao), [loPartialKey, loCaseInsensitive]) then
						Result := FieldByName('ID_ATIVIDADE').AsInteger
            end;
      end;
end;

function RetornaIdEstadoCivil( varDescricao : String ) : Integer;
begin
	with dtModule.cfgEstadoCivil do
   	begin
         if not Active then
            Active := True;

         Filtered := False;

         if not IsEmpty then
         	begin
               if Locate('DESCRICAO', Trim(varDescricao), [loPartialKey, loCaseInsensitive]) then
						Result := FieldByName('ID_ESTADO_CIVIL').AsInteger
            end;
      end;
end;

function RetornaIdTipoContato( varDescricao : String ) : Integer;
begin
	with dtModule.sisTipoContato do
   	begin
         if not Active then
            Active := True;

         Filtered := False;

         if not IsEmpty then
         	begin
               if Locate('DESCRICAO', Trim(varDescricao), [loPartialKey, loCaseInsensitive]) then
						Result := FieldByName('ID_TIPO_CONTATO').AsInteger
            end;
      end;
end;

function RetornaIdTipoDocumento( varDescricao : String ) : Integer;
begin
	with dtModule.sisTipoDocumento do
   	begin
         if not Active then
            Active := True;

         Filtered := False;

         if not IsEmpty then
         	begin
               if Locate('DESCRICAO', Trim(varDescricao), [loPartialKey, loCaseInsensitive]) then
						Result := FieldByName('ID_TIPO_DOCUMENTO').AsInteger
            end;
      end;
end;

function RetornaIdTipoEndereco( varDescricao : String ) : Integer;
begin
	with dtModule.sisTipoEndereco do
   	begin
         if not Active then
            Active := True;

         Filtered := False;

         if not IsEmpty then
         	begin
               if Locate('DESCRICAO', Trim(varDescricao), [loPartialKey, loCaseInsensitive]) then
						Result := FieldByName('ID_TIPO_ENDERECO').AsInteger
            end;
      end;
end;

function RetornaIdPlano( varDescricao : String ) : Integer;
begin
	with dtModule.sisPlano do
   	begin
         if not Active then
            Active := True;

         Filtered := False;

         if not IsEmpty then
         	begin
               if Locate('DESCRICAO', Trim(varDescricao), [loPartialKey, loCaseInsensitive]) then
						Result := FieldByName('ID_PLANO').AsInteger
            end;
      end;
end;

function RetornaValorPlano( varDescricao : String ) : Currency;
begin
	with dtModule.sisPlano do
   	begin
         if not Active then
            Active := True;

         Filtered := False;

         if not IsEmpty then
         	begin
               if Locate('DESCRICAO', Trim(varDescricao), [loPartialKey, loCaseInsensitive]) then
						Result := FieldByName('VALOR').AsCurrency;
            end;
      end;
end;

function RetornaValorPlanoMatricula( varNomePessoa : String ) : Currency;
begin
   with dtModule.ADOQuery, SQL do
      begin
         Close;
         Clear;

         Add(' SELECT MAX(VALOR) AS VALOR FROM [sis].[V_PESSOA_PLANO] WHERE ID_PESSOA = ' + IntToStr(RetornaIdPessoa(varNomePessoa)));

         Open;

         if not IsEmpty then
            Result := FieldByName('VALOR').AsCurrency
         else
            Result := 0;

         Close;
      end;
end;

function RetornaValorMensalidade( varNomePessoa : String ) : Currency;
begin
   with dtModule.ADOQuery, SQL do
      begin
         Close;
         Clear;

         Add(' SELECT                                                                                                                                                                                                                   ');
         Add(' 	COALESCE(                                                                                                                                                                                                             ');
         Add(' 				(SELECT VL_REFER FROM [sis].[FINANCEIRO] WHERE ANO = CAST((YEAR(GETDATE())-1) AS VARCHAR(4)) AND MES = ' + Char(39) + '12' + Char(39) + ' AND ID_PESSOA = ' + IntToStr(RetornaIdPessoa(varNomePessoa)) + '), ');
         Add(' 				(SELECT TOP 1 VALOR FROM [sis].[PESSOA_PLANO] A INNER JOIN [sis].[PLANO] B ON (A.ID_PLANO = B.ID_PLANO) WHERE ID_PESSOA = ' + IntToStr(RetornaIdPessoa(varNomePessoa)) + ' ORDER BY ID_PESSOA_PLANO DESC)    ');
         Add(' 			) AS VALOR                                                                                                                                                                                                      ');

         Open;

         if not IsEmpty then
            Result := FieldByName('VALOR').AsCurrency
         else
            Result := 0;

         Close;
      end;
end;

function RetornaIdFilantropia( varDescricao : String ) : Integer;
begin
	with dtModule.sisFilantropia do
   	begin
         if not Active then
            Active := True;

         Filtered := False;

         if not IsEmpty then
         	begin
               if Locate('DESCRICAO', Trim(varDescricao), [loPartialKey, loCaseInsensitive]) then
						Result := FieldByName('ID_FILANTROPIA').AsInteger
            end;
      end;
end;

function RetornaIdFinanceiro( varIdPessoa, varReferencia : String ) : Integer;
begin
   with dtModule.sisFinanceiro do
      begin
         if not Active then
            Active := True;

         Filtered := False;

         if not IsEmpty then
            begin
               if Locate('ID_PESSOA;REFER', VarArrayOf([varIdPessoa, varReferencia]), [loPartialKey, loCaseInsensitive]) then
                  Result := FieldByName('ID_FINANCEIRO').AsInteger;
            end;
      end;
end;

function RetornaValorFilantropia( varDescricao : String ) : Currency;
begin
	with dtModule.sisFilantropia do
   	begin
         if not Active then
            Active := True;

         Filtered := False;

         if not IsEmpty then
         	begin
               if Locate('DESCRICAO', Trim(varDescricao), [loPartialKey, loCaseInsensitive]) then
						Result := FieldByName('VALOR').AsInteger
            end;
      end;
end;

function RetornaPercentualFilantropia( varDescricao : String ) : Currency;
begin
	with dtModule.sisFilantropia do
   	begin
         if not Active then
            Active := True;

         Filtered := False;

         if not IsEmpty then
         	begin
               if Locate('DESCRICAO', Trim(varDescricao), [loPartialKey, loCaseInsensitive]) then
						Result := FieldByName('PERCENTUAL').AsInteger
            end;
      end;
end;

function RetornaCodigoMatricula : String;
begin
   with dtModule.ADOQuery, SQL do
   	begin
         Close;
         Clear;

         Add(' SELECT MATRICULA FROM [sis].[V_NOVA_MATRICULA] ');

         Open;

         if not IsEmpty then
         	Result := FieldByName('MATRICULA').AsString
         else
         	Result := '';

         Close;
      end;
end;

function RetornaMatricula( varNome : String ) : String;
begin
	with dtModule.sisPessoa do
   	begin
         if not Active then
            Active := True;

         Filtered := False;

         if not IsEmpty then
         	begin
               if Locate('NOME', Trim(varNome), [loPartialKey, loCaseInsensitive]) then
						Result := FieldByName('MATRICULA').AsString
            end;
      end;
end;

function CarregaPessoaUsuario( varNome : String ) : Boolean;
begin
	Result := False;

   with dtModule.sisPessoa do
   	begin
      	Filtered := False;

         if not IsEmpty then
         	begin
               if Locate('NOME', Trim(varNome), [loPartialKey, loCaseInsensitive]) then
               	begin
                     if FieldByName('DT_NASCIMENTO').AsString <> '' then
                     	begin
                        	if not dtModule.cfgUsuario.Locate('NOME;DT_NASCIMENTO', VarArrayOf([varNome, FieldByName('DT_NASCIMENTO').AsDateTime]), [loPartialKey, loCaseInsensitive]) then
                           	begin
	                           	glbDataNascimentoPessoa := FieldByName('DT_NASCIMENTO').AsString;
                                 Result := True;
                              end;
                        end
                     else
                     	glbDataNascimentoPessoa := '';
                  end;
            end;

         Filtered := True;
      end;
end;

function VerificaAcesso( varUsuario, varSenha : String ) : Boolean;
begin
   with dtModule.ADOQuery, SQL do
      begin
         Close;
         Clear;

         Add(' SELECT ID_USUARIO, NOME, V_SENHA FROM [cfg].[F_USUARIO_SENHA] (' + QuotedStr(varUsuario) + ', ' + QuotedStr(varSenha) + ') ');

         Open;

         if not IsEmpty then
            begin
            	if FieldByName('V_SENHA').AsString = 'TRUE' then
               	begin
                  	glbIdUsuario    := FieldByName('ID_USUARIO').AsInteger;
                     glbUsuario      := varUsuario;
                     glbNomeUsuario  := FieldByName('NOME').AsString;

                  	Result := True;
                  end
               else
               	Result := False;
            end
         else
            begin
               glbIdUsuario    := 0;
               glbUsuario      := '';
               glbNomeUsuario  := '';

               Result := False;
            end;

         Close;
      end;
end;

Function StrZeros(Texto: String; Qtde: Integer): String;
var i, Tam: integer;	Aux: String;
begin
   Aux := '';
   Tam := Length(Texto);

   for i := Tam to (Qtde - 1) do
      Aux := Aux + '0';

   StrZeros := Aux + Texto;
end;

function SubtracaoData(varDataMaior, varDataMenor : TDateTime) : Integer;
begin
   Result := DaysBetween(varDataMaior, varDataMenor);
end;

function VerificaAphaNumerico(varTexto: String): Boolean;
var i: Integer;
begin
   for i := 1 to Length(varTexto) do
      if (varTexto[i] in ['0' .. '9']) then
         Result := True
      else
         begin
            Result := False;
            Exit;
         end;
end;

function VerificaMatriculaAtiva(varMatricula : String) : Boolean;
begin
   with dtModule.ADOQuery, SQL do
      begin
         Close;
         Clear;

         Add(' SELECT CAST( ATIVO AS INTEGER ) AS ATIVO FROM SIS.PESSOA WHERE MATRICULA = ' + QuotedStr(varMatricula) );

         Open;

         if not IsEmpty then
            begin
               if FieldByName('ATIVO').AsInteger = 1 then
                  Result := True //ATIVO
               else
                  Result := False; //INATIVO
            end
         else
            Notificacao('Ocorreu um erro ao verificar o status da matrícula, por favor entre em contato com o administrador do sistema.');

         Close;
      end;
end;

end.
