unit uCadastroTipoPagamentoDiverso;

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
  cxButtons, Vcl.ExtCtrls, cxContainer, cxEdit, cxLabel, cxTextEdit;

type
  TfrmCadastroTipoPagamentoDiverso = class(TfrmCadastroPadrao)
    edtDescricao: TcxTextEdit;
    cxLabel1: TcxLabel;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure CarregaInformacoes;

    function ValidaCampos : Boolean;
  public
    { Public declarations }
  end;

var
  frmCadastroTipoPagamentoDiverso: TfrmCadastroTipoPagamentoDiverso;

implementation

{$R *.dfm}

uses uGlobal, uFuncao, uModule;

{ TfrmCadastroTipoPagamentoDiverso }

procedure TfrmCadastroTipoPagamentoDiverso.btnCancelarClick(Sender: TObject);
begin
  inherited;

  	Close;
end;

procedure TfrmCadastroTipoPagamentoDiverso.btnSalvarClick(Sender: TObject);
begin
  inherited;

  	if ValidaCampos then
   	begin
      	try
            with dtModule, ADOStoredProc do
               begin
                  if glbOperacao = 'I' then
                     begin
                        ProcedureName := '[sis].[P_TIPO_PAGAMENTO_DIVERSO_INSERT]';
                        Parameters.Refresh;
                     end
                  else if glbOperacao = 'A' then
                     begin
                        ProcedureName := '[sis].[P_TIPO_PAGAMENTO_DIVERSO_UPDATE]';
                        Parameters.Refresh;
                        Parameters.ParamByName('@ID_TIPO_PAGAMENTO_DIVERSO').Value := glbIdTipoPagamentoDiverso;
                     end;

                  Parameters.ParamByName('@DESCRICAO').Value   	  := Trim(edtDescricao.Text);
                  Parameters.ParamByName('@USUARIO_OPERACAO').Value := glbUsuario;

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

procedure TfrmCadastroTipoPagamentoDiverso.CarregaInformacoes;
begin
	with dtModule.ADOQuery, SQL do
   	begin
         Close;

         Clear;

         Add(' SELECT DESCRICAO                                                            ');
         Add(' FROM [sis].[TIPO_PAGAMENTO_DIVERSO]                                         ');
         Add(' WHERE ID_TIPO_PAGAMENTO_DIVERSO = ' + IntToStr( glbIdTipoPagamentoDiverso )  );

         Open;

         if not IsEmpty then
         	edtDescricao.Text := FieldByName('DESCRICAO').AsString;

         Close;
      end;
end;

procedure TfrmCadastroTipoPagamentoDiverso.FormCreate(Sender: TObject);
begin
  inherited;

	Brush.Style := bsClear;

   TraducaoFormulario('TraduçãoDev.ini', locCargo);
end;

procedure TfrmCadastroTipoPagamentoDiverso.FormShow(Sender: TObject);
begin
  inherited;

	if glbOperacao = 'A' then
   	CarregaInformacoes
   else
      glbIdPlano := 0;

	edtDescricao.SetFocus;
end;

function TfrmCadastroTipoPagamentoDiverso.ValidaCampos: Boolean;
begin
	Result := False;

   if edtDescricao.Text = '' then
   	begin
         Notificacao('Informe a descrição do tipo de pagamento diverso.');
         edtDescricao.SetFocus;
      end
   else if not ValidaTipoPagamentoDiversoCadastrado( glbIdTipoPagamentoDiverso, edtDescricao.Text ) then
   	begin
         Notificacao('O tipo de pagamento diverso informado já está cadastrado em nosso sistema.');
         edtDescricao.SetFocus;
      end
   else
   	Result := True;
end;

end.
