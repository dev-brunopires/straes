unit uPagamentoDiverso;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroPadrao, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
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
  dxSkinXmas2008Blue, cxControls, dxSkinscxPCPainter, dxBarBuiltInMenu,
  cxClasses, cxLocalization, ACBrBase, ACBrEnterTab, cxPC, Vcl.StdCtrls,
  cxButtons, Vcl.ExtCtrls, cxContainer, cxEdit, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxCheckBox, cxTextEdit, cxCalendar,
  cxCurrencyEdit, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridCustomView, cxGrid, cxDropDownEdit, cxMaskEdit,
  cxLabel;

type
  TfrmPagamentoDiverso = class(TfrmCadastroPadrao)
    btnFechar: TcxButton;
    GroupBox2: TGroupBox;
    btnReceberPagamento: TcxButton;
    cxLabel6: TcxLabel;
    cmbTipoPagamento: TcxComboBox;
    pcTipoPagamento: TcxPageControl;
    tsMensalidade: TcxTabSheet;
    tsDiverso: TcxTabSheet;
    cxLabel3: TcxLabel;
    edtDivDataPagamento: TcxDateEdit;
    cxLabel2: TcxLabel;
    edtDivValor: TcxCurrencyEdit;
    cxLabel1: TcxLabel;
    cxLabel4: TcxLabel;
    cmbDivFormaPagamento: TcxComboBox;
    cxLabel5: TcxLabel;
    edtDivPessoaMatricula: TcxTextEdit;
    btnDivPesPessoa: TcxButton;
    btnDivConsPessoa: TcxButton;
    cxLabel7: TcxLabel;
    lblDivPessoaNome: TcxLabel;
    btnDivCadFormaPagamento: TcxButton;
    btnDivAltFormaPagamento: TcxButton;
    cxLabel8: TcxLabel;
    edtMenPessoaMatricula: TcxTextEdit;
    btnMenPesPessoa: TcxButton;
    btnMenConsPessoa: TcxButton;
    cxLabel9: TcxLabel;
    lblMenPessoaNome: TcxLabel;
    cxLabel10: TcxLabel;
    edtMenReferencia: TcxMaskEdit;
    edtMenValor: TcxCurrencyEdit;
    edtMenDataPagamento: TcxDateEdit;
    cxLabel11: TcxLabel;
    cxLabel12: TcxLabel;
    cmbMenFormaPagamento: TcxComboBox;
    btnMenCadFormaPagamento: TcxButton;
    btnMenAltFormaPagamento: TcxButton;
    edtMenDataVencimento: TcxDateEdit;
    btnMenReferencia: TcxButton;
    btnConsDebito: TcxButton;
    cxLabel13: TcxLabel;
    cxLabel14: TcxLabel;
    cmbDivDescricao: TcxComboBox;
    btnDivCadDescricao: TcxButton;
    btnDivAltDescricao: TcxButton;
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnReceberPagamentoClick(Sender: TObject);
    procedure btnDivCadFormaPagamentoClick(Sender: TObject);
    procedure btnDivAltFormaPagamentoClick(Sender: TObject);
    procedure cmbTipoPagamentoPropertiesChange(Sender: TObject);
    procedure edtDivPessoaMatriculaExit(Sender: TObject);
    procedure btnDivPesPessoaClick(Sender: TObject);
    procedure btnDivConsPessoaClick(Sender: TObject);
    procedure btnMenReferenciaClick(Sender: TObject);
    procedure edtMenPessoaMatriculaExit(Sender: TObject);
    procedure btnMenPesPessoaClick(Sender: TObject);
    procedure btnMenConsPessoaClick(Sender: TObject);
    procedure edtMenReferenciaExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnConsDebitoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnDivCadDescricaoClick(Sender: TObject);
    procedure btnDivAltDescricaoClick(Sender: TObject);
    procedure edtMenDataPagamentoExit(Sender: TObject);
    procedure edtDivDataPagamentoExit(Sender: TObject);
  private
    { Private declarations }
    procedure CarregaDados(varIdPessoa: Integer; varEdit : TcxTextEdit; varLabel : TcxLabel);
    procedure CarregaMensalidade(varMatricula, varReferencia : String);
    procedure LimpaCamposMensalidade;
    procedure LimpaCamposDiverso;

    function ValidaCamposMensalidade : Boolean;
    function ValidaCamposDiverso : Boolean;
  public
    { Public declarations }
  end;

