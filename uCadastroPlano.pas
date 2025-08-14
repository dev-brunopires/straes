unit uCadastroPlano;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroPadrao, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, cxControls,
  dxBarBuiltInMenu, cxClasses, cxLocalization, ACBrBase, ACBrEnterTab, cxPC,
  Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls, cxContainer, cxEdit, Vcl.Mask,
  cxLabel, cxTextEdit, cxCurrencyEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue,
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
  TfrmCadastroPlano = class(TfrmCadastroPadrao)
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    edtDescricao: TcxTextEdit;
    edtValor: TcxCurrencyEdit;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure CarregaInformacoes;

    function ValidaCampos : Boolean;
  public
    { Public declarations }
  end;

var
  frmCadastroPlano: TfrmCadastroPlano;

implementation

{$R *.dfm}

uses uGlobal, uFuncao, uModule;

{ TfrmCadastroPlano }

procedure TfrmCadastroPlano.btnCancelarClick(Sender: TObject);
begin
  inherited;

  	Close;
end;

procedure TfrmCadastroPlano.btnSalvarClick(Sender: TObject);
begin
  inherited;

  	if ValidaCampos then
   	begin
      	try
            with dtModule, ADOStoredProc do
               begin
                  if glbOperacao = 'I' then
                     begin
                        ProcedureName := '[sis].[P_PLANO_INSERT]';
                        Parameters.Refresh;
                     end
                  else if glbOperacao = 'A' then
                     begin
                        ProcedureName := '[sis].[P_PLANO_UPDATE]';
                        Parameters.Refresh;
                        Parameters.ParamByName('@ID_PLANO').Value := glbIdPlano;
                     end;

                  Parameters.ParamByName('@DESCRICAO').Value   	  := Trim(edtDescricao.Text);
                  Parameters.ParamByName('@VALOR').Value   	        := edtValor.Value;
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

procedure TfrmCadastroPlano.CarregaInformacoes;
begin
	with dtModule.ADOQuery, SQL do
   	begin
         Close;

         Clear;

         Add(' SELECT DESCRICAO, VALOR                     ');
         Add(' FROM [sis].[PLANO]                          ');
         Add(' WHERE ID_PLANO = ' + IntToStr( glbIdPlano )  );

         Open;

         if not IsEmpty then
         	begin
         		edtDescricao.Text := FieldByName('DESCRICAO').AsString;
               edtValor.Value    := FieldByName('VALOR').AsCurrency;
            end;

         Close;
      end;
end;

procedure TfrmCadastroPlano.FormCreate(Sender: TObject);
begin
  inherited;

	Brush.Style := bsClear;

   TraducaoFormulario('TraduçãoDev.ini', locCargo);
end;

procedure TfrmCadastroPlano.FormShow(Sender: TObject);
begin
  inherited;

	if glbOperacao = 'A' then
   	CarregaInformacoes
   else
      glbIdPlano := 0;

	edtDescricao.SetFocus;
end;

function TfrmCadastroPlano.ValidaCampos: Boolean;
begin
	Result := False;

   if edtDescricao.Text = '' then
   	begin
         Notificacao('Informe a descrição do plano.');
         edtDescricao.SetFocus;
      end
   else if edtValor.Value = 0 then
   	begin
      	Notificacao('Informe o valor do plano.');
         edtValor.SetFocus;
      end
   else if not ValidaPlanoCadastrado( glbIdPlano, edtDescricao.Text ) then
   	begin
         Notificacao('O plano informado já está cadastrado em nosso sistema.');
         edtDescricao.SetFocus;
      end
   else
   	Result := True;
end;

end.
