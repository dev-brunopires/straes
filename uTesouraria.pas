unit uTesouraria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroPadrao, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, cxControls,
  dxBarBuiltInMenu, cxClasses, cxLocalization, ACBrBase, ACBrEnterTab, cxPC,
  Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls, cxContainer, cxEdit, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData,
  cxTextEdit, cxCalendar, cxCurrencyEdit, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridCustomView, cxGrid, cxMaskEdit,
  cxDropDownEdit, cxLabel, Datasnap.DBClient, cxCheckBox, cxMemo,
  System.ImageList, Vcl.ImgList, dxSkinsCore, dxSkinBlack, dxSkinBlue,
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
  TfrmTesouraria = class(TfrmCadastroPadrao)
    GroupBox6: TGroupBox;
    cxLabel2: TcxLabel;
    edtPessoaMatricula: TcxTextEdit;
    cxLabel1: TcxLabel;
    btnPesPessoa: TcxButton;
    GroupBox7: TGroupBox;
    cxGrid1: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    GroupBox1: TGroupBox;
    lblDesconto: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    lblTotal: TcxLabel;
    dscdsTesouraria: TDataSource;
    cxGridDBTableView2SELECIONAR: TcxGridDBColumn;
    cxGridDBTableView2REFER: TcxGridDBColumn;
    cxGridDBTableView2DT_VENCIMENTO: TcxGridDBColumn;
    cxGridDBTableView2VL_REFER: TcxGridDBColumn;
    cxGridDBTableView2VL_DESCONTO: TcxGridDBColumn;
    cxGridDBTableView2VL_JUROS: TcxGridDBColumn;
    cxGridDBTableView2VL_PAGAR: TcxGridDBColumn;
    cxGridDBTableView2DT_PAGAMENTO: TcxGridDBColumn;
    cxGridDBTableView2VL_PAGO: TcxGridDBColumn;
    btnGerarBoleto: TcxButton;
    btnPagarBoleto: TcxButton;
    btnEstornarDeb: TcxButton;
    btnAlterarBoleto: TcxButton;
    btnLimpar: TcxButton;
    cdsEstorno: TClientDataSet;
    dscdsEstorno: TDataSource;
    cdsEstornoID_FINANCEIRO: TIntegerField;
    cdsEstornoID_FINANCEIRO_ESTORNO: TIntegerField;
    cdsEstornoOBSERVACAO: TStringField;
    cdsEstornoUSUARIO_OPERACAO: TStringField;
    cdsEstornoDATA_OPERACAO: TDateTimeField;
    Label1: TLabel;
    mnuTesouraria: TPopupMenu;
    ImageList: TImageList;
    mnuTesDet: TMenuItem;
    dscdsAlteracao: TDataSource;
    cdsAlteracao: TClientDataSet;
    cdsAlteracaoID_FINANCEIRO_ALTERACAO: TIntegerField;
    cdsAlteracaoID_FINANCEIRO: TIntegerField;
    cdsAlteracaoDT_VENCIMENTO: TDateField;
    cdsAlteracaoVL_DESCONTO_ORIGINAL: TCurrencyField;
    cdsAlteracaoVL_DESCONTO: TCurrencyField;
    cdsAlteracaoVL_JUROS_ORIGINAL: TCurrencyField;
    cdsAlteracaoVL_JUROS: TCurrencyField;
    cdsAlteracaoOBSERVACAO: TStringField;
    cdsAlteracaoUSUARIO_OPERACAO: TStringField;
    cdsAlteracaoDATA_OPERACAO: TDateTimeField;
    cxGridDBTableView2FORMA_PAGAMENTO: TcxGridDBColumn;
    cxButton1: TcxButton;
    lblPessoaNome: TcxLabel;
    cbAberto: TCheckBox;
    cbAno: TCheckBox;
    cdsTesouraria: TClientDataSet;
    cdsTesourariaID_FINANCEIRO: TIntegerField;
    cdsTesourariaID_PESSOA: TIntegerField;
    cdsTesourariaSELECIONAR: TBooleanField;
    cdsTesourariaMES: TIntegerField;
    cdsTesourariaANO: TIntegerField;
    cdsTesourariaREFER: TStringField;
    cdsTesourariaDT_VENCIMENTO: TDateTimeField;
    cdsTesourariaVL_REFER: TCurrencyField;
    cdsTesourariaVL_DESCONTO: TCurrencyField;
    cdsTesourariaVL_JUROS: TCurrencyField;
    cdsTesourariaVL_PAGAR: TCurrencyField;
    cdsTesourariaDT_PAGAMENTO: TDateTimeField;
    cdsTesourariaVL_PAGO: TCurrencyField;
    cdsTesourariaFORMA_PAGAMENTO: TStringField;
    rbCrescente: TRadioButton;
    rbDecrescente: TRadioButton;
    Label2: TLabel;
    N1: TMenuItem;
    Imprimirrecibo1: TMenuItem;
    Label3: TLabel;
    procedure btnPesPessoaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxGridDBTableView2SELECIONARCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGridDBTableView2REFERCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGridDBTableView2DT_VENCIMENTOCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGridDBTableView2VL_REFERCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGridDBTableView2VL_DESCONTOCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGridDBTableView2VL_JUROSCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGridDBTableView2VL_PAGARCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGridDBTableView2DT_PAGAMENTOCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGridDBTableView2VL_PAGOCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure btnCancelarClick(Sender: TObject);
    procedure cdsTesourariaAfterEdit(DataSet: TDataSet);
    procedure btnPagarBoletoClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnEstornarDebClick(Sender: TObject);
    procedure btnAlterarBoletoClick(Sender: TObject);
    procedure mnuTesourariaChange(Sender: TObject; Source: TMenuItem;
      Rebuild: Boolean);
    procedure mnuTesDetClick(Sender: TObject);
    procedure edtPessoaMatriculaExit(Sender: TObject);
    procedure cbAbertoClick(Sender: TObject);
    procedure cbAnoClick(Sender: TObject);
    procedure rbCrescenteClick(Sender: TObject);
    procedure rbDecrescenteClick(Sender: TObject);
    procedure cxGridDBTableView2FORMA_PAGAMENTOCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxButton1Click(Sender: TObject);
    procedure Imprimirrecibo1Click(Sender: TObject);
  private
    { Private declarations }
    procedure CarregaDados(varIdPessoa: Integer);
    procedure RecarregaDadosAlunos( varNome : String );
    procedure CarregaEstornoAlteracao( varIdFinanceiro : Integer );
    procedure VerificaValores( varDesconto, varTotal : TcxLabel );
    procedure CarregaFiltro;
  public
    { Public declarations }
  end;

