unit uLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxGDIPlusClasses, Vcl.ExtCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
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
  dxSkinXmas2008Blue, Vcl.StdCtrls, cxLabel, ShellApi, {RxCtrls,} Vcl.Menus,
  cxButtons, Vcl.Buttons, cxClasses, cxLocalization, ACBrBase, ACBrEnterTab;

type
  TfrmLogin = class(TForm)
    imgFundo: TImage;
    lblSistema: TcxLabel;
    lblMSTI: TcxLabel;
    lblCliente: TcxLabel;
    lblUsuario: TcxLabel;
    lblSenha: TcxLabel;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    lblEsqueciSenha: TcxLabel;
    btnEntrar: TcxButton;
    btnSair: TcxButton;
    lblSite: TcxLabel;
    locCargo: TcxLocalizer;
    lblVersao: TcxLabel;
    lblEmail: TcxLabel;
    ACBrEnterTab: TACBrEnterTab;
    procedure FormCreate(Sender: TObject);
    procedure lblEsqueciSenhaClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnEntrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lblSiteMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lblSiteMouseLeave(Sender: TObject);
    procedure lblEmailClick(Sender: TObject);
    procedure lblEmailMouseLeave(Sender: TObject);
    procedure lblEmailMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lblSiteClick(Sender: TObject);
    procedure lblEsqueciSenhaMouseLeave(Sender: TObject);
    procedure lblEsqueciSenhaMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure imgFundoClick(Sender: TObject);
  private
    { Private declarations }
    function ValidaCampos : Boolean;
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

uses uSplash, uFuncao, uRecuperaSenha, uGlobal;

procedure TfrmLogin.lblEsqueciSenhaClick(Sender: TObject);
begin
   try
      Application.CreateForm(TfrmRecuperaSenha, frmRecuperaSenha);
      frmRecuperaSenha.ShowModal;
   finally
      frmRecuperaSenha.Free;
   end;
end;

function TfrmLogin.ValidaCampos: Boolean;
begin
   Result := False;

   if edtUsuario.Text = '' then
      begin
         Notificacao('Informe o usuário.');
         edtUsuario.SetFocus;
      end
   else if edtSenha.Text = '' then
      begin
         Notificacao('Informe a senha.');
         edtSenha.SetFocus;
      end
   else
      Result := True;
end;

procedure TfrmLogin.btnEntrarClick(Sender: TObject);
begin
   if ValidaCampos then
      begin
         if VerificaAcesso( edtUsuario.Text, edtSenha.Text ) then
            Close
         else
            begin
               Notificacao('Usuário ou senha incorretos.');
               edtUsuario.SetFocus;
            end;
      end;
end;

procedure TfrmLogin.btnSairClick(Sender: TObject);
begin
	Application.Terminate;
end;

procedure TfrmLogin.lblSiteClick(Sender: TObject);
begin
	ShellExecute(Application.Handle, 'open', 'http://stimarques.com.br/', nil, nil, 0);
end;

procedure TfrmLogin.lblSiteMouseLeave(Sender: TObject);
begin
	TcxLabel(Sender).Style.Font.Color := clWhite;
  	TcxLabel(Sender).Style.Font.Style := [];
  	Cursor := crDefault;
end;

procedure TfrmLogin.lblEmailMouseLeave(Sender: TObject);
begin
	TcxLabel(Sender).Style.Font.Color := clWhite;
  	TcxLabel(Sender).Style.Font.Style := [];
  	Cursor := crDefault;
end;

procedure TfrmLogin.lblEsqueciSenhaMouseLeave(Sender: TObject);
begin
	TcxLabel(Sender).Style.Font.Color := clWhite;
  	TcxLabel(Sender).Style.Font.Style := [];
  	Cursor := crDefault;
end;

procedure TfrmLogin.lblSiteMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
	TcxLabel(Sender).Style.Font.Color := clYellow;
  	TcxLabel(Sender).Style.Font.Style := [fsUnderline];
  	Cursor := crHandPoint;
end;

procedure TfrmLogin.lblEmailMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
	TcxLabel(Sender).Style.Font.Color := clYellow;
  	TcxLabel(Sender).Style.Font.Style := [fsUnderline];
  	Cursor := crHandPoint;
end;

procedure TfrmLogin.lblEsqueciSenhaMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
	TcxLabel(Sender).Style.Font.Color := clYellow;
  	TcxLabel(Sender).Style.Font.Style := [fsUnderline];
  	Cursor := crHandPoint;
end;

procedure TfrmLogin.lblEmailClick(Sender: TObject);
begin
	ShellExecute(handle,'open', 'mailto:suporte@stimarques.com.br', nil, nil, sw_show);
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
	Brush.Style := bsClear;

   TraducaoFormulario('TraduçãoDev.ini', locCargo);

	try
      Application.CreateForm(TfrmSplash, frmSplash);
      frmSplash.ShowModal;
   finally
      frmSplash.Free;
   end;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
	lblVersao.Caption := glbVersao;
   edtUsuario.SetFocus;
end;

procedure TfrmLogin.imgFundoClick(Sender: TObject);
begin

end;

end.
