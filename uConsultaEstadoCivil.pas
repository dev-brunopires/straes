unit uConsultaEstadoCivil;

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
  Vcl.ExtCtrls;

type
  TfrmConsultaEstadoCivil = class(TfrmConsultaPadrao)
    cxGrid1DBTableView1ID_ESTADO_CIVIL1: TcxGridDBColumn;
    cxGrid1DBTableView1DESCRICAO1: TcxGridDBColumn;
    cxGrid1DBTableView1ATIVO1: TcxGridDBColumn;
    cxGrid1DBTableView1USUARIO_OPERACAO1: TcxGridDBColumn;
    cxGrid1DBTableView1DATA_OPERACAO1: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure cmbPesqCampoPropertiesChange(Sender: TObject);
    procedure edtPesqTextoPropertiesChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaEstadoCivil: TfrmConsultaEstadoCivil;

implementation

{$R *.dfm}

uses uGlobal, uFuncao, uModule, uCadastroEstadoCivil;

procedure TfrmConsultaEstadoCivil.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

   dtModule.cfgEstadoCivil.Active := False;
end;

procedure TfrmConsultaEstadoCivil.FormCreate(Sender: TObject);
begin
  inherited;

	Brush.Style := bsClear;

   TraducaoFormulario('TraduçãoDev.ini', locCargo);
end;

procedure TfrmConsultaEstadoCivil.FormShow(Sender: TObject);
begin
  inherited;

	with dtModule.cfgEstadoCivil do
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

procedure TfrmConsultaEstadoCivil.btnIncluirClick(Sender: TObject);
begin
  inherited;

  	with dtModule.cfgEstadoCivil do
   	begin
      	DisableControls;

         glbOperacao := 'I';

         AberturaJanela(TfrmCadastroEstadoCivil, frmCadastroEstadoCivil, 'Cadastro de Estado Civil');

         dtModule.cfgEstadoCivil.Active := False;
         dtModule.cfgEstadoCivil.Active := True;

         EnableControls;
      end;
end;

procedure TfrmConsultaEstadoCivil.btnAlterarClick(Sender: TObject);
begin
  inherited;

  	with dtModule.cfgEstadoCivil do
   	begin
      	DisableControls;

         if not IsEmpty then
            begin
               glbOperacao      := 'A';
               glbIdEstadoCivil := FieldByName('ID_ESTADO_CIVIL').AsInteger;

               AberturaJanela(TfrmCadastroEstadoCivil, frmCadastroEstadoCivil, 'Cadastro de Estado Civil');

               dtModule.cfgEstadoCivil.Active := False;
               dtModule.cfgEstadoCivil.Active := True;
            end;

         EnableControls;
      end;
end;

procedure TfrmConsultaEstadoCivil.btnExcluirClick(Sender: TObject);
var lclTexto, lclOperacao : String;
begin
  inherited;

  	with dtModule do
   	begin
         if not cfgEstadoCivil.IsEmpty then
            begin
               if cfgEstadoCivil.FieldByName('ATIVO').AsBoolean = False then
                  begin
                     lclTexto := 'Atenção'#13'Deseja realmente ativar o registro?';
                     lclOperacao := 'A';
                  end
               else if cfgEstadoCivil.FieldByName('ATIVO').AsBoolean = True then
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
                                 ProcedureName := '[cfg].[P_ESTADO_CIVIL_ATIVAR]'
                              else if lclOperacao = 'D' then
                                 ProcedureName := '[cfg].[P_ESTADO_CIVIL_DESATIVAR]';

                              Parameters.Refresh;

                              Parameters.ParamByName('@ID_ESTADO_CIVIL').Value  := cfgEstadoCivil.FieldByName('ID_ESTADO_CIVIL').AsInteger;
                              Parameters.ParamByName('@USUARIO_OPERACAO').Value := glbUsuario;

                              ExecProc;
                           end;

                        Notificacao('Operação realizada com sucesso!');

                        dtModule.cfgEstadoCivil.Active := False;
                        dtModule.cfgEstadoCivil.Active := True;
                     except
                        on E : Exception do
                           Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
                     end;
                  end;
            end;
      end;
end;

procedure TfrmConsultaEstadoCivil.btnAtualizarClick(Sender: TObject);
begin
  inherited;

  	dtModule.cfgEstadoCivil.Active := False;
   dtModule.cfgEstadoCivil.Active := True;
end;

procedure TfrmConsultaEstadoCivil.btnSairClick(Sender: TObject);
begin
  inherited;

   Close;
end;

procedure TfrmConsultaEstadoCivil.cmbPesqCampoPropertiesChange(Sender: TObject);
begin
  inherited;

   dtModule.cfgEstadoCivil.First;

   edtPesqTexto.Clear;
   edtPesqTexto.SetFocus;
end;

procedure TfrmConsultaEstadoCivil.edtPesqTextoPropertiesChange(Sender: TObject);
begin
  inherited;

   dtModule.cfgEstadoCivil.Filtered := False;

   if Trim(edtPesqTexto.Text) <> '' then
      FiltroConsulta(dtModule.cfgEstadoCivil, cmbPesqCampo, 'ID_ESTADO_CIVIL', 'DESCRICAO', Trim(edtPesqTexto.Text));
end;

end.
