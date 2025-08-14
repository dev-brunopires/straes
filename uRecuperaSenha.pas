unit uRecuperaSenha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.Menus, Vcl.StdCtrls, ShellApi,
  cxButtons, cxLabel, dxGDIPlusClasses, Vcl.ExtCtrls, cxClasses, cxLocalization,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, Vcl.Mask, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
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
  TfrmRecuperaSenha = class(TForm)
    imgFundo: TImage;
    cxButton2: TcxButton;
    lblUsuario: TcxLabel;
    btnSalvar: TcxButton;
    lblSistema: TcxLabel;
    lblCliente: TcxLabel;
    lblMSTI: TcxLabel;
    locCargo: TcxLocalizer;
    cxLabel1: TcxLabel;
    edtUsuario: TEdit;
    lblSenha: TcxLabel;
    edtSenha: TEdit;
    cxLabel2: TcxLabel;
    edtRepetirSenha: TEdit;
    edtDataNascimento: TcxDateEdit;
    procedure btnSalvarClick(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lblSiteClick(Sender: TObject);
  private
    { Private declarations }
    function ValidaCampos : Boolean;
  public
    { Public declarations }
  end;

var
  frmRecuperaSenha: TfrmRecuperaSenha;

implementation

{$R *.dfm}

uses uGlobal, uFuncao, uModule, uSplash;

procedure TfrmRecuperaSenha.btnSalvarClick(Sender: TObject);
begin
	if ( ValidaCampos ) then
   	begin
      	try
            with dtModule, ADOStoredProc do
               begin
                  ProcedureName := '[cfg].[P_USUARIO_SENHA_UPDATE]';
                  Parameters.Refresh;

                  Parameters.ParamByName('@LOGIN').Value 		  := Trim(edtUsuario.Text);
                  Parameters.ParamByName('@DT_NASCIMENTO').Value := edtDataNascimento.Date;
                  Parameters.ParamByName('@SENHA').Value 		  := Trim(edtRepetirSenha.Text);

                  ExecProc;
               end;

            Notificacao('Operação realizada com sucesso!');

            Close;
         except
            on E : Exception do
               Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
         end;
      end;
end;

procedure TfrmRecuperaSenha.cxButton2Click(Sender: TObject);
begin
   Close;
end;

procedure TfrmRecuperaSenha.FormCreate(Sender: TObject);
begin
	Brush.Style := bsClear;

   TraducaoFormulario('TraduçãoDev.ini', locCargo);
end;

procedure TfrmRecuperaSenha.FormShow(Sender: TObject);
begin
   edtUsuario.SetFocus;
end;

procedure TfrmRecuperaSenha.lblSiteClick(Sender: TObject);
begin
	ShellExecute(Application.Handle, 'open', 'http://stimarques.com.br/', nil, nil, 0);
end;

function TfrmRecuperaSenha.ValidaCampos: Boolean;
begin
   Result := False;

   if edtUsuario.Text = '' then
      begin
         Notificacao('Informe o usuário.');
         edtUsuario.SetFocus;
      end
   else if ( edtDataNascimento.Text = '' ) then
   	begin
			Notificacao('Informe a data de nascimento.');
         edtDataNascimento.SetFocus;
      end
   else if edtSenha.Text = '' then
      begin
         Notificacao('Informe a senha.');
         edtSenha.SetFocus;
      end
   else if edtRepetirSenha.Text = '' then
      begin
         Notificacao('Informe a senha novamente..');
         edtRepetirSenha.SetFocus;
      end
   else if ( edtSenha.Text <> '' ) and ( edtRepetirSenha.Text <> '' ) and ( edtSenha.Text <> edtRepetirSenha.Text ) then
   	begin
         Notificacao('As senhas informadas não são iguais.');
         edtRepetirSenha.SetFocus;
      end
   else
      Result := True;
end;

end.
