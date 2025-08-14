unit uConsultaFormaPagamento;

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
  TfrmConsultaFormaPagamento = class(TfrmConsultaPadrao)
    cxGrid1DBTableView1ID_FORMA_PAGAMENTO: TcxGridDBColumn;
    cxGrid1DBTableView1DESCRICAO: TcxGridDBColumn;
    cxGrid1DBTableView1ATIVO: TcxGridDBColumn;
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
  frmConsultaFormaPagamento: TfrmConsultaFormaPagamento;

implementation

{$R *.dfm}

uses uGlobal, uFuncao, uModule, uCadastroFormaPagamento;

procedure TfrmConsultaFormaPagamento.btnAlterarClick(Sender: TObject);
begin
  inherited;

  	with dtModule.sisFormaPagamento do
   	begin
      	DisableControls;

         if not IsEmpty then
            begin
               glbOperacao      := 'A';
               glbIdFormaPagamento := FieldByName('ID_FORMA_PAGAMENTO').AsInteger;

               AberturaJanela(TfrmCadastroFormaPagamento, frmCadastroFormaPagamento, 'Cadastro de Forma Pagamento');

               dtModule.sisFormaPagamento.Active := False;
               dtModule.sisFormaPagamento.Active := True;
            end;

         EnableControls;
      end;
end;

procedure TfrmConsultaFormaPagamento.btnAtualizarClick(Sender: TObject);
begin
  inherited;

  	dtModule.sisFormaPagamento.Active := False;
   dtModule.sisFormaPagamento.Active := True;
end;

procedure TfrmConsultaFormaPagamento.btnExcluirClick(Sender: TObject);
var lclTexto, lclOperacao : String;
begin
  inherited;

  	with dtModule do
   	begin
         if not sisFormaPagamento.IsEmpty then
            begin
               if sisFormaPagamento.FieldByName('ATIVO').AsBoolean = False then
                  begin
                     lclTexto := 'Atenção'#13'Deseja realmente ativar o registro?';
                     lclOperacao := 'A';
                  end
               else if sisFormaPagamento.FieldByName('ATIVO').AsBoolean = True then
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
                                 ProcedureName := '[sis].[P_FORMA_PAGAMENTO_ATIVAR]'
                              else if lclOperacao = 'D' then
                                 ProcedureName := '[sis].[P_FORMA_PAGAMENTO_DESATIVAR]';

                              Parameters.Refresh;

                              Parameters.ParamByName('@ID_FORMA_PAGAMENTO').Value := sisFormaPagamento.FieldByName('ID_FORMA_PAGAMENTO').AsInteger;
                              Parameters.ParamByName('@USUARIO_OPERACAO').Value   := glbUsuario;

                              ExecProc;
                           end;

                        Notificacao('Operação realizada com sucesso!');

                        dtModule.sisFormaPagamento.Active := False;
                        dtModule.sisFormaPagamento.Active := True;
                     except
                        on E : Exception do
                           Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
                     end;
                  end;
            end;
      end;
end;

procedure TfrmConsultaFormaPagamento.btnIncluirClick(Sender: TObject);
begin
  inherited;

  	with dtModule.sisFormaPagamento do
   	begin
      	DisableControls;

         glbOperacao := 'I';

         AberturaJanela(TfrmCadastroFormaPagamento, frmCadastroFormaPagamento, 'Cadastro de Forma de Pagamento');

         dtModule.sisFormaPagamento.Active := False;
         dtModule.sisFormaPagamento.Active := True;

         EnableControls;
      end;
end;

procedure TfrmConsultaFormaPagamento.btnSairClick(Sender: TObject);
begin
  inherited;

   Close;
end;

procedure TfrmConsultaFormaPagamento.cmbPesqCampoPropertiesChange(
  Sender: TObject);
begin
  inherited;

   dtModule.sisFormaPagamento.First;

   edtPesqTexto.Clear;
   edtPesqTexto.SetFocus;
end;

procedure TfrmConsultaFormaPagamento.edtPesqTextoPropertiesChange(
  Sender: TObject);
begin
  inherited;

   dtModule.sisFormaPagamento.Filtered := False;

   if Trim(edtPesqTexto.Text) <> '' then
      FiltroConsulta(dtModule.sisFormaPagamento, cmbPesqCampo, 'ID_FORMA_PAGAMENTO', 'DESCRICAO', Trim(edtPesqTexto.Text));
end;

procedure TfrmConsultaFormaPagamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

   dtModule.sisFormaPagamento.Active := False;
end;

procedure TfrmConsultaFormaPagamento.FormCreate(Sender: TObject);
begin
  inherited;

	Brush.Style := bsClear;

   TraducaoFormulario('TraduçãoDev.ini', locCargo);
end;

procedure TfrmConsultaFormaPagamento.FormShow(Sender: TObject);
begin
  inherited;

	with dtModule.sisFormaPagamento do
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
