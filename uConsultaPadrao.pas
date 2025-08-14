unit uConsultaPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, Vcl.StdCtrls, cxButtons, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLabel, cxGroupBox, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  Datasnap.DBClient, Vcl.Buttons, cxLocalization, Vcl.DBCtrls,
  ACBrBase, ACBrEnterTab, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
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
  dxSkinXmas2008Blue;

type
  TfrmConsultaPadrao = class(TForm)
    pnlBotoes: TPanel;
    pnlCentral: TPanel;
    btnIncluir: TcxButton;
    btnSair: TcxButton;
    btnExcluir: TcxButton;
    btnAlterar: TcxButton;
    btnImprimir: TcxButton;
    btnEnviar: TcxButton;
    pnlParametros: TPanel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    btnAtualizar: TcxButton;
    EnterTab: TACBrEnterTab;
    locCargo: TcxLocalizer;
    GroupBox1: TGroupBox;
    cmbPesqCampo: TcxComboBox;
    edtPesqTexto: TcxTextEdit;
    btnLimpar: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaPadrao: TfrmConsultaPadrao;

implementation

{$R *.dfm}

uses uFuncao, uGlobal, uModule;

procedure TfrmConsultaPadrao.btnLimparClick(Sender: TObject);
begin
   edtPesqTexto.Clear;
end;

procedure TfrmConsultaPadrao.FormCreate(Sender: TObject);
begin
	Brush.Style := bsClear;

   TraducaoFormulario('TraduçãoDev.ini', locCargo);
end;

procedure TfrmConsultaPadrao.FormShow(Sender: TObject);
begin
   //edtPesqTexto.SetFocus;
end;

end.
