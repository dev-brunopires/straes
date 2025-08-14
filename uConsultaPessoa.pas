unit uConsultaPessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uConsultaPadrao, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, cxControls, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxLocalization, ACBrBase, ACBrEnterTab, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls, cxCheckBox, cxTextEdit,
  cxCalendar, cxMaskEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxContainer, cxDropDownEdit;

type
  TfrmConsultaPessoa = class(TfrmConsultaPadrao)
    cxGrid1DBTableView1MATRICULA: TcxGridDBColumn;
    cxGrid1DBTableView1NOME: TcxGridDBColumn;
    cxGrid1DBTableView1ATIVO: TcxGridDBColumn;
    cxGrid1DBTableView1ID_PESSOA1: TcxGridDBColumn;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxGrid1DBTableView1ATIVOCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid1DBTableView1CONSULENTECustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid1DBTableView1TRABALHADORCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid1DBTableView1VISITANTECustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid1DBTableView1MATRICULACustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid1DBTableView1NOMECustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid1DBTableView1DT_NASCIMENTOCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid1DBTableView1TELEFONECustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid1DBTableView1CELULARCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid1DBTableView1EMAILCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure FormShow(Sender: TObject);
    procedure cmbPesqCampoPropertiesChange(Sender: TObject);
    procedure edtPesqTextoPropertiesChange(Sender: TObject);
    procedure cxGrid1DBTableView1ID_PESSOA1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnEnviarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaPessoa: TfrmConsultaPessoa;

implementation

{$R *.dfm}

uses uFuncao, uGlobal, uModule, uCadastroPessoa, uMotivoStatusPessoa;

procedure TfrmConsultaPessoa.btnAlterarClick(Sender: TObject);
begin
  inherited;

  	with dtModule.sisPessoa do
   	begin
      	DisableControls;

         if not IsEmpty then
            begin
               glbOperacao  := 'A';
               glbIdPessoa  := FieldByName('ID_PESSOA').AsInteger;
               glbStatusPessoa := FieldByName('ATIVO').AsBoolean;

               AberturaJanela(TfrmCadastroPessoa, frmCadastroPessoa, 'Cadastro de Pessoa');

               dtModule.sisPessoa.Active := False;
               dtModule.sisPessoa.Active := True;

               btnLimpar.OnClick(Self);
            end;

         EnableControls;
      end;
end;

procedure TfrmConsultaPessoa.btnAtualizarClick(Sender: TObject);
begin
  inherited;

   dtModule.sisPessoa.Active := False;
   dtModule.sisPessoa.Active := True;
end;

procedure TfrmConsultaPessoa.btnEnviarClick(Sender: TObject);
var lclTexto : String;
begin
  inherited;

  	if not dtModule.sisPessoa.IsEmpty then
   	begin
      	lclTexto := 'Atenção'#13'Se excluir uma pessoa, toda sua vida finaceira também será removida. Deseja realmente continuar com a operação?';

      	if ( Application.MessageBox(Pchar(lclTexto), PChar(Application.Title), MB_YESNO Or MB_ICONQUESTION ) = IDYES ) then
         	begin
               glbIdPessoa  := dtModule.sisPessoa.FieldByName('ID_PESSOA').AsInteger;

               try
                  with dtModule, ADOStoredProc do
                     begin
                        ProcedureName := '[SIS].[P_PESSOA_DELETE]';

                        Parameters.Refresh;

                        Parameters.ParamByName('@ID_PESSOA').Value 		  := sisPessoa.FieldByName('ID_PESSOA').AsInteger;
                        Parameters.ParamByName('@USUARIO_OPERACAO').Value := glbUsuario;

                        ExecProc;
                     end;

                  Notificacao('Operação realizada com sucesso!');

                  dtModule.sisPessoa.Active := False;
                  dtModule.sisPessoa.Active := True;
               except
                  on E : Exception do
                     Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
               end;
            end;
      end;
end;

