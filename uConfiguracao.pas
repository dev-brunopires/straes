unit uConfiguracao;

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
  dxSkinXmas2008Blue, cxControls, dxSkinscxPCPainter, dxBarBuiltInMenu, cxPC,
  Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls, cxContainer, cxEdit, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxLabel, cxTextEdit, cxMaskEdit,
  cxSpinEdit, cxTimeEdit, cxDropDownEdit, Datasnap.DBClient, cxLocalization, DateUtils,
  cxGroupBox, ACBrBase, ACBrEnterTab, cxCurrencyEdit, cxCheckBox,
  System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids;

type
  TfrmConfiguracao = class(TfrmCadastroPadrao)
    cxLabel24: TcxLabel;
    edtAnoContabil: TcxTextEdit;
    edtDiaVencimento: TcxTextEdit;
    cxLabel3: TcxLabel;
    btnAdicionar: TcxButton;
    btnRemover: TcxButton;
    cmbAtivo: TcxComboBox;
    cxLabel2: TcxLabel;
    btnAlterar: TcxButton;
    btnEditar: TcxButton;
    DBGrid1: TDBGrid;
    btnLimpar: TcxButton;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnRemoverClick(Sender: TObject);
    procedure mnuAtivoClick(Sender: TObject);
    procedure mnuDeleteClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnEditarClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure cmbAtivoExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    procedure VerificaAnoAtivo;
    procedure DesativaTodos;

    function ValidaCamposFinanceiro : Boolean;
    function VerificaExisteAtivo : Boolean;
  public
    { Public declarations }
  end;

var
  frmConfiguracao: TfrmConfiguracao;

implementation

{$R *.dfm}

uses uModule, uFuncao, uGlobal;

procedure TfrmConfiguracao.btnAdicionarClick(Sender: TObject);
begin
  inherited;

  	if ValidaCamposFinanceiro then
   	begin
      	if cmbAtivo.ItemIndex = 1 then
         	DesativaTodos;

			try
         	with dtModule.cfgConfiguracao do
            	begin
                  Append;

                  FieldByName('FIN_ANO_CONTABIL').AsString 	 := edtAnoContabil.Text;
                  FieldByName('FIN_DIA_VENCIMENTO').AsString := edtDiaVencimento.Text;
                  FieldByName('FIN_JUROS_DIA').AsCurrency    := 0;

                  if cmbAtivo.ItemIndex = 0 then
                  	FieldByName('ATIVO').Value := False
                  else if cmbAtivo.ItemIndex = 1 then
                  	FieldByName('ATIVO').Value := True;

						FieldByName('USUARIO_OPERACAO').Value := glbUsuario;

                  Post;
               end;
         except
            on E : Exception do
               Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
         end;

         VerificaAnoAtivo;

         glbIdConfiguracao   := 0;
         edtAnoContabil.Clear;
         edtDiaVencimento.Clear;
         cmbAtivo.ItemIndex  := 0;

         if not dtModule.cfgConfiguracao.IsEmpty then
            dtModule.cfgConfiguracao.First;

         edtAnoContabil.SetFocus;
      end;
end;

procedure TfrmConfiguracao.btnCancelarClick(Sender: TObject);
begin
  inherited;

   {if dtModule.cfgConfiguracao.Locate('ATIVO', True, []) then
      begin
         glbAnoContabil   := dtModule.cfgConfiguracao.FieldByName('FIN_ANO_CONTABIL').Value;
         glbDiaVencimento := dtModule.cfgConfiguracao.FieldByName('FIN_DIA_VENCIMENTO').Value;
      end;

   dtModule.cfgConfiguracao.Active := False;}

  	Close;
end;

procedure TfrmConfiguracao.btnEditarClick(Sender: TObject);
begin
  inherited;

   with dtModule.cfgConfiguracao do
      begin
         if not IsEmpty then
            begin
               edtAnoContabil.Text   := FieldByName('FIN_ANO_CONTABIL').AsString;
               edtDiaVencimento.Text := FieldByName('FIN_DIA_VENCIMENTO').AsString;

               if FieldByName('ATIVO').AsBoolean = True then
                  cmbAtivo.ItemIndex := 0
               else
                  cmbAtivo.ItemIndex := 1;

               edtAnoContabil.SetFocus;

               try
                  Delete;
               except
                  on E : Exception do
                     Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
               end;
            end;
      end;

end;

procedure TfrmConfiguracao.btnLimparClick(Sender: TObject);
begin
  inherited;

   edtAnoContabil.Clear;
   edtDiaVencimento.Clear;
   cmbAtivo.ItemIndex := 1;

   edtAnoContabil.SetFocus;
end;

procedure TfrmConfiguracao.mnuAtivoClick(Sender: TObject);
begin
  inherited;

  	btnAlterar.OnClick(Self);
end;

procedure TfrmConfiguracao.DBGrid1DblClick(Sender: TObject);
begin
  inherited;

   btnEditar.OnClick(Self);
end;

procedure TfrmConfiguracao.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;

   if dtModule.cfgConfiguracao.FieldByName('ATIVO').AsBoolean = True then
      begin
         TDBGrid(Sender).Canvas.Font.Style := [fsBold];

         TDBGrid(Sender).Canvas.FillRect(Rect);

         TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end;
end;

