unit uConsultaTipoPagamentoDiverso;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uConsultaPadrao, cxGraphics,
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
  dxSkinXmas2008Blue, cxControls, cxStyles, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  cxContainer, cxLocalization, ACBrBase, ACBrEnterTab, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, Vcl.StdCtrls, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxButtons,
  Vcl.ExtCtrls, cxCheckBox;

type
  TfrmConsultaTipoPagamentoDiverso = class(TfrmConsultaPadrao)
    cxGrid1DBTableView1ID_TIPO_PAGAMENTO_DIVERSO: TcxGridDBColumn;
    cxGrid1DBTableView1DESCRICAO: TcxGridDBColumn;
    cxGrid1DBTableView1ATIVO: TcxGridDBColumn;
    procedure btnAlterarClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure cmbPesqCampoPropertiesChange(Sender: TObject);
    procedure edtPesqTextoPropertiesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxGrid1DBTableView1ATIVOCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid1DBTableView1ID_TIPO_PAGAMENTO_DIVERSOCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid1DBTableView1DESCRICAOCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaTipoPagamentoDiverso: TfrmConsultaTipoPagamentoDiverso;

implementation

{$R *.dfm}

uses uGlobal, uFuncao, uModule, uCadastroTipoPagamentoDiverso;

procedure TfrmConsultaTipoPagamentoDiverso.btnAlterarClick(Sender: TObject);
begin
  inherited;

  	with dtModule.sisTipoPagamentoDiverso do
   	begin
      	DisableControls;

         if not IsEmpty then
            begin
               glbOperacao  := 'A';

               glbIdTipoPagamentoDiverso  := FieldByName('ID_TIPO_PAGAMENTO_DIVERSO').AsInteger;

               AberturaJanela(TfrmCadastroTipoPagamentoDiverso, frmCadastroTipoPagamentoDiverso, 'Tipo de Pagamentos Diversos');

               Active := False;
               Active := True;
            end;

         EnableControls;
      end;
end;

procedure TfrmConsultaTipoPagamentoDiverso.btnAtualizarClick(Sender: TObject);
begin
  inherited;

   dtModule.sisTipoPagamentoDiverso.Active := False;
   dtModule.sisTipoPagamentoDiverso.Active := True;
end;

procedure TfrmConsultaTipoPagamentoDiverso.btnExcluirClick(Sender: TObject);
var lclTexto, lclOperacao : String;
begin
  inherited;

  	with dtModule do
   	begin
         if not sisTipoPagamentoDiverso.IsEmpty then
            begin
               if sisTipoPagamentoDiverso.FieldByName('ATIVO').AsBoolean = False then
                  begin
                     lclTexto := 'Atenção'#13'Deseja realmente ativar o registro?';
                     lclOperacao := 'A';
                  end
               else if sisTipoPagamentoDiverso.FieldByName('ATIVO').AsBoolean = True then
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
                                 ProcedureName := '[sis].[P_TIPO_PAGAMENTO_DIVERSO_ATIVAR]'
                              else if lclOperacao = 'D' then
                                 ProcedureName := '[sis].[P_TIPO_PAGAMENTO_DIVERSO_DESATIVAR]';

                              Parameters.Refresh;

                              Parameters.ParamByName('@ID_TIPO_PAGAMENTO_DIVERSO').Value := sisTipoPagamentoDiverso.FieldByName('ID_TIPO_PAGAMENTO_DIVERSO').AsInteger;
                              Parameters.ParamByName('@USUARIO_OPERACAO').Value          := glbUsuario;

                              ExecProc;
                           end;

                        Notificacao('Operação realizada com sucesso!');

                        dtModule.sisTipoPagamentoDiverso.Active := False;
                        dtModule.sisTipoPagamentoDiverso.Active := True;
                     except
                        on E : Exception do
                           Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
                     end;
                  end;
            end;
      end;
end;

procedure TfrmConsultaTipoPagamentoDiverso.btnIncluirClick(Sender: TObject);
begin
  inherited;

  	with dtModule.sisTipoPagamentoDiverso do
   	begin
      	DisableControls;

         glbOperacao := 'I';

         AberturaJanela(TfrmCadastroTipoPagamentoDiverso, frmCadastroTipoPagamentoDiverso, 'Tipo de Pagamentos Diversos');

         Active := False;
         Active := True;

         EnableControls;
      end;
end;

procedure TfrmConsultaTipoPagamentoDiverso.btnSairClick(Sender: TObject);
begin
  inherited;

   Close;
end;

procedure TfrmConsultaTipoPagamentoDiverso.cmbPesqCampoPropertiesChange(
  Sender: TObject);
begin
  inherited;

   dtModule.sisTipoPagamentoDiverso.First;

   edtPesqTexto.Clear;
   edtPesqTexto.SetFocus;
end;

procedure TfrmConsultaTipoPagamentoDiverso.cxGrid1DBTableView1ATIVOCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;

	if Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, 0) = 0 then
      ACanvas.Brush.Color := clSilver;
end;

procedure TfrmConsultaTipoPagamentoDiverso.cxGrid1DBTableView1DESCRICAOCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;

	if Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, 0) = 0 then
      ACanvas.Brush.Color := clSilver;
end;

procedure TfrmConsultaTipoPagamentoDiverso.cxGrid1DBTableView1ID_TIPO_PAGAMENTO_DIVERSOCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;

	if Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, 0) = 0 then
      ACanvas.Brush.Color := clSilver;
end;

procedure TfrmConsultaTipoPagamentoDiverso.edtPesqTextoPropertiesChange(
  Sender: TObject);
begin
  inherited;

   dtModule.sisTipoPagamentoDiverso.Filtered := False;

   if Trim(edtPesqTexto.Text) <> '' then
      FiltroConsulta(dtModule.sisTipoPagamentoDiverso, cmbPesqCampo, 'ID_TIPO_PAGAMENTO_DIVERSO', 'DESCRICAO', Trim(edtPesqTexto.Text));
end;

procedure TfrmConsultaTipoPagamentoDiverso.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

	dtModule.sisTipoPagamentoDiverso.Active := False;
end;

procedure TfrmConsultaTipoPagamentoDiverso.FormCreate(Sender: TObject);
begin
  inherited;

	Brush.Style := bsClear;

   TraducaoFormulario('TraduçãoDev.ini', locCargo);
end;

procedure TfrmConsultaTipoPagamentoDiverso.FormShow(Sender: TObject);
begin
  inherited;

	with dtModule.sisTipoPagamentoDiverso do
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
