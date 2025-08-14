unit uCadastroFilantropia;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroPadrao, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, cxControls,
  dxBarBuiltInMenu, cxClasses, cxLocalization, ACBrBase, ACBrEnterTab, cxPC,
  Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls, cxContainer, cxEdit, cxCurrencyEdit,
  cxTextEdit, cxLabel, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
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
  TfrmCadastroFilantropia = class(TfrmCadastroPadrao)
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    edtDescricao: TcxTextEdit;
    edtValor: TcxCurrencyEdit;
    cxLabel3: TcxLabel;
    edtPercentual: TcxCurrencyEdit;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
    procedure CarregaInformacoes;

    function ValidaCampos : Boolean;
  public
    { Public declarations }
  end;

var
  frmCadastroFilantropia: TfrmCadastroFilantropia;

implementation

{$R *.dfm}

uses uFuncao, uGlobal, uModule;

procedure TfrmCadastroFilantropia.btnCancelarClick(Sender: TObject);
begin
  inherited;

  	Close;
end;

procedure TfrmCadastroFilantropia.btnSalvarClick(Sender: TObject);
begin
  inherited;

  	if ValidaCampos then
   	begin
      	try
            with dtModule, ADOStoredProc do
               begin
                  if glbOperacao = 'I' then
                     begin
                        ProcedureName := '[sis].[P_FILANTROPIA_INSERT]';
                        Parameters.Refresh;
                     end
                  else if glbOperacao = 'A' then
                     begin
                        ProcedureName := '[sis].[P_FILANTROPIA_UPDATE]';
                        Parameters.Refresh;
                        Parameters.ParamByName('@ID_FILANTROPIA').Value := glbIdFilantropia;
                     end;

                  Parameters.ParamByName('@DESCRICAO').Value   	  := Trim(edtDescricao.Text);

                  if edtPercentual.Value = 0 then
                  	Parameters.ParamByName('@PERCENTUAL').Value       := 0
                  else if edtPercentual.Value > 0 then
                  	Parameters.ParamByName('@PERCENTUAL').Value       := edtPercentual.Value
                  else
                  	Parameters.ParamByName('@PERCENTUAL').Value       := 0;

                  if edtValor.Value = 0 then
                  	Parameters.ParamByName('@VALOR').Value       := 0
                  else if edtValor.Value > 0 then
                  	Parameters.ParamByName('@VALOR').Value       := edtValor.Value
                  else
                  	Parameters.ParamByName('@VALOR').Value       := 0;

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

procedure TfrmCadastroFilantropia.CarregaInformacoes;
begin
	with dtModule.ADOQuery, SQL do
   	begin
         Close;

         Clear;

         Add(' SELECT DESCRICAO, PERCENTUAL, VALOR                     ');
         Add(' FROM [sis].[FILANTROPIA]                                ');
         Add(' WHERE ID_FILANTROPIA = ' + IntToStr( glbIdFilantropia )  );

         Open;

         if not IsEmpty then
         	begin
         		edtDescricao.Text   := FieldByName('DESCRICAO').AsString;

               if FieldByName('PERCENTUAL').AsCurrency > 100 then
               	edtPercentual.Value := 100
               else
               	edtPercentual.Value := FieldByName('PERCENTUAL').AsCurrency;

               edtValor.Value      := FieldByName('VALOR').AsCurrency;
            end;

         Close;
      end;
end;

procedure TfrmCadastroFilantropia.FormCreate(Sender: TObject);
begin
  inherited;

	Brush.Style := bsClear;

   TraducaoFormulario('TraduçãoDev.ini', locCargo);
end;

procedure TfrmCadastroFilantropia.FormShow(Sender: TObject);
begin
  inherited;

	if glbOperacao = 'A' then
   	CarregaInformacoes
   else
   	glbIdFilantropia := 0;

	edtDescricao.SetFocus;
end;

function TfrmCadastroFilantropia.ValidaCampos: Boolean;
begin
	Result := False;

   if edtDescricao.Text = '' then
   	begin
         Notificacao('Informe a descrição da filantropia.');
         edtDescricao.SetFocus;
      end
   else if ( edtPercentual.Value = 0 ) and ( edtValor.Value = 0 ) then
   	begin
      	Notificacao('Informe o valor monetário [R$] ou o percentual de desconto [%] da filantropia.');
         edtValor.SetFocus;
      end
   else if ( edtPercentual.Value > 0 ) and ( edtValor.Value > 0 ) then
   	begin
      	Notificacao('Informe apenas um registro para a filantropia (valor monetário [R$] ou percentual de desconto [%]).');
         edtValor.SetFocus;
      end
   else if not ValidaFilantropiaCadastrado( glbIdFilantropia, edtDescricao.Text ) then
   	begin
         Notificacao('A filantropia informada já está cadastrada em nosso sistema.');
         edtDescricao.SetFocus;
      end
   else
   	Result := True;
end;

end.
