unit uConsultaTipoContato;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uConsultaPadrao, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, cxControls, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxLocalization, ACBrBase, ACBrEnterTab, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls, cxCheckBox, cxTextEdit,
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
  TfrmConsultaTipoContato = class(TfrmConsultaPadrao)
    cxGrid1DBTableView1DESCRICAO: TcxGridDBColumn;
    cxGrid1DBTableView1ATIVO: TcxGridDBColumn;
    cxGrid1DBTableView1ID_TIPO_CONTATO1: TcxGridDBColumn;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure cxGrid1DBTableView1ATIVOCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid1DBTableView1DESCRICAOCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmbPesqCampoPropertiesChange(Sender: TObject);
    procedure edtPesqTextoPropertiesChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaTipoContato: TfrmConsultaTipoContato;

implementation

{$R *.dfm}

uses uModule, uGlobal, uFuncao, uCadastroTipoContato;

procedure TfrmConsultaTipoContato.btnAlterarClick(Sender: TObject);
begin
  inherited;

  	with dtModule.sisTipoContato do
   	begin
      	DisableControls;

         if not IsEmpty then
            begin
               glbOperacao  := 'A';
               glbIdTipoContato  := FieldByName('ID_TIPO_CONTATO').AsInteger;

               AberturaJanela(TfrmCadastroTipoContato, frmCadastroTipoContato, 'Cadastro de Tipo de Contato');

               dtModule.sisTipoContato.Active := False;
               dtModule.sisTipoContato.Active := True;
            end;

         EnableControls;
      end;
end;

procedure TfrmConsultaTipoContato.btnAtualizarClick(Sender: TObject);
begin
  inherited;

  	dtModule.sisTipoContato.Active := False;
   dtModule.sisTipoContato.Active := True;
end;

procedure TfrmConsultaTipoContato.btnExcluirClick(Sender: TObject);
var lclTexto, lclOperacao : String;
begin
  inherited;

  	with dtModule do
   	begin
         if not sisTipoContato.IsEmpty then
            begin
               if sisTipoContato.FieldByName('ATIVO').AsBoolean = False then
                  begin
                     lclTexto := 'Atenção'#13'Deseja realmente ativar o registro?';
                     lclOperacao := 'A';
                  end
               else if sisTipoContato.FieldByName('ATIVO').AsBoolean = True then
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
                                 ProcedureName := '[sis].[P_TIPO_CONTATO_ATIVAR]'
                              else if lclOperacao = 'D' then
                                 ProcedureName := '[sis].[P_TIPO_CONTATO_DESATIVAR]';

                              Parameters.Refresh;

                              Parameters.ParamByName('@ID_TIPO_CONTATO').Value  := sisTipoContato.FieldByName('ID_TIPO_CONTATO').AsInteger;
                              Parameters.ParamByName('@USUARIO_OPERACAO').Value := glbUsuario;

                              ExecProc;
                           end;

                        Notificacao('Operação realizada com sucesso!');

                        dtModule.sisTipoContato.Active := False;
                        dtModule.sisTipoContato.Active := True;
                     except
                        on E : Exception do
                           Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
                     end;
                  end;
            end;
      end;
end;

procedure TfrmConsultaTipoContato.btnIncluirClick(Sender: TObject);
begin
  inherited;

  	with dtModule.sisTipoContato do
   	begin
      	DisableControls;

         glbOperacao := 'I';

         AberturaJanela(TfrmCadastroTipoContato, frmCadastroTipoContato, 'Cadastro de Tipo de Contato');

         Active := False;
         Active := True;

         EnableControls;
      end;
end;

procedure TfrmConsultaTipoContato.btnSairClick(Sender: TObject);
begin
  inherited;

  	Close;
end;

procedure TfrmConsultaTipoContato.cmbPesqCampoPropertiesChange(Sender: TObject);
begin
  inherited;

   dtModule.sisTipoContato.First;

   edtPesqTexto.Clear;
   edtPesqTexto.SetFocus;
end;

procedure TfrmConsultaTipoContato.cxGrid1DBTableView1ATIVOCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;

	if Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, 0) = 0 then
      ACanvas.Brush.Color := clSilver;
end;

procedure TfrmConsultaTipoContato.cxGrid1DBTableView1DESCRICAOCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;

	if Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, 0) = 0 then
      ACanvas.Brush.Color := clSilver;
end;

procedure TfrmConsultaTipoContato.edtPesqTextoPropertiesChange(Sender: TObject);
begin
  inherited;

   dtModule.sisTipoContato.Filtered := False;

   if Trim(edtPesqTexto.Text) <> '' then
      FiltroConsulta(dtModule.sisTipoContato, cmbPesqCampo, 'ID_TIPO_CONTATO', 'DESCRICAO', Trim(edtPesqTexto.Text));
end;

procedure TfrmConsultaTipoContato.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

   dtModule.sisTipoContato.Active := False;
end;

procedure TfrmConsultaTipoContato.FormCreate(Sender: TObject);
begin
  inherited;

	Brush.Style := bsClear;

   TraducaoFormulario('TraduçãoDev.ini', locCargo);
end;

procedure TfrmConsultaTipoContato.FormShow(Sender: TObject);
begin
  inherited;

	with dtModule.sisTipoContato do
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
