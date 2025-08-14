unit uImportaDados;

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
  cxButtons, Vcl.ExtCtrls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLabel, Data.DB, Vcl.Samples.Gauges, Vcl.Grids, Vcl.DBGrids,
  Datasnap.DBClient, cxProgressBar;

type
  TfrmImportaDados = class(TfrmCadastroPadrao)
    GroupBox3: TGroupBox;
    cxLabel1: TcxLabel;
    cmbAno: TcxComboBox;
    cxLabel2: TcxLabel;
    cmbSituacao: TcxComboBox;
    GroupBox4: TGroupBox;
    DBGrid1: TDBGrid;
    GroupBox5: TGroupBox;
    DBGrid2: TDBGrid;
    dsPessoa: TDataSource;
    dsMensalidade: TDataSource;
    GroupBox6: TGroupBox;
    cxLabel5: TcxLabel;
    lblAnoContabil: TcxLabel;
    btnConfiguracao: TcxButton;
    GroupBox1: TGroupBox;
    btnCarregar: TcxButton;
    btnLimpar: TcxButton;
    Gauge: TGauge;
    cxLabel6: TcxLabel;
    lblDiaVencimento: TcxLabel;
    cmbFormaPagamento: TcxComboBox;
    cxLabel8: TcxLabel;
    cdsPessoa: TClientDataSet;
    cdsPessoaMATRICULA: TStringField;
    cdsPessoaNOME: TStringField;
    cdsPessoaDT_NASCIMENTO: TDateTimeField;
    cdsPessoaCELULAR: TStringField;
    cdsPessoaSITUACAO: TStringField;
    cdsMensalidade: TClientDataSet;
    cdsMensalidadeMATRICULA: TStringField;
    cdsMensalidadeFORMAPAGAMENTO: TStringField;
    cdsMensalidadeORIGEMPAGAMENTO: TStringField;
    cdsMensalidadeMES: TStringField;
    cdsMensalidadeANO: TStringField;
    cdsMensalidadeREFER: TStringField;
    cdsMensalidadeDT_VENCIMENTO: TDateTimeField;
    cdsMensalidadeVL_REFER: TCurrencyField;
    cdsMensalidadeVL_DESCONTO: TCurrencyField;
    cdsMensalidadeDT_PAGAMENTO: TDateTimeField;
    cdsMensalidadeVL_PAGO: TCurrencyField;
    cdsMensalidadeUSUARIO: TStringField;
    GroupBox2: TGroupBox;
    btnImportar: TcxButton;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCarregarClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnImportarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnConfiguracaoClick(Sender: TObject);
  private
    { Private declarations }
    procedure CarregaAno(varComboBox : TcxComboBox);
    procedure CarregaSituacao(varComboBox : TcxComboBox);
    procedure CarregaOrigemPagamento(varComboBox : TcxComboBox);
    procedure CarregaFormaPagamento(varComboBox : TcxComboBox);
    procedure CarregaMensalidade(varMatricula : String);
  public
    { Public declarations }
  end;

var
  frmImportaDados: TfrmImportaDados;

implementation

{$R *.dfm}

uses uModule, uGlobal, uFuncao, uCadastroPlano, uConsultaDadosAntigos, uConfiguracao;

procedure TfrmImportaDados.btnCancelarClick(Sender: TObject);
begin
  inherited;

   Close;
end;

procedure TfrmImportaDados.CarregaAno(varComboBox: TcxComboBox);
begin
   with dtModule.ADOQuery, SQL do
      begin
         Close;
         Clear;
         Add(' SELECT DISTINCT MENSALIDADE_ANO FROM [old].[V_DADOS_ANTIGO_COMPLETO] WHERE MENSALIDADE_ANO IS NOT NULL ORDER BY MENSALIDADE_ANO ');
         Open;

         if not IsEmpty then
            begin
               varComboBox.Clear;

               First;

               varComboBox.Properties.Items.Add('TODOS OS ANOS');

               while not Eof do
                  begin
                     varComboBox.Properties.Items.Add(FieldByName('MENSALIDADE_ANO').AsString);

                     Next;
                  end;
            end;

         varComboBox.ItemIndex := 0;

         Close;
      end;
end;