procedure TfrmConsultaPessoa.btnExcluirClick(Sender: TObject);
var lclTexto, lclOperacao : String;
begin
  inherited;
  	if not dtModule.sisPessoa.IsEmpty then
   	begin
      	if dtModule.sisPessoa.FieldByName('ATIVO').AsBoolean = False then
         	begin
	         	lclTexto := 'Atenção'#13'Deseja realmente ativar o registro?';
					lclOperacao := 'A';
            end
         else if dtModule.sisPessoa.FieldByName('ATIVO').AsBoolean = True then
         	begin
	         	lclTexto := 'Atenção'#13'Deseja realmente desativar o registro?';
               lclOperacao := 'D';
            end;

      	if ( Application.MessageBox(Pchar(lclTexto), PChar(Application.Title), MB_YESNO Or MB_ICONQUESTION ) = IDYES ) then
         	begin
               glbIdPessoa  := dtModule.sisPessoa.FieldByName('ID_PESSOA').AsInteger;

               AberturaJanela(TfrmMotivoStatusPessoa, frmMotivoStatusPessoa, 'Motivo da alteração de status');

               if glbMotivoStatus then
                  begin
                     try
                        with dtModule, ADOStoredProc do
                           begin
                              if lclOperacao = 'A' then
                                 ProcedureName := '[sis].[P_PESSOA_ATIVAR]'
                              else if lclOperacao = 'D' then
                                 ProcedureName := '[sis].[P_PESSOA_DESATIVAR]';

                              Parameters.Refresh;

                              Parameters.ParamByName('@ID_PESSOA').Value 		  := sisPessoa.FieldByName('ID_PESSOA').AsInteger;
                              Parameters.ParamByName('@USUARIO_OPERACAO').Value := glbUsuario;

                              ExecProc;
                           end;

                        Notificacao('Operação realizada com sucesso!');

                        dtModule.sisPessoa.Active := False;
                        dtModule.sisPessoa.Active := True;
                     except
                        on E : Exception do
                           Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
                     end;
                  end;
            end;
      end;
end;

procedure TfrmConsultaPessoa.btnIncluirClick(Sender: TObject);
begin
  inherited;

  	with dtModule.sisPessoa do
   	begin
         DisableControls;

         glbOperacao := 'I';

         AberturaJanela(TfrmCadastroPessoa, frmCadastroPessoa, 'Cadastro de Pessoa');

         dtModule.sisPessoa.Active := False;
         dtModule.sisPessoa.Active := True;

         btnLimpar.OnClick(Self);

         EnableControls;
      end;
end;

procedure TfrmConsultaPessoa.btnSairClick(Sender: TObject);
begin
  inherited;

  	Close;
end;

procedure TfrmConsultaPessoa.cmbPesqCampoPropertiesChange(Sender: TObject);
begin
  inherited;

   dtModule.sisPessoa.First;

   edtPesqTexto.Clear;
   edtPesqTexto.SetFocus;
end;

procedure TfrmConsultaPessoa.cxGrid1DBTableView1ATIVOCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;

	if Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, 0) = 0 then
      ACanvas.Brush.Color := clSilver;
end;

procedure TfrmConsultaPessoa.cxGrid1DBTableView1CELULARCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;

	if Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, 0) = 0 then
      ACanvas.Brush.Color := clSilver;
end;

procedure TfrmConsultaPessoa.cxGrid1DBTableView1CONSULENTECustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;

	if Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, 0) = 0 then
      ACanvas.Brush.Color := clSilver;
end;

procedure TfrmConsultaPessoa.cxGrid1DBTableView1DT_NASCIMENTOCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;

	if Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, 0) = 0 then
      ACanvas.Brush.Color := clSilver;
end;

procedure TfrmConsultaPessoa.cxGrid1DBTableView1EMAILCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;

	if Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, 0) = 0 then
      ACanvas.Brush.Color := clSilver;
end;

procedure TfrmConsultaPessoa.cxGrid1DBTableView1ID_PESSOA1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;

	if Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, 0) = 0 then
      ACanvas.Brush.Color := clSilver;
end;

procedure TfrmConsultaPessoa.cxGrid1DBTableView1MATRICULACustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;

	if Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, 0) = 0 then
      ACanvas.Brush.Color := clSilver;
end;

procedure TfrmConsultaPessoa.cxGrid1DBTableView1NOMECustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;

	if Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, 0) = 0 then
      ACanvas.Brush.Color := clSilver;
end;

procedure TfrmConsultaPessoa.cxGrid1DBTableView1TELEFONECustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;

	if Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, 0) = 0 then
      ACanvas.Brush.Color := clSilver;
end;

procedure TfrmConsultaPessoa.cxGrid1DBTableView1TRABALHADORCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;

	if Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, 0) = 0 then
      ACanvas.Brush.Color := clSilver;
end;

procedure TfrmConsultaPessoa.cxGrid1DBTableView1VISITANTECustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;

	if Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, 0) = 0 then
      ACanvas.Brush.Color := clSilver;
end;

procedure TfrmConsultaPessoa.edtPesqTextoPropertiesChange(Sender: TObject);
begin
  inherited;

   dtModule.sisPessoa.Filtered := False;

   if Trim(edtPesqTexto.Text) <> '' then
      FiltroConsulta(dtModule.sisPessoa, cmbPesqCampo, 'MATRICULA', 'NOME', Trim(edtPesqTexto.Text));
end;

procedure TfrmConsultaPessoa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

   dtModule.sisPessoa.Active := False;
end;

procedure TfrmConsultaPessoa.FormCreate(Sender: TObject);
begin
  inherited;
   Brush.Style := bsClear;

   TraducaoFormulario('TraduçãoDev.ini', locCargo);
end;

procedure TfrmConsultaPessoa.FormShow(Sender: TObject);
begin
  inherited;

	with dtModule.sisPessoa do
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
