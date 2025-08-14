unit uGeraDebitoAnual;

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
  cxButtons, Vcl.ExtCtrls, cxContainer, cxEdit, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, cxGridLevel,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxMaskEdit, cxDropDownEdit, cxTextEdit, cxLabel, cxCalendar,
  cxCurrencyEdit, Vcl.Samples.Gauges, Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids,
  cxDBLabel, Vcl.DBCtrls, cxGroupBox;

type
  TfrmGeraDebitoAnual = class(TfrmCadastroPadrao)
    GroupBox1: TGroupBox;
    cxLabel2: TcxLabel;
    edtMatricula: TcxTextEdit;
    cxLabel1: TcxLabel;
    btnPesPessoa: TcxButton;
    btnConsPessoa: TcxButton;
    lblPessoaNome: TcxLabel;
    cxLabel3: TcxLabel;
    cmbGerarPor: TcxComboBox;
    GroupBox2: TGroupBox;
    GroupBox5: TGroupBox;
    btnGerarDebito: TcxButton;
    GroupBox3: TGroupBox;
    lblAnoContabil: TcxLabel;
    cxLabel5: TcxLabel;
    lblDiaVencimento: TcxLabel;
    cxLabel7: TcxLabel;
    btnConfiguracao: TcxButton;
    btnLimpar: TcxButton;
    cxLabel6: TcxLabel;
    cxLabel8: TcxLabel;
    btnCarregaMensalidade: TcxButton;
    cxGroupBox1: TcxGroupBox;
    cxLabel11: TcxLabel;
    DBText3: TDBText;
    cxLabel12: TcxLabel;
    DBText4: TDBText;
    cxLabel13: TcxLabel;
    DBText5: TDBText;
    Gauge1: TGauge;
    DBGrid2: TDBGrid;
    DBGrid1: TDBGrid;
    dsPessoa: TDataSource;
    dsFinanceiro: TDataSource;
    cdsPessoa: TClientDataSet;
    cdsPessoaID_PESSOA: TIntegerField;
    cdsPessoaMATRICULA: TStringField;
    cdsPessoaNOME: TStringField;
    cdsPessoaPLANO_DESCRICAO: TStringField;
    cdsPessoaPLANO_VALOR: TCurrencyField;
    cdsPessoaSTATUS_PLANO: TStringField;
    cdsFinanceiro: TClientDataSet;
    cdsFinanceiroID_PESSOA: TIntegerField;
    cdsFinanceiroID_FINANCEIRO: TIntegerField;
    cdsFinanceiroANO: TStringField;
    cdsFinanceiroMES: TStringField;
    cdsFinanceiroREFER: TStringField;
    cdsFinanceiroVL_REFER: TCurrencyField;
    cdsFinanceiroDT_VENCIMENTO: TDateField;
    btnReiniciar: TcxButton;
    procedure cmbClassificacaoPropertiesChange(Sender: TObject);
    procedure edtMatriculaExit(Sender: TObject);
    procedure btnPesPessoaClick(Sender: TObject);
    procedure btnConsPessoaClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnConfiguracaoClick(Sender: TObject);
    procedure btnGerarDebitoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnCarregaMensalidadeClick(Sender: TObject);
    procedure btnReiniciarClick(Sender: TObject);
  private
    { Private declarations }
    procedure CarregaMensalidades( varAno : String );
    procedure CarregaMensalidadePessoa( varAno, varMatricula : String );
  public
    { Public declarations }
  end;

var
  frmGeraDebitoAnual: TfrmGeraDebitoAnual;

implementation

{$R *.dfm}

uses uModule, uGlobal, uFuncao, uConsPessoa, uConfiguracao;

procedure TfrmGeraDebitoAnual.btnCancelarClick(Sender: TObject);
begin
  inherited;

   Close;
end;

