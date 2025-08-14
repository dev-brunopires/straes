unit uCadastroUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroPadrao, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, cxControls,
  dxBarBuiltInMenu, cxPC, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls, cxContainer,
  cxEdit, cxClasses, cxLocalization, Vcl.Buttons, cxTextEdit, cxLabel, ACBrBase,
  ACBrEnterTab, cxImage, Vcl.ComCtrls, dxCore, cxDateUtils, cxMaskEdit,
  cxDropDownEdit, cxCalendar, Data.DB, dxSkinsCore, dxSkinBlack, dxSkinBlue,
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
  TfrmCadastroUsuario = class(TfrmCadastroPadrao)
    GroupBox2: TGroupBox;
    cxLabel1: TcxLabel;
    edtNome: TcxTextEdit;
    cxLabel3: TcxLabel;
    edtDataNascimento: TcxDateEdit;
    GroupBox4: TGroupBox;
    rbExistente: TRadioButton;
    rbNovo: TRadioButton;
    cxLabel17: TcxLabel;
    cmbPessoa: TcxComboBox;
    btnCadPessoa: TcxButton;
    btnAltPessoa: TcxButton;
    cxLabel2: TcxLabel;
    edtLogin: TcxTextEdit;
    cxLabel4: TcxLabel;
    edtSenha: TcxTextEdit;
    edtRepetirSenha: TcxTextEdit;
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rbExistenteClick(Sender: TObject);
    procedure rbNovoClick(Sender: TObject);
    procedure btnCadPessoaClick(Sender: TObject);
    procedure btnAltPessoaClick(Sender: TObject);
    procedure cmbPessoaPropertiesChange(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    procedure CarregaInformacoes;
    procedure VerificaOrigemInformacao;

    function ValidaCampos : Boolean;
  public
    { Public declarations }
  end;

var
  frmCadastroUsuario: TfrmCadastroUsuario;

implementation

{$R *.dfm}

uses uFuncao, uGlobal, uModule, uCadastroPessoa;

procedure TfrmCadastroUsuario.btnCadPessoaClick(Sender: TObject);
begin
  inherited;

	BtnCad(TfrmCadastroPessoa, frmCadastroPessoa, cmbPessoa, 'Pessoa', 'Cadastro de Pessoa');
end;

procedure TfrmCadastroUsuario.btnAltPessoaClick(Sender: TObject);
begin
  inherited;

	BtnAlt(TfrmCadastroPessoa, frmCadastroPessoa, cmbPessoa, 'Pessoa', 'Cadastro de Pessoa', 'Informe uma pessoa para ser alterada.');
end;

procedure TfrmCadastroUsuario.btnCancelarClick(Sender: TObject);
begin
  inherited;

  	Close;
end;

procedure TfrmCadastroUsuario.btnSalvarClick(Sender: TObject);
begin
  inherited;

  	if ValidaCampos then
   	begin
      	try
            with dtModule, ADOStoredProc do
               begin
                  if glbOperacao = 'I' then
                     begin
                        ProcedureName := '[cfg].[P_USUARIO_INSERT]';
                        Parameters.Refresh;
                     end
                  else if glbOperacao = 'A' then
                     begin
                        ProcedureName := '[cfg].[P_USUARIO_UPDATE]';
                        Parameters.Refresh;
                        Parameters.ParamByName('@ID_USUARIO').Value := glbIdUsuario;
                     end;

                  Parameters.ParamByName('@NOME').Value   				:= Trim(edtNome.Text);
                  Parameters.ParamByName('@DT_NASCIMENTO').Value   	:= edtDataNascimento.Date;
                  Parameters.ParamByName('@LOGIN').Value   				:= Trim(edtLogin.Text);
                  Parameters.ParamByName('@SENHA').Value   				:= Trim(edtRepetirSenha.Text);
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

procedure TfrmCadastroUsuario.VerificaOrigemInformacao;
begin
	cmbPessoa.Enabled    := rbExistente.Checked;
   btnCadPessoa.Enabled := rbExistente.Checked;
   btnAltPessoa.Enabled := rbExistente.Checked;
end;

procedure TfrmCadastroUsuario.CarregaInformacoes;
begin
	with dtModule.ADOQuery, SQL do
   	begin
         Close;

         Clear;

         Add(' SELECT NOME, DT_NASCIMENTO, LOGIN FROM [cfg].[USUARIO] WHERE ID_USUARIO = ' + IntToStr( glbIdUsuario ) );

         Open;

         if not IsEmpty then
         	begin
         		edtNome.Text  			  := FieldByName('NOME').AsString;
               edtDataNascimento.Date := FieldByName('DT_NASCIMENTO').AsDateTime;
               edtLogin.Text 			  := FieldByName('LOGIN').AsString;
            end;

         Close;
      end;
end;

procedure TfrmCadastroUsuario.cmbPessoaPropertiesChange(Sender: TObject);
begin
  inherited;

  	if cmbPessoa.ItemIndex > -1 then
   	begin
      	if CarregaPessoaUsuario( cmbPessoa.Text ) then
         	begin
               edtNome.Text           := cmbPessoa.Text;
               edtDataNascimento.Text := glbDataNascimentoPessoa;
            end
         else
         	begin
	         	Notificacao('A pessoa informada possui cadastro de usuário. Por favor, verifica se o mesmo está ativo no sistema.');
               cmbPessoa.ItemIndex := -1;
               edtNome.Clear;
		         edtDataNascimento.Clear;
               cmbPessoa.SetFocus;
            end;
      end
   else
   	begin
         edtNome.Clear;
         edtDataNascimento.Clear;
      end;
end;

procedure TfrmCadastroUsuario.FormCreate(Sender: TObject);
begin
  inherited;

	Brush.Style := bsClear;

   TraducaoFormulario('TraduçãoDev.ini', locCargo);
end;

procedure TfrmCadastroUsuario.FormShow(Sender: TObject);
begin
  inherited;

	CarregaPessoa(cmbPessoa);

	if glbOperacao = 'A' then
   	begin
	   	CarregaInformacoes;
         edtLogin.Enabled := False;
      end
   else
   	glbIdUsuario := 0;

	edtNome.SetFocus;
end;

procedure TfrmCadastroUsuario.rbExistenteClick(Sender: TObject);
begin
  inherited;

  rbExistente.Checked := not rbNovo.Checked;
  rbNovo.Checked 		 := not rbExistente.Checked;

  VerificaOrigemInformacao;
end;

procedure TfrmCadastroUsuario.rbNovoClick(Sender: TObject);
begin
  inherited;

  rbExistente.Checked := not rbNovo.Checked;
  rbNovo.Checked 		 := not rbExistente.Checked;

  VerificaOrigemInformacao;
end;

function TfrmCadastroUsuario.ValidaCampos: Boolean;
begin
	Result := False;

   if edtNome.Text = '' then
   	begin
         Notificacao('Informe o nome do usuário.');
         edtNome.SetFocus;
      end
   else if edtDataNascimento.Text = '' then
   	begin
         Notificacao('Informe a data de nascimento do usuário.');
         edtDataNascimento.SetFocus;
      end
   else if edtLogin.Text = '' then
   	begin
         Notificacao('Informe o login do usuário.');
         edtLogin.SetFocus;
      end
   else if not ValidaLoginCadastrado( glbIdUsuario, edtLogin.Text ) then
   	begin
      	Notificacao('O login informado já está cadastrado em nosso sistema.');
         edtLogin.SetFocus;
      end
   else if edtSenha.Text = '' then
		begin
         Notificacao('Informe a senha do usuário.');
         edtSenha.SetFocus;
      end
   else if edtRepetirSenha.Text = '' then
		begin
         Notificacao('Informe a repetição da senha do usuário.');
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
