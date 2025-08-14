unit uConsultaUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uConsultaPadrao, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, cxControls, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Vcl.StdCtrls, cxButtons,
  Vcl.ExtCtrls, cxTextEdit, cxCheckBox, cxLocalization, Vcl.Buttons, ACBrBase,
  ACBrEnterTab, cxCalendar, dxSkinsCore, dxSkinBlack, dxSkinBlue,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxContainer, cxMaskEdit,
  cxDropDownEdit;

type
  TfrmConsultaUsuario = class(TfrmConsultaPadrao)
    cxGrid1DBTableView1LOGIN: TcxGridDBColumn;
    cxGrid1DBTableView1NOME: TcxGridDBColumn;
    cxGrid1DBTableView1DT_NASCIMENTO: TcxGridDBColumn;
    cxGrid1DBTableView1ATIVO: TcxGridDBColumn;
    cxGrid1DBTableView1ID_USUARIO1: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxGrid1DBTableView1ATIVOCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid1DBTableView1LOGINCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid1DBTableView1NOMECustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid1DBTableView1DT_NASCIMENTOCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cmbPesqCampoPropertiesChange(Sender: TObject);
    procedure edtPesqTextoPropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaUsuario: TfrmConsultaUsuario;

implementation

{$R *.dfm}

uses uGlobal, uFuncao, uModule, uCadastroUsuario;

procedure TfrmConsultaUsuario.btnIncluirClick(Sender: TObject);
begin
  inherited;

  	with dtModule.cfgUsuario do
   	begin
         DisableControls;

         glbOperacao := 'I';

         AberturaJanela(TfrmCadastroUsuario, frmCadastroUsuario, 'Cadastro de Usuário');

         Active := False;
         Active := True;

         EnableControls;
      end;
end;

procedure TfrmConsultaUsuario.btnAlterarClick(Sender: TObject);
begin
  inherited;

  	with dtModule.cfgUsuario do
   	begin
      	DisableControls;

         if not IsEmpty then
            begin
               if ( Application.MessageBox('Por questões de segurança, ao alterar um usuário sua senha deverá ser alterada!'#13'Deseja continuar?', PChar(Application.Title), MB_YESNO Or MB_ICONQUESTION ) = IDYES ) then
                  begin
                     glbOperacao  := 'A';
                     glbIdUsuario := FieldByName('ID_USUARIO').AsInteger;

                     AberturaJanela(TfrmCadastroUsuario, frmCadastroUsuario, 'Cadastro de Usuário');

                     Active := False;
                     Active := True;
                  end;
            end;

         EnableControls;
      end;
end;

procedure TfrmConsultaUsuario.btnExcluirClick(Sender: TObject);
var lclTexto, lclOperacao : String;
begin
  inherited;

  	if not dtModule.cfgUsuario.IsEmpty then
   	begin
      	if dtModule.cfgUsuario.FieldByName('ATIVO').AsBoolean = False then
         	begin
	         	lclTexto := 'Atenção'#13'Deseja realmente ativar o registro?';
					lclOperacao := 'A';
            end
         else if dtModule.cfgUsuario.FieldByName('ATIVO').AsBoolean = True then
         	begin
	         	lclTexto := 'Atenção'#13'Deseja realmente desativar o registro?';
               lclOperacao := 'D';
            end;

      	if ( Application.MessageBox(Pchar(lclTexto), PChar(Application.Title), MB_YESNO Or MB_ICONQUESTION ) = IDYES ) then
         	begin
               try
                  with dtModule, ADOStoredProc do
                     begin
                     	if lclOperacao = 'A' then
                        	ProcedureName := '[cfg].[P_USUARIO_ATIVAR]'
                        else if lclOperacao = 'D' then
                        	ProcedureName := '[cfg].[P_USUARIO_DESATIVAR]';

                        Parameters.Refresh;

                        Parameters.ParamByName('@ID_USUARIO').Value 		  := cfgUsuario.FieldByName('ID_USUARIO').AsInteger;
                        Parameters.ParamByName('@USUARIO_OPERACAO').Value := glbUsuario;

                        ExecProc;
                     end;

                  Notificacao('Operação realizada com sucesso!');

                  dtModule.cfgUsuario.Active := False;
                  dtModule.cfgUsuario.Active := True;
               except
                  on E : Exception do
                     Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
               end;
            end;
      end;
end;

procedure TfrmConsultaUsuario.btnAtualizarClick(Sender: TObject);
begin
  inherited;

   dtModule.cfgUsuario.Active := False;
   dtModule.cfgUsuario.Active := True;
end;

procedure TfrmConsultaUsuario.btnSairClick(Sender: TObject);
begin
  inherited;

   Close;
end;

procedure TfrmConsultaUsuario.cmbPesqCampoPropertiesChange(Sender: TObject);
begin
  inherited;

   dtModule.cfgUsuario.First;

   edtPesqTexto.Clear;
   edtPesqTexto.SetFocus;
end;

procedure TfrmConsultaUsuario.cxGrid1DBTableView1ATIVOCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;

	if Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, 0) = 0 then
      ACanvas.Brush.Color := clSilver;
end;

procedure TfrmConsultaUsuario.cxGrid1DBTableView1DT_NASCIMENTOCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;

	if Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, 0) = 0 then
      ACanvas.Brush.Color := clSilver;
end;

procedure TfrmConsultaUsuario.cxGrid1DBTableView1LOGINCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;

	if Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, 0) = 0 then
      ACanvas.Brush.Color := clSilver;
end;

procedure TfrmConsultaUsuario.cxGrid1DBTableView1NOMECustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;

	if Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, 0) = 0 then
      ACanvas.Brush.Color := clSilver;
end;

procedure TfrmConsultaUsuario.edtPesqTextoPropertiesChange(Sender: TObject);
begin
  inherited;

   dtModule.cfgUsuario.Filtered := False;

   if Trim(edtPesqTexto.Text) <> '' then
      FiltroConsulta(dtModule.cfgUsuario, cmbPesqCampo, 'ID_USUARIO', 'NOME', Trim(edtPesqTexto.Text));
end;

procedure TfrmConsultaUsuario.FormCreate(Sender: TObject);
begin
  inherited;

	Brush.Style := bsClear;

   TraducaoFormulario('TraduçãoDev.ini', locCargo);
end;

procedure TfrmConsultaUsuario.FormShow(Sender: TObject);
begin
  inherited;

	with dtModule.cfgUsuario do
   	begin
         Active := False;
         Active := True;

         if not IsEmpty then
            begin
               Filtered := False;
            	First;
            end;
      end;
end;

procedure TfrmConsultaUsuario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

   dtModule.cfgUsuario.Active := False;
end;

end.
