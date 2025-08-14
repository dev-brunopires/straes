unit uPagamento;

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
  cxButtons, Vcl.ExtCtrls, cxContainer, cxEdit, cxLabel, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, Vcl.ComCtrls, dxCore, cxDateUtils, cxCalendar, cxCurrencyEdit;

type
  TfrmPagamento = class(TfrmCadastroPadrao)
    GroupBox1: TGroupBox;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    GroupBox2: TGroupBox;
    cmbFormaPagamento: TcxComboBox;
    btnCadFormaPagamento: TcxButton;
    btbAltFormaPagamento: TcxButton;
    cxLabel4: TcxLabel;
    edtDataPagamento: TcxDateEdit;
    cxLabel5: TcxLabel;
    edtPagamentoDesconto: TcxCurrencyEdit;
    edtPagamentoTotal: TcxCurrencyEdit;
    procedure btnCadFormaPagamentoClick(Sender: TObject);
    procedure btbAltFormaPagamentoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure edtDataPagamentoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPagamento: TfrmPagamento;

implementation

{$R *.dfm}

uses uFuncao, uGlobal, uModule, uCadastroFormaPagamento, uTesouraria,
  uConsPessoa;

procedure TfrmPagamento.btbAltFormaPagamentoClick(Sender: TObject);
begin
  inherited;

  	BtnAlt(TfrmCadastroFormaPagamento, frmCadastroFormaPagamento, cmbFormaPagamento, 'Forma de Pagamento', 'Cadastro de Forma de Pagamento', 'Informe uma forma de pagamento para ser alterada.');
end;

procedure TfrmPagamento.btnCadFormaPagamentoClick(Sender: TObject);
begin
  inherited;

  	BtnCad(TfrmCadastroFormaPagamento, frmCadastroFormaPagamento, cmbFormaPagamento, 'Forma de Pagamento', 'Cadastro de Forma de Pagamento');
end;

procedure TfrmPagamento.btnCancelarClick(Sender: TObject);
begin
  inherited;

   glbFinalizaPagamento := False;
   Close;
end;

procedure TfrmPagamento.btnSalvarClick(Sender: TObject);
begin
  inherited;

   if edtDataPagamento.Text = '' then
      begin
         Notificacao('Informe uma data de pagamento.');
         edtDataPagamento.SetFocus;
      end
   else if cmbFormaPagamento.ItemIndex = -1 then
      begin
         Notificacao('Informe uma forma de pagamento.');
         cmbFormaPagamento.SetFocus;
      end
   else
      begin
         glbFinalizaPagamento := True;
         glbDataPagamento     := edtDataPagamento.Date;
         glbIdFormaPagamento  := RetornaIdFormaPagamento(cmbFormaPagamento.Text);
         glbFormaPagamento    := cmbFormaPagamento.Text;

         Close;
      end;
end;

procedure TfrmPagamento.edtDataPagamentoExit(Sender: TObject);
begin
  inherited;

   if edtDataPagamento.Text <> '' then
      begin
         if edtDataPagamento.Date > Now() then
            begin
               Notificacao('Não é permitido inserir uma data de pagamento maior que a data atual.');
               edtDataPagamento.SetFocus;
            end;
      end;
end;

procedure TfrmPagamento.FormCreate(Sender: TObject);
begin
  inherited;

	Brush.Style := bsClear;

   TraducaoFormulario('TraduçãoDev.ini', locCargo);
end;

procedure TfrmPagamento.FormShow(Sender: TObject);
begin
  inherited;

   glbFinalizaPagamento := False;

   edtPagamentoDesconto.Value := StrToCurr(glbLabelDesconto);
   edtPagamentoTotal.Value    := StrToCurr(glbLabelTotal);

   edtDataPagamento.Date := Date();

   CarregaFormaPagamento(cmbFormaPagamento);

   cmbFormaPagamento.SetFocus;
end;

end.