var
  frmTesouraria: TfrmTesouraria;
  lclDesconto, lclJuros, lclTotal : Currency;

implementation

{$R *.dfm}

uses uModule, uFuncao, uGlobal, uCadastroPessoa, uEstornoFinanceiro,
  uAlteraReferencia, uTesourariaDetalhe, uPagamento, uConsPessoa;

procedure TfrmTesouraria.CarregaDados(varIdPessoa: Integer);
var lclFiltro : String;
begin
	with dtModule do
   	begin
         ReconectaTabela(sisVDadosFinanceiro);
         ReconectaTabela(sisPessoa);

      	sisVDadosFinanceiro.DisableControls;
         sisPessoa.DisableControls;

      	sisVDadosFinanceiro.Filtered := False;

         sisPessoa.Filtered := False;
         sisPessoa.Filter   := 'ID_PESSOA = ' + IntToStr(varIdPessoa);
         sisPessoa.Filtered := True;

         if not sisPessoa.IsEmpty then
         	begin
               edtPessoaMatricula.Text := RetornaMatricula(sisPessoa.FieldByName('NOME').AsString);
               lblPessoaNome.Caption   := sisPessoa.FieldByName('NOME').AsString;

            	sisVDadosFinanceiro.Filtered := False;
               sisVDadosFinanceiro.Filter   := 'ID_PESSOA = ' + IntToStr(varIdPessoa);
               sisVDadosFinanceiro.Filtered := True;

               cdsTesouraria.EmptyDataSet;
               cdsEstorno.EmptyDataSet;

               if not sisVDadosFinanceiro.IsEmpty then
               	begin
                  	sisVDadosFinanceiro.First;

                     cdsTesouraria.DisableControls;

                     while not sisVDadosFinanceiro.Eof do
                     	begin
                        	try
                              cdsTesouraria.Append;

                              cdsTesouraria.FieldByName('SELECIONAR').Value 	   := False;
										cdsTesouraria.FieldByName('ID_FINANCEIRO').Value   := sisVDadosFinanceiro.FieldByName('ID_FINANCEIRO').Value;
                              cdsTesouraria.FieldByName('ID_PESSOA').Value 	   := sisVDadosFinanceiro.FieldByName('ID_PESSOA').Value;
                              cdsTesouraria.FieldByName('MES').Value 			   := StrToInt(Copy(sisVDadosFinanceiro.FieldByName('REFER').Value, 1, 2));
                              cdsTesouraria.FieldByName('ANO').Value 			   := StrToInt(Copy(sisVDadosFinanceiro.FieldByName('REFER').Value, 3, 4));
                              cdsTesouraria.FieldByName('REFER').Value 			   := sisVDadosFinanceiro.FieldByName('REFER').Value;
                              cdsTesouraria.FieldByName('DT_VENCIMENTO').Value   := sisVDadosFinanceiro.FieldByName('DT_VENCIMENTO').Value;
                              cdsTesouraria.FieldByName('VL_REFER').Value 		   := sisVDadosFinanceiro.FieldByName('VL_REFER').Value;
                              cdsTesouraria.FieldByName('VL_DESCONTO').Value 	   := sisVDadosFinanceiro.FieldByName('VL_DESCONTO').Value;
                              cdsTesouraria.FieldByName('VL_JUROS').Value 		   := sisVDadosFinanceiro.FieldByName('VL_JUROS').Value;
                              cdsTesouraria.FieldByName('VL_PAGAR').Value 		   := sisVDadosFinanceiro.FieldByName('VL_PAGAR').Value;
                              cdsTesouraria.FieldByName('DT_PAGAMENTO').Value    := sisVDadosFinanceiro.FieldByName('DT_PAGAMENTO').Value;
                              cdsTesouraria.FieldByName('VL_PAGO').Value 		   := sisVDadosFinanceiro.FieldByName('VL_PAGO').Value;
                              cdsTesouraria.FieldByName('FORMA_PAGAMENTO').Value := sisVDadosFinanceiro.FieldByName('FORMA_PAGAMENTO').Value;

                              cdsTesouraria.Post;
                           except
                              on E : Exception do
                                 Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
                           end;

                           CarregaEstornoAlteracao( dtModule.sisVDadosFinanceiro.FieldByName('ID_FINANCEIRO').AsInteger );

                        	sisVDadosFinanceiro.Next;
                        end;

                     cdsTesouraria.Filtered := False;

                     lclFiltro := '';

                     if ( cbAberto.Checked = True ) then
                        lclFiltro := lclFiltro + 'DT_PAGAMENTO = NULL';

                     if ( cbAno.Checked = True ) and ( lclFiltro = '' ) then
                        lclFiltro := lclFiltro + 'ANO = ' + glbAnoContabil
                     else if ( cbAno.Checked = True ) and ( lclFiltro <> '' ) then
                        lclFiltro := lclFiltro + ' AND ANO = ' + glbAnoContabil
                     else if ( cbAno.Checked = False ) and ( lclFiltro = '' ) then
                        lclFiltro := lclFiltro + 'ANO <> NULL'
                     else if ( cbAno.Checked = False ) and ( lclFiltro <> '' ) then
                        lclFiltro := lclFiltro + ' AND ANO <> NULL';

                     cdsTesouraria.Filter   := lclFiltro;

                     cdsTesouraria.Filtered := True;

                     cdsTesouraria.EnableControls;

                     cdsTesouraria.First;
                  end;
            end
         else
         	begin
               Notificacao('Nenhuma pessoa encontrada com os dados informados.');
               sisVDadosFinanceiro.Filtered := False;
            end;

         sisPessoa.Filtered := False;

         sisVDadosFinanceiro.EnableControls;
         sisPessoa.EnableControls;

         if not cdsTesouraria.IsEmpty then
            cdsTesouraria.First;
      end;
