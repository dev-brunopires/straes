unit uConexao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls, System.IniFiles,
  Vcl.Imaging.pngimage, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  Vcl.Menus, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
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
  dxSkinXmas2008Blue, cxButtons, cxClasses, cxLocalization;

type
  TfrmConexao = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    SpeedButton2: TSpeedButton;
    Image1: TImage;
    edtServidor: TEdit;
    edtBase: TEdit;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    cxButton1: TcxButton;
    locCargo: TcxLocalizer;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SpeedButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
    function DadosConexao : Boolean;
  public
    { Public declarations }
    lclDadosConexao : Boolean;
  end;

var
  frmConexao: TfrmConexao;

implementation

{$R *.dfm}

uses uGlobal, uModule, uFuncao;

procedure TfrmConexao.cxButton1Click(Sender: TObject);
begin
   if DadosConexao then
      Close;
end;

function TfrmConexao.DadosConexao: Boolean;
begin
   Result := False;
   lclDadosConexao := False;

   if ( edtServidor.Text = '' ) then
      begin
         Application.MessageBox('Por favor, informe o nome do servidor.', PChar(Application.Title), MB_ICONINFORMATION);
         edtServidor.SetFocus;
      end
   else if ( edtBase.Text = '' ) then
      begin
         Application.MessageBox('Por favor, informe o nome da base de dados.', PChar(Application.Title), MB_ICONINFORMATION);
         edtBase.SetFocus;
      end
   else if ( edtUsuario.Text = '' ) then
      begin
         Application.MessageBox('Por favor, informe o usuário do servidor.', PChar(Application.Title), MB_ICONINFORMATION);
         edtUsuario.SetFocus;
      end
   else if ( edtSenha.Text = '' ) then
      begin
         Application.MessageBox('Por favor, informe a senha do servidor.', PChar(Application.Title), MB_ICONINFORMATION);
         edtSenha.SetFocus;
      end
   else
      begin
         glbDatabase := edtBase.Text;
         glbPassword := edtSenha.Text;
         glbUser     := edtUsuario.Text;
         glbLocal    := edtServidor.Text;

         Result := True;

         lclDadosConexao := True;
      end;
end;

procedure TfrmConexao.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   if not ( lclDadosConexao ) then
      CanClose := Application.MessageBox('Atenção!'#13'Deseja realmente sair do sistema?', PChar(Application.Title), MB_YESNO Or MB_ICONQUESTION ) = IDYES;
end;

procedure TfrmConexao.FormCreate(Sender: TObject);
begin
   Brush.Style := bsClear;

 	TraducaoFormulario('TraduçãoDev.ini', locCargo);

   lclDadosConexao := False;
end;

procedure TfrmConexao.SpeedButton2Click(Sender: TObject);
begin
   Application.Terminate;
end;

end.
