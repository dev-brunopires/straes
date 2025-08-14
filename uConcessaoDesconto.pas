unit uConcessaoDesconto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroPadrao, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, cxControls,
  dxBarBuiltInMenu, cxClasses, cxLocalization, ACBrBase, ACBrEnterTab, cxPC,
  Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxLabel, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, Data.DB, cxDBData, cxCheckBox, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridCustomView,
  cxGrid, cxCurrencyEdit, cxCalendar, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
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
  TfrmConcessaoDesconto = class(TfrmCadastroPadrao)
    GroupBox4: TGroupBox;
    btnAltPlano: TcxButton;
    btnCadPlano: TcxButton;
    cmbPlano: TcxComboBox;
    cxLabel24: TcxLabel;
    cxLabel26: TcxLabel;
    cmbPlanoDtInicio: TcxComboBox;
    cxLabel27: TcxLabel;
    cmbPlanoDtFinal: TcxComboBox;
    GroupBox5: TGroupBox;
    cmbFilantropia: TcxComboBox;
    cmbFilantropiaDtFinal: TcxComboBox;
    cxLabel29: TcxLabel;
    cmbFilantropiaDtInicio: TcxComboBox;
    cxLabel28: TcxLabel;
    btnAltFilantropia: TcxButton;
    btnCadFilantropia: TcxButton;
    cxLabel25: TcxLabel;
    GroupBox6: TGroupBox;
    cxLabel2: TcxLabel;
    edtPessoaMatricula: TcxTextEdit;
    cxLabel1: TcxLabel;
    GroupBox1: TGroupBox;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    lblAnoContabil: TcxLabel;
    lblDiaVencimento: TcxLabel;
    btnConfiguracao: TcxButton;
    btnLimpar: TcxButton;
    btnPesPessoa: TcxButton;
    Label2: TLabel;
    Label1: TLabel;
    GroupBox7: TGroupBox;
    cxGrid1: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBTableView2REFER1: TcxGridDBColumn;
    cxGridDBTableView2DT_VENCIMENTO1: TcxGridDBColumn;
    cxGridDBTableView2VL_REFER1: TcxGridDBColumn;
    cxGridDBTableView2VL_DESCONTO1: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    cxButton1: TcxButton;
    lblPessoaNome: TcxLabel;
    lblPlanoValor: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    lblFilantropiaValor: TcxLabel;
    cxLabel7: TcxLabel;
    lblFilantropiaPercentual: TcxLabel;
    Label3: TLabel;
    rbCrescente: TRadioButton;
    rbDecrescente: TRadioButton;
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCadPlanoClick(Sender: TObject);
    procedure btnAltPlanoClick(Sender: TObject);
    procedure btnCadFilantropiaClick(Sender: TObject);
    procedure btnAltFilantropiaClick(Sender: TObject);
    procedure cmbPlanoPropertiesChange(Sender: TObject);
    procedure cmbFilantropiaPropertiesChange(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnConfiguracaoClick(Sender: TObject);
    procedure btnPesPessoaClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure cxGridDBTableView2REFER1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGridDBTableView2DT_VENCIMENTO1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGridDBTableView2VL_REFER1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGridDBTableView2VL_DESCONTO1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxButton1Click(Sender: TObject);
    procedure edtPessoaMatriculaExit(Sender: TObject);
    procedure rbCrescenteClick(Sender: TObject);
    procedure rbDecrescenteClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure Habilita( varHabilitado : Boolean );
    procedure CarregaDados( varMatricula : String );
    procedure GravaPlano;
    procedure GravaFilantropia;

    function ValidaCampos : Boolean;
  public
    { Public declarations }
  end;

var
  frmConcessaoDesconto: TfrmConcessaoDesconto;

implementation

{$R *.dfm}

uses uFuncao, uGlobal, uModule, uCadastroPessoa, uCadastroPlano, uCadastroFilantropia,
  uConfiguracao, uConsPessoa;

procedure TfrmConcessaoDesconto.btnCancelarClick(Sender: TObject);
begin
  inherited;

  	Close;
end;

procedure TfrmConcessaoDesconto.btnConfiguracaoClick(Sender: TObject);
begin
  inherited;

	glbOperacao := '';
	AberturaJanela(TfrmConfiguracao, frmConfiguracao, 'Configuração');

   lblAnoContabil.Caption   := glbAnoContabil;
   lblDiaVencimento.Caption := glbDiaVencimento;

   btnLimpar.OnClick(Self);
end;

procedure TfrmConcessaoDesconto.btnLimparClick(Sender: TObject);
begin
  inherited;

  	Habilita(False);

   dtModule.sisFinanceiro.Active := False;

   lblPessoaNome.Clear;
   edtPessoaMatricula.Clear;

   edtPessoaMatricula.SetFocus;
end;

procedure TfrmConcessaoDesconto.btnPesPessoaClick(Sender: TObject);
begin
  inherited;

	if edtPessoaMatricula.Text <> '' then
      begin
         //Verifica se a matricula está ativa
         if VerificaMatriculaAtiva(Trim(edtPessoaMatricula.Text)) then
            CarregaDados(Trim(edtPessoaMatricula.Text))
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

procedure TfrmConcessaoDesconto.GravaPlano;
var lclAno, lclAnoInicio, lclAnoFinal : Integer;
	 lclMesInicio, lclMesFinal : String;
begin
	with dtModule do
      begin
      	lclAnoInicio := StrToInt( Copy( cmbPlanoDtInicio.Text, 3, 4 ) );
         lclAnoFinal  := StrToInt( Copy( cmbPlanoDtFinal.Text, 3, 4 ) );

         lclAno := lclAnoInicio;

         while lclAno <= lclAnoFinal do
            begin
            	lclMesInicio := '01';
               lclMesFinal  := '12';

               if lclAno = lclAnoInicio then
                  lclMesInicio := Copy( cmbPlanoDtInicio.Text, 1, 2 );

               if lclAno = lclAnoFinal then
                  lclMesFinal := Copy( cmbPlanoDtFinal.Text, 1, 2 );

               ADOQuery.Close;
               ADOQuery.SQL.Clear;

               ADOQuery.SQL.Add(' SELECT ANO, SUBSTRING( REFER, 1, 2 ) AS MES, REFER            ');
               ADOQuery.SQL.Add(' FROM [sis].[F_REFERENCIA] ( YEAR(GETDATE()) )   				   ');
               ADOQuery.SQL.Add(' WHERE ANO = ' + QuotedStr( IntToStr( lclAno ) )  				    );
               ADOQuery.SQL.Add(' AND SUBSTRING( REFER, 1, 2 ) >= ' + QuotedStr( lclMesInicio )  );
               ADOQuery.SQL.Add(' AND SUBSTRING( REFER, 1, 2 ) <= ' + QuotedStr( lclMesFinal )   );
               ADOQuery.SQL.Add(' ORDER BY ANO, SUBSTRING( REFER, 1, 2 )          				   ');

               ADOQuery.Open;

               if not ADOQuery.IsEmpty then
                  begin
                     ADOQuery.First;

                     while not ADOQuery.Eof do
                        begin
                           try
                              ADOStoredProc.ProcedureName := '[sis].[P_CONCESSAO_DESCONTO]';
                              ADOStoredProc.Parameters.Refresh;

                              ADOStoredProc.Parameters.ParamByName('@ID_PESSOA').Value        := RetornaIdPessoa(lblPessoaNome.Caption);
                              ADOStoredProc.Parameters.ParamByName('@REFER').Value            := ADOQuery.FieldByName('REFER').AsString;
                              ADOStoredProc.Parameters.ParamByName('@DT_VENCIMENTO').Value    := IntToStr( lclAno ) + '-' + ADOQuery.FieldByName('MES').AsString + '-' + glbDiaVencimento;
                              ADOStoredProc.Parameters.ParamByName('@VL_REFER').Value         := RetornaValorPlano( cmbPlano.Text );
                              ADOStoredProc.Parameters.ParamByName('@VL_DESCONTO').Value      := 0;
                              ADOStoredProc.Parameters.ParamByName('@USUARIO_OPERACAO').Value := glbUsuario;

                              ADOStoredProc.ExecProc;
                           except
                              on E : Exception do
                                 Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
                           end;

                           dtModule.ADOQuery.Next;
                        end;

                     dtModule.ADOQuery.Close;
                  end;

               lclAno := lclAno + 1;
            end;
      end;
end;

procedure TfrmConcessaoDesconto.GravaFilantropia;
var lclAno, lclAnoInicio, lclAnoFinal : Integer;
	 lclMesInicio, lclMesFinal : String;
begin
	with dtModule do
      begin
      	lclAnoInicio := StrToInt( Copy( cmbFilantropiaDtInicio.Text, 3, 4 ) );
         lclAnoFinal  := StrToInt( Copy( cmbFilantropiaDtFinal.Text, 3, 4 ) );

         lclAno := lclAnoInicio;

         while lclAno <= lclAnoFinal do
            begin
            	lclMesInicio := '01';
               lclMesFinal  := '12';

               if lclAno = lclAnoInicio then
                  lclMesInicio := Copy( cmbFilantropiaDtInicio.Text, 1, 2 );

               if lclAno = lclAnoFinal then
                  lclMesFinal := Copy( cmbFilantropiaDtFinal.Text, 1, 2 );

               ADOQuery.Close;
               ADOQuery.SQL.Clear;

               ADOQuery.SQL.Add(' SELECT ANO, SUBSTRING( REFER, 1, 2 ) AS MES, REFER            ');
               ADOQuery.SQL.Add(' FROM [sis].[F_REFERENCIA] ( YEAR(GETDATE()) )   				   ');
               ADOQuery.SQL.Add(' WHERE ANO = ' + QuotedStr( IntToStr( lclAno ) )  				    );
               ADOQuery.SQL.Add(' AND SUBSTRING( REFER, 1, 2 ) >= ' + QuotedStr( lclMesInicio )  );
               ADOQuery.SQL.Add(' AND SUBSTRING( REFER, 1, 2 ) <= ' + QuotedStr( lclMesFinal )   );
               ADOQuery.SQL.Add(' ORDER BY ANO, SUBSTRING( REFER, 1, 2 )          				   ');

               ADOQuery.Open;

               if not ADOQuery.IsEmpty then
                  begin
                     ADOQuery.First;

                     while not ADOQuery.Eof do
                        begin
                           try
                              ADOStoredProc.ProcedureName := '[sis].[P_CONCESSAO_DESCONTO_FILANTROPIA]';
                              ADOStoredProc.Parameters.Refresh;

                              ADOStoredProc.Parameters.ParamByName('@ID_PESSOA').Value        := RetornaIdPessoa(lblPessoaNome.Caption);
                              ADOStoredProc.Parameters.ParamByName('@REFER').Value            := ADOQuery.FieldByName('REFER').AsString;

                              if RetornaValorFilantropia( cmbFilantropia.Text ) = 0 then
                                 begin
                                    ADOStoredProc.Parameters.ParamByName('@TIPO_DESCONTO').Value := 0;
                                 	ADOStoredProc.Parameters.ParamByName('@VL_DESCONTO').Value   := RetornaPercentualFilantropia( cmbFilantropia.Text );
                                 end
                              else
                                 begin
                                    ADOStoredProc.Parameters.ParamByName('@TIPO_DESCONTO').Value := 1;
                                 	ADOStoredProc.Parameters.ParamByName('@VL_DESCONTO').Value   := RetornaValorFilantropia( cmbFilantropia.Text );
                                 end;

                              ADOStoredProc.Parameters.ParamByName('@USUARIO_OPERACAO').Value := glbUsuario;

                              ADOStoredProc.ExecProc;
                           except
                              on E : Exception do
                                 Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
                           end;

                           dtModule.ADOQuery.Next;
                        end;

                     dtModule.ADOQuery.Close;
                  end;

               lclAno := lclAno + 1;
            end;
      end;
end;

procedure TfrmConcessaoDesconto.btnSalvarClick(Sender: TObject);
var lclPlano, lclFilantropia : Boolean;
begin
  inherited;

	if ValidaCampos then
   	begin
         if (cmbPlano.ItemIndex > -1) and (cmbPlanoDtInicio.ItemIndex > -1) and (cmbPlanoDtFinal.ItemIndex > -1) then
            begin
      			GravaPlano;
               lclPlano := True;
            end
         else
            lclPlano := False;

         if (cmbFilantropia.ItemIndex > -1) and (cmbFilantropiaDtFinal.ItemIndex > -1) and (cmbFilantropiaDtInicio.ItemIndex > -1) then
            begin
               GravaFilantropia;
               lclFilantropia := True;
            end
         else
            lclFilantropia := False;

         if (lclPlano) or (lclFilantropia) then
            begin
               Notificacao('Operação realizada com sucesso!');

               CarregaDados(RetornaMatricula(lblPessoaNome.Caption));
            end;
      end;
end;

procedure TfrmConcessaoDesconto.CarregaDados(varMatricula: String);
begin
	with dtModule do
   	begin
         ReconectaTabela(sisFinanceiro);
         ReconectaTabela(sisPessoa);

      	sisFinanceiro.DisableControls;
         sisPessoa.DisableControls;

      	sisFinanceiro.Filtered := False;

         sisPessoa.Filtered := False;
         sisPessoa.Filter   := 'MATRICULA = ' + QuotedStr(varMatricula);
         sisPessoa.Filtered := True;

         if not sisPessoa.IsEmpty then
         	begin
            	edtPessoaMatricula.Text := varMatricula;
               lblPessoaNome.Caption   := sisPessoa.FieldByName('NOME').AsString;

            	sisFinanceiro.Filtered := False;
               sisFinanceiro.Filter   := 'ID_PESSOA = ' + IntToStr(RetornaIdPessoa(sisPessoa.FieldByName('NOME').AsString)) + ' AND ANO = ' + glbAnoContabil;
               sisFinanceiro.Filtered := True;

               Habilita(True);
            end
         else
         	begin
               Notificacao('Nenhuma pessoa encontrada com os dados informados.');
               sisFinanceiro.Filtered := False;
               Habilita(False);
            end;

         sisPessoa.Filtered := False;

         if not sisFinanceiro.IsEmpty then
            begin
               sisFinanceiro.Sort := 'ANO, MES DESC';

               sisFinanceiro.First;
            end;

         sisFinanceiro.EnableControls;
         sisPessoa.EnableControls;
      end;
end;

procedure TfrmConcessaoDesconto.cmbPlanoPropertiesChange(Sender: TObject);
begin
  inherited;

  	with dtModule.sisFinanceiro do
   	begin
      	lblPlanoValor.Clear;
         cmbPlanoDtInicio.Clear;
         cmbPlanoDtFinal.Clear;

         CarregaReferencia( cmbPlanoDtInicio, cmbPlanoDtFinal, 'Atual' );

         lblPlanoValor.Caption := FormatFloat('R$ ###,###,##0.00', RetornaValorPlano( cmbPlano.Text ));
      end;
end;

procedure TfrmConcessaoDesconto.cxButton1Click(Sender: TObject);
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

procedure TfrmConcessaoDesconto.cxGridDBTableView2DT_VENCIMENTO1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;

	if Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, 3) > 0 then
      ACanvas.Font.Style := [fsBold];