end;

procedure TfrmTesouraria.CarregaEstornoAlteracao(varIdFinanceiro: Integer);
begin
	with dtModule.ADOQuery, SQL do
   	begin
         Close;
         Clear;

         Add(' SELECT                                                ');
         Add(' 	ID_FINANCEIRO_ESTORNO,                             ');
         Add(' 	ID_FINANCEIRO,                                     ');
         Add(' 	OBSERVACAO,                                        ');
         Add(' 	USUARIO_OPERACAO,                                  ');
         Add(' 	DATA_OPERACAO                                      ');
         Add(' FROM [sis].[FINANCEIRO_ESTORNO]                       ');
         Add(' WHERE ID_FINANCEIRO = ' + IntToStr( varIdFinanceiro )  );

         Open;

         if not IsEmpty then
            begin
            	First;

               cdsEstorno.DisableControls;

               while not Eof do
               	begin
                     try
                        cdsEstorno.Append;

                        cdsEstorno.FieldByName('ID_FINANCEIRO_ESTORNO').Value := FieldByName('ID_FINANCEIRO_ESTORNO').AsInteger;
                        cdsEstorno.FieldByName('ID_FINANCEIRO').Value         := FieldByName('ID_FINANCEIRO').AsInteger;
                        cdsEstorno.FieldByName('OBSERVACAO').Value 	    		:= FieldByName('OBSERVACAO').AsString;
                        cdsEstorno.FieldByName('USUARIO_OPERACAO').Value 		:= FieldByName('USUARIO_OPERACAO').AsString;
                        cdsEstorno.FieldByName('DATA_OPERACAO').Value    		:= FieldByName('DATA_OPERACAO').AsDateTime;

                        cdsEstorno.Post;
                     except
                        on E : Exception do
                           Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
                     end;

                     Next;
                  end;

               cdsEstorno.EnableControls;
            end;

         Close;
         Clear;

         Add(' SELECT                                                ');
         Add(' 	ID_FINANCEIRO_ALTERACAO,                           ');
         Add('    ID_FINANCEIRO,                                     ');
         Add(' 	DT_VENCIMENTO,                                     ');
         Add(' 	VL_DESCONTO_ORIGINAL,                              ');
         Add(' 	VL_DESCONTO,                                       ');
         Add(' 	VL_JUROS_ORIGINAL,                                 ');
         Add(' 	VL_JUROS,                                          ');
         Add(' 	OBSERVACAO,                                        ');
         Add(' 	USUARIO_OPERACAO,                                  ');
         Add(' 	DATA_OPERACAO                                      ');
         Add(' FROM [sis].[FINANCEIRO_ALTERACAO]                     ');
         Add(' WHERE ID_FINANCEIRO = ' + IntToStr( varIdFinanceiro )  );

         Open;

         if not IsEmpty then
            begin
            	First;

               cdsAlteracao.DisableControls;

               while not Eof do
               	begin
                     try
                        cdsAlteracao.Append;

                        cdsAlteracao.FieldByName('ID_FINANCEIRO_ALTERACAO').Value := FieldByName('ID_FINANCEIRO_ALTERACAO').Value;
                        cdsAlteracao.FieldByName('ID_FINANCEIRO').Value 			 := FieldByName('ID_FINANCEIRO').Value;
                        cdsAlteracao.FieldByName('DT_VENCIMENTO').Value 			 := FieldByName('DT_VENCIMENTO').Value;
                        cdsAlteracao.FieldByName('VL_DESCONTO_ORIGINAL').Value 	 := FieldByName('VL_DESCONTO_ORIGINAL').Value;
                        cdsAlteracao.FieldByName('VL_DESCONTO').Value 				 := FieldByName('VL_DESCONTO').Value;
                        cdsAlteracao.FieldByName('VL_JUROS_ORIGINAL').Value 		 := FieldByName('VL_JUROS_ORIGINAL').Value;
                        cdsAlteracao.FieldByName('VL_JUROS').Value 					 := FieldByName('VL_JUROS').Value;
                        cdsAlteracao.FieldByName('OBSERVACAO').Value 				 := FieldByName('OBSERVACAO').Value;
                        cdsAlteracao.FieldByName('USUARIO_OPERACAO').Value 		 := FieldByName('USUARIO_OPERACAO').Value;
                        cdsAlteracao.FieldByName('DATA_OPERACAO').Value 			 := FieldByName('DATA_OPERACAO').Value;

                        cdsAlteracao.Post;
                     except
                        on E : Exception do
                           Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
                     end;

                     Next;
                  end;

               cdsAlteracao.EnableControls;
            end;

         Close;
      end;
