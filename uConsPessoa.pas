unit uConsPessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer, Vcl.Menus,
  Vcl.StdCtrls, cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, Vcl.ExtCtrls, cxLocalization, ACBrBase,
  ACBrEnterTab;

type
  TfrmConsPessoa = class(TForm)
    EnterTab: TACBrEnterTab;
    locCargo: TcxLocalizer;
    pnlCentral: TPanel;
    pnlParametros: TPanel;
    pnlBotoes: TPanel;
    btnSalvar: TcxButton;
    btnCancelar: TcxButton;
    GroupBox2: TGroupBox;
    edtPesquisa: TcxTextEdit;
    cxButton1: TcxButton;
    cbAtivo: TCheckBox;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1MATRICULA1: TcxGridDBColumn;
    cxGrid1DBTableView1NOME1: TcxGridDBColumn;
    cxGrid1DBTableView1DT_NASCIMENTO1: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    btnCadFormaPagamento: TcxButton;
    btbAltFormaPagamento: TcxButton;
    procedure FormShow(Sender: TObject);
    procedure cxTextEdit1PropertiesChange(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbAtivoClick(Sender: TObject);
    procedure btnCadFormaPagamentoClick(Sender: TObject);
    procedure btbAltFormaPagamentoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsPessoa: TfrmConsPessoa;

implementation

{$R *.dfm}

uses uModule, uFuncao, uGlobal, uCadastroPessoa;

procedure TfrmConsPessoa.btbAltFormaPagamentoClick(Sender: TObject);
begin
  	BtnAltCons(TfrmCadastroPessoa, frmCadastroPessoa, dtModule.sisVDadosPessoa, 'Pessoa', dtModule.sisVDadosPessoa.FieldByName('NOME').AsString, 'Cadastro de Pessoa', 'Informe uma pessoa para ser alterada.');
end;

procedure TfrmConsPessoa.btnCadFormaPagamentoClick(Sender: TObject);
begin
  	BtnCadCons(TfrmCadastroPessoa, frmCadastroPessoa, 'Cadastro de Pessoa');
end;

procedure TfrmConsPessoa.btnCancelarClick(Sender: TObject);
begin
   glbConsMatricula  := '';
   glbConsNomePessoa := '';

   Close;
end;

procedure TfrmConsPessoa.btnSalvarClick(Sender: TObject);
begin
   if not dtModule.sisVDadosPessoa.IsEmpty then
      begin
         glbConsMatricula  := dtModule.sisVDadosPessoa.FieldByName('MATRICULA').AsString;
         glbConsNomePessoa := dtModule.sisVDadosPessoa.FieldByName('NOME').AsString;

         Close;
      end
   else
      begin
         Notificacao('Nenhum registro foi encontrado.');
      end;
end;

procedure TfrmConsPessoa.cbAtivoClick(Sender: TObject);
begin
   with dtModule.sisVDadosPessoa do
      begin
         Filtered := False;

         if cbAtivo.Checked then
            begin
               Filter := 'ATIVO = 1';

               Filtered := True;
            end;
      end;
end;

procedure TfrmConsPessoa.cxTextEdit1PropertiesChange(Sender: TObject);
begin
   with dtModule.sisVDadosPessoa do
      begin
         Filtered := False;

         if Trim(edtPesquisa.Text) <> '' then
            begin
               if not IsEmpty then
                  begin
                     Filter   := 'NOME LIKE ' + QuotedStr('%' + LowerCase(edtPesquisa.Text) + '%');

                     Filtered := True;
                  end;
            end;
      end;
end;

procedure TfrmConsPessoa.FormCreate(Sender: TObject);
begin

	Brush.Style := bsClear;

   TraducaoFormulario('TraduçãoDev.ini', locCargo);
end;

procedure TfrmConsPessoa.FormShow(Sender: TObject);
begin
   dtModule.sisVDadosPessoa.Active := False;
   dtModule.sisVDadosPessoa.Active := True;

  	edtPesquisa.SetFocus;
end;

end.