procedure TfrmConfiguracao.DesativaTodos;
begin
	with dtModule.cfgConfiguracao do
   	begin
         if not IsEmpty then
         	begin
            	DisableControls;

            	First;

               while not Eof do
               	begin
                     try
                        Edit;

								FieldByName('ATIVO').AsBoolean := False;

                        Post;
                     except
                        on E : Exception do
                           Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
                     end;

                     Next;
                  end;

               EnableControls;
            end;
      end;
end;

procedure TfrmConfiguracao.btnRemoverClick(Sender: TObject);
begin
  inherited;

  	with dtModule.cfgConfiguracao do
   	begin
         if not IsEmpty then
         	begin
            	if FieldByName('ATIVO').Value = False then
               	begin
                     try
                        Delete;
                     except
                        on E : Exception do
                           Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
                     end;

                     VerificaAnoAtivo;

                     if not dtModule.cfgConfiguracao.IsEmpty then
                        dtModule.cfgConfiguracao.First;
                  end
               else
               	Notificacao('Não é possível remover um ano contábil ativo.');
            end;
      end;
end;

procedure TfrmConfiguracao.cmbAtivoExit(Sender: TObject);
begin
  inherited;

   if ( edtAnoContabil.Text <> '' ) and
      ( edtDiaVencimento.Text <> '' ) then
      btnAdicionar.OnClick(Self);
end;

procedure TfrmConfiguracao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

   dtModule.cfgConfiguracao.Active := False;
end;

procedure TfrmConfiguracao.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;

   if dtModule.cfgConfiguracao.Locate('ATIVO', True, []) then
      begin
         glbAnoContabil   := dtModule.cfgConfiguracao.FieldByName('FIN_ANO_CONTABIL').Value;
         glbDiaVencimento := dtModule.cfgConfiguracao.FieldByName('FIN_DIA_VENCIMENTO').Value;
      end;

   dtModule.cfgConfiguracao.Active := False;

  	//Close;
end;

procedure TfrmConfiguracao.FormCreate(Sender: TObject);
begin
  inherited;

	Brush.Style := bsClear;

   TraducaoFormulario('TraduçãoDev.ini', locCargo);
end;

procedure TfrmConfiguracao.FormShow(Sender: TObject);
begin
  inherited;

   dtModule.cfgConfiguracao.Active := True;

   glbIdConfiguracao   := 0;
   edtAnoContabil.Clear;
   edtDiaVencimento.Clear;
   cmbAtivo.ItemIndex  := 0;

   edtAnoContabil.SetFocus;
end;

procedure TfrmConfiguracao.mnuDeleteClick(Sender: TObject);
begin
  inherited;

  	btnRemover.OnClick(Self);
end;

function TfrmConfiguracao.ValidaCamposFinanceiro: Boolean;
begin
	Result := False;

   if edtAnoContabil.Text = '' then
   	begin
      	Notificacao('Informe o ano contábil.');
         edtAnoContabil.SetFocus;
      end
   else if edtDiaVencimento.Text = '' then
   	begin
         Notificacao('Informe o dia de vencimento das referências.');
         edtDiaVencimento.SetFocus;
      end
   else if cmbAtivo.ItemIndex = -1 then
   	begin
         Notificacao('Informe o status.');
         cmbAtivo.SetFocus;
      end
   else
   	Result := True;
end;

procedure TfrmConfiguracao.VerificaAnoAtivo;
var lclStatus : Boolean;
	 lclAno : String;
begin
	lclStatus := False;

	with dtModule.cfgConfiguracao do
   	begin
         if not IsEmpty then
         	begin
            	First;

               lclAno := FormatDateTime('yyyy', Now );

               while not Eof do
               	begin
                  	if FieldByName('ATIVO').AsBoolean = True then
	                  	lclStatus := FieldByName('ATIVO').AsBoolean;

							if ( StrToInt( lclAno ) < StrToInt( FormatDateTime('yyyy', Date() ) ) ) then
	                     if ( StrToInt( FieldByName('FIN_ANO_CONTABIL').AsString ) > StrToInt( lclAno ) ) then
		                     lclAno := FieldByName('FIN_ANO_CONTABIL').AsString;

                     Next;
                  end;

               if lclStatus = False then
               	begin
                     Filtered := False;
                     Filter   := 'FIN_ANO_CONTABIL = ' + QuotedStr(lclAno);
							Filtered := True;

                     if not IsEmpty then
                     	begin
                           try
                           	glbIdConfiguracao := FieldByName('ID_CONFIGURACAO').AsInteger;
                              glbAnoContabil    := FieldByName('FIN_ANO_CONTABIL').AsString;
                              glbDiaVencimento  := FieldByName('FIN_DIA_VENCIMENTO').AsString;
                              glbJurosDia       := 0;

                           	Edit;

                              FieldByName('ATIVO').AsBoolean := True;

                              Post;
                           except
                              on E : Exception do
                                 Notificacao( E.ClassName + 'Ocorreu um erro ao realizar a operação!' + #13 + E.Message );
                           end;
                        end;

                     Filtered := False;
                  end;
            end;
      end;
end;

function TfrmConfiguracao.VerificaExisteAtivo: Boolean;
begin
	with dtModule.cfgConfiguracao do
   	begin
         Result := True;

         Filtered := False;
         Filter   := 'ATIVO = TRUE';
         Filtered := True;

         if IsEmpty then
         	begin
	         	Notificacao('Informe pelo menos um ano contábil como ativo no sistema.');
               Result := False;
            end;

         Filtered := False;
      end;
end;

end.