end;

procedure TfrmTesouraria.CarregaFiltro;
var lclFiltro : String;
begin
   with cdsTesouraria do
      begin
         Filtered := False;

         if not IsEmpty then
            begin
               lclFiltro := '';

               if ( cbAberto.Checked = True ) then
                  lclFiltro := lclFiltro + 'DT_PAGAMENTO = NULL';

               if ( cbAno.Checked = True ) and ( lclFiltro = '' ) then
                  lclFiltro := lclFiltro + 'ANO = ' + glbAnoContabil
               else if ( cbAno.Checked = True ) and ( lclFiltro <> '' ) then
                  lclFiltro := lclFiltro + ' AND ANO = ' + glbAnoContabil
               else if ( cbAno.Checked = False ) and ( lclFiltro = '' ) then
                  lclFiltro := lclFiltro + 'ANO <> NULL'
               else if ( cbAno.Checked = False ) and ( lclFiltro <> '' ) then
                  lclFiltro := lclFiltro + ' AND ANO <> NULL';


               Filter   := lclFiltro;

               Filtered := True;

               First;
            end;
      end;
end;

procedure TfrmTesouraria.RecarregaDadosAlunos(varNome: String);
var lclFiltro : String;
begin
	dtModule.sisVDadosFinanceiro.Active := False;
   dtModule.sisVDadosFinanceiro.Active := True;

   dtModule.sisVDadosFinanceiro.Filtered := False;
   dtModule.sisVDadosFinanceiro.Filter   := 'ID_PESSOA = ' + IntToStr(RetornaIdPessoa(varNome));
   dtModule.sisVDadosFinanceiro.Filtered := True;

   if not dtModule.sisVDadosFinanceiro.IsEmpty then
      begin
         dtModule.sisVDadosFinanceiro.First;

         cdsTesouraria.EmptyDataSet;
         cdsEstorno.EmptyDataSet;

         cdsTesouraria.DisableControls;

         while not dtModule.sisVDadosFinanceiro.Eof do
            begin
               try
                  cdsTesouraria.Append;

                  cdsTesouraria.FieldByName('SELECIONAR').Value 	   := False;
                  cdsTesouraria.FieldByName('ID_FINANCEIRO').Value   := dtModule.sisVDadosFinanceiro.FieldByName('ID_FINANCEIRO').Value;
                  cdsTesouraria.FieldByName('ID_PESSOA').Value 	   := dtModule.sisVDadosFinanceiro.FieldByName('ID_PESSOA').Value;
                  cdsTesouraria.FieldByName('MES').Value 			   := StrToInt(Copy(dtModule.sisVDadosFinanceiro.FieldByName('REFER').Value, 1, 2));
                  cdsTesouraria.FieldByName('ANO').Value 			   := StrToInt(Copy(dtModule.sisVDadosFinanceiro.FieldByName('REFER').Value, 3, 4));
                  cdsTesouraria.FieldByName('REFER').Value 			   := dtModule.sisVDadosFinanceiro.FieldByName('REFER').Value;
                  cdsTesouraria.FieldByName('DT_VENCIMENTO').Value   := dtModule.sisVDadosFinanceiro.FieldByName('DT_VENCIMENTO').Value;
                  cdsTesouraria.FieldByName('VL_REFER').Value 		   := dtModule.sisVDadosFinanceiro.FieldByName('VL_REFER').Value;
                  cdsTesouraria.FieldByName('VL_DESCONTO').Value 	   := dtModule.sisVDadosFinanceiro.FieldByName('VL_DESCONTO').Value;
                  cdsTesouraria.FieldByName('VL_JUROS').Value 		   := dtModule.sisVDadosFinanceiro.FieldByName('VL_JUROS').Value;
                  cdsTesouraria.FieldByName('VL_PAGAR').Value 		   := dtModule.sisVDadosFinanceiro.FieldByName('VL_PAGAR').Value;
                  cdsTesouraria.FieldByName('DT_PAGAMENTO').Value    := dtModule.sisVDadosFinanceiro.FieldByName('DT_PAGAMENTO').Value;
                  cdsTesouraria.FieldByName('VL_PAGO').Value 		   := dtModule.sisVDadosFinanceiro.FieldByName('VL_PAGO').Value;
                  cdsTesouraria.FieldByName('FORMA_PAGAMENTO').Value := dtModule.sisVDadosFinanceiro.FieldByName('FORMA_PAGAMENTO').Value;

                  cdsTesouraria.Post;
               except
                  on E : Exception do
                     Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
               end;

               CarregaEstornoAlteracao( dtModule.sisVDadosFinanceiro.FieldByName('ID_FINANCEIRO').AsInteger );

               dtModule.sisVDadosFinanceiro.Next;
            end;

         lblDesconto.Clear;
         lblTotal.Clear;

         cdsTesouraria.Filtered := False;

         lclFiltro := '';

         if ( cbAberto.Checked = True ) then
            lclFiltro := lclFiltro + 'DT_PAGAMENTO = NULL';

         if ( cbAno.Checked = True ) and ( lclFiltro = '' ) then
            lclFiltro := lclFiltro + 'ANO = ' + glbAnoContabil
         else if ( cbAno.Checked = True ) and ( lclFiltro <> '' ) then
            lclFiltro := lclFiltro + ' AND ANO = ' + glbAnoContabil
         else if ( cbAno.Checked = False ) and ( lclFiltro = '' ) then
            lclFiltro := lclFiltro + 'ANO <> NULL'
         else if ( cbAno.Checked = False ) and ( lclFiltro <> '' ) then
            lclFiltro := lclFiltro + ' AND ANO <> NULL';

         cdsTesouraria.Filter   := lclFiltro;

         cdsTesouraria.Filtered := True;

         cdsTesouraria.EnableControls;

         cdsTesouraria.First;
      end;
