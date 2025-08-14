unit uConsultaAtividade;

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
  cxDropDownEdit, dxCore;

type
  TfrmConsultaAtividade = class(TfrmConsultaPadrao)
    cxGrid1DBTableView1ID_ATIVIDADE1: TcxGridDBColumn;
    cxGrid1DBTableView1DESCRICAO1: TcxGridDBColumn;
    cxGrid1DBTableView1ATIVO1: TcxGridDBColumn;
    procedure cxGrid1DBTableView1ATIVOCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid1DBTableView1DESCRICAOCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtPesqTextoPropertiesChange(Sender: TObject);
    procedure cmbPesqCampoPropertiesChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaAtividade: TfrmConsultaAtividade;

implementation

{$R *.dfm}

uses uGlobal, uModule, uFuncao, uCadastroAtividade;

procedure TfrmConsultaAtividade.btnAlterarClick(Sender: TObject);
begin
  inherited;

  	with dtModule.sisAtividade do
   	begin
      	DisableControls;

         if not IsEmpty then
            begin
               glbOperacao     := 'A';
               glbIdAtividade  := FieldByName('ID_ATIVIDADE').AsInteger;

               AberturaJanela(TfrmCadastroAtividade, frmCadastroAtividade, 'Cadastro de Atividade');

               Active := False;
               Active := True;
            end;

         EnableControls;
      end;
end;

procedure TfrmConsultaAtividade.btnAtualizarClick(Sender: TObject);
begin
  inherited;

  	dtModule.sisAtividade.Active := False;
   dtModule.sisAtividade.Active := True;
end;

procedure TfrmConsultaAtividade.btnExcluirClick(Sender: TObject);
var lclTexto, lclOperacao : String;
begin
  inherited;

  	with dtModule do
   	begin
         if not sisAtividade.IsEmpty then
            begin
               if sisAtividade.FieldByName('ATIVO').AsBoolean = False then
                  begin
                     lclTexto := 'Atenção'#13'Deseja realmente ativar o registro?';
                     lclOperacao := 'A';
                  end
               else if sisAtividade.FieldByName('ATIVO').AsBoolean = True then
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
                                 ProcedureName := '[sis].[P_ATIVIDADE_ATIVAR]'
                              else if lclOperacao = 'D' then
                                 ProcedureName := '[sis].[P_ATIVIDADE_DESATIVAR]';

                              Parameters.Refresh;

                              Parameters.ParamByName('@ID_ATIVIDADE').Value  := sisAtividade.FieldByName('ID_ATIVIDADE').AsInteger;
                              Parameters.ParamByName('@USUARIO_OPERACAO').Value := glbUsuario;

                              ExecProc;
                           end;

                        Notificacao('Operação realizada com sucesso!');

                        sisAtividade.Active := False;
                        sisAtividade.Active := True;
                     except
                        on E : Exception do
                           Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
                     end;
                  end;
            end;
      end;
end;

procedure TfrmConsultaAtividade.btnIncluirClick(Sender: TObject);
begin
  inherited;

  	with dtModule.sisAtividade do
   	begin
      	DisableControls;

         glbOperacao := 'I';

         AberturaJanela(TfrmCadastroAtividade, frmCadastroAtividade, 'Cadastro de Atividade');

         Active := False;
         Active := True;

         EnableControls;
      end;
end;

procedure TfrmConsultaAtividade.btnSairClick(Sender: TObject);
begin
  inherited;

  	Close;
end;

procedure TfrmConsultaAtividade.cxGrid1DBTableView1ATIVOCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;

	if Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, 0) = 0 then
      ACanvas.Brush.Color := clSilver;
end;

procedure TfrmConsultaAtividade.cxGrid1DBTableView1DESCRICAOCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;

	if Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, 0) = 0 then
      ACanvas.Brush.Color := clSilver;
end;

procedure TfrmConsultaAtividade.FormCreate(Sender: TObject);
begin
  inherited;

	Brush.Style := bsClear;

   TraducaoFormulario('TraduçãoDev.ini', locCargo);
end;

procedure TfrmConsultaAtividade.cmbPesqCampoPropertiesChange(Sender: TObject);
begin
  inherited;

   dtModule.sisAtividade.First;

   edtPesqTexto.Clear;
   edtPesqTexto.SetFocus;
end;

procedure TfrmConsultaAtividade.edtPesqTextoPropertiesChange(Sender: TObject);
begin
  inherited;

   dtModule.sisAtividade.Filtered := False;

   if Trim(edtPesqTexto.Text) <> '' then
      FiltroConsulta(dtModule.sisAtividade, cmbPesqCampo, 'ID_ATIVIDADE', 'DESCRICAO', Trim(edtPesqTexto.Text));
end;

procedure TfrmConsultaAtividade.FormShow(Sender: TObject);
begin
  inherited;

	with dtModule.sisAtividade do
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

procedure TfrmConsultaAtividade.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

   dtModule.sisAtividade.Active := False;
end;

end.
