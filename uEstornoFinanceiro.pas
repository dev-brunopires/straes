unit uEstornoFinanceiro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroPadrao, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, cxControls,
  dxBarBuiltInMenu, cxClasses, cxLocalization, ACBrBase, ACBrEnterTab, cxPC,
  Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls, cxContainer, cxEdit, cxLabel,
  cxTextEdit, cxMemo, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter;

type
  TfrmEstornoFinanceiro = class(TfrmCadastroPadrao)
    GroupBox1: TGroupBox;
    mmObservacao: TcxMemo;
    cxLabel7: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEstornoFinanceiro: TfrmEstornoFinanceiro;

implementation

{$R *.dfm}

uses uGlobal, uFuncao, uModule;

procedure TfrmEstornoFinanceiro.btnCancelarClick(Sender: TObject);
begin
  inherited;

  	Close;
end;

procedure TfrmEstornoFinanceiro.btnSalvarClick(Sender: TObject);
begin
  inherited;

  	if mmObservacao.Text <> '' then
   	begin
         try
            with dtModule, ADOStoredProc do
               begin
                  ProcedureName := '[sis].[P_FINANCEIRO_ESTORNO_INSERT]';
                  Parameters.Refresh;

                  Parameters.ParamByName('@ID_FINANCEIRO').Value 	  := glbIdFinanceiro;
                  Parameters.ParamByName('@OBSERVACAO').Value 	     := Trim(mmObservacao.Text);
                  Parameters.ParamByName('@USUARIO_OPERACAO').Value := glbUsuario;

                  ExecProc;
               end;

            btnCancelar.OnClick(Self);
         except
            on E : Exception do
               Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
         end;
      end
   else
   	begin
         Notificacao('Informe o motivo do estorno do débito.');
         mmObservacao.SetFocus;
      end;
end;

procedure TfrmEstornoFinanceiro.FormCreate(Sender: TObject);
begin
  inherited;

	Brush.Style := bsClear;

   TraducaoFormulario('TraduçãoDev.ini', locCargo);
end;

procedure TfrmEstornoFinanceiro.FormShow(Sender: TObject);
begin
  inherited;

	mmObservacao.SetFocus;
end;

end.