end;

procedure TfrmTesouraria.cbAbertoClick(Sender: TObject);
begin
  inherited;

   if edtPessoaMatricula.Text <> '' then
      CarregaFiltro;
end;

procedure TfrmTesouraria.cbAnoClick(Sender: TObject);
begin
  inherited;

   if edtPessoaMatricula.Text <> '' then
      CarregaFiltro;
end;

procedure TfrmTesouraria.cdsTesourariaAfterEdit(DataSet: TDataSet);
begin
  inherited;

	VerificaValores( lblDesconto, lblTotal );
end;

procedure TfrmTesouraria.cxButton1Click(Sender: TObject);
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

procedure TfrmTesouraria.cxGridDBTableView2DT_PAGAMENTOCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;

	if Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, 8) >= 0 then
   	begin
      	ACanvas.Font.Color := clWindowText;
	      ACanvas.Font.Style := [fsBold];
      end;
end;

procedure TfrmTesouraria.cxGridDBTableView2DT_VENCIMENTOCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;

	if Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, 8) >= 0 then
   	begin
      	ACanvas.Font.Color := clWindowText;
	      ACanvas.Font.Style := [fsBold];
      end;
end;

procedure TfrmTesouraria.cxGridDBTableView2FORMA_PAGAMENTOCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;

	if Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, 8) >= 0 then
   	begin
      	ACanvas.Font.Color := clWindowText;
	      ACanvas.Font.Style := [fsBold];
      end;