var
  frmPagamentoDiverso: TfrmPagamentoDiverso;

implementation

{$R *.dfm}

uses uFuncao, uGlobal, uModule, uCadastroFormaPagamento, uCadastroPessoa, uConsPessoa,
  uConsultaDebito, uCadastroTipoPagamentoDiverso;

procedure TfrmPagamentoDiverso.btnCancelarClick(Sender: TObject);
begin
  inherited;

   cmbTipoPagamento.ItemIndex := 0;

   tsMensalidade.Enabled := True;
   tsDiverso.Enabled     := False;

   pcTipoPagamento.ActivePage := tsMensalidade;

   LimpaCamposMensalidade;
   LimpaCamposDiverso;

   edtMenPessoaMatricula.SetFocus;
end;

procedure TfrmPagamentoDiverso.btnConsDebitoClick(Sender: TObject);
begin
  inherited;

   if edtMenPessoaMatricula.Text <> '' then
      begin
         dtModule.sisVDadosPessoaFinanceiro.Active := False;
         dtModule.sisVDadosPessoaFinanceiro.Active := True;

         glbMatricula := edtMenPessoaMatricula.Text;
         glbNomePessoa := lblMenPessoaNome.Caption;

         AberturaJanela(TfrmConsultaDebito, frmConsultaDebito, 'Consulta de Débitos');
      end
   else
      begin
         Notificacao('Informe uma matrícula para consultar os débitos.');
         edtMenPessoaMatricula.SetFocus;
      end;
end;

procedure TfrmPagamentoDiverso.btnDivAltDescricaoClick(Sender: TObject);
begin
  inherited;

  	BtnAlt(TfrmCadastroTipoPagamentoDiverso, frmCadastroTipoPagamentoDiverso, cmbDivDescricao, 'Tipo de Pagamentos Diversos', 'Cadastro de Tipo de Pagamentos Diversos', 'Informe um tipo de pagamentos diversos para ser alterado.');
end;

procedure TfrmPagamentoDiverso.btnDivAltFormaPagamentoClick(Sender: TObject);
begin
  inherited;

  	BtnAlt(TfrmCadastroFormaPagamento, frmCadastroFormaPagamento, cmbDivFormaPagamento, 'Forma de Pagamento', 'Cadastro de Forma de Pagamento', 'Informe uma forma de pagamento para ser alterada.');
end;

procedure TfrmPagamentoDiverso.btnDivCadDescricaoClick(Sender: TObject);
begin
  inherited;

  	BtnCad(TfrmCadastroTipoPagamentoDiverso, frmCadastroTipoPagamentoDiverso, cmbDivDescricao, 'Tipo de Pagamentos Diversos', 'Cadastro de Tipo de Pagamentos Diversos');
end;

procedure TfrmPagamentoDiverso.btnDivCadFormaPagamentoClick(Sender: TObject);
begin
  inherited;

  	BtnCad(TfrmCadastroFormaPagamento, frmCadastroFormaPagamento, cmbDivFormaPagamento, 'Forma de Pagamento', 'Cadastro de Forma de Pagamento');
end;

procedure TfrmPagamentoDiverso.btnDivConsPessoaClick(Sender: TObject);
begin
  inherited;

   glbOperacao := '';

   AberturaJanela(TfrmConsPessoa, frmConsPessoa, 'Consulta de Pessoa');

   if glbConsMatricula <> '' then
      begin
         edtDivPessoaMatricula.Text := glbConsMatricula;
         btnDivPesPessoa.OnClick(Self);
      end;
