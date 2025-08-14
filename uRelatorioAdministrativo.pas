unit uRelatorioAdministrativo;

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
  cxDateUtils, Data.DB, Vcl.Grids, Vcl.DBGrids, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxLabel, RxCtrls, Datasnap.DBClient, frxClass,
  frxDBSet, frxExportCSV, frxExportPDF;

type
  TfrmRelatorioAdministrativo = class(TfrmCadastroPadrao)
    GroupBox1: TGroupBox;
    rbFluxoDiario: TRxRadioButton;
    btnLimpar: TcxButton;
    frxDBDatasetFluxoDiario: TfrxDBDataset;
    frxReportFluxoDiario: TfrxReport;
    dsFluxoDiario: TDataSource;
    cdsFluxoDiario: TClientDataSet;
    cdsFluxoDiarioPERIODO: TStringField;
    cdsFluxoDiarioMATRICULA: TStringField;
    cdsFluxoDiarioNOME: TStringField;
    cdsFluxoDiarioDATA_PAGAMENTO: TDateField;
    cdsFluxoDiarioORIGEM_PAGAMENTO: TStringField;
    cdsFluxoDiarioFORMA_PAGAMENTO: TStringField;
    cdsFluxoDiarioVALOR: TCurrencyField;
    cdsFluxoDiarioOBSERVACAO: TStringField;
    gbFluxo: TGroupBox;
    cmbTipo: TcxComboBox;
    cxLabel3: TcxLabel;
    cmbDescricao: TcxComboBox;
    btnDivCadDescricao: TcxButton;
    btnDivAltDescricao: TcxButton;
    rbTodos: TRxRadioButton;
    rbPorDescricao: TRxRadioButton;
    cxLabel4: TcxLabel;
    rbMatriculaAtrasada: TRxRadioButton;
    rbMatricula: TRxRadioButton;
    rbPeriodo: TRxRadioButton;
    gbPeriodo: TGroupBox;
    cxLabel1: TcxLabel;
    edtPeriodoInicio: TcxDateEdit;
    cxLabel2: TcxLabel;
    edtPeriodoFinal: TcxDateEdit;
    gbMatricula: TGroupBox;
    cxLabel5: TcxLabel;
    edtPessoaMatricula: TcxTextEdit;
    btnPesPessoa: TcxButton;
    btnConsPessoa: TcxButton;
    lblPessoaNome: TcxLabel;
    cxLabel6: TcxLabel;
    frxReportMatriculaAtrasada: TfrxReport;
    frxReportPorMatricula: TfrxReport;
    frxPDFExport: TfrxPDFExport;
    frxCSVExport: TfrxCSVExport;
    frxReportPorPeriodo: TfrxReport;
    procedure FormShow(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure rbTodosClick(Sender: TObject);
    procedure rbPorDescricaoClick(Sender: TObject);
    procedure cmbTipoPropertiesChange(Sender: TObject);
    procedure edtPessoaMatriculaExit(Sender: TObject);
    procedure btnPesPessoaClick(Sender: TObject);
    procedure btnConsPessoaClick(Sender: TObject);
    procedure rbFluxoDiarioClick(Sender: TObject);
    procedure rbMatriculaAtrasadaClick(Sender: TObject);
    procedure rbMatriculaClick(Sender: TObject);
    procedure rbPeriodoClick(Sender: TObject);
  private
    { Private declarations }
    procedure CarregaDados( varModelo : String );
    procedure CarregaDadosPessoa(varIdPessoa: Integer);
    procedure HabilitaCampos( varFiltro, varPeriodo, varMatricula : Boolean );
  public
    { Public declarations }
  end;

var
  frmRelatorioAdministrativo: TfrmRelatorioAdministrativo;

implementation

{$R *.dfm}

uses uGlobal, uFuncao, uModule, uConsPessoa;

{ TfrmRelatorioAdministrativo }

procedure TfrmRelatorioAdministrativo.FormShow(Sender: TObject);
begin
  inherited;

   dtModule.ADOQuery.Close;

   rbFluxoDiario.Checked := True;

   HabilitaCampos(True, True, False);

   cmbTipo.SetFocus;
end;

procedure TfrmRelatorioAdministrativo.HabilitaCampos(varFiltro, varPeriodo,
  varMatricula: Boolean);
begin
   cmbTipo.ItemIndex      := 0;
   rbTodos.Checked        := True;
   rbPorDescricao.Checked := False;
   cmbDescricao.ItemIndex := -1;

   edtPeriodoInicio.Clear;
   edtPeriodoFinal.Clear;

   edtPessoaMatricula.Clear;
   lblPessoaNome.Clear;

   cmbTipo.Enabled            := varFiltro;
   rbTodos.Enabled            := varFiltro;
   rbPorDescricao.Enabled     := varFiltro;
   cmbDescricao.Enabled       := varFiltro;
   btnDivCadDescricao.Enabled := varFiltro;
   btnDivAltDescricao.Enabled := varFiltro;

   edtPeriodoInicio.Enabled := varPeriodo;
   edtPeriodoFinal.Enabled  := varPeriodo;

   edtPessoaMatricula.Enabled := varMatricula;
   btnPesPessoa.Enabled       := varMatricula;
   btnConsPessoa.Enabled      := varMatricula;
end;

procedure TfrmRelatorioAdministrativo.rbFluxoDiarioClick(Sender: TObject);
begin
  inherited;

   HabilitaCampos(True, True, False);

   cmbTipo.SetFocus;
end;

procedure TfrmRelatorioAdministrativo.rbMatriculaAtrasadaClick(Sender: TObject);
begin
  inherited;

   HabilitaCampos(False, False, False);
end;

procedure TfrmRelatorioAdministrativo.rbMatriculaClick(Sender: TObject);
begin
  inherited;

   HabilitaCampos(False, False, True);

   edtPessoaMatricula.SetFocus;
end;

procedure TfrmRelatorioAdministrativo.rbPeriodoClick(Sender: TObject);
begin
  inherited;

   HabilitaCampos(False, True, False);

   edtPeriodoInicio.SetFocus;
end;

procedure TfrmRelatorioAdministrativo.rbPorDescricaoClick(Sender: TObject);
begin
  inherited;

   cmbDescricao.ItemIndex := -1;

   if rbTodos.Checked = True then
      cmbDescricao.Enabled := False
   else if rbPorDescricao.Checked = True then
      cmbDescricao.Enabled := True;
end;

procedure TfrmRelatorioAdministrativo.rbTodosClick(Sender: TObject);
begin
  inherited;

   cmbDescricao.ItemIndex := -1;

   if rbTodos.Checked = True then
      cmbDescricao.Enabled := False
   else if rbPorDescricao.Checked = True then
      cmbDescricao.Enabled := True;
end;

procedure TfrmRelatorioAdministrativo.btnCancelarClick(Sender: TObject);
begin
  inherited;

   Close;
end;

procedure TfrmRelatorioAdministrativo.btnLimparClick(Sender: TObject);
begin
  inherited;

   dtModule.ADOQuery.Close;

   rbFluxoDiario.Checked := True;

   edtPeriodoInicio.Clear;
   edtPeriodoFinal.Clear;

   edtPeriodoInicio.SetFocus;
end;

procedure TfrmRelatorioAdministrativo.btnPesPessoaClick(Sender: TObject);
var lclValor : Integer;
begin
  inherited;

	if edtPessoaMatricula.Text <> '' then
      begin
         lclValor := StrToInt(Trim(edtPessoaMatricula.Text));

         edtPessoaMatricula.Text := Format('%6.6d', [lclValor]);

         //Verifica se a matricula está ativa
         if VerificaMatriculaAtiva(Trim(edtPessoaMatricula.Text)) then
            begin
               CarregaDadosPessoa(RetornaIdPessoaMatricula(Trim(edtPessoaMatricula.Text)))
            end
         else
            begin
               Notificacao('Matrícula inativa.');
               edtPessoaMatricula.Clear;
               edtPessoaMatricula.SetFocus;
            end;
      end
   else
   	begin
   		Notificacao('Informe a matrícula da pessoa para realizar a pesquisa.');
      	edtPessoaMatricula.SetFocus;
      end;
end;

procedure TfrmRelatorioAdministrativo.btnSalvarClick(Sender: TObject);
begin
  inherited;
   if rbFluxoDiario.Checked then
      begin
         if (cmbTipo.ItemIndex = 1) and (rbPorDescricao.Checked = True) and (cmbDescricao.ItemIndex = -1) then
            begin
               Notificacao('Informe a descrição do pagamento diverso.');
               cmbDescricao.SetFocus;
            end
         else if edtPeriodoInicio.Text = '' then
            begin
               Notificacao('Informe o período inicial.');
               edtPeriodoInicio.SetFocus;
            end
         else if edtPeriodoFinal.Text = '' then
            begin
               Notificacao('Informe o período final.');
               edtPeriodoFinal.SetFocus;
            end
         else
            CarregaDados('FluxoDiario');
      end
   else if rbMatriculaAtrasada.Checked then
      begin
         CarregaDados('FluxoDiario');
      end
   else if rbMatricula.Checked then
      begin
         if edtPessoaMatricula.Text = '' then
            begin
               Notificacao('Informe a matrícula.');
               edtPessoaMatricula.SetFocus;
            end
         else
            CarregaDados('FluxoDiario');
      end
   else if rbPeriodo.Checked then
      begin
         if edtPeriodoInicio.Text = '' then
            begin
               Notificacao('Informe o período inicial.');
               edtPeriodoInicio.SetFocus;
            end
         else if edtPeriodoFinal.Text = '' then
            begin
               Notificacao('Informe o período final.');
               edtPeriodoFinal.SetFocus;
            end
         else
            CarregaDados('FluxoDiario');
      end;

end;

procedure TfrmRelatorioAdministrativo.CarregaDados(varModelo: String);
begin
   with dtModule.ADOQuery, SQL do
      begin
         Close;
         Clear;

         //FLUXO DIÁRIO
         if rbFluxoDiario.Checked then
            begin
               Add(' SELECT                                                                                                                      ');
               Add(' 	MATRICULA,                                                                                                               ');
               Add(' 	NOME,                                                                                                                    ');
               Add(' 	DATA_PAGAMENTO,                                                                                                          ');
               Add(' 	ORIGEM_PAGAMENTO,                                                                                                        ');
               Add(' 	FORMA_PAGAMENTO,                                                                                                         ');
               Add(' 	VALOR,                                                                                                                   ');
               Add(' 	OBSERVACAO                                                                                                               ');
               Add(' FROM [sis].[V_RELATORIO_FLUXO_DIARIO]                                                                                       ');
               Add(' WHERE ( DATA_PAGAMENTO BETWEEN ' + Char(39) + formatdatetime('yyyy-dd-mm', StrToDateTime(edtPeriodoInicio.Text)) + Char(39)  );
               Add(' AND ' + Char(39) + formatdatetime('yyyy-dd-mm', StrToDateTime(edtPeriodoFinal.Text)) + Char(39) + ')'                        );

               if cmbTipo.ItemIndex = 0 then
                  Add(' AND ORIGEM_PAGAMENTO = ' + QuotedStr('MENSALIDADE') )
               else if cmbTipo.ItemIndex = 1 then
                  Add(' AND ORIGEM_PAGAMENTO = ' + QuotedStr('PAGAMENTOS DIVERSOS') );

               if (rbPorDescricao.Checked = True) and (cmbDescricao.ItemIndex > -1) then
                  Add(' AND OBSERVACAO = ' + QuotedStr(cmbDescricao.Text) );

               Add(' ORDER BY MATRICULA, DATA_PAGAMENTO ');
            end
         //MATRÍCULA ATRASADA
         else if rbMatriculaAtrasada.Checked then
            begin
               Add(' SELECT                              ');
               Add(' 	MATRICULA,                       ');
               Add(' 	NOME,                            ');
               Add(' 	DT_VENCIMENTO AS DATA_PAGAMENTO, ');
               Add(' 	NULL AS ORIGEM_PAGAMENTO,        ');
               Add(' 	NULL AS FORMA_PAGAMENTO,         ');
               Add(' 	VL_PAGAR AS VALOR,               ');
               Add(' 	NULL AS OBSERVACAO               ');
               Add(' FROM [SIS].[V_DADOS_FINANCEIRO] A   ');
               Add(' INNER JOIN [SIS].[V_DADOS_PESSOA] B ');
               Add(' 	ON ( A.ID_PESSOA = B.ID_PESSOA ) ');
               Add(' 	AND ( B.ATIVO = 1 )              ');
               Add(' WHERE A.DT_PAGAMENTO IS NULL        ');
               Add(' AND A.DT_VENCIMENTO <= GETDATE()    ');
               Add(' ORDER BY MATRICULA, A.ANO, A.MES    ');
            end
         //POR MATRÍCULA
         else if rbMatricula.Checked then
            begin
               Add(' SELECT                                                   ');
               Add(' 	MATRICULA,                                            ');
               Add(' 	NOME,                                                 ');
               Add(' 	REFER AS OBSERVACAO,                                  ');
               Add(' 	DT_VENCIMENTO AS ORIGEM_PAGAMENTO,                    ');
               Add(' 	DT_PAGAMENTO AS DATA_PAGAMENTO,                       ');
               Add(' 	NULL AS FORMA_PAGAMENTO,                              ');
               Add(' 	VL_PAGAR AS VALOR                                     ');
               Add(' FROM [SIS].[V_DADOS_FINANCEIRO] A                        ');
               Add(' INNER JOIN [SIS].[V_DADOS_PESSOA] B                      ');
               Add(' 	ON ( A.ID_PESSOA = B.ID_PESSOA )                      ');
               Add(' WHERE MATRICULA = ' + QuotedStr(edtPessoaMatricula.Text)  );
               Add(' ORDER BY MATRICULA, A.ANO, A.MES                         ');
            end
         //POR PERÍODO
         else if rbPeriodo.Checked then
            begin
               Add(' SELECT                                                                                                                      ');
               Add(' 	MATRICULA,                                                                                                               ');
               Add(' 	NOME,                                                                                                                    ');
               Add(' 	DATA_PAGAMENTO,                                                                                                          ');
               Add(' 	ORIGEM_PAGAMENTO,                                                                                                        ');
               Add(' 	FORMA_PAGAMENTO,                                                                                                         ');
               Add(' 	VALOR,                                                                                                                   ');
               Add(' 	OBSERVACAO                                                                                                               ');
               Add(' FROM [sis].[V_RELATORIO_FLUXO_DIARIO]                                                                                       ');
               Add(' WHERE ( DATA_PAGAMENTO BETWEEN ' + Char(39) + formatdatetime('yyyy-dd-mm', StrToDateTime(edtPeriodoInicio.Text)) + Char(39)  );
               Add(' AND ' + Char(39) + formatdatetime('yyyy-dd-mm', StrToDateTime(edtPeriodoFinal.Text)) + Char(39) + ')'                        );
               Add(' ORDER BY MATRICULA, DATA_PAGAMENTO                                                                                          ');
            end;

         Open;

         First;

         if not IsEmpty then
            begin

               cdsFluxoDiario.EmptyDataSet;

               while not Eof do
                  begin
                     try
                        cdsFluxoDiario.Append;

                        cdsFluxoDiario.FieldByName('PERIODO').Value          := 'PERÍODO DE ' + edtPeriodoInicio.Text + ' ATÉ ' + edtPeriodoFinal.Text;
                        cdsFluxoDiario.FieldByName('MATRICULA').Value        := FieldByName('MATRICULA').Value;
                        cdsFluxoDiario.FieldByName('NOME').Value             := FieldByName('NOME').Value;
                        cdsFluxoDiario.FieldByName('DATA_PAGAMENTO').Value   := FieldByName('DATA_PAGAMENTO').Value;
                        cdsFluxoDiario.FieldByName('ORIGEM_PAGAMENTO').Value := FieldByName('ORIGEM_PAGAMENTO').Value;
                        cdsFluxoDiario.FieldByName('FORMA_PAGAMENTO').Value  := FieldByName('FORMA_PAGAMENTO').Value;
                        cdsFluxoDiario.FieldByName('VALOR').Value            := FieldByName('VALOR').Value;
                        cdsFluxoDiario.FieldByName('OBSERVACAO').Value       := FieldByName('OBSERVACAO').Value;

                        cdsFluxoDiario.Post;
                     except
                        on E : Exception do
                           Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
                     end;

                     Next;
                  end;

               if (not cdsFluxoDiario.IsEmpty) then
                  begin
                     if rbFluxoDiario.Checked then
                        begin
                           if frxReportFluxoDiario.LoadFromFile(DataDirectory + 'FluxoDiario.fr3') then
                              frxReportFluxoDiario.ShowReport();
                        end
                     else if rbMatriculaAtrasada.Checked then
                        begin
                           if frxReportFluxoDiario.LoadFromFile(DataDirectory + 'MatriculaAtrasada.fr3') then
                              frxReportFluxoDiario.ShowReport();
                        end
                     else if rbMatricula.Checked then
                        begin
                           if frxReportFluxoDiario.LoadFromFile(DataDirectory + 'PorMatricula.fr3') then
                              frxReportFluxoDiario.ShowReport();
                        end
                     else if rbPeriodo.Checked then
                        begin
                           if frxReportFluxoDiario.LoadFromFile(DataDirectory + 'PorPeriodo.fr3') then
                              frxReportFluxoDiario.ShowReport();
                        end
                     else
                        Notificacao('Arquivo do relatório não encontrado.');
                  end;
            end
         else
            begin
               Notificacao('Nenhum registro encontrado com o período informado.');
               edtPeriodoInicio.SetFocus;
            end;

         Close;
      end;
end;

procedure TfrmRelatorioAdministrativo.CarregaDadosPessoa(varIdPessoa: Integer);
var lclFiltro : String;
begin
	with dtModule do
   	begin
         ReconectaTabela(sisVDadosFinanceiro);
         ReconectaTabela(sisPessoa);

         sisPessoa.Filtered := False;
         sisPessoa.Filter   := 'ID_PESSOA = ' + IntToStr(varIdPessoa);
         sisPessoa.Filtered := True;

         if not sisPessoa.IsEmpty then
         	begin
               edtPessoaMatricula.Text := RetornaMatricula(sisPessoa.FieldByName('NOME').AsString);
               lblPessoaNome.Caption   := sisPessoa.FieldByName('NOME').AsString;
            end
         else
         	begin
               Notificacao('Nenhuma pessoa encontrada com os dados informados.');
            end;
      end;
end;

procedure TfrmRelatorioAdministrativo.cmbTipoPropertiesChange(Sender: TObject);
begin
  inherited;

   rbTodos.Checked        := True;
   rbPorDescricao.Checked := False;
   cmbDescricao.ItemIndex := -1;

   if cmbTipo.ItemIndex = 0 then
      begin
         rbTodos.Enabled        := False;
         rbPorDescricao.Enabled := False;
         cmbDescricao.Enabled   := False;
      end
   else if cmbTipo.ItemIndex = 1 then
      begin
         rbTodos.Enabled        := True;
         rbPorDescricao.Enabled := True;
         cmbDescricao.Enabled   := False;

         CarregaTipoPagamentoDiverso(cmbDescricao);
      end;
end;

procedure TfrmRelatorioAdministrativo.btnConsPessoaClick(Sender: TObject);
begin
  inherited;

   glbOperacao := '';

   AberturaJanela(TfrmConsPessoa, frmConsPessoa, 'Consulta de Pessoa');

   if glbConsMatricula <> '' then
      begin
         edtPessoaMatricula.Text := glbConsMatricula;
         btnPesPessoa.OnClick(Self);
      end;
end;

procedure TfrmRelatorioAdministrativo.edtPessoaMatriculaExit(Sender: TObject);
var lclValor : Integer;
begin
  inherited;

   if (Trim(edtPessoaMatricula.Text) <> '') then
      begin
         lclValor := StrToInt(Trim(edtPessoaMatricula.Text));
         edtPessoaMatricula.Text := Format('%6.6d', [lclValor]);

         btnPesPessoa.OnClick(Self);
      end;
end;

end.