end;

procedure TfrmTesouraria.cxGridDBTableView2REFERCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;

	if Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, 8) >= 0 then
   	begin
      	ACanvas.Font.Color := clWindowText;
	      ACanvas.Font.Style := [fsBold];
      end;
end;

procedure TfrmTesouraria.cxGridDBTableView2SELECIONARCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;

	if Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, 8) >= 0 then
   	begin
      	ACanvas.Font.Color := clWindowText;
	      ACanvas.Font.Style := [fsBold];
      end;
end;

procedure TfrmTesouraria.VerificaValores( varDesconto, varTotal : TcxLabel );
var lclIdFinanceiro : Integer;
begin
   if not cdsTesouraria.IsEmpty then
      begin
         if not cdsTesouraria.FieldByName('DT_PAGAMENTO').IsNull then
            begin
               Notificacao('Não é possível realizar o pagamento de uma mensalidade com baixa.');

               try
                  cdsTesouraria.Edit;

                  cdsTesouraria.FieldByName('SELECIONAR').Value := False;

                  cdsTesouraria.Post;
               except
                  on E : Exception do
                     Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
               end;
            end
         else
            begin
               cdsTesouraria.DisableControls;

               try
                  cdsTesouraria.Edit;

                  if cdsTesouraria.FieldByName('SELECIONAR').Value = False then
                     cdsTesouraria.FieldByName('SELECIONAR').Value := True
                  else
                     cdsTesouraria.FieldByName('SELECIONAR').Value := False;

                  cdsTesouraria.Post;

                  lclIdFinanceiro := cdsTesouraria.FieldByName('ID_FINANCEIRO').AsInteger;
               except
                  on E : Exception do
                     Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
               end;

               cdsTesouraria.First;

               lclDesconto := 0;
               lclTotal    := 0;

               while not cdsTesouraria.Eof do
                  begin
                     if cdsTesouraria.FieldByName('SELECIONAR').AsBoolean = True then
                        begin
                           lclDesconto := lclDesconto + cdsTesouraria.FieldByName('VL_DESCONTO').AsCurrency;
                           lclTotal    := lclTotal + cdsTesouraria.FieldByName('VL_REFER').AsCurrency;
                        end;

                     cdsTesouraria.Next;
                  end;

               cdsTesouraria.Locate('ID_FINANCEIRO', lclIdFinanceiro, [loPartialKey, loCaseInsensitive]);

               varDesconto.Caption := FormatFloat('###,###,##0.00', lclDesconto );
               varTotal.Caption    := FormatFloat('###,###,##0.00', lclTotal );

               cdsTesouraria.EnableControls;
            end;
      end;
end;

procedure TfrmTesouraria.cxGridDBTableView2VL_DESCONTOCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;

	if Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, 8) >= 0 then
   	begin
      	ACanvas.Font.Color := clWindowText;
	      ACanvas.Font.Style := [fsBold];
      end;
end;

procedure TfrmTesouraria.cxGridDBTableView2VL_JUROSCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;

	if Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, 8) >= 0 then
   	begin
      	ACanvas.Font.Color := clWindowText;
	      ACanvas.Font.Style := [fsBold];
      end;
end;

procedure TfrmTesouraria.cxGridDBTableView2VL_PAGARCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;

	if Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, 8) >= 0 then
   	begin
      	ACanvas.Font.Color := clWindowText;
	      ACanvas.Font.Style := [fsBold];
      end;
end;

procedure TfrmTesouraria.cxGridDBTableView2VL_PAGOCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;

	if Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, 8) >= 0 then
   	begin
      	ACanvas.Font.Color := clWindowText;
	      ACanvas.Font.Style := [fsBold];
      end;
end;

