unit uAlteraReferencia;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroPadrao, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, cxControls,
  dxBarBuiltInMenu, cxClasses, cxLocalization, ACBrBase, ACBrEnterTab, cxPC,
  Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls, cxContainer, cxEdit, cxCurrencyEdit,
  cxLabel, cxTextEdit, cxMemo, Vcl.ComCtrls, dxCore, cxDateUtils, cxMaskEdit,
  cxDropDownEdit, cxCalendar, dxSkinsCore, dxSkinBlack, dxSkinBlue,
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
  TfrmAlteraReferencia = class(TfrmCadastroPadrao)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    cxLabel1: TcxLabel;
    edtDesconto: TcxCurrencyEdit;
    cxLabel7: TcxLabel;
    edtObservacao: TcxTextEdit;
    edtVencimento: TcxDateEdit;
    cxLabel2: TcxLabel;
    cxLabel8: TcxLabel;
    lblValor: TcxLabel;
    GroupBox3: TGroupBox;
    cxLabel3: TcxLabel;
    lblCorrigido: TcxLabel;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtDescontoExit(Sender: TObject);
    procedure edtJurosExit(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure edtVencimentoExit(Sender: TObject);
  private
    { Private declarations }
    procedure AtualizaValores;

    function ValidaCampos : Boolean;
  public
    { Public declarations }
  end;

var
  frmAlteraReferencia: TfrmAlteraReferencia;

implementation

{$R *.dfm}

uses uGlobal, uFuncao, uModule;

procedure TfrmAlteraReferencia.btnCancelarClick(Sender: TObject);
begin
  inherited;

  	Close;
end;

procedure TfrmAlteraReferencia.btnSalvarClick(Sender: TObject);
begin
  inherited;

  	if ValidaCampos then
   	begin
      	try
            with dtModule, ADOStoredProc do
               begin
                  ProcedureName := '[sis].[P_FINANCEIRO_ALTERACAO_INSERT]';
                  Parameters.Refresh;

                  Parameters.ParamByName('@ID_FINANCEIRO').Value 	  		:= glbIdFinanceiro;
                  Parameters.ParamByName('@DT_VENCIMENTO').Value 	  		:= edtVencimento.Date;
                  Parameters.ParamByName('@VL_DESCONTO_ORIGINAL').Value := glbDesconto;
                  Parameters.ParamByName('@VL_DESCONTO').Value 	  		:= edtDesconto.Value;
                  Parameters.ParamByName('@VL_JUROS_ORIGINAL').Value 	:= 0;
                  Parameters.ParamByName('@VL_JUROS').Value 	  			:= 0;
                  Parameters.ParamByName('@OBSERVACAO').Value 	  			:= edtObservacao.Text;
                  Parameters.ParamByName('@USUARIO_OPERACAO').Value 		:= glbUsuario;

                  ExecProc;
               end;

            btnCancelar.OnClick(Self);
         except
            on E : Exception do
               Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
         end;
      end;
end;

procedure TfrmAlteraReferencia.edtDescontoExit(Sender: TObject);
begin
  inherited;

  	AtualizaValores;
end;

procedure TfrmAlteraReferencia.edtJurosExit(Sender: TObject);
begin
  inherited;

  	AtualizaValores;
end;

procedure TfrmAlteraReferencia.edtVencimentoExit(Sender: TObject);
begin
  inherited;

  	if ( edtVencimento.Text = '' ) or ( edtVencimento.Text = '30/12/1899' ) then
   	begin
	   	edtVencimento.Date := Date();
      end
   else if edtVencimento.Date < Date() then
   	begin
			Notificacao('Informe uma data de vencimento maior ou igual a data atual.');
         edtVencimento.Date := Date();
         edtVencimento.SetFocus;
      end;

end;

procedure TfrmAlteraReferencia.FormShow(Sender: TObject);
begin
  inherited;

  	edtVencimento.Date   := Date();
  	lblValor.Caption     := FormatFloat('###,###,##0.00', glbValor );
   edtDesconto.Value    := glbDesconto;
   lblCorrigido.Caption := FormatFloat('###,###,##0.00', ( ( glbValor - glbDesconto ) + glbJuros ) );

   edtDesconto.SetFocus;
end;

function TfrmAlteraReferencia.ValidaCampos: Boolean;
begin
	Result := False;

   if ( edtVencimento.Text = '' ) or ( edtVencimento.Text = '  /  /    ' ) or ( edtVencimento.Text = '30/12/1899' ) then
   	begin
      	Notificacao('Informe a data de vencimento.');
         edtVencimento.SetFocus;
      end
	else if edtDesconto.Text = '' then
   	begin
      	Notificacao('Informe um valor para desconto. Caso não tenha desconto, informe R$ 0,00.');
         edtDesconto.SetFocus;
      end
   else if edtObservacao.Text = '' then
   	begin
      	Notificacao('Informe o motivo da alteração.');
         edtObservacao.SetFocus;
      end
   else
   	Result := True;
end;

procedure TfrmAlteraReferencia.AtualizaValores;
begin
	if ( edtDesconto.Text <> '' ) then
   	lblCorrigido.Caption := FormatFloat('###,###,##0.00', ( ( glbValor - edtDesconto.Value ) + 0 ) );
end;

end.