procedure TfrmImportaDados.CarregaSituacao(varComboBox: TcxComboBox);
begin
   with dtModule.ADOQuery, SQL do
      begin
         Close;
         Clear;
         Add(' SELECT DISTINCT CONTATO_SITUACAO FROM [old].[V_DADOS_ANTIGO_COMPLETO] WHERE CONTATO_SITUACAO IS NOT NULL ORDER BY CONTATO_SITUACAO ');
         Open;

         if not IsEmpty then
            begin
               varComboBox.Clear;

               First;

               varComboBox.Properties.Items.Add('TODAS AS SITUAÇÕES');

               while not Eof do
                  begin
                     varComboBox.Properties.Items.Add(FieldByName('CONTATO_SITUACAO').AsString);

                     Next;
                  end;
            end;

         varComboBox.ItemIndex := 0;

         Close;
      end;
end;

procedure TfrmImportaDados.CarregaOrigemPagamento(varComboBox : TcxComboBox);
begin
   with dtModule.ADOQuery, SQL do
      begin
         Close;
         Clear;
         Add(' SELECT DISTINCT ORIGEM_ORIGEMPAGAMENTO FROM [old].[V_DADOS_ANTIGO_COMPLETO] WHERE ORIGEM_ORIGEMPAGAMENTO IS NOT NULL ORDER BY ORIGEM_ORIGEMPAGAMENTO ');
         Open;

         if not IsEmpty then
            begin
               varComboBox.Clear;

               First;

               varComboBox.Properties.Items.Add('TODAS AS ORIGENS');

               while not Eof do
                  begin
                     varComboBox.Properties.Items.Add(FieldByName('ORIGEM_ORIGEMPAGAMENTO').AsString);

                     Next;
                  end;
            end;

         varComboBox.ItemIndex := 0;

         Close;
      end;
end;

procedure TfrmImportaDados.CarregaFormaPagamento(varComboBox : TcxComboBox);
begin
   with dtModule.ADOQuery, SQL do
      begin
         Close;
         Clear;
         Add(' SELECT DISTINCT PGTO_FORMAPAGAMENTO FROM [old].[V_DADOS_ANTIGO_COMPLETO] WHERE PGTO_FORMAPAGAMENTO IS NOT NULL ORDER BY PGTO_FORMAPAGAMENTO ');
         Open;

         if not IsEmpty then
            begin
               varComboBox.Clear;

               First;

               varComboBox.Properties.Items.Add('TODAS AS FORMAS DE PAGAMENTO');

               while not Eof do
                  begin
                     varComboBox.Properties.Items.Add(FieldByName('PGTO_FORMAPAGAMENTO').AsString);

                     Next;
                  end;
            end;

         varComboBox.ItemIndex := 0;

         Close;
      end;
end;

