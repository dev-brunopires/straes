unit uConsultaDadosAntigos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uConsultaPadrao, cxGraphics,
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
  dxSkinXmas2008Blue, cxControls, cxStyles, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  cxContainer, cxLocalization, ACBrBase, ACBrEnterTab, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, Vcl.StdCtrls, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxButtons,
  Vcl.ExtCtrls, cxCalendar, cxCurrencyEdit;

type
  TfrmConsultaDadosAntigos = class(TfrmConsultaPadrao)
    cxGrid1DBTableView1CONTATO_MATRICULA: TcxGridDBColumn;
    cxGrid1DBTableView1CONTATO_NOMECOMPLETO: TcxGridDBColumn;
    cxGrid1DBTableView1CONTATO_DT_NASCIMENTO: TcxGridDBColumn;
    cxGrid1DBTableView1CONTATO_SITUACAO: TcxGridDBColumn;
    cxGrid1DBTableView1MENSALIDADE_REFER: TcxGridDBColumn;
    cxGrid1DBTableView1MENSALIDADE_DATAVENCIMENTO: TcxGridDBColumn;
    cxGrid1DBTableView1ORIGEM_ORIGEMPAGAMENTO: TcxGridDBColumn;
    cxGrid1DBTableView1PGTO_DATAPAGAMENTO: TcxGridDBColumn;
    cxGrid1DBTableView1PGTO_VALOR: TcxGridDBColumn;
    cxGrid1DBTableView1PGTO_FORMAPAGAMENTO: TcxGridDBColumn;
    cxGrid1DBTableView1PGTO_OBSERVACAO: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmbPesqCampoPropertiesChange(Sender: TObject);
    procedure edtPesqTextoPropertiesChange(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaDadosAntigos: TfrmConsultaDadosAntigos;

implementation

{$R *.dfm}

uses uModule, uGlobal, uFuncao;

procedure TfrmConsultaDadosAntigos.btnSairClick(Sender: TObject);
begin
  inherited;

   Close;
end;

procedure TfrmConsultaDadosAntigos.cmbPesqCampoPropertiesChange(
  Sender: TObject);
begin
  inherited;

   {dtModule.oldVDadosAntigoCompleto.DisableControls;

   dtModule.oldVDadosAntigoCompleto.Active := False;
   dtModule.oldVDadosAntigoCompleto.Active := True;

   dtModule.oldVDadosAntigoCompleto.Filtered := False;

   dtModule.oldVDadosAntigoCompleto.First;

   dtModule.oldVDadosAntigoCompleto.EnableControls;

   edtPesqTexto.Clear;
   edtPesqTexto.SetFocus;}
end;

procedure TfrmConsultaDadosAntigos.edtPesqTextoPropertiesChange(
  Sender: TObject);
begin
  inherited;

   {dtModule.oldVDadosAntigoCompleto.Filtered := False;

   if not dtModule.oldVDadosAntigoCompleto.IsEmpty then
      begin
         dtModule.oldVDadosAntigoCompleto.DisableControls;

         if cmbPesqCampo.ItemIndex = 0 then
            dtModule.oldVDadosAntigoCompleto.Filter := 'CONTATO_MATRICULA LIKE ' + QuotedStr('%' + LowerCase(Trim(edtPesqTexto.Text)) + '%')
         else if cmbPesqCampo.ItemIndex = 1 then
            dtModule.oldVDadosAntigoCompleto.Filter := 'CONTATO_NOMECOMPLETO LIKE ' + QuotedStr('%' + LowerCase(Trim(edtPesqTexto.Text)) + '%');

         dtModule.oldVDadosAntigoCompleto.Filtered := True;

         dtModule.oldVDadosAntigoCompleto.EnableControls;
      end;}
end;

procedure TfrmConsultaDadosAntigos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

   dtModule.oldVDadosAntigoCompleto.Active := False;
end;

procedure TfrmConsultaDadosAntigos.FormShow(Sender: TObject);
begin
  inherited;

   dtModule.oldVDadosAntigoCompleto.Active := False;
   dtModule.oldVDadosAntigoCompleto.Active := True;
end;

end.
