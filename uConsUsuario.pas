unit uConsUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uConsPadrao, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore, dxSkinBlack, dxSkinBlue,
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
  dxSkinXmas2008Blue, cxControls, cxContainer, cxEdit, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxLocalization, ACBrBase, ACBrEnterTab,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Vcl.StdCtrls, cxTextEdit,
  cxButtons, Vcl.ExtCtrls;

type
  TfrmConsUsuario = class(TfrmConsPadrao)
    cxGrid1DBTableView1ID_USUARIO: TcxGridDBColumn;
    cxGrid1DBTableView1LOGIN: TcxGridDBColumn;
    cxGrid1DBTableView1NOME: TcxGridDBColumn;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure edtPesquisaPropertiesChange(Sender: TObject);
    procedure cbAnoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCadFormaPagamentoClick(Sender: TObject);
    procedure btbAltFormaPagamentoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsUsuario: TfrmConsUsuario;

implementation

{$R *.dfm}

uses uModule, uGlobal, uFuncao, uCadastroUsuario;

procedure TfrmConsUsuario.btbAltFormaPagamentoClick(Sender: TObject);
begin
  inherited;

  	BtnAltCons(TfrmCadastroUsuario, frmCadastroUsuario, dtModule.cfgUsuario, 'Usuario', dtModule.cfgUsuario.FieldByName('NOME').AsString, 'Cadastro de Usuário', 'Informe um usuário para ser alterado.');
end;

procedure TfrmConsUsuario.btnCadFormaPagamentoClick(Sender: TObject);
begin
  inherited;

  	BtnCadCons(TfrmCadastroUsuario, frmCadastroUsuario, 'Cadastro de Usuário');
end;

procedure TfrmConsUsuario.btnCancelarClick(Sender: TObject);
begin
  inherited;

   glbConsCodigo      := '';
   glbConsNomeUsuario := '';

   Close;
end;

procedure TfrmConsUsuario.btnSalvarClick(Sender: TObject);
begin
  inherited;

   if not dtModule.cfgUsuario.IsEmpty then
      begin
         glbConsCodigo      := IntToStr(dtModule.cfgUsuario.FieldByName('ID_USUARIO').AsInteger);
         glbConsNomeUsuario := dtModule.cfgUsuario.FieldByName('NOME').AsString;

         Close;
      end
   else
      begin
         Notificacao('Nenhum registro foi encontrado.');
      end;
end;

procedure TfrmConsUsuario.cbAnoClick(Sender: TObject);
begin
  inherited;

   with dtModule.cfgUsuario do
      begin
         Filtered := False;

         if cbAtivo.Checked then
            begin
               Filter := 'ATIVO = 1';

               Filtered := True;
            end;
      end;
end;

procedure TfrmConsUsuario.edtPesquisaPropertiesChange(Sender: TObject);
begin
  inherited;

   with dtModule.cfgUsuario do
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

procedure TfrmConsUsuario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

   dtModule.cfgUsuario.Active := False;
end;

procedure TfrmConsUsuario.FormShow(Sender: TObject);
begin
  inherited;

  with dtModule.cfgUsuario do
      begin
         Active := True;

         Filtered := False;

         Filter := 'ATIVO = 1';

         Filtered := True;
      end;

  edtPesquisa.SetFocus;
end;

end.
