unit uTesourariaDetalhe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroPadrao, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, cxControls,
  dxBarBuiltInMenu, cxClasses, cxLocalization, ACBrBase, ACBrEnterTab, cxPC,
  Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxTextEdit,
  cxCalendar, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridCustomView, cxGrid, cxCurrencyEdit, cxMemo,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter;

type
  TfrmTesourariaDetalhe = class(TfrmCadastroPadrao)
    GroupBox7: TGroupBox;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    GroupBox1: TGroupBox;
    cxGrid1: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    cxGridDBTableView2OBSERVACAO1: TcxGridDBColumn;
    cxGridDBTableView2USUARIO_OPERACAO1: TcxGridDBColumn;
    cxGridDBTableView2DATA_OPERACAO1: TcxGridDBColumn;
    cxGridDBTableView1DT_VENCIMENTO1: TcxGridDBColumn;
    cxGridDBTableView1VL_DESCONTO_ORIGINAL1: TcxGridDBColumn;
    cxGridDBTableView1VL_DESCONTO1: TcxGridDBColumn;
    cxGridDBTableView1VL_JUROS_ORIGINAL1: TcxGridDBColumn;
    cxGridDBTableView1VL_JUROS1: TcxGridDBColumn;
    cxGridDBTableView1OBSERVACAO1: TcxGridDBColumn;
    cxGridDBTableView1USUARIO_OPERACAO1: TcxGridDBColumn;
    cxGridDBTableView1DATA_OPERACAO1: TcxGridDBColumn;
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTesourariaDetalhe: TfrmTesourariaDetalhe;

implementation

{$R *.dfm}

uses uGlobal, uFuncao, uModule, uTesouraria;

procedure TfrmTesourariaDetalhe.btnCancelarClick(Sender: TObject);
begin
  inherited;

	Close;
end;

end.