procedure TfrmImportaDados.btnCarregarClick(Sender: TObject);
begin
  inherited;

   if cmbAno.ItemIndex = -1 then
      begin
         Notificacao('Informe o ano.');
         cmbAno.SetFocus;
      end
   else if cmbSituacao.ItemIndex = -1 then
      begin
         Notificacao('Informe a situação.');
         cmbSituacao.SetFocus;
      end
   else if cmbFormaPagamento.ItemIndex = -1 then
      begin
         Notificacao('Informe a forma de pagamento.');
         cmbFormaPagamento.SetFocus;
      end
   else
      begin
         btnCarregar.Enabled := False;
         btnImportar.Enabled := True;

         cmbAno.Enabled             := False;
         cmbSituacao.Enabled        := False;
         cmbFormaPagamento.Enabled  := False;

         dtModule.ADOQuery.DisableControls;
         cdsPessoa.DisableControls;
         cdsMensalidade.DisableControls;

         dtModule.ADOQuery.Close;
         dtModule.ADOQuery.SQL.Clear;

         dtModule.ADOQuery.SQL.Add(' SELECT DISTINCT                                           ');
         dtModule.ADOQuery.SQL.Add(' 	CONTATO_MATRICULA,                                      ');
         dtModule.ADOQuery.SQL.Add(' 	CONTATO_NOMECOMPLETO,                                   ');
         dtModule.ADOQuery.SQL.Add(' 	CONTATO_DT_NASCIMENTO,                                  ');
         dtModule.ADOQuery.SQL.Add(' 	CONTATO_SITUACAO                                        ');
         dtModule.ADOQuery.SQL.Add(' FROM [old].[V_DADOS_ANTIGO_COMPLETO]                      ');
         dtModule.ADOQuery.SQL.Add(' WHERE CONTATO_NOMECOMPLETO IS NOT NULL                    ');
         dtModule.ADOQuery.SQL.Add(' AND ORIGEM_ORIGEMPAGAMENTO = ' + QuotedStr('MENSALIDADE')  );

         if (cmbAno.ItemIndex > 0) then
            dtModule.ADOQuery.SQL.Add(' AND MENSALIDADE_ANO = ' + QuotedStr(cmbAno.Text));

         if (cmbSituacao.ItemIndex > 0) then
            dtModule.ADOQuery.SQL.Add(' AND CONTATO_SITUACAO = ' + QuotedStr(cmbSituacao.Text));

         if (cmbFormaPagamento.ItemIndex > 0) then
            dtModule.ADOQuery.SQL.Add(' AND PGTO_FORMAPAGAMENTO = ' + QuotedStr(cmbFormaPagamento.Text));

         dtModule.ADOQuery.SQL.Add(' ORDER BY CONTATO_MATRICULA ');

         dtModule.ADOQuery.Open;

         if not dtModule.ADOQuery.IsEmpty then
            begin
               cdsPessoa.EmptyDataSet;

               Gauge.MinValue := 0;
               Gauge.MaxValue := dtModule.ADOQuery.RecordCount;
               Gauge.Progress := 1;

               dtModule.ADOQuery.First;

               while not dtModule.ADOQuery.Eof do
                  begin
                     try
                        cdsPessoa.Append;

                        cdsPessoa.FieldByName('MATRICULA').Value     := dtModule.ADOQuery.FieldByName('CONTATO_MATRICULA').Value;
                        cdsPessoa.FieldByName('NOME').Value          := dtModule.ADOQuery.FieldByName('CONTATO_NOMECOMPLETO').Value;
                        cdsPessoa.FieldByName('DT_NASCIMENTO').Value := dtModule.ADOQuery.FieldByName('CONTATO_DT_NASCIMENTO').Value;
                        cdsPessoa.FieldByName('CELULAR').Value       := Null;
                        cdsPessoa.FieldByName('SITUACAO').Value      := dtModule.ADOQuery.FieldByName('CONTATO_SITUACAO').Value;

                        cdsPessoa.Post;
                     except
                        on E : Exception do
                           Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
                     end;

                     CarregaMensalidade(dtModule.ADOQuery.FieldByName('CONTATO_MATRICULA').AsString);

                     Gauge.Progress := Gauge.Progress + 1;

                     dtModule.ADOQuery.Next;
                  end;

               Gauge.Progress := 0;

               cdsPessoa.First;
            end;

         cdsMensalidade.EnableControls;
         cdsPessoa.EnableControls;
         dtModule.ADOQuery.EnableControls;

         dtModule.ADOQuery.Close;

         if ( not cdsPessoa.IsEmpty ) and ( not cdsMensalidade.IsEmpty ) then
            begin
               DBGrid1.Enabled := True;
               DBGrid2.Enabled := True;

               DBGrid1.SetFocus;
            end
         else
            btnLimpar.OnClick(Self);
      end;
end;

procedure TfrmImportaDados.btnConfiguracaoClick(Sender: TObject);
begin
  inherited;

	glbOperacao := '';
	AberturaJanela(TfrmConfiguracao, frmConfiguracao, 'Configuração');

   lblAnoContabil.Caption   := glbAnoContabil;
   lblDiaVencimento.Caption := glbDiaVencimento;
end;

