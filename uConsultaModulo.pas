unit uConsultaModulo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uConsultaPadrao, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, cxControls, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxLocalization, ACBrBase, ACBrEnterTab, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls, cxTextEdit, cxCheckBox,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxContainer, cxMaskEdit,
  cxDropDownEdit;

type
  TfrmConsultaModulo = class(TfrmConsultaPadrao)
    cxGrid1DBTableView1ID_MODULO: TcxGridDBColumn;
    cxGrid1DBTableView1DESCRICAO_PAI: TcxGridDBColumn;
    cxGrid1DBTableView1DESCRICAO: TcxGridDBColumn;
    cxGrid1DBTableView1COMPONENTE: TcxGridDBColumn;
    cxGrid1DBTableView1ATIVO: TcxGridDBColumn;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxGrid1DBTableView1ATIVOCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid1DBTableView1DESCRICAOCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid1DBTableView1COMPONENTECustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure FormShow(Sender: TObject);
    procedure cxGrid1DBTableView1ID_MODULOCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid1DBTableView1ID_MODULO_PAICustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cmbPesqCampoPropertiesChange(Sender: TObject);
    procedure edtPesqTextoPropertiesChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaModulo: TfrmConsultaModulo;

implementation

{$R *.dfm}

uses uFuncao, uGlobal, uModule, uCadastroModulo;

procedure TfrmConsultaModulo.btnAlterarClick(Sender: TObject);
begin
  inherited;

  	with dtModule.cfgVModulo do
   	begin
      	DisableControls;

         if not IsEmpty then
            begin
               glbOperacao  := 'A';
               glbIdModulo  := FieldByName('ID_MODULO').AsInteger;

               AberturaJanela(TfrmCadastroModulo, frmCadastroModulo, 'Cadastro de M�dulo');

               Active := False;
               Active := True;
            end;

         EnableControls;
      end;
end;

procedure TfrmConsultaModulo.btnAtualizarClick(Sender: TObject);
begin
  inherited;

   dtModule.cfgVModulo.Active := False;
   dtModule.cfgVModulo.Active := True;
end;

procedure TfrmConsultaModulo.btnExcluirClick(Sender: TObject);
var lclTexto, lclOperacao : String;
begin
  inherited;

  	if not dtModule.cfgVModulo.IsEmpty then
   	begin
      	if dtModule.cfgVModulo.FieldByName('ATIVO').AsBoolean = False then
         	begin
	         	lclTexto := 'Aten��o'#13'Deseja realmente ativar o registro?';
					lclOperacao := 'A';
            end
         else if dtModule.cfgVModulo.FieldByName('ATIVO').AsBoolean = True then
         	begin
	         	lclTexto := 'Aten��o'#13'Deseja realmente desativar o registro?';
               lclOperacao := 'D';
            end;

      	if ( Application.MessageBox(Pchar(lclTexto), PChar(Application.Title), MB_YESNO Or MB_ICONQUESTION ) = IDYES ) then
         	begin
               try
                  with dtModule, ADOStoredProc do
                     begin
                     	if lclOperacao = 'A' then
                        	ProcedureName := '[cfg].[P_MODULO_ATIVAR]'
                        else if lclOperacao = 'D' then
                        	ProcedureName := '[cfg].[P_MODULO_DESATIVAR]';

                        Parameters.Refresh;

                        Parameters.ParamByName('@ID_MODULO').Value 		  := cfgVModulo.FieldByName('ID_MODULO').AsInteger;
                        Parameters.ParamByName('@USUARIO_OPERACAO').Value := glbUsuario;

                        ExecProc;
                     end;

                  Notificacao('Opera��o realizada com sucesso!');

                  dtModule.cfgVModulo.Active := False;
                  dtModule.cfgVModulo.Active := True;
               except
                  on E : Exception do
                     Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a opera��o!' + #13 + E.Message );
               end;
            end;
      end;
end;

procedure TfrmConsultaModulo.btnIncluirClick(Sender: TObject);
begin
  inherited;

  	with dtModule.cfgVModulo do
   	begin
      	DisableControls;

         glbOperacao := 'I';

         AberturaJanela(TfrmCadastroModulo, frmCadastroModulo, 'Cadastro de M�dulo');

         Active := False;
         Active := True;

         EnableControls;
      end;
end;

procedure TfrmConsultaModulo.btnSairClick(Sender: TObject);
begin
  inherited;

  	Close;
end;

procedure TfrmConsultaModulo.cmbPesqCampoPropertiesChange(Sender: TObject);
begin
  inherited;

   dtModule.cfgVModulo.First;

   edtPesqTexto.Clear;
   edtPesqTexto.SetFocus;
end;

procedure TfrmConsultaModulo.cxGrid1DBTableView1ATIVOCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;

	if Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, 0) = 0 then
      ACanvas.Brush.Color := clSilver;
end;

procedure TfrmConsultaModulo.cxGrid1DBTableView1COMPONENTECustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;

	if Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, 0) = 0 then
      ACanvas.Brush.Color := clSilver;
end;

procedure TfrmConsultaModulo.cxGrid1DBTableView1DESCRICAOCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;

	if Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, 0) = 0 then
      ACanvas.Brush.Color := clSilver;
end;

procedure TfrmConsultaModulo.cxGrid1DBTableView1ID_MODULOCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;

	if Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, 0) = 0 then
      ACanvas.Brush.Color := clSilver;
end;

procedure TfrmConsultaModulo.cxGrid1DBTableView1ID_MODULO_PAICustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;

	if Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, 0) = 0 then
      ACanvas.Brush.Color := clSilver;
end;

procedure TfrmConsultaModulo.edtPesqTextoPropertiesChange(Sender: TObject);
begin
  inherited;

   dtModule.cfgVModulo.Filtered := False;

   if Trim(edtPesqTexto.Text) <> '' then
      FiltroConsulta(dtModule.cfgVModulo, cmbPesqCampo, 'ID_MODULO', 'DESCRICAO', Trim(edtPesqTexto.Text));
end;

procedure TfrmConsultaModulo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

   dtModule.cfgVModulo.Active := False;
end;

procedure TfrmConsultaModulo.FormCreate(Sender: TObject);
begin
  inherited;

	Brush.Style := bsClear;

   TraducaoFormulario('Tradu��oDev.ini', locCargo);
end;

procedure TfrmConsultaModulo.FormShow(Sender: TObject);
begin
  inherited;

	with dtModule.cfgVModulo do
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

end.
