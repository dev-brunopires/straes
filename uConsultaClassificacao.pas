unit uConsultaClassificacao;

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
  TfrmConsultaClassificacao = class(TfrmConsultaPadrao)
    cxGrid1DBTableView1DESCRICAO: TcxGridDBColumn;
    cxGrid1DBTableView1ATIVO: TcxGridDBColumn;
    cxGrid1DBTableView1ID_CLASSIFICACAO1: TcxGridDBColumn;
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
  frmConsultaClassificacao: TfrmConsultaClassificacao;

implementation

{$R *.dfm}

uses uGlobal, uFuncao, uModule, uCadastroClassificacao;

procedure TfrmConsultaClassificacao.btnAlterarClick(Sender: TObject);
begin
  inherited;

  	with dtModule.sisClassificacao do
   	begin
      	DisableControls;

         if not IsEmpty then
            begin
               glbOperacao := 'A';

               glbIdClassificacao := FieldByName('ID_CLASSIFICACAO').AsInteger;

               AberturaJanela(TfrmCadastroClassificacao, frmCadastroClassificacao, 'Cadastro de Classificação');

               Active := False;
               Active := True;
            end;

         EnableControls;
      end;
end;

procedure TfrmConsultaClassificacao.btnAtualizarClick(Sender: TObject);
begin
  inherited;

  	dtModule.sisClassificacao.Active := False;
   dtModule.sisClassificacao.Active := True;
end;

procedure TfrmConsultaClassificacao.btnExcluirClick(Sender: TObject);
var lclTexto, lclOperacao : String;
begin
  inherited;

  	with dtModule do
   	begin
         if not sisClassificacao.IsEmpty then
            begin
               if sisClassificacao.FieldByName('ATIVO').AsBoolean = False then
                  begin
                     lclTexto := 'Atenção'#13'Deseja realmente ativar o registro?';
                     lclOperacao := 'A';
                  end
               else if sisClassificacao.FieldByName('ATIVO').AsBoolean = True then
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
                                 ProcedureName := '[sis].[P_CLASSIFICACAO_ATIVAR]'
                              else if lclOperacao = 'D' then
                                 ProcedureName := '[sis].[P_CLASSIFICACAO_DESATIVAR]';

                              Parameters.Refresh;

                              Parameters.ParamByName('@ID_CLASSIFICACAO').Value := sisClassificacao.FieldByName('ID_CLASSIFICACAO').AsInteger;
                              Parameters.ParamByName('@USUARIO_OPERACAO').Value := glbUsuario;

                              ExecProc;
                           end;

                        Notificacao('Operação realizada com sucesso!');

                        sisClassificacao.Active := False;
                        sisClassificacao.Active := True;
                     except
                        on E : Exception do
                           Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
                     end;
                  end;
            end;
      end;
end;

procedure TfrmConsultaClassificacao.btnIncluirClick(Sender: TObject);
begin
  inherited;

  	with dtModule.sisClassificacao do
   	begin
      	DisableControls;

         glbOperacao := 'I';

         AberturaJanela(TfrmCadastroClassificacao, frmCadastroClassificacao, 'Cadastro de Classificação');

         Active := False;
         Active := True;

         EnableControls;
      end;
end;

procedure TfrmConsultaClassificacao.btnSairClick(Sender: TObject);
begin
  inherited;

  	Close;
end;

procedure TfrmConsultaClassificacao.cmbPesqCampoPropertiesChange(
  Sender: TObject);
begin
  inherited;

   dtModule.sisClassificacao.First;

   edtPesqTexto.Clear;
   edtPesqTexto.SetFocus;
end;

procedure TfrmConsultaClassificacao.cxGrid1DBTableView1ATIVOCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;

	if Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, 0) = 0 then
      ACanvas.Brush.Color := clSilver;
end;

procedure TfrmConsultaClassificacao.cxGrid1DBTableView1DESCRICAOCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;

	if Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, 0) = 0 then
      ACanvas.Brush.Color := clSilver;
end;

procedure TfrmConsultaClassificacao.edtPesqTextoPropertiesChange(
  Sender: TObject);
begin
  inherited;

   dtModule.sisClassificacao.Filtered := False;

   if Trim(edtPesqTexto.Text) <> '' then
      FiltroConsulta(dtModule.sisClassificacao, cmbPesqCampo, 'ID_CLASSIFICACAO', 'DESCRICAO', Trim(edtPesqTexto.Text));
end;

procedure TfrmConsultaClassificacao.FormShow(Sender: TObject);
begin
  inherited;

	with dtModule.sisClassificacao do
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

procedure TfrmConsultaClassificacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

   dtModule.sisClassificacao.Active := False;
end;

end.