procedure TfrmImportaDados.btnImportarClick(Sender: TObject);
begin
  inherited;

   if (not cdsPessoa.IsEmpty) and (not cdsMensalidade.IsEmpty) then
      begin
         Gauge.MaxValue := cdsPessoa.RecordCount;
         Gauge.MinValue := 0;
         Gauge.Progress := 0;

         cdsPessoa.First;

         while not cdsPessoa.Eof do
            begin
               try
                  with dtModule, ADOStoredProc do
                     begin
                        ProcedureName := '[old].[P_PESSOA_IMPORTACAO]';

                        Parameters.Refresh;

                        Parameters.ParamByName('@MATRICULA').Value     := cdsPessoa.FieldByName('MATRICULA').Value;
                        Parameters.ParamByName('@NOME').Value   	     := cdsPessoa.FieldByName('NOME').Value;
                        Parameters.ParamByName('@DT_NASCIMENTO').Value := cdsPessoa.FieldByName('DT_NASCIMENTO').Value;

                        if cdsPessoa.FieldByName('SITUACAO').AsString = 'ATIVO' then
                           Parameters.ParamByName('@ATIVO').Value := 1
                        else
                           Parameters.ParamByName('@ATIVO').Value := 0;

                        ExecProc;
                     end;
               except
                  on E : Exception do
                     Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
               end;

               cdsMensalidade.First;

               while not cdsMensalidade.Eof do
                  begin
                     try
                        with dtModule, ADOStoredProc do
                           begin
                              ProcedureName := '[old].[P_FINANCEIRO_IMPORTACAO]';

                              Parameters.Refresh;

                              Parameters.ParamByName('@MATRICULA').Value        := cdsMensalidade.FieldByName('MATRICULA').Value;
                              Parameters.ParamByName('@FORMA_PAGAMENTO').Value  := cdsMensalidade.FieldByName('FORMAPAGAMENTO').Value;
                              Parameters.ParamByName('@MES').Value              := cdsMensalidade.FieldByName('MES').Value;
                              Parameters.ParamByName('@ANO').Value              := cdsMensalidade.FieldByName('ANO').Value;
                              Parameters.ParamByName('@REFER').Value            := cdsMensalidade.FieldByName('REFER').Value;
                              Parameters.ParamByName('@DT_VENCIMENTO').Value    := cdsMensalidade.FieldByName('DT_VENCIMENTO').Value;
                              Parameters.ParamByName('@VL_REFER').Value         := cdsMensalidade.FieldByName('VL_REFER').Value;
                              Parameters.ParamByName('@VL_DESCONTO').Value      := cdsMensalidade.FieldByName('VL_DESCONTO').Value;
                              Parameters.ParamByName('@DT_PAGAMENTO').Value     := cdsMensalidade.FieldByName('DT_PAGAMENTO').Value;
                              Parameters.ParamByName('@VL_PAGO').Value          := cdsMensalidade.FieldByName('VL_PAGO').Value;

                              ExecProc;
                           end;
                     except
                        on E : Exception do
                           Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
                     end;

                     cdsMensalidade.Next;
                  end;

               Gauge.Progress := Gauge.Progress + 1;

               cdsPessoa.Next;
            end;

         Notificacao('Operação realizada com sucesso!');

         btnLimpar.OnClick(Self);
      end;
end;

procedure TfrmImportaDados.CarregaMensalidade(varMatricula : String);
var i : integer;
    lclValor : Currency;