procedure TfrmGeraDebitoAnual.btnCarregaMensalidadeClick(Sender: TObject);
var lblMensagem, lblMatriculaAnterior : String;
begin
  inherited;

   if cmbGerarPor.ItemIndex = 0 then
      begin
         lblMensagem := 'Atenção!'#13'Deseja verificar os débitos do ano de ' + IntToStr(StrToInt(glbAnoContabil) - 1) + ' para geração do ano de ' + glbAnoContabil + '?';

         if ( Application.MessageBox(PChar(lblMensagem), PChar(Application.Title), MB_YESNO Or MB_ICONQUESTION ) = IDYES ) then
            begin
               CarregaMensalidades(IntToStr(StrToInt(glbAnoContabil) - 1));

               if (not cdsPessoa.IsEmpty) and (not cdsFinanceiro.IsEmpty) then
                  begin
                     btnCarregaMensalidade.Enabled := False;
                     btnGerarDebito.Enabled        := true;
                     btnReiniciar.Enabled          := True;
                  end
               else
                  begin
                     btnCarregaMensalidade.Enabled := True;
                     btnGerarDebito.Enabled        := False;
                     btnReiniciar.Enabled          := False;
                  end;
            end
         else
            Notificacao('Nenhum registro de pessoa foi selecionado.');
      end
   else if cmbGerarPor.ItemIndex = 1 then
      begin
         CarregaMensalidadePessoa(IntToStr(StrToInt(glbAnoContabil) - 1), Trim(edtMatricula.Text));

         if (not cdsPessoa.IsEmpty) and (not cdsFinanceiro.IsEmpty) then
            begin
               btnCarregaMensalidade.Enabled := False;
               btnGerarDebito.Enabled        := true;
               btnReiniciar.Enabled          := True;
            end
         else
            begin
               btnCarregaMensalidade.Enabled := True;
               btnGerarDebito.Enabled        := False;
               btnReiniciar.Enabled          := False;
            end;
      end
end;

procedure TfrmGeraDebitoAnual.btnConfiguracaoClick(Sender: TObject);
begin
  inherited;

	glbOperacao := '';

   if edtMatricula.Text <> '' then
      edtMatricula.Clear;

	AberturaJanela(TfrmConfiguracao, frmConfiguracao, 'Configuração');

   btnLimpar.OnClick(Self);
end;

procedure TfrmGeraDebitoAnual.btnConsPessoaClick(Sender: TObject);
begin
  inherited;

   glbOperacao := '';

   AberturaJanela(TfrmConsPessoa, frmConsPessoa, 'Consulta de Pessoa');

   if glbConsMatricula <> '' then
      begin
         edtMatricula.Text := glbConsMatricula;
         btnPesPessoa.OnClick(Self);
      end;
end;

procedure TfrmGeraDebitoAnual.btnGerarDebitoClick(Sender: TObject);
var i : Integer;
    lclMes : String;