end;

procedure TfrmConcessaoDesconto.cxGridDBTableView2REFER1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;

	if Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, 3) > 0 then
      ACanvas.Font.Style := [fsBold];
end;

procedure TfrmConcessaoDesconto.cxGridDBTableView2VL_DESCONTO1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;

	if Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, 3) > 0 then
      ACanvas.Font.Style := [fsBold];
end;

procedure TfrmConcessaoDesconto.cxGridDBTableView2VL_REFER1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;

	if Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, 3) > 0 then
      ACanvas.Font.Style := [fsBold];
end;

procedure TfrmConcessaoDesconto.edtPessoaMatriculaExit(Sender: TObject);
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

procedure TfrmConcessaoDesconto.cmbFilantropiaPropertiesChange(Sender: TObject);
begin
  inherited;

  	with dtModule.sisFinanceiro do
   	begin
      	lblFilantropiaValor.Clear;
         lblFilantropiaPercentual.Clear;

         cmbFilantropiaDtInicio.Clear;
         cmbFilantropiaDtFinal.Clear;

         CarregaReferencia( cmbFilantropiaDtInicio, cmbFilantropiaDtFinal, 'Atual' );

         lblFilantropiaValor.Caption 		:= FormatFloat('R$ ###,###,##0.00', RetornaValorFilantropia( cmbFilantropia.Text ));
         lblFilantropiaPercentual.Caption := FormatFloat('###,###,##0.00 %', RetornaPercentualFilantropia( cmbFilantropia.Text ));
      end;
