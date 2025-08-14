unit uCadastroModulo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroPadrao, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, cxControls,
  dxBarBuiltInMenu, cxClasses, cxLocalization, ACBrBase, ACBrEnterTab, cxPC,
  Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls, cxContainer, cxEdit, cxLabel,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue,
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
  TfrmCadastroModulo = class(TfrmCadastroPadrao)
    edtDescricao: TcxTextEdit;
    cxLabel1: TcxLabel;
    edtComponente: TcxTextEdit;
    cxLabel3: TcxLabel;
    cmbModuloPai: TcxComboBox;
    cxLabel17: TcxLabel;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
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
  frmCadastroModulo: TfrmCadastroModulo;

implementation

{$R *.dfm}

uses uFuncao, uGlobal, uModule;

procedure TfrmCadastroModulo.btnCancelarClick(Sender: TObject);
begin
  inherited;

  	Close;
end;

procedure TfrmCadastroModulo.btnSalvarClick(Sender: TObject);
begin
  inherited;

  	if ValidaCampos then
   	begin
      	try
            with dtModule, ADOStoredProc do
               begin
                  if glbOperacao = 'I' then
                     begin
                        ProcedureName := '[cfg].[P_MODULO_INSERT]';
                        Parameters.Refresh;
                     end
                  else if glbOperacao = 'A' then
                     begin
                        ProcedureName := '[cfg].[P_MODULO_UPDATE]';
                        Parameters.Refresh;
                        Parameters.ParamByName('@ID_MODULO').Value := glbIdModulo;
                     end;

                  if cmbModuloPai.ItemIndex = -1 then
							Parameters.ParamByName('@ID_MODULO_PAI').Value := Null
                  else
                  	Parameters.ParamByName('@ID_MODULO_PAI').Value := RetornaIdModulo( cmbModuloPai.Text );

                  Parameters.ParamByName('@DESCRICAO').Value   	  := Trim(edtDescricao.Text);
                  Parameters.ParamByName('@COMPONENTE').Value   	  := Trim(edtComponente.Text);
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

procedure TfrmCadastroModulo.CarregaInformacoes;
begin
	with dtModule.ADOQuery, SQL do
   	begin
         Close;

         Clear;

         Add(' SELECT A.DESCRICAO, A.COMPONENTE, A.ID_MODULO_PAI, ');
         Add(' B.DESCRICAO AS DESCRICAO_PAI                       ');
         Add(' FROM [cfg].[MODULO] A                              ');
         Add(' LEFT JOIN [cfg].[MODULO] B                             ');
         Add('    ON ( A.ID_MODULO_PAI = B.ID_MODULO )            ');
         Add(' WHERE A.ID_MODULO = ' + IntToStr( glbIdModulo )     );

         Open;

         if not IsEmpty then
         	begin
            	cmbModuloPai.ItemIndex := cmbModuloPai.Properties.Items.IndexOf(FieldByName('DESCRICAO_PAI').AsString);
         		edtDescricao.Text      := FieldByName('DESCRICAO').AsString;
               glbComponente          := FieldByName('COMPONENTE').AsString;
               edtComponente.Text     := glbComponente;
            end;

         Close;
      end;
end;

procedure TfrmCadastroModulo.FormCreate(Sender: TObject);
begin
  inherited;

	Brush.Style := bsClear;

   TraducaoFormulario('TraduçãoDev.ini', locCargo);
end;

procedure TfrmCadastroModulo.FormShow(Sender: TObject);
begin
  inherited;

	CarregaModuloPai(cmbModuloPai);

	if glbOperacao = 'A' then
   	CarregaInformacoes
   else
   	glbComponente := '';

	edtDescricao.SetFocus;
end;

function TfrmCadastroModulo.ValidaCampos: Boolean;
begin
	Result := False;

   if edtDescricao.Text = '' then
   	begin
         Notificacao('Informe a descrição do módulo.');
         edtDescricao.SetFocus;
      end
   else if edtComponente.Text = '' then
   	begin
         Notificacao('Informe o nome do componente do módulo.');
         edtComponente.SetFocus;
      end
   else if not ValidaComponenteCadastrado( glbIdModulo, edtComponente.Text ) and
			  ( ( glbOperacao = 'I' ) or ( ( glbOperacao = 'A' ) and ( glbComponente <> edtComponente.Text ) ) ) then
   	begin
         Notificacao('O nome do componente informado já está cadastrado em nosso sistema.');
         edtComponente.SetFocus;
      end
   else
   	Result := True;
end;

end.