begin
  inherited;

   if (not cdsPessoa.IsEmpty) and (not cdsFinanceiro.IsEmpty) then
      begin
         cdsPessoa.First;

         Gauge1.MinValue := 0;
         Gauge1.MaxValue := cdsPessoa.RecordCount;
         Gauge1.Progress := 0;

         while not cdsPessoa.Eof do
            begin
               cdsFinanceiro.Last;

               for i := 1 to 12 do
                  begin
                     lclMes := StrZeros( IntToStr(i), 2 );

                     with dtModule do
                        begin
                           try
                              ADOStoredProc.ProcedureName := '[sis].[P_FINANCEIRO_INSERT_VERIFICADO]';
                              ADOStoredProc.Parameters.Refresh;

                              ADOStoredProc.Parameters.ParamByName('@ID_PESSOA').Value        := cdsPessoa.FieldByName('ID_PESSOA').AsInteger;
                              ADOStoredProc.Parameters.ParamByName('@REFER').Value            := lclMes + glbAnoContabil;
                              ADOStoredProc.Parameters.ParamByName('@DT_VENCIMENTO').Value    := glbAnoContabil + '-' + lclMes + '-' + glbDiaVencimento;
                              ADOStoredProc.Parameters.ParamByName('@VL_REFER').Value         := cdsFinanceiro.FieldByName('VL_REFER').AsInteger;
                              ADOStoredProc.Parameters.ParamByName('@VL_DESCONTO').Value      := 0;
                              ADOStoredProc.Parameters.ParamByName('@DT_PAGAMENTO').Value     := Null;
                              ADOStoredProc.Parameters.ParamByName('@VL_PAGO').Value          := Null;
                              ADOStoredProc.Parameters.ParamByName('@USUARIO_OPERACAO').Value := glbUsuario;

                              ADOStoredProc.ExecProc;
                           except
                              on E : Exception do
                                 Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
                           end;
                        end;
                  end;

               Gauge1.Progress := Gauge1.Progress + 1;

               cdsPessoa.Next;
            end;

         Gauge1.Progress := 0;

         Notificacao('Operação realizada com sucesso!');

         btnReiniciar.OnClick(Self);
         btnLimpar.OnClick(Self);
      end;
end;

procedure TfrmGeraDebitoAnual.btnLimparClick(Sender: TObject);
begin
  inherited;

   cmbGerarPor.ItemIndex := 0;

   edtMatricula.Clear;
   lblPessoaNome.Clear;

   edtMatricula.Enabled  := False;
   btnPesPessoa.Enabled  := False;
   btnConsPessoa.Enabled := False;

   cdsPessoa.EmptyDataSet;

   lblAnoContabil.Caption   := glbAnoContabil;
   lblDiaVencimento.Caption := glbDiaVencimento;

   glbValor := 0;

   cmbGerarPor.SetFocus;
end;

procedure TfrmGeraDebitoAnual.btnPesPessoaClick(Sender: TObject);
begin
  inherited;

	if edtMatricula.Text <> '' then
      begin
         //Verifica se a matricula está ativa
         if VerificaMatriculaAtiva(Trim(edtMatricula.Text)) then
            begin
               lblPessoaNome.Caption := RetornaNomePessoa(RetornaIdPessoaMatricula(edtMatricula.Text));
            end
         else
            begin
               Notificacao('Matrícula inativa.');
               edtMatricula.Clear;
               edtMatricula.SetFocus;
            end;
      end
   else
   	begin
   		Notificacao('Informe a matrícula da pessoa para realizar a pesquisa.');
      	edtMatricula.SetFocus;
      end;
end;

procedure TfrmGeraDebitoAnual.btnReiniciarClick(Sender: TObject);
begin
  inherited;

   cdsPessoa.EmptyDataSet;
   cdsFinanceiro.EmptyDataSet;

   btnCarregaMensalidade.Enabled := True;
   btnGerarDebito.Enabled        := False;
   btnReiniciar.Enabled          := False;
end;

procedure TfrmGeraDebitoAnual.cmbClassificacaoPropertiesChange(Sender: TObject);
begin
  inherited;

   edtMatricula.Enabled  := cmbGerarPor.ItemIndex = 1;
   btnPesPessoa.Enabled  := cmbGerarPor.ItemIndex = 1;
   btnConsPessoa.Enabled := cmbGerarPor.ItemIndex = 1;

   edtMatricula.Clear;
   lblPessoaNome.Clear;

   cdsPessoa.EmptyDataSet;

   if cmbGerarPor.ItemIndex = 1 then
      edtMatricula.SetFocus;
end;

procedure TfrmGeraDebitoAnual.edtMatriculaExit(Sender: TObject);
var lclValor : Integer;
begin
  inherited;

   if (Trim(edtMatricula.Text) <> '') then
      begin
         lclValor := StrToInt(Trim(edtMatricula.Text));
         edtMatricula.Text := Format('%6.6d', [lclValor]);

         btnPesPessoa.OnClick(Self);
      end;
