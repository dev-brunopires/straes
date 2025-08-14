unit uConsultaFilantropia;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uConsultaPadrao, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, cxControls, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxLocalization, ACBrBase, ACBrEnterTab, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls, cxCheckBox, cxCurrencyEdit,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxContainer, cxTextEdit, cxMaskEdit,
  cxDropDownEdit;

type
  TfrmConsultaFilantropia = class(TfrmConsultaPadrao)
    cxGrid1DBTableView1DESCRICAO1: TcxGridDBColumn;
    cxGrid1DBTableView1VALOR1: TcxGridDBColumn;
    cxGrid1DBTableView1ATIVO1: TcxGridDBColumn;
    cxGrid1DBTableView1PERCENTUAL1: TcxGridDBColumn;
    cxGrid1DBTableView1ID_FILANTROPIA: TcxGridDBColumn;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxGrid1DBTableView1ATIVO1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid1DBTableView1DESCRICAO1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid1DBTableView1VALOR1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid1DBTableView1PERCENTUAL1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure FormShow(Sender: TObject);
    procedure cmbPesqCampoPropertiesChange(Sender: TObject);
    procedure edtPesqTextoPropertiesChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxGrid1DBTableView1ID_FILANTROPIACustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaFilantropia: TfrmConsultaFilantropia;

implementation

{$R *.dfm}

uses uFuncao, uGlobal, uModule, uCadastroFilantropia;

procedure TfrmConsultaFilantropia.btnAlterarClick(Sender: TObject);
begin
  inherited;

	with dtModule.sisFilantropia do
		begin
      	DisableControls;

         if not IsEmpty then
            begin
               glbOperacao      := 'A';
               glbIdFilantropia := FieldByName('ID_FILANTROPIA').AsInteger;

               AberturaJanela(TfrmCadastroFilantropia, frmCadastroFilantropia, 'Cadastro de Filantropia');

               dtModule.sisFilantropia.Active := False;
               dtModule.sisFilantropia.Active := True;
            end;

         EnableControls;
      end;
end;

procedure TfrmConsultaFilantropia.btnAtualizarClick(Sender: TObject);
begin
  inherited;

  	dtModule.sisFilantropia.Active := False;
   dtModule.sisFilantropia.Active := True;
end;

procedure TfrmConsultaFilantropia.btnExcluirClick(Sender: TObject);
var lclTexto, lclOperacao : String;
begin
  inherited;
  	with dtModule do
   	begin
         if not sisFilantropia.IsEmpty then
            begin
               if sisFilantropia.FieldByName('ATIVO').AsBoolean = False then
                  begin
                     lclTexto := 'Atenção'#13'Deseja realmente ativar o registro?';
                     lclOperacao := 'A';
                  end
               else if sisFilantropia.FieldByName('ATIVO').AsBoolean = True then
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
                                 ProcedureName := '[sis].[P_FILANTROPIA_ATIVAR]'
                              else if lclOperacao = 'D' then
                                 ProcedureName := '[sis].[P_FILANTROPIA_DESATIVAR]';

                              Parameters.Refresh;

                              Parameters.ParamByName('@ID_FILANTROPIA').Value   := sisFilantropia.FieldByName('ID_FILANTROPIA').AsInteger;
                              Parameters.ParamByName('@USUARIO_OPERACAO').Value := glbUsuario;

                              ExecProc;
                           end;

                        Notificacao('Operação realizada com sucesso!');

                        dtModule.sisFilantropia.Active := False;
                        dtModule.sisFilantropia.Active := True;
                     except
                        on E : Exception do
                           Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
                     end;
                  end;
            end;
      end;
end;

procedure TfrmConsultaFilantropia.btnIncluirClick(Sender: TObject);
begin
  inherited;

  	with dtModule.sisFilantropia do
   	begin
      	DisableControls;

      	glbOperacao := 'I';

         AberturaJanela(TfrmCadastroFilantropia, frmCadastroFilantropia, 'Cadastro de Filantropia');

         dtModule.sisFilantropia.Active := False;
         dtModule.sisFilantropia.Active := True;

         EnableControls;
      end;
end;

procedure TfrmConsultaFilantropia.btnSairClick(Sender: TObject);
begin
  inherited;

  	Close;
end;

procedure TfrmConsultaFilantropia.cmbPesqCampoPropertiesChange(Sender: TObject);
begin
  inherited;

   dtModule.sisFilantropia.First;

   edtPesqTexto.Clear;
   edtPesqTexto.SetFocus;
end;

procedure TfrmConsultaFilantropia.cxGrid1DBTableView1ATIVO1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;

	if Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, 0) = 0 then
      ACanvas.Brush.Color := clSilver;
end;

procedure TfrmConsultaFilantropia.cxGrid1DBTableView1DESCRICAO1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;

	if Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, 0) = 0 then
      ACanvas.Brush.Color := clSilver;
end;

procedure TfrmConsultaFilantropia.cxGrid1DBTableView1ID_FILANTROPIACustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;

	if Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, 0) = 0 then
      ACanvas.Brush.Color := clSilver;
end;

procedure TfrmConsultaFilantropia.cxGrid1DBTableView1PERCENTUAL1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;

	if Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, 0) = 0 then
      ACanvas.Brush.Color := clSilver;
end;

procedure TfrmConsultaFilantropia.cxGrid1DBTableView1VALOR1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;

	if Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, 0) = 0 then
      ACanvas.Brush.Color := clSilver;
end;

procedure TfrmConsultaFilantropia.edtPesqTextoPropertiesChange(Sender: TObject);
begin
  inherited;

   dtModule.sisFilantropia.Filtered := False;

   if Trim(edtPesqTexto.Text) <> '' then
      FiltroConsulta(dtModule.sisFilantropia, cmbPesqCampo, 'ID_FILANTROPIA', 'DESCRICAO', Trim(edtPesqTexto.Text));
end;

procedure TfrmConsultaFilantropia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

   dtModule.sisFilantropia.Active := False;
end;

procedure TfrmConsultaFilantropia.FormCreate(Sender: TObject);
begin
  inherited;

	Brush.Style := bsClear;

   TraducaoFormulario('TraduçãoDev.ini', locCargo);
end;

procedure TfrmConsultaFilantropia.FormShow(Sender: TObject);
begin
  inherited;

	with dtModule.sisFilantropia do
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