end;

procedure TfrmPagamentoDiverso.btnDivPesPessoaClick(Sender: TObject);
begin
  inherited;

	if edtDivPessoaMatricula.Text <> '' then
   	CarregaDados(RetornaIdPessoaMatricula(Trim(edtDivPessoaMatricula.Text)), edtDivPessoaMatricula, lblDivPessoaNome)
   else
   	begin
   		Notificacao('Informe a matrícula da pessoa para realizar a pesquisa.');
      	edtDivPessoaMatricula.SetFocus;
      end;
end;

procedure TfrmPagamentoDiverso.btnReceberPagamentoClick(Sender: TObject);
var lclImprimeComprovante : Boolean;
begin
  inherited;

   if cmbTipoPagamento.ItemIndex = 0 then
      begin
         if ValidaCamposMensalidade then
            begin
               if (edtMenValor.Value > 0) or ((edtMenValor.Value = 0) and (Application.MessageBox('Atenção!'#13'Deseja realizar um pagamento com valor R$ 0.00?', PChar(Application.Title), MB_YESNO Or MB_ICONQUESTION ) = IDYES)) then
                  begin
                     if (Application.MessageBox('Atenção!'#13'Deseja imprimir o comprovante de pagamento?', PChar(Application.Title), MB_YESNO Or MB_ICONQUESTION ) = IDYES) then
                        lclImprimeComprovante := True
                     else
                        lclImprimeComprovante := False;

                     with dtModule, ADOStoredProc do
                        begin
                           try
                              ProcedureName := '[sis].[P_FINANCEIRO_BAIXA]';
                              Parameters.Refresh;

                              Parameters.ParamByName('@ID_FINANCEIRO').Value 	    := retornaIdFinanceiro(IntToStr(RetornaIdPessoaMatricula(Trim(edtMenPessoaMatricula.Text))), edtMenReferencia.Text);
                              Parameters.ParamByName('@ID_FORMA_PAGAMENTO').Value := RetornaIdFormaPagamento(cmbMenFormaPagamento.Text);
                              Parameters.ParamByName('@DT_PAGAMENTO').Value 	    := edtMenDataPagamento.Date;
                              Parameters.ParamByName('@VL_PAGO').Value 		       := edtMenValor.Value;
                              Parameters.ParamByName('@USUARIO_OPERACAO').Value   := glbUsuario;

                              ExecProc;
                           except
                              on E : Exception do
                                 Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
                           end;
                        end;

                     if lclImprimeComprovante then
                        ImprimeCupomTesouraria(Trim(edtMenPessoaMatricula.Text),
                                               UpperCase(lblMenPessoaNome.Caption),
                                               edtMenReferencia.Text,
                                               FormatDateTime('dd/MM/yyyy', edtMenDataVencimento.Date),
                                               formatfloat('R$ #,##0.00', edtMenValor.Value),
                                               FormatDateTime('dd/MM/yyyy  HH:mm', edtMenDataPagamento.Date),
                                               UpperCase(cmbMenFormaPagamento.Text));

                     Notificacao('Operação realizada com sucesso!');

                     AtualizaTabelas;

                     edtMenPessoaMatricula.Clear;
                     lblMenPessoaNome.Clear;
                     edtMenReferencia.Clear;
                     edtMenDataVencimento.Clear;
                     edtMenValor.Value              := 0;
                     edtMenDataPagamento.Date       := Date();
                     cmbMenFormaPagamento.ItemIndex := -1;

                     edtMenPessoaMatricula.SetFocus;
                  end;
            end;
      end
   else if cmbTipoPagamento.ItemIndex = 1 then
      begin
         if ValidaCamposDiverso then
            begin
               if (Application.MessageBox('Atenção!'#13'Deseja imprimir o comprovante de pagamento?', PChar(Application.Title), MB_YESNO Or MB_ICONQUESTION ) = IDYES) then
                  lclImprimeComprovante := True
               else
                  lclImprimeComprovante := False;

               with dtModule, ADOStoredProc do
                  begin
                     try
                        ProcedureName := '[sis].[P_PAGAMENTO_DIVERSO_INSERT]';
                        Parameters.Refresh;

                        if edtDivPessoaMatricula.Text <> '' then
                           Parameters.ParamByName('@ID_PESSOA').Value := RetornaIdPessoa(lblDivPessoaNome.Caption)
                        else
                           Parameters.ParamByName('@ID_PESSOA').Value := Null;

                        Parameters.ParamByName('@ID_FORMA_PAGAMENTO').Value        := RetornaIdFormaPagamento(cmbDivFormaPagamento.Text);
                        Parameters.ParamByName('@DATA_PAGAMENTO').Value            := edtDivDataPagamento.Date;
                        Parameters.ParamByName('@VALOR').Value   	                 := edtDivValor.Value;
                        Parameters.ParamByName('@ID_TIPO_PAGAMENTO_DIVERSO').Value := RetornaIdTipoPagamentoDiverso(cmbDivDescricao.Text);
                        Parameters.ParamByName('@USUARIO_OPERACAO').Value          := glbUsuario;

                        ExecProc;
                     except
                        on E : Exception do
                           Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
                     end;
                  end;

               if lclImprimeComprovante then
                  ImprimeCupomPagamentoDiverso(UpperCase(lblDivPessoaNome.Caption),
                                               UpperCase(cmbDivDescricao.Text),
                                               formatfloat('R$ #,##0.00', edtDivValor.Value),
                                               FormatDateTime('dd/MM/yyyy  HH:mm', edtDivDataPagamento.Date),
                                               UpperCase(cmbDivFormaPagamento.Text));

               Notificacao('Operação realizada com sucesso!');

               AtualizaTabelas;

               edtDivDataPagamento.Date       := Date();
               edtDivValor.Value              := 0;
               cmbDivDescricao.ItemIndex      := -1;
               cmbDivFormaPagamento.ItemIndex := -1;
               edtDivPessoaMatricula.Clear;
               lblDivPessoaNome.Clear;

               edtDivDataPagamento.SetFocus;
            end;
      end;
end;

procedure TfrmPagamentoDiverso.CarregaDados(varIdPessoa: Integer; varEdit : TcxTextEdit; varLabel : TcxLabel);
begin
	with dtModule.sisPessoa do
   	begin
         Filtered := False;
         Filter   := 'ID_PESSOA = ' + IntToStr(varIdPessoa);
         Filtered := True;

         if not IsEmpty then
         	begin
               varEdit.Text     := RetornaMatricula(FieldByName('NOME').AsString);
               varLabel.Caption := FieldByName('NOME').AsString;
            end
         else
            begin
            	Notificacao('Nenhuma pessoa encontrada com os dados informados.');
               varEdit.SelectAll;
               varEdit.SetFocus;
            end;

         Filtered := False;
      end;
end;

procedure TfrmPagamentoDiverso.CarregaMensalidade(varMatricula,
  varReferencia: String);
begin
   with dtModule.sisVDadosPessoaFinanceiro do
      begin
         Filtered := False;
         Filter   := 'MATRICULA = ' + QuotedStr(varMatricula) + ' AND REFER = ' + QuotedStr(varReferencia);
         Filtered := True;

         if not IsEmpty then
            begin
               if FieldByName('DT_PAGAMENTO').IsNull then
                  begin
                     edtMenDataVencimento.Date := FieldByName('DT_VENCIMENTO').AsDateTime;
                     edtMenValor.Value         := FieldByName('VL_REFER').AsCurrency;
                  end
               else
                  begin
                     Notificacao('A mensalidade informada já foi recebida.');

                     edtMenDataVencimento.Clear;
                     edtMenValor.Value := 0;

                     edtMenReferencia.SetFocus;
                  end;
            end
         else
            begin
               Notificacao('Nenhum débito encontrado para os dados informados.');

               edtMenDataVencimento.Clear;
               edtMenValor.Value := 0;

               edtMenReferencia.SelectAll;
               edtMenReferencia.SetFocus;
            end;

         Filtered := False;
      end;
end;

procedure TfrmPagamentoDiverso.cmbTipoPagamentoPropertiesChange(
  Sender: TObject);
begin
  inherited;

   if cmbTipoPagamento.ItemIndex = 0 then
      begin
         tsMensalidade.Enabled := True;
         tsDiverso.Enabled     := False;

         pcTipoPagamento.ActivePage := tsMensalidade;

         LimpaCamposMensalidade;
         LimpaCamposDiverso;

         edtMenPessoaMatricula.SetFocus;
      end
   else if cmbTipoPagamento.ItemIndex = 1 then
      begin
         tsMensalidade.Enabled := False;
         tsDiverso.Enabled     := True;

         pcTipoPagamento.ActivePage := tsDiverso;

         LimpaCamposMensalidade;
         LimpaCamposDiverso;

         edtDivDataPagamento.SetFocus;
      end;
end;

procedure TfrmPagamentoDiverso.btnMenReferenciaClick(Sender: TObject);
begin
  inherited;

   if edtMenReferencia.Text <> '' then
      CarregaMensalidade(Trim(edtMenPessoaMatricula.Text), Trim(edtMenReferencia.Text));
end;

procedure TfrmPagamentoDiverso.btnFecharClick(Sender: TObject);
begin
  inherited;

   Close;
end;

procedure TfrmPagamentoDiverso.btnMenConsPessoaClick(Sender: TObject);
begin
  inherited;

   glbOperacao := '';

   AberturaJanela(TfrmConsPessoa, frmConsPessoa, 'Consulta de Pessoa');

   if glbConsMatricula <> '' then
      begin
         edtMenPessoaMatricula.Text := glbConsMatricula;
         btnMenPesPessoa.OnClick(Self);
      end;
end;

procedure TfrmPagamentoDiverso.btnMenPesPessoaClick(Sender: TObject);
begin
  inherited;

	if edtMenPessoaMatricula.Text <> '' then
   	CarregaDados(RetornaIdPessoaMatricula(Trim(edtMenPessoaMatricula.Text)), edtMenPessoaMatricula, lblMenPessoaNome)
   else
   	begin
   		Notificacao('Informe a matrícula da pessoa para realizar a pesquisa.');
      	edtMenPessoaMatricula.SetFocus;
      end;
end;

procedure TfrmPagamentoDiverso.edtDivDataPagamentoExit(Sender: TObject);
begin
  inherited;

   if edtDivDataPagamento.Text <> '' then
      begin
         if edtDivDataPagamento.Date > Now() then
            begin
               Notificacao('Não é permitido inserir uma data de pagamento maior que a data atual.');
               edtDivDataPagamento.SetFocus;
            end;
      end;
end;

procedure TfrmPagamentoDiverso.edtDivPessoaMatriculaExit(Sender: TObject);
var lclValor : Integer;
begin
  inherited;

   if (Trim(edtDivPessoaMatricula.Text) <> '') then
      begin
         lclValor := StrToInt(Trim(edtDivPessoaMatricula.Text));
         edtDivPessoaMatricula.Text := Format('%6.6d', [lclValor]);

         btnDivPesPessoa.OnClick(Self);
      end;
end;

procedure TfrmPagamentoDiverso.edtMenDataPagamentoExit(Sender: TObject);
begin
  inherited;

   if edtMenDataPagamento.Text <> '' then
      begin
         if edtMenDataPagamento.Date > Now() then
            begin
               Notificacao('Não é permitido inserir uma data de pagamento maior que a data atual.');
               edtMenDataPagamento.SetFocus;
            end;
      end;
end;

procedure TfrmPagamentoDiverso.edtMenPessoaMatriculaExit(Sender: TObject);
var lclValor : Integer;
begin
  inherited;

   if (Trim(edtMenPessoaMatricula.Text) <> '') then
      begin
         lclValor := StrToInt(Trim(edtMenPessoaMatricula.Text));
         edtMenPessoaMatricula.Text := Format('%6.6d', [lclValor]);

         btnMenPesPessoa.OnClick(Self);
      end;
end;

procedure TfrmPagamentoDiverso.edtMenReferenciaExit(Sender: TObject);
begin
  inherited;

   if (Trim(edtMenReferencia.Text) <> '') then
      btnMenReferencia.OnClick(Self);
end;

procedure TfrmPagamentoDiverso.FormCreate(Sender: TObject);
begin
  inherited;

	Brush.Style := bsClear;

   TraducaoFormulario('TraduçãoDev.ini', locCargo);
end;

procedure TfrmPagamentoDiverso.FormShow(Sender: TObject);
begin
  inherited;
   dtModule.sisVDadosPessoaFinanceiro.Active := False;
   dtModule.sisVDadosPessoaFinanceiro.Active := True;

   tsMensalidade.Visible := True;
   tsDiverso.Visible     := False;

   pcTipoPagamento.ActivePage := tsMensalidade;
   edtMenPessoaMatricula.SetFocus;

   edtMenDataPagamento.Date := Date();
   edtDivDataPagamento.Date := Date();

   CarregaTipoPagamentoDiverso(cmbDivDescricao);

   CarregaFormaPagamento(cmbMenFormaPagamento);
   CarregaFormaPagamento(cmbDivFormaPagamento);
end;

procedure TfrmPagamentoDiverso.LimpaCamposDiverso;
begin
   edtDivDataPagamento.Date       := Date();
   edtDivValor.Value              := 0;
   cmbDivDescricao.ItemIndex      := -1;
   cmbDivFormaPagamento.ItemIndex := -1;
   edtDivPessoaMatricula.Clear;
   lblDivPessoaNome.Clear;
end;

procedure TfrmPagamentoDiverso.LimpaCamposMensalidade;
begin
   edtMenPessoaMatricula.Clear;
   lblMenPessoaNome.Clear;
   edtMenReferencia.Clear;
   edtMenDataVencimento.Clear;
   edtMenValor.Value := 0;
   edtMenDataPagamento.Date := Date();
   cmbMenFormaPagamento.ItemIndex := -1;
end;

function TfrmPagamentoDiverso.ValidaCamposMensalidade: Boolean;
begin
   Result := False;

   if edtMenPessoaMatricula.Text = '' then
      begin
         Notificacao('Informe a matrícula da pessoa.');
         edtMenPessoaMatricula.SetFocus;
      end
   else if edtMenReferencia.Text = '' then
      begin
         Notificacao('Informe a referência para pagamento.');
         edtMenReferencia.SetFocus;
      end
   else if edtMenDataPagamento.Text = '' then
      begin
         Notificacao('Informe a data de pagamento.');
         edtMenDataPagamento.SetFocus;
      end
   else if cmbMenFormaPagamento.ItemIndex = -1 then
      begin
         Notificacao('Informe a forma de pagamento.');
         cmbMenFormaPagamento.SetFocus;
      end
   else
      Result := True;
end;

function TfrmPagamentoDiverso.ValidaCamposDiverso: Boolean;
begin
   Result := False;

   if edtDivDataPagamento.Text = '' then
      begin
         Notificacao('Informe a data de pagamento.');
         edtDivDataPagamento.SetFocus;
      end
   else if (edtDivValor.Text = '') or (edtDivValor.Value = 0) then
      begin
         Notificacao('Informe o valor de pagamento.');
         edtDivValor.SetFocus;
      end
   else if cmbDivDescricao.ItemIndex = -1 then
      begin
         Notificacao('Informe a descrição do pagamento.');
         cmbDivDescricao.SetFocus;
      end
   else if cmbDivFormaPagamento.ItemIndex = -1 then
      begin
         Notificacao('Informe a forma de pagamento.');
         cmbDivFormaPagamento.SetFocus;
      end
   else
      Result := True;
end;

end.