end;

procedure TfrmGeraDebitoAnual.FormShow(Sender: TObject);
begin
  inherited;

   cmbGerarPor.ItemIndex := 0;

   edtMatricula.Enabled  := False;
   btnPesPessoa.Enabled  := False;
   btnConsPessoa.Enabled := False;

   edtMatricula.Clear;
   lblPessoaNome.Clear;

   cdsPessoa.EmptyDataSet;
   cdsFinanceiro.EmptyDataSet;

   btnCarregaMensalidade.Enabled := True;
   btnGerarDebito.Enabled        := False;
   btnReiniciar.Enabled          := False;

   lblAnoContabil.Caption   := glbAnoContabil;
   lblDiaVencimento.Caption := glbDiaVencimento;

   cmbGerarPor.SetFocus;
end;

procedure TfrmGeraDebitoAnual.CarregaMensalidades(varAno: String);
var lblMensagem, lblMatriculaAnterior : String;
begin
   cdsPessoa.EmptyDataSet;
   cdsFinanceiro.EmptyDataSet;

   with dtModule.ADOQuery, SQL do
      begin
         Close;
         Clear;

         Add(' SELECT DISTINCT                                                                                  ');
         Add(' 	B.ID_PESSOA,                                                                                  ');
         Add(' 	A.ID_FINANCEIRO,                                                                              ');
         Add(' 	B.MATRICULA,                                                                                  ');
         Add(' 	B.NOME,                                                                                       ');
         Add(' 	C.DESCRICAO AS PLANO_DESCRICAO,                                                               ');
         Add(' 	C.VALOR AS PLANO_VALOR,                                                                       ');
         Add(' 	A.ANO,                                                                                        ');
         Add(' 	A.MES,                                                                                        ');
         Add(' 	A.REFER,                                                                                      ');
         Add(' 	A.VL_REFER,                                                                                   ');
         Add(' 	A.DT_VENCIMENTO,                                                                              ');
         Add(' 	CASE                                                                                          ');
         Add(' 		WHEN C.VALOR = A.VL_REFER THEN ' + Char(39) + 'PLANO IGUAL MENSALIDADE' + Char(39) + '     ');
         Add(' 		WHEN C.VALOR > A.VL_REFER THEN ' + Char(39) + 'PLANO MAIOR QUE MENSALIDADE' + Char(39) + ' ');
         Add(' 		WHEN C.VALOR < A.VL_REFER THEN ' + Char(39) + 'PLANO MENOR QUE MENSALIDADE' + Char(39) + ' ');
         Add(' 	END AS STATUS_PLANO                                                                           ');
         Add(' FROM SIS.V_DADOS_FINANCEIRO A                                                                    ');
         Add(' INNER JOIN SIS.V_DADOS_PESSOA B                                                                  ');
         Add(' 	ON ( A.ID_PESSOA = B.ID_PESSOA )                                                              ');
         Add(' 	AND ( B.ATIVO = 1 )                                                                           ');
         Add(' LEFT JOIN SIS.V_PESSOA_PLANO C                                                                   ');
         Add(' 	ON ( B.ID_PESSOA = C.ID_PESSOA )                                                              ');
         Add(' WHERE A.ANO = ' + QuotedStr(varAno) + '                                                          ');
         Add(' ORDER BY B.MATRICULA, A.ANO, A.MES                                                               ');

         Open;

         if not IsEmpty then
            begin
               Gauge1.MinValue := 0;
               Gauge1.MaxValue := RecordCount;
               Gauge1.Progress := 0;

               cdsPessoa.DisableControls;
               cdsFinanceiro.DisableControls;

               lblMatriculaAnterior := '';

               First;

               while not Eof do
                  begin
                     if lblMatriculaAnterior <> FieldByName('MATRICULA').AsString then
                        begin
                           try
                              cdsPessoa.Append;

                              cdsPessoa.FieldByName('ID_PESSOA').Value       := FieldByName('ID_PESSOA').Value;
                              cdsPessoa.FieldByName('MATRICULA').Value       := FieldByName('MATRICULA').Value;
                              cdsPessoa.FieldByName('NOME').Value            := UpperCase(FieldByName('NOME').AsString);
                              cdsPessoa.FieldByName('PLANO_DESCRICAO').Value := FieldByName('PLANO_DESCRICAO').Value;
                              cdsPessoa.FieldByName('PLANO_VALOR').Value     := FieldByName('PLANO_VALOR').Value;
                              cdsPessoa.FieldByName('STATUS_PLANO').Value    := FieldByName('STATUS_PLANO').Value;

                              cdsPessoa.Post;
                           except
                              on E : Exception do
                                 Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
                           end;
                        end;

                     try
                        cdsFinanceiro.Append;

                        cdsFinanceiro.FieldByName('ID_PESSOA').Value       := FieldByName('ID_PESSOA').Value;
                        cdsFinanceiro.FieldByName('ID_FINANCEIRO').Value   := FieldByName('ID_FINANCEIRO').Value;
                        cdsFinanceiro.FieldByName('ANO').Value             := FieldByName('ANO').Value;
                        cdsFinanceiro.FieldByName('MES').Value             := FieldByName('MES').Value;
                        cdsFinanceiro.FieldByName('REFER').Value           := FieldByName('REFER').Value;
                        cdsFinanceiro.FieldByName('VL_REFER').Value        := FieldByName('VL_REFER').Value;
                        cdsFinanceiro.FieldByName('DT_VENCIMENTO').Value   := FieldByName('DT_VENCIMENTO').Value;

                        cdsFinanceiro.Post;
                     except
                        on E : Exception do
                           Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
                     end;

                     Gauge1.Progress := Gauge1.Progress + 1;

                     lblMatriculaAnterior := FieldByName('MATRICULA').AsString;

                     Next;
                  end;

               if not cdsPessoa.IsEmpty then
                  begin
                     cdsPessoa.First;
                     DBGrid2.SetFocus;
                  end;
            end;

         cdsPessoa.EnableControls;
         cdsFinanceiro.EnableControls;

         Gauge1.Progress := 0;

         Close;
      end;
