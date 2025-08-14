unit uPermissaoAcesso;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroPadrao, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, cxControls,
  dxBarBuiltInMenu, cxClasses, cxLocalization, ACBrBase, ACBrEnterTab, cxPC,
  Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls, cxContainer, cxEdit, cxLabel,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, cxCheckBox, cxCalendar,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridCustomView, cxGrid, dxSkinsCore, dxSkinBlack, dxSkinBlue,
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
  TfrmPermissaoAcesso = class(TfrmCadastroPadrao)
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBTableView1DESCRICAO1: TcxGridDBColumn;
    cxGrid1DBTableView1PERMISSAO1: TcxGridDBColumn;
    cxGrid1DBTableView1COMPONENTE1: TcxGridDBColumn;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxLabel2: TcxLabel;
    edtPessoaMatricula: TcxTextEdit;
    btnPesPessoa: TcxButton;
    cxButton3: TcxButton;
    lblPessoaNome: TcxLabel;
    cxLabel1: TcxLabel;
    btnLimpar: TcxButton;
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure cxGrid1DBTableView1PERMISSAOPropertiesEditValueChanged(
      Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxGrid1DBTableView1PERMISSAO1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid1DBTableView1DESCRICAO1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid1DBTableView1COMPONENTE1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure btnPesPessoaClick(Sender: TObject);
    procedure edtPessoaMatriculaExit(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
  private
    { Private declarations }
    procedure SelecionarTodos( varSelecionar : Boolean );
  public
    { Public declarations }
  end;

var
  frmPermissaoAcesso: TfrmPermissaoAcesso;

implementation

{$R *.dfm}

uses uFuncao, uGlobal, uModule, uCadastroModulo, uCadastroUsuario, uConsUsuario;

procedure TfrmPermissaoAcesso.btnCancelarClick(Sender: TObject);
begin
  inherited;

  	//dtModule.cfgVUsuarioModulo.First;
	Close;
end;

procedure TfrmPermissaoAcesso.btnLimparClick(Sender: TObject);
begin
  inherited;

   dtModule.cfgVUsuarioModulo.Active := False;

   lblPessoaNome.Clear;
   edtPessoaMatricula.Clear;

   edtPessoaMatricula.SetFocus;
end;

procedure TfrmPermissaoAcesso.btnPesPessoaClick(Sender: TObject);
begin
  inherited;

  	if Trim(edtPessoaMatricula.Text) <> '' then
      begin
         lblPessoaNome.Caption := RetornaNomeUsuario(StrToInt(Trim(edtPessoaMatricula.Text)));

         if lblPessoaNome.Caption <> '' then
         	CarregaUsuarioModulo(lblPessoaNome.Caption, edtPessoaMatricula, lblPessoaNome, cxGrid1)
         else
            begin
               Notificacao('Nenhum registro encontrado para o código informado.');

               lblPessoaNome.Clear;
               edtPessoaMatricula.SelectAll;
               edtPessoaMatricula.SetFocus;
            end;
      end
   else
      begin
      	dtModule.cfgVUsuarioModulo.Active := False;
         lblPessoaNome.Caption := '';
      end;
end;

procedure TfrmPermissaoAcesso.cxButton1Click(Sender: TObject);
begin
  inherited;

	SelecionarTodos(True);
end;

procedure TfrmPermissaoAcesso.cxButton2Click(Sender: TObject);
begin
  inherited;

  	SelecionarTodos(False);
end;

procedure TfrmPermissaoAcesso.cxButton3Click(Sender: TObject);
begin
  inherited;

   glbOperacao := '';

   AberturaJanela(TfrmConsUsuario, frmConsUsuario, 'Consulta de Usuário');

   if glbConsCodigo <> '' then
      begin
         edtPessoaMatricula.Text := glbConsCodigo;
         btnPesPessoa.OnClick(Self);
      end;
end;

procedure TfrmPermissaoAcesso.cxGrid1DBTableView1COMPONENTE1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;

	if Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, 0) = 0 then
      ACanvas.Brush.Color := clSilver;
end;

procedure TfrmPermissaoAcesso.cxGrid1DBTableView1DESCRICAO1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;

	if Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, 0) = 0 then
      ACanvas.Brush.Color := clSilver;
end;

procedure TfrmPermissaoAcesso.cxGrid1DBTableView1PERMISSAO1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;

	if Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, 0) = 0 then
      ACanvas.Brush.Color := clSilver;
end;

procedure TfrmPermissaoAcesso.cxGrid1DBTableView1PERMISSAOPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;

  	with dtModule.cfgVUsuarioModulo do
   	begin
		  	if RecNo = RecordCount then
         	First
         else
         	Next;
      end;

end;

procedure TfrmPermissaoAcesso.edtPessoaMatriculaExit(Sender: TObject);
begin
  inherited;

   btnPesPessoa.OnClick(Self);
end;

procedure TfrmPermissaoAcesso.FormCreate(Sender: TObject);
begin
  inherited;

	Brush.Style := bsClear;

   TraducaoFormulario('TraduçãoDev.ini', locCargo);
end;

procedure TfrmPermissaoAcesso.FormShow(Sender: TObject);
begin
  inherited;

  	dtModule.cfgVUsuarioModulo.Active := False;

   edtPessoaMatricula.SetFocus;
end;

procedure TfrmPermissaoAcesso.SelecionarTodos(varSelecionar: Boolean);
begin
	with dtModule.cfgVUsuarioModulo do
   	begin
			First;

         while not eof do
         	begin
            	try
                  Edit;

                  FieldByName('PERMISSAO').Value := varSelecionar;

                  Post;
               except
                  on E : Exception do
                     Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
               end;

               Next;
            end;
      end;
end;

end.
