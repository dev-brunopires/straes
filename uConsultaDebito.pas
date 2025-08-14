unit uConsultaDebito;

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
  cxButtons, Vcl.ExtCtrls, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxCheckBox, cxTextEdit,
  cxCalendar, cxCurrencyEdit, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridCustomView, cxGrid, cxContainer,
  cxLabel;

type
  TfrmConsultaDebito = class(TfrmCadastroPadrao)
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGridDBTableView1REFER: TcxGridDBColumn;
    cxGridDBTableView1DT_VENCIMENTO: TcxGridDBColumn;
    cxGridDBTableView1VL_REFER: TcxGridDBColumn;
    cxGridDBTableView1VL_DESCONTO: TcxGridDBColumn;
    cxGridDBTableView1DT_PAGAMENTO: TcxGridDBColumn;
    cxGridDBTableView1VL_PAGO: TcxGridDBColumn;
    cxGridDBTableView1FORMA_PAGAMENTO: TcxGridDBColumn;
    cxLabel1: TcxLabel;
    lblMatricula: TcxLabel;
    lblNome: TcxLabel;
    cxLabel3: TcxLabel;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxGridDBTableView1REFERCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGridDBTableView1DT_VENCIMENTOCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGridDBTableView1VL_REFERCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGridDBTableView1VL_DESCONTOCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGridDBTableView1DT_PAGAMENTOCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGridDBTableView1VL_PAGOCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGridDBTableView1FORMA_PAGAMENTOCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaDebito: TfrmConsultaDebito;

implementation

{$R *.dfm}

uses uModule, uFuncao, uGlobal;

procedure TfrmConsultaDebito.btnCancelarClick(Sender: TObject);
begin
  inherited;

   Close;
end;

procedure TfrmConsultaDebito.cxGridDBTableView1DT_PAGAMENTOCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;

	if Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, 5) >= 0 then
   	begin
      	ACanvas.Font.Color := clWindowText;
	      ACanvas.Font.Style := [fsBold];
      end;
end;

procedure TfrmConsultaDebito.cxGridDBTableView1DT_VENCIMENTOCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;

	if Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, 5) >= 0 then
   	begin
      	ACanvas.Font.Color := clWindowText;
	      ACanvas.Font.Style := [fsBold];
      end;
end;

procedure TfrmConsultaDebito.cxGridDBTableView1FORMA_PAGAMENTOCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;

	if Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, 5) >= 0 then
   	begin
      	ACanvas.Font.Color := clWindowText;
	      ACanvas.Font.Style := [fsBold];
      end;
end;

procedure TfrmConsultaDebito.cxGridDBTableView1REFERCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;

	if Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, 5) >= 0 then
   	begin
      	ACanvas.Font.Color := clWindowText;
	      ACanvas.Font.Style := [fsBold];
      end;
end;

procedure TfrmConsultaDebito.cxGridDBTableView1VL_DESCONTOCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;

	if Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, 5) >= 0 then
   	begin
      	ACanvas.Font.Color := clWindowText;
	      ACanvas.Font.Style := [fsBold];
      end;
end;

procedure TfrmConsultaDebito.cxGridDBTableView1VL_PAGOCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;

	if Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, 5) >= 0 then
   	begin
      	ACanvas.Font.Color := clWindowText;
	      ACanvas.Font.Style := [fsBold];
      end;
end;

procedure TfrmConsultaDebito.cxGridDBTableView1VL_REFERCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;

	if Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, 5) >= 0 then
   	begin
      	ACanvas.Font.Color := clWindowText;
	      ACanvas.Font.Style := [fsBold];
      end;
end;

procedure TfrmConsultaDebito.FormCreate(Sender: TObject);
begin
  inherited;

	Brush.Style := bsClear;

   TraducaoFormulario('TraduçãoDev.ini', locCargo);
end;

procedure TfrmConsultaDebito.FormShow(Sender: TObject);
begin
  inherited;

   lblMatricula.Caption := glbMatricula;
   lblNome.Caption      := glbNomePessoa;

   dtModule.sisVDadosPessoaFinanceiro.Filtered := False;
   dtModule.sisVDadosPessoaFinanceiro.Filter   := 'MATRICULA = ' + QuotedStr(glbMatricula);
   dtModule.sisVDadosPessoaFinanceiro.Filtered := True;

   cxGrid1.SetFocus;
end;

end.