end;

procedure TfrmGeraDebitoAnual.CarregaMensalidadePessoa( varAno, varMatricula : String );
var lblMensagem, lblMatriculaAnterior : String;
begin
   cdsPessoa.EmptyDataSet;
   cdsFinanceiro.EmptyDataSet;

   with dtModule.ADOQuery, SQL do
      begin
         Close;
         Clear;

         Add(' SELECT DISTINCT                                                                                  ');
         Add(' 	B.ID_PESSOA,                                                                                  ');
         Add(' 	A.ID_FINANCEIRO,                                                                              ');
         Add(' 	B.MATRICULA,                                                                                  ');
         Add(' 	B.NOME,                                                                                       ');
         Add(' 	C.DESCRICAO AS PLANO_DESCRICAO,                                                               ');
         Add(' 	C.VALOR AS PLANO_VALOR,                                                                       ');
         Add(' 	A.ANO,                                                                                        ');
         Add(' 	A.MES,                                                                                        ');
         Add(' 	A.REFER,                                                                                      ');
         Add(' 	A.VL_REFER,                                                                                   ');
         Add(' 	A.DT_VENCIMENTO,                                                                              ');
         Add(' 	CASE                                                                                          ');
         Add(' 		WHEN C.VALOR = A.VL_REFER THEN ' + Char(39) + 'PLANO IGUAL MENSALIDADE' + Char(39) + '     ');
         Add(' 		WHEN C.VALOR > A.VL_REFER THEN ' + Char(39) + 'PLANO MAIOR QUE MENSALIDADE' + Char(39) + ' ');
         Add(' 		WHEN C.VALOR < A.VL_REFER THEN ' + Char(39) + 'PLANO MENOR QUE MENSALIDADE' + Char(39) + ' ');
         Add(' 	END AS STATUS_PLANO                                                                           ');
         Add(' FROM SIS.V_DADOS_FINANCEIRO A                                                                    ');
         Add(' INNER JOIN SIS.V_DADOS_PESSOA B                                                                  ');
         Add(' 	ON ( A.ID_PESSOA = B.ID_PESSOA )                                                              ');
         Add(' 	AND ( B.ATIVO = 1 )                                                                           ');
         Add(' LEFT JOIN SIS.V_PESSOA_PLANO C                                                                   ');
         Add(' 	ON ( B.ID_PESSOA = C.ID_PESSOA )                                                              ');
         Add(' WHERE A.ANO = ' + QuotedStr(varAno) + '                                                          ');
         Add(' AND B.MATRICULA = ' + QuotedStr(varMatricula) + '                                                ');
         Add(' ORDER BY B.MATRICULA, A.ANO, A.MES                                                               ');

         Open;

         if not IsEmpty then
            begin
               Gauge1.MinValue := 0;
               Gauge1.MaxValue := RecordCount;
               Gauge1.Progress := 0;

               cdsPessoa.DisableControls;
               cdsFinanceiro.DisableControls;

               lblMatriculaAnterior := '';

               First;

               while not Eof do
                  begin
                     if lblMatriculaAnterior <> FieldByName('MATRICULA').AsString then
                        begin
                           try
                              cdsPessoa.Append;

                              cdsPessoa.FieldByName('ID_PESSOA').Value       := FieldByName('ID_PESSOA').Value;
                              cdsPessoa.FieldByName('MATRICULA').Value       := FieldByName('MATRICULA').Value;
                              cdsPessoa.FieldByName('NOME').Value            := UpperCase(FieldByName('NOME').AsString);
                              cdsPessoa.FieldByName('PLANO_DESCRICAO').Value := FieldByName('PLANO_DESCRICAO').Value;
                              cdsPessoa.FieldByName('PLANO_VALOR').Value     := FieldByName('PLANO_VALOR').Value;
                              cdsPessoa.FieldByName('STATUS_PLANO').Value    := FieldByName('STATUS_PLANO').Value;

                              cdsPessoa.Post;
                           except
                              on E : Exception do
                                 Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
                           end;
                        end;

                     try
                        cdsFinanceiro.Append;

                        cdsFinanceiro.FieldByName('ID_PESSOA').Value       := FieldByName('ID_PESSOA').Value;
                        cdsFinanceiro.FieldByName('ID_FINANCEIRO').Value   := FieldByName('ID_FINANCEIRO').Value;
                        cdsFinanceiro.FieldByName('ANO').Value             := FieldByName('ANO').Value;
                        cdsFinanceiro.FieldByName('MES').Value             := FieldByName('MES').Value;
                        cdsFinanceiro.FieldByName('REFER').Value           := FieldByName('REFER').Value;
                        cdsFinanceiro.FieldByName('VL_REFER').Value        := FieldByName('VL_REFER').Value;
                        cdsFinanceiro.FieldByName('DT_VENCIMENTO').Value   := FieldByName('DT_VENCIMENTO').Value;

                        cdsFinanceiro.Post;
                     except
                        on E : Exception do
                           Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
                     end;

                     Gauge1.Progress := Gauge1.Progress + 1;

                     lblMatriculaAnterior := FieldByName('MATRICULA').AsString;

                     Next;
                  end;

               if not cdsPessoa.IsEmpty then
                  begin
                     cdsPessoa.First;
                     DBGrid2.SetFocus;
                  end;
            end;

         cdsPessoa.EnableControls;
         cdsFinanceiro.EnableControls;

         Gauge1.Progress := 0;

         Close;
      end;
end;

end.