end;

procedure TfrmConcessaoDesconto.btnCadPlanoClick(Sender: TObject);
begin
  inherited;

	BtnCad(TfrmCadastroPlano, frmCadastroPlano, cmbPlano, 'Plano', 'Cadastro de Plano');
end;

procedure TfrmConcessaoDesconto.btnAltPlanoClick(Sender: TObject);
begin
  inherited;

	BtnAlt(TfrmCadastroPlano, frmCadastroPlano, cmbPlano, 'Plano', 'Cadastro de Plano', 'Informe um plano para ser alterado.');
end;

procedure TfrmConcessaoDesconto.btnCadFilantropiaClick(Sender: TObject);
begin
  inherited;

	BtnCad(TfrmCadastroFilantropia, frmCadastroFilantropia, cmbFilantropia, 'Filantropia', 'Cadastro de Filantropia');
end;

procedure TfrmConcessaoDesconto.btnAltFilantropiaClick(Sender: TObject);
begin
  inherited;

  	BtnAlt(TfrmCadastroFilantropia, frmCadastroFilantropia, cmbFilantropia, 'Filantropia', 'Cadastro de Filantropia', 'Informe uma filantropia para ser alterada.');
end;

procedure TfrmConcessaoDesconto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

   dtModule.sisFinanceiro.Active := False;