begin
   dtModule.ADOQueryAux2.Close;
   dtModule.ADOQueryAux2.SQL.Clear;

   dtModule.ADOQueryAux2.SQL.Add(' SELECT DISTINCT                                       ');
   dtModule.ADOQueryAux2.SQL.Add(' 	MENSALIDADE_ANO                                      ');
   dtModule.ADOQueryAux2.SQL.Add(' FROM [old].[V_DADOS_ANTIGO_COMPLETO]                  ');
   dtModule.ADOQueryAux2.SQL.Add(' WHERE CONTATO_MATRICULA = ' + QuotedStr(varMatricula)  );

   if cmbAno.ItemIndex > 0 then
      dtModule.ADOQueryAux2.SQL.Add(' AND MENSALIDADE_ANO = ' + QuotedStr(cmbAno.Text)    );

   dtModule.ADOQueryAux2.SQL.Add(' ORDER BY MENSALIDADE_ANO                              ');

   dtModule.ADOQueryAux2.Open;

   if not dtModule.ADOQueryAux2.IsEmpty then
      begin
         lclValor := 0;

         dtModule.ADOQueryAux2.First;

         while not dtModule.ADOQueryAux2.Eof do
            begin
               for I := 1 to 12 do
                  begin
                     dtModule.ADOQueryAux.Close;
                     dtModule.ADOQueryAux.SQL.Clear;

                     dtModule.ADOQueryAux.SQL.Add(' SELECT DISTINCT                                                                                    ');
                     dtModule.ADOQueryAux.SQL.Add(' 	CONTATO_MATRICULA,                                                                               ');
                     dtModule.ADOQueryAux.SQL.Add(' 	PGTO_FORMAPAGAMENTO,                                                                             ');
                     dtModule.ADOQueryAux.SQL.Add(' 	ORIGEM_ORIGEMPAGAMENTO,                                                                          ');
                     dtModule.ADOQueryAux.SQL.Add(' 	MENSALIDADE_ANO,                                                                                 ');
                     dtModule.ADOQueryAux.SQL.Add(' 	MENSALIDADE_MES,                                                                                 ');
                     dtModule.ADOQueryAux.SQL.Add(' 	MENSALIDADE_REFER,                                                                               ');
                     dtModule.ADOQueryAux.SQL.Add(' 	MENSALIDADE_DATAVENCIMENTO,                                                                      ');
                     dtModule.ADOQueryAux.SQL.Add(' 	PGTO_VALOR,                                                                                      ');
                     dtModule.ADOQueryAux.SQL.Add(' 	0.00 AS PGTO_DESCONTO,                                                                           ');
                     dtModule.ADOQueryAux.SQL.Add(' 	PGTO_DATAPAGAMENTO,                                                                              ');
                     dtModule.ADOQueryAux.SQL.Add(' 	PGTO_VALOR AS PGTO_VALOR_PAGO                                                                    ');
                     dtModule.ADOQueryAux.SQL.Add(' FROM [old].[V_DADOS_ANTIGO_COMPLETO]                                                               ');
                     dtModule.ADOQueryAux.SQL.Add(' WHERE CONTATO_MATRICULA = ' + QuotedStr(varMatricula)                                               );
                     dtModule.ADOQueryAux.SQL.Add(' AND MENSALIDADE_ANO = ' + QuotedStr(dtModule.ADOQueryAux2.FieldByName('MENSALIDADE_ANO').AsString)  );
                     dtModule.ADOQueryAux.SQL.Add(' AND MENSALIDADE_MES = ' + QuotedStr(StrZeros(IntToStr(i), 2))                                       );
                     dtModule.ADOQueryAux.SQL.Add(' ORDER BY MENSALIDADE_ANO, MENSALIDADE_MES                                                          ');

                     dtModule.ADOQueryAux.Open;

                     try
                        if not dtModule.ADOQueryAux.IsEmpty then
                           begin
                              lclValor := dtModule.ADOQueryAux.FieldByName('PGTO_VALOR').AsCurrency;

                              cdsMensalidade.Append;

                              cdsMensalidade.FieldByName('MATRICULA').Value       := dtModule.ADOQueryAux.FieldByName('CONTATO_MATRICULA').Value;
                              cdsMensalidade.FieldByName('MES').Value             := dtModule.ADOQueryAux.FieldByName('MENSALIDADE_MES').Value;
                              cdsMensalidade.FieldByName('ANO').Value             := dtModule.ADOQueryAux.FieldByName('MENSALIDADE_ANO').Value;
                              cdsMensalidade.FieldByName('REFER').Value           := dtModule.ADOQueryAux.FieldByName('MENSALIDADE_REFER').Value;
                              cdsMensalidade.FieldByName('FORMAPAGAMENTO').Value  := dtModule.ADOQueryAux.FieldByName('PGTO_FORMAPAGAMENTO').Value;
                              cdsMensalidade.FieldByName('ORIGEMPAGAMENTO').Value := dtModule.ADOQueryAux.FieldByName('ORIGEM_ORIGEMPAGAMENTO').Value;
                              cdsMensalidade.FieldByName('DT_VENCIMENTO').Value   := dtModule.ADOQueryAux.FieldByName('MENSALIDADE_DATAVENCIMENTO').Value;
                              cdsMensalidade.FieldByName('VL_REFER').Value        := dtModule.ADOQueryAux.FieldByName('PGTO_VALOR').Value;
                              cdsMensalidade.FieldByName('VL_DESCONTO').Value     := dtModule.ADOQueryAux.FieldByName('PGTO_DESCONTO').Value;
                              cdsMensalidade.FieldByName('DT_PAGAMENTO').Value    := dtModule.ADOQueryAux.FieldByName('PGTO_DATAPAGAMENTO').Value;
                              cdsMensalidade.FieldByName('VL_PAGO').Value         := dtModule.ADOQueryAux.FieldByName('PGTO_VALOR_PAGO').Value;
                              cdsMensalidade.FieldByName('USUARIO').Value         := 'admin';

                              cdsMensalidade.Post;
                           end
                        else
                           begin
                              if dtModule.ADOQueryAux2.FieldByName('MENSALIDADE_ANO').AsString = glbAnoContabil then
                                 begin
                                    cdsMensalidade.Append;

                                    cdsMensalidade.FieldByName('MATRICULA').Value       := varMatricula;
                                    cdsMensalidade.FieldByName('MES').Value             := StrZeros(IntToStr(i), 2);
                                    cdsMensalidade.FieldByName('ANO').Value             := glbAnoContabil;
                                    cdsMensalidade.FieldByName('REFER').Value           := StrZeros(IntToStr(i), 2) + glbAnoContabil;
                                    cdsMensalidade.FieldByName('FORMAPAGAMENTO').Value  := Null;
                                    cdsMensalidade.FieldByName('ORIGEMPAGAMENTO').Value := Null;
                                    cdsMensalidade.FieldByName('DT_VENCIMENTO').Value   := glbAnoContabil + '-' + StrZeros(IntToStr(i), 2) + '-' + StrZeros(Trim(glbDiaVencimento), 2);
                                    cdsMensalidade.FieldByName('VL_REFER').Value        := lclValor;
                                    cdsMensalidade.FieldByName('VL_DESCONTO').Value     := Null;
                                    cdsMensalidade.FieldByName('DT_PAGAMENTO').Value    := Null;
                                    cdsMensalidade.FieldByName('VL_PAGO').Value         := Null;
                                    cdsMensalidade.FieldByName('USUARIO').Value         := 'admin';

                                    cdsMensalidade.Post;
                                 end;
                           end;
                     except
                        on E : Exception do
                           Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
                     end;

                     dtModule.ADOQueryAux.Close;
                  end;

               dtModule.ADOQueryAux2.Next;
            end;
      end;

   dtModule.ADOQueryAux2.Close;
