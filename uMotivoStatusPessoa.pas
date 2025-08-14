unit uMotivoStatusPessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroPadrao, cxGraphics,
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
  dxSkinXmas2008Blue, cxControls, dxSkinscxPCPainter, dxBarBuiltInMenu,
  cxClasses, cxLocalization, ACBrBase, ACBrEnterTab, cxPC, Vcl.StdCtrls,
  cxButtons, Vcl.ExtCtrls, cxContainer, cxEdit, cxLabel, cxTextEdit, cxMemo,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxMaskEdit, cxDropDownEdit, cxCalendar, Datasnap.DBClient;

type
  TfrmMotivoStatusPessoa = class(TfrmCadastroPadrao)
    GroupBox1: TGroupBox;
    cdsMotivoStatus: TClientDataSet;
    dsMotivoStatus: TDataSource;
    cdsMotivoStatusUSUARIO_OPERACAO: TStringField;
    cdsMotivoStatusDT_ALTERACAO: TDateTimeField;
    cdsMotivoStatusMOTIVO: TStringField;
    edtMotivo: TcxTextEdit;
    edtDataAlteracao: TcxDateEdit;
    cxLabel2: TcxLabel;
    cxLabel1: TcxLabel;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
    procedure CarregaHistorico;
  public
    { Public declarations }
  end;

var
  frmMotivoStatusPessoa: TfrmMotivoStatusPessoa;

implementation

{$R *.dfm}

uses uGlobal, uFuncao, uModule;

procedure TfrmMotivoStatusPessoa.btnCancelarClick(Sender: TObject);
begin
  inherited;

   glbMotivoStatus := false;
   Close;
end;

procedure TfrmMotivoStatusPessoa.btnSalvarClick(Sender: TObject);
begin
  inherited;

   if edtDataAlteracao.Text = '' then
      begin
         Notificacao('Informe a data da alteração do status.');
         edtDataAlteracao.SetFocus;
      end
   else if edtMotivo.Text = '' then
      begin
         Notificacao('Informe o motivo da alteração do status.');
         edtMotivo.SetFocus;
      end
   else
      begin
         try
            with dtModule, ADOStoredProc do
               begin
                  ProcedureName := '[sis].[P_MOTIVO_STATUS_INSERT]';
                  Parameters.Refresh;

                  Parameters.ParamByName('@ID_PESSOA').Value   	  := glbIdPessoa;
                  Parameters.ParamByName('@DT_ALTERACAO').Value     := edtDataAlteracao.Date;
                  Parameters.ParamByName('@MOTIVO').Value   	     := edtMotivo.Text;
                  Parameters.ParamByName('@USUARIO_OPERACAO').Value := glbUsuario;

                  ExecProc;
               end;

            Close;
         except
            on E : Exception do
               Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
         end;

         glbMotivoStatus := True;
      end;
end;

procedure TfrmMotivoStatusPessoa.CarregaHistorico;
begin
   with dtModule.sisMotivoStatus do
      begin
         Active := False;
         Active := True;

         First;

         if not IsEmpty then
            begin
               cdsMotivoStatus.EmptyDataSet;

               First;

               while not Eof do
                  begin
                     try
                        cdsMotivoStatus.Append;

                        cdsMotivoStatus.FieldByName('USUARIO_OPERACAO').Value := FieldByName('USUARIO_OPERACAO').Value;
                        cdsMotivoStatus.FieldByName('MOTIVO').Value           := FieldByName('MOTIVO').Value;
                        cdsMotivoStatus.FieldByName('DT_ALTERACAO').Value     := FieldByName('DT_ALTERACAO').Value;

                        cdsMotivoStatus.Post;
                     except
                        on E : Exception do
                           Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
                     end;

                     Next;
                  end;

               if not cdsMotivoStatus.IsEmpty then
                  begin
                     cdsMotivoStatus.First;

                     while not cdsMotivoStatus.Eof do
                        begin
                           Memo1.Lines.Add('Data: ' + FormatDateTime( 'dd/MM/yyyy', cdsMotivoStatus.FieldByName('DT_ALTERACAO').AsDateTime) + ' - ' +
                                           cdsMotivoStatus.FieldByName('MOTIVO').AsString + ' - ' +
                                           'Alterado por: ' + cdsMotivoStatus.FieldByName('USUARIO_OPERACAO').AsString);

                           cdsMotivoStatus.Next;
                        end;
                  end;
            end;

         Close;
      end;
end;

procedure TfrmMotivoStatusPessoa.FormCreate(Sender: TObject);
begin
  inherited;

	Brush.Style := bsClear;

   TraducaoFormulario('TraduçãoDev.ini', locCargo);
end;

procedure TfrmMotivoStatusPessoa.FormShow(Sender: TObject);
begin
  inherited;

   glbMotivoStatus := False;

   CarregaHistorico;

   edtDataAlteracao.Date := Date();
   edtMotivo.Clear;

   edtDataAlteracao.SetFocus;
end;

end.