procedure TfrmTesouraria.cxGridDBTableView2VL_REFERCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;

	if Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, 8) >= 0 then
   	begin
      	ACanvas.Font.Color := clWindowText;
	      ACanvas.Font.Style := [fsBold];
      end;
end;

procedure TfrmTesouraria.edtPessoaMatriculaExit(Sender: TObject);
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

procedure TfrmTesouraria.FormCreate(Sender: TObject);
begin
  inherited;

	Brush.Style := bsClear;

   TraducaoFormulario('TraduçãoDev.ini', locCargo);
end;

procedure TfrmTesouraria.FormShow(Sender: TObject);
begin
  inherited;

   dtModule.sisVDadosFinanceiro.Active := False;

  	edtPessoaMatricula.SetFocus;
end;

procedure TfrmTesouraria.Imprimirrecibo1Click(Sender: TObject);
begin
  inherited;

   with cdsTesouraria do
      begin
         if not cdsTesouraria.FieldByName('DT_PAGAMENTO').IsNull then
            begin
               ImprimeCupomTesouraria(Trim(edtPessoaMatricula.Text),
                                      UpperCase(lblPessoaNome.Caption),
                                      Trim(FieldByName('REFER').AsString),
                                      FormatDateTime('dd/MM/yyyy', FieldByName('DT_VENCIMENTO').AsDateTime),
                                      formatfloat('R$ #,##0.00', FieldByName('VL_PAGAR').AsCurrency),
                                      FormatDateTime('dd/MM/yyyy', FieldByName('DT_PAGAMENTO').AsDateTime),
                                      UpperCase(Trim(FieldByName('FORMA_PAGAMENTO').AsString)));
            end
         else
            Notificacao('O valor selecionado não possui registro de pagamento para emissão do recibo.');
      end;
end;

procedure TfrmTesouraria.mnuTesDetClick(Sender: TObject);
begin
  inherited;

  	AberturaJanela(TfrmTesourariaDetalhe, frmTesourariaDetalhe, 'Tesouraria detalhe(s) - MATRÍCULA: ' + edtPessoaMatricula.Text + ' REFERÊNCIA: ' + cdsTesouraria.FieldByName('REFER').AsString);
end;

procedure TfrmTesouraria.mnuTesourariaChange(Sender: TObject; Source: TMenuItem;
  Rebuild: Boolean);
begin
  inherited;

  	if ( not cdsEstorno.IsEmpty ) or ( not cdsAlteracao.IsEmpty ) then
   	mnuTesDet.Visible := True
   else
   	mnuTesDet.Visible := False;
end;

procedure TfrmTesouraria.rbCrescenteClick(Sender: TObject);
begin
  inherited;

   if ( not cdsTesouraria.IsEmpty ) and ( rbCrescente.Checked ) then
      cdsTesouraria.IndexName := 'cdsTesourariaIndexAnoMesAsc';
end;

procedure TfrmTesouraria.rbDecrescenteClick(Sender: TObject);
begin
  inherited;

   if ( not cdsTesouraria.IsEmpty ) and ( rbDecrescente.Checked ) then
      cdsTesouraria.IndexName := 'cdsTesourariaIndexAnoMesDesc';
end;

procedure TfrmTesouraria.btnAlterarBoletoClick(Sender: TObject);
begin
  inherited;

  	if cdsTesouraria.FieldByName('DT_PAGAMENTO').IsNull then
   	begin
         glbIdFinanceiro := cdsTesouraria.FieldByName('ID_FINANCEIRO').AsInteger;
         glbValor        := cdsTesouraria.FieldByName('VL_REFER').AsCurrency;
         glbDesconto     := cdsTesouraria.FieldByName('VL_DESCONTO').AsCurrency;

         AberturaJanela(TfrmAlteraReferencia, frmAlteraReferencia, 'Altera Referência - MATRÍCULA: ' + edtPessoaMatricula.Text + ' REFERÊNCIA: ' + cdsTesouraria.FieldByName('REFER').AsString);

         RecarregaDadosAlunos(lblPessoaNome.Caption);
      end
   else
   	Notificacao('Não é possível alterar uma referência paga.');
end;

procedure TfrmTesouraria.btnCancelarClick(Sender: TObject);
begin
  inherited;

  	Close;
end;

procedure TfrmTesouraria.btnEstornarDebClick(Sender: TObject);
begin
  inherited;

  	if not cdsTesouraria.FieldByName('DT_PAGAMENTO').IsNull then
   	begin
         glbIdFinanceiro := cdsTesouraria.FieldByName('ID_FINANCEIRO').AsInteger;

         AberturaJanela(TfrmEstornoFinanceiro, frmEstornoFinanceiro, 'Estorno Financeiro - MATRÍCULA: ' + edtPessoaMatricula.Text + ' REFERÊNCIA: ' + cdsTesouraria.FieldByName('REFER').AsString);

         RecarregaDadosAlunos(lblPessoaNome.Caption);
      end
   else
   	Notificacao('Não é possível estornar uma referência em aberto.');