end;

procedure TfrmImportaDados.btnLimparClick(Sender: TObject);
begin
  inherited;

   Gauge.Progress := 0;

   cmbAno.ItemIndex             := 0;
   cmbSituacao.ItemIndex        := 0;
   cmbFormaPagamento.ItemIndex  := 0;

   btnCarregar.Enabled := True;
   btnImportar.Enabled := False;

   cmbAno.Enabled             := True;
   cmbSituacao.Enabled        := True;
   cmbFormaPagamento.Enabled  := True;

   DBGrid1.Enabled := False;
   DBGrid2.Enabled := False;

   cdsPessoa.EmptyDataSet;
   cdsMensalidade.EmptyDataSet;

   cmbAno.SetFocus;
end;

procedure TfrmImportaDados.btnSalvarClick(Sender: TObject);
begin
  inherited;

   AberturaJanela(TfrmConsultaDadosAntigos, frmConsultaDadosAntigos, 'Consulta de Dados do Sistema Antigo');
end;

procedure TfrmImportaDados.FormShow(Sender: TObject);
begin
  inherited;

   lblAnoContabil.Caption := glbAnoContabil;
   lblDiaVencimento.Caption := glbDiaVencimento;

   CarregaAno(cmbAno);
   CarregaSituacao(cmbSituacao);
   CarregaFormaPagamento(cmbFormaPagamento);

   btnCarregar.Enabled := True;
   btnImportar.Enabled := False;

   DBGrid1.Enabled := False;
   DBGrid2.Enabled := False;

   cdsPessoa.EmptyDataSet;
   cdsMensalidade.EmptyDataSet;

   cmbAno.SetFocus;
end;

end.