end;

procedure TfrmConcessaoDesconto.FormCreate(Sender: TObject);
begin
  inherited;

	Brush.Style := bsClear;

   TraducaoFormulario('TraduçãoDev.ini', locCargo);
end;

procedure TfrmConcessaoDesconto.FormShow(Sender: TObject);
begin
  inherited;

   dtModule.sisFinanceiro.Active := False;

	CarregaPlano(cmbPlano);
   CarregaFilantropia(cmbFilantropia);

   CarregaConfiguracao;

   lblAnoContabil.Caption   := glbAnoContabil;
   lblDiaVencimento.Caption := glbDiaVencimento;

  	edtPessoaMatricula.SetFocus;
end;

procedure TfrmConcessaoDesconto.Habilita(varHabilitado: Boolean);
begin
	//Plano
   cmbPlano.Enabled         := varHabilitado;
   btnCadPlano.Enabled      := varHabilitado;
   btnAltPlano.Enabled      := varHabilitado;

   if varHabilitado = False then
   	begin
         cmbPlanoDtInicio.Enabled := varHabilitado;
         cmbPlanoDtFinal.Enabled  := varHabilitado;

         cmbPlanoDtInicio.Properties.Items.Clear;
		   cmbPlanoDtFinal.Properties.Items.Clear;
      end;

   CarregaPlano(cmbPlano);
   cmbPlano.ItemIndex := -1;
   lblPlanoValor.Clear;

   //Filantropia
   cmbFilantropia.Enabled 		    := varHabilitado;
   btnCadFilantropia.Enabled 		 := varHabilitado;
   btnAltFilantropia.Enabled 		 := varHabilitado;

   if varHabilitado = False then
   	begin
         cmbFilantropiaDtFinal.Enabled  := varHabilitado;
         cmbFilantropiaDtInicio.Enabled := varHabilitado;

         cmbFilantropiaDtFinal.Properties.Items.Clear;
		   cmbFilantropiaDtInicio.Properties.Items.Clear;
      end;

   CarregaFilantropia(cmbFilantropia);
   cmbFilantropia.ItemIndex := -1;
   lblFilantropiaValor.Clear;
   lblFilantropiaPercentual.Clear;

   //Dados Contábeis
   btnConfiguracao.Enabled := varHabilitado;
end;

procedure TfrmConcessaoDesconto.rbCrescenteClick(Sender: TObject);
begin
  inherited;

   with dtModule.sisFinanceiro do
      begin
         if ( not IsEmpty ) then
            Sort := 'ANO, MES';
      end;
end;

procedure TfrmConcessaoDesconto.rbDecrescenteClick(Sender: TObject);
begin
  inherited;

   with dtModule.sisFinanceiro do
      begin
         if ( not IsEmpty ) then
            Sort := 'ANO, MES DESC';
      end;
end;

function TfrmConcessaoDesconto.ValidaCampos: Boolean;
begin
	Result := False;

   if edtPessoaMatricula.Text = '' then
   	begin
      	Notificacao('Informe a matrícula da pessoa.');
         edtPessoaMatricula.SetFocus;
      end
   else
   	Result := True;
end;

end.