end;

procedure TfrmTesouraria.btnLimparClick(Sender: TObject);
begin
  inherited;

   cdsTesouraria.EmptyDataSet;

   lblPessoaNome.Clear;
   edtPessoaMatricula.Clear;

   cbAberto.Checked := False;
   cbAno.Checked    := True;

   lblDesconto.Clear;
   lblTotal.Clear;

   edtPessoaMatricula.SetFocus;
end;

procedure TfrmTesouraria.btnPagarBoletoClick(Sender: TObject);
var lclImprimeComprovante : Boolean;
begin
  inherited;

   if not cdsTesouraria.IsEmpty then
      begin
         cdsTesouraria.DisableControls;

         cdsTesouraria.Filtered := False;
         cdsTesouraria.Filter   := 'SELECIONAR = TRUE';
         cdsTesouraria.Filtered := True;

         if not cdsTesouraria.IsEmpty then
            begin
               glbIdFinanceiro  := cdsTesouraria.FieldByName('ID_FINANCEIRO').AsInteger;
               glbLabelDesconto := lblDesconto.Caption;
               glbLabelTotal    := lblTotal.Caption;

               AberturaJanela(TfrmPagamento, frmPagamento, 'Pagamento - MATRÍCULA: ' + edtPessoaMatricula.Text + ' REFERÊNCIA: ' + cdsTesouraria.FieldByName('REFER').AsString);

               if glbFinalizaPagamento then
                  begin
                     if (Application.MessageBox('Atenção!'#13'Deseja imprimir o(s) comprovante(s) de pagamento(s)?', PChar(Application.Title), MB_YESNO Or MB_ICONQUESTION ) = IDYES) then
                        lclImprimeComprovante := True
                     else
                        lclImprimeComprovante := False;

                     cdsTesouraria.First;

                     while not cdsTesouraria.Eof do
                        begin
                           try
                              with dtModule, ADOStoredProc do
                                 begin
                                    ProcedureName := '[sis].[P_FINANCEIRO_BAIXA]';
                                    Parameters.Refresh;

                                    Parameters.ParamByName('@ID_FINANCEIRO').Value 	    := cdsTesouraria.FieldByName('ID_FINANCEIRO').Value;
                                    Parameters.ParamByName('@ID_FORMA_PAGAMENTO').Value := glbIdFormaPagamento;
                                    Parameters.ParamByName('@DT_PAGAMENTO').Value 	    := glbDataPagamento;
                                    Parameters.ParamByName('@VL_PAGO').Value 		       := cdsTesouraria.FieldByName('VL_PAGAR').Value;
                                    Parameters.ParamByName('@USUARIO_OPERACAO').Value   := glbUsuario;

                                    ExecProc;
                                 end;
                           except
                              on E : Exception do
                                 Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
                           end;

                           if lclImprimeComprovante then
                              ImprimeCupomTesouraria(Trim(edtPessoaMatricula.Text),
                                                     UpperCase(lblPessoaNome.Caption),
                                                     cdsTesouraria.FieldByName('REFER').AsString,
                                                     FormatDateTime('dd/MM/yyyy', cdsTesouraria.FieldByName('DT_VENCIMENTO').AsDateTime),
                                                     formatfloat('R$ #,##0.00', cdsTesouraria.FieldByName('VL_PAGAR').AsCurrency),
                                                     FormatDateTime('dd/MM/yyyy', glbDataPagamento),
                                                     UpperCase(glbFormaPagamento));

                           cdsTesouraria.Next;
                        end;
                  end;
            end
         else
            Notificacao('Nenhum débito foi selecionado para efetuar o pagamento.');

         cdsTesouraria.Filtered := False;

         RecarregaDadosAlunos(lblPessoaNome.Caption);

         cdsTesouraria.EnableControls;
      end;
end;

procedure TfrmTesouraria.btnPesPessoaClick(Sender: TObject);
var lclValor : Integer;
begin
  inherited;

	if edtPessoaMatricula.Text <> '' then
      begin
         lclValor := StrToInt(Trim(edtPessoaMatricula.Text));

         edtPessoaMatricula.Text := Format('%6.6d', [lclValor]);

         //Verifica se a matricula está ativa
         if VerificaMatriculaAtiva(Trim(edtPessoaMatricula.Text)) then
            CarregaDados(RetornaIdPessoaMatricula(Trim(edtPessoaMatricula.Text)))
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

end.
