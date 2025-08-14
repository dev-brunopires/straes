unit uPrincipal;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
     Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, dxGDIPlusClasses, Vcl.ExtCtrls,
     cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,

     Printers,

     dxCustomTileControl, dxTileControl, cxClasses,
     System.ImageList, Vcl.ImgList, dxSkinsForm, Vcl.Buttons, cxLocalization,
     Vcl.StdCtrls, frxClass, frxDBSet, frxExportPDF, madExceptVcl, dxScreenTip,
     dxBar, Data.DB, Vcl.Grids, Vcl.DBGrids, cxContainer, cxEdit, Vcl.DBCtrls,
     cxTextEdit, cxMaskEdit, cxDropDownEdit, cxDBEdit, cxLookupEdit,
     cxDBLookupEdit, cxDBLookupComboBox, dxSkinsCore, dxSkinBlack, dxSkinBlue,
     dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
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
     dxSkinXmas2008Blue, ACBrBase, ACBrECF{, VDOBasePrinter, VDOCaPrinter,
     VDODmPrinter, VDOPrinter};

type
  TfrmPrincipal = class(TForm)
    imgFundo: TImage;
    mmPrincipal: TMainMenu;
    mnuSis: TMenuItem;
    mnuSisSai: TMenuItem;
    dxTileControlPrincipalGroupCadastro: TdxTileControlGroup;
    dxTileControlPrincipalActionBarItemSair: TdxTileControlActionBarItem;
    BtnMnuUsuario: TdxTileControlItem;
    locCargo: TcxLocalizer;
    mnuSisSob: TMenuItem;
    mnuParCon: TMenuItem;
    dxSkinController: TdxSkinController;
    MadExceptionHandler: TMadExceptionHandler;
    ImageList: TImageList;
    mnuCad: TMenuItem;
    BtnMnuPessoa: TdxTileControlItem;
    mnuCadUsu: TMenuItem;
    mnuPar: TMenuItem;
    mnuParMod: TMenuItem;
    BtnMnuModulo: TdxTileControlItem;
    BtnMnuPermissao: TdxTileControlItem;
    mnuParPer: TMenuItem;
    mnuCadPes: TMenuItem;
    BtnMnuPlano: TdxTileControlItem;
    BtnMnuFilantropia: TdxTileControlItem;
    mnuCadPla: TMenuItem;
    mnuCadFil: TMenuItem;
    mnuFin: TMenuItem;
    mnuFinDes: TMenuItem;
    BtnMnuDesconto: TdxTileControlItem;
    mnuCadTpC: TMenuItem;
    mnuCadTpD: TMenuItem;
    mnuCadTpE: TMenuItem;
    mnuCadCla: TMenuItem;
    mnuCadAti: TMenuItem;
    dxTileControlPrincipalGroupFinanceiro: TdxTileControlGroup;
    BtnMnuTesouraria: TdxTileControlItem;
    mnuFinTes: TMenuItem;
    mnuCadEst: TMenuItem;
    mnuCadFor: TMenuItem;
    BtnMnuPagamentoDiverso: TdxTileControlItem;
    mnuFinDiv: TMenuItem;
    BtnMnuGeraDebitoAnual: TdxTileControlItem;
    mnuFinDeb: TMenuItem;
    BtnMnuImportar: TdxTileControlItem;
    dxTileControlPrincipalGroup1: TdxTileControlGroup;
    mnuParImp: TMenuItem;
    mnuRel: TMenuItem;
    mnuRelAdm: TMenuItem;
    mnuCadTdv: TMenuItem;
    procedure mnuSisSaiClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure dxTileControlPrincipalActionBarItemSairClick(
      Sender: TdxTileControlActionBarItem);
    procedure FormShow(Sender: TObject);
    procedure mnuParConClick(Sender: TObject);
    procedure BtnMnuUsuarioClick(Sender: TdxTileControlItem);
    procedure mnuCadUsuClick(Sender: TObject);
    procedure mnuSisSobClick(Sender: TObject);
    procedure BtnMnuModuloClick(Sender: TdxTileControlItem);
    procedure mnuParModClick(Sender: TObject);
    procedure BtnMnuPermissaoClick(Sender: TdxTileControlItem);
    procedure mnuParPerClick(Sender: TObject);
    procedure BtnMnuPessoaClick(Sender: TdxTileControlItem);
    procedure mnuCadPesClick(Sender: TObject);
    procedure BtnMnuPlanoClick(Sender: TdxTileControlItem);
    procedure BtnMnuFilantropiaClick(Sender: TdxTileControlItem);
    procedure mnuCadPlaClick(Sender: TObject);
    procedure mnuCadFilClick(Sender: TObject);
    procedure BtnMnuDescontoClick(Sender: TdxTileControlItem);
    procedure mnuFinDesClick(Sender: TObject);
    procedure mnuCadTpCClick(Sender: TObject);
    procedure mnuCadTpDClick(Sender: TObject);
    procedure mnuCadTpEClick(Sender: TObject);
    procedure mnuCadClaClick(Sender: TObject);
    procedure mnuCadAtiClick(Sender: TObject);
    procedure BtnMnuTesourariaClick(Sender: TdxTileControlItem);
    procedure mnuFinTesClick(Sender: TObject);
    procedure mnuCadEstClick(Sender: TObject);
    procedure mnuCadForClick(Sender: TObject);
    procedure BtnMnuPagamentoDiversoClick(Sender: TdxTileControlItem);
    procedure mnuFinDivClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure BtnMnuGeraDebitoAnualClick(Sender: TdxTileControlItem);
    procedure mnuFinDebClick(Sender: TObject);
    procedure mnuParImpClick(Sender: TObject);
    procedure BtnMnuImportarClick(Sender: TdxTileControlItem);
    procedure BtnMnuRelatorioClick(Sender: TdxTileControlItem);
    procedure mnuRelAdmClick(Sender: TObject);
    procedure mnuCadTdvClick(Sender: TObject);
  private
    { Private declarations }
    //Menu Cadastro
    procedure Usuario;
    procedure Classificacao;
    procedure Atividade;
    procedure TipoContato;
    procedure TipoDocumento;
    procedure TipoEndereco;
    procedure Plano;
    procedure Filantropia;
    procedure EstadoCivil;
    procedure FormaPagamento;
    procedure Pessoa;
    procedure TipoPagamentoDiverso;

    //Menu Financeiro
    procedure Desconto;
    procedure Tesouraria;
    procedure PagamentoDiverso;
    procedure DebitoAnual;

    //Menu Parãmetros
    procedure Configuracao;
    procedure Modulo;
    procedure Permissao;
    procedure Importar;

    //Menu Relatório
    procedure Relatorio;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uFuncao, uGlobal, uModule, uLogin, uConfiguracao, uConsultaUsuario,
  uConsultaModulo, uPermissaoAcesso, uConsultaPessoa, uConsultaPlano,
  uConsultaFilantropia, uConcessaoDesconto, uConsultaTipoContato,
  uConsultaTipoDocumento, uConsultaTipoEndereco, uConsultaClassificacao,
  uConsultaAtividade, uTesouraria, uConsultaEstadoCivil, uConsultaFormaPagamento,
  uPagamentoDiverso, uGeraDebitoAnual, uImportaDados, uRelatorioAdministrativo,
  uConsultaTipoPagamentoDiverso;

procedure TfrmPrincipal.Usuario;
begin
	glbOperacao := '';

   AberturaJanela(TfrmConsultaUsuario, frmConsultaUsuario, 'Consulta de Usuário');
end;

procedure TfrmPrincipal.Modulo;
begin
	glbOperacao := '';

   AberturaJanela(TfrmConsultaModulo, frmConsultaModulo, 'Consulta de Módulo');
end;

procedure TfrmPrincipal.Permissao;
begin
	glbOperacao := '';

   AberturaJanela(TfrmPermissaoAcesso, frmPermissaoAcesso, 'Permissão de Acesso');

   CarregaPermissaoAcessoMenu( glbUsuario );
   CarregaPermissaoAcessoBotao( glbUsuario );
end;

procedure TfrmPrincipal.Configuracao;
begin
   glbOperacao := '';

   AberturaJanela(TfrmConfiguracao, frmConfiguracao, 'Configuração');
end;

procedure TfrmPrincipal.Pessoa;
begin
   glbOperacao := '';

   AberturaJanela(TfrmConsultaPessoa, frmConsultaPessoa, 'Consulta de Pessoa');
end;

procedure TfrmPrincipal.TipoPagamentoDiverso;
begin
   glbOperacao := '';

   AberturaJanela(TfrmConsultaTipoPagamentoDiverso, frmConsultaTipoPagamentoDiverso, 'Tipo de Pagamentos Diversos');
end;

procedure TfrmPrincipal.Plano;
begin
   glbOperacao := '';

   AberturaJanela(TfrmConsultaPlano, frmConsultaPlano, 'Consulta de Plano');
end;

procedure TfrmPrincipal.mnuCadPlaClick(Sender: TObject);
begin
	Plano;
end;

procedure TfrmPrincipal.mnuCadTpCClick(Sender: TObject);
begin
	TipoContato;
end;

procedure TfrmPrincipal.mnuCadTpDClick(Sender: TObject);
begin
	TipoDocumento;
end;

procedure TfrmPrincipal.mnuCadTpEClick(Sender: TObject);
begin
	TipoEndereco;
end;

procedure TfrmPrincipal.Filantropia;
begin
   glbOperacao := '';
   AberturaJanela(TfrmConsultaFilantropia, frmConsultaFilantropia, 'Consulta de Filantropia');
end;

procedure TfrmPrincipal.Desconto;
begin
   glbOperacao := '';
   AberturaJanela(TfrmConcessaoDesconto, frmConcessaoDesconto, 'Concessão de Desconto');
end;

procedure TfrmPrincipal.Tesouraria;
begin
	glbOperacao := '';
   AberturaJanela(TfrmTesouraria, frmTesouraria, 'Tesouraria');
end;

procedure TfrmPrincipal.Classificacao;
begin
	glbOperacao := '';
   AberturaJanela(TfrmConsultaClassificacao, frmConsultaClassificacao, 'Consulta de Classificação');
end;

procedure TfrmPrincipal.Atividade;
begin
	glbOperacao := '';
   AberturaJanela(TfrmConsultaAtividade, frmConsultaAtividade, 'Consulta de Atividade');
end;

procedure TfrmPrincipal.TipoContato;
begin
   glbOperacao := '';
   AberturaJanela(TfrmConsultaTipoContato, frmConsultaTipoContato, 'Consulta de Tipo de Contato');
end;

procedure TfrmPrincipal.TipoDocumento;
begin
   glbOperacao := '';
   AberturaJanela(TfrmConsultaTipoDocumento, frmConsultaTipoDocumento, 'Consulta de Tipo de Documento');
end;

procedure TfrmPrincipal.TipoEndereco;
begin
   glbOperacao := '';
   AberturaJanela(TfrmConsultaTipoEndereco, frmConsultaTipoEndereco, 'Consulta de Tipo de Endereço');
end;

procedure TfrmPrincipal.EstadoCivil;
begin
   glbOperacao := '';
   AberturaJanela(TfrmConsultaEstadoCivil, frmConsultaEstadoCivil, 'Consulta de Estado Civil');
end;

procedure TfrmPrincipal.FormaPagamento;
begin
   glbOperacao := '';
   AberturaJanela(TfrmConsultaFormaPagamento, frmConsultaFormaPagamento, 'Consulta de Forma de Pagamento');
end;

procedure TfrmPrincipal.PagamentoDiverso;
begin
   glbOperacao := '';
   AberturaJanela(TfrmPagamentoDiverso, frmPagamentoDiverso, 'Pagamentos Diversos');
end;

procedure TfrmPrincipal.DebitoAnual;
begin
   glbOperacao := '';
   AberturaJanela(TfrmGeraDebitoAnual, frmGeraDebitoAnual, 'Geração de Débito Anual');
end;

procedure TfrmPrincipal.Importar;
begin
   glbOperacao := '';
   AberturaJanela(TfrmImportaDados, frmImportaDados, 'Importação de Dados');
end;

procedure TfrmPrincipal.mnuCadTdvClick(Sender: TObject);
begin
   TipoPagamentoDiverso;
end;

procedure TfrmPrincipal.Relatorio;
begin
   glbOperacao := '';
   AberturaJanela(TfrmRelatorioAdministrativo, frmRelatorioAdministrativo, 'Relatórios Administrativos');
end;

procedure TfrmPrincipal.mnuCadAtiClick(Sender: TObject);
begin
	Atividade;
end;

procedure TfrmPrincipal.mnuCadClaClick(Sender: TObject);
begin
	Classificacao;
end;

procedure TfrmPrincipal.mnuCadEstClick(Sender: TObject);
begin
   EstadoCivil;
end;

procedure TfrmPrincipal.mnuCadFilClick(Sender: TObject);
begin
	Filantropia;
end;

procedure TfrmPrincipal.BtnMnuUsuarioClick(Sender: TdxTileControlItem);
begin
	Usuario;
end;

procedure TfrmPrincipal.Button2Click(Sender: TObject);
var iPrinter   : TPrinter;
    PrinterY   : Integer;
    TargetRect : TRect;
begin
   iPrinter:= TPrinter.Create;

   PrinterY :=  0;

   iPrinter.Title := PChar(Application.Title);

   While Printer.Printing Do
      Sleep(100);

   iPrinter.BeginDoc;

   iPrinter.Canvas.Font.Name := 'Courier';
   iPrinter.Canvas.Font.Style := [fsBold];
   iPrinter.Canvas.Font.Size  := 8;

   iPrinter.Canvas.TextOut(25, PrinterY, 'XANGÔ MENINO - INSTITUIÇÃO UMBANDISTA');
   Inc(PrinterY,30);
   iPrinter.Canvas.TextOut(200, PrinterY, 'FILANTROPICA');
   Inc(PrinterY,30);

   iPrinter.Canvas.TextOut(0,PrinterY,'------------------------------------------------------------------------------------');
   Inc(PrinterY,30);
   iPrinter.Canvas.TextOut(0,PrinterY,'Rua Xangô Menino, 96 - Miramar - Macaé, RJ, Brasil');
   Inc(PrinterY,30);
   iPrinter.Canvas.TextOut(250,PrinterY,'27.943-520');
   iPrinter.Canvas.TextOut(0,PrinterY,'------------------------------------------------------------------------------------');

   Inc(PrinterY,60);
   iPrinter.Canvas.TextOut(240,PrinterY,'RECIBO');
   Inc(PrinterY,60);

   iPrinter.Canvas.TextOut(0,PrinterY,'MATRÍCULA:');
   Inc(PrinterY,30);
   iPrinter.Canvas.TextOut(0,PrinterY,'NOME:');
   Inc(PrinterY,30);

   iPrinter.Canvas.TextOut(0,PrinterY,'REFERÊNCIA:');
   Inc(PrinterY,30);
   iPrinter.Canvas.TextOut(0,PrinterY,'VENCIMENTO:');
   Inc(PrinterY,30);
   iPrinter.Canvas.TextOut(0,PrinterY,'VALOR:');
   Inc(PrinterY,30);
   iPrinter.Canvas.TextOut(0,PrinterY,'PAGAMENTO:');
   Inc(PrinterY,30);

   iPrinter.Canvas.TextOut(225,PrinterY,FormatDateTime('dd/mm/yyyy', Date()));

   iPrinter.EndDoc;

   iPrinter.Free;
end;

procedure TfrmPrincipal.mnuCadPesClick(Sender: TObject);
begin
	Pessoa;
end;

procedure TfrmPrincipal.mnuCadUsuClick(Sender: TObject);
begin
	Usuario;
end;

procedure TfrmPrincipal.mnuFinDebClick(Sender: TObject);
begin
   DebitoAnual;
end;

procedure TfrmPrincipal.mnuFinDesClick(Sender: TObject);
begin
	Desconto;
end;

procedure TfrmPrincipal.mnuFinDivClick(Sender: TObject);
begin
   PagamentoDiverso;
end;

procedure TfrmPrincipal.mnuFinTesClick(Sender: TObject);
begin
	Tesouraria;
end;

procedure TfrmPrincipal.mnuCadForClick(Sender: TObject);
begin
   FormaPagamento;
end;

procedure TfrmPrincipal.BtnMnuDescontoClick(Sender: TdxTileControlItem);
begin
	Desconto;
end;

procedure TfrmPrincipal.BtnMnuFilantropiaClick(Sender: TdxTileControlItem);
begin
	Filantropia;
end;

procedure TfrmPrincipal.BtnMnuGeraDebitoAnualClick(Sender: TdxTileControlItem);
begin
   DebitoAnual;
end;

procedure TfrmPrincipal.BtnMnuImportarClick(Sender: TdxTileControlItem);
begin
   Importar;
end;

procedure TfrmPrincipal.BtnMnuModuloClick(Sender: TdxTileControlItem);
begin
	Modulo;
end;

procedure TfrmPrincipal.mnuParModClick(Sender: TObject);
begin
	Modulo;
end;

procedure TfrmPrincipal.BtnMnuPagamentoDiversoClick(Sender: TdxTileControlItem);
begin
   PagamentoDiverso;
end;

procedure TfrmPrincipal.BtnMnuPermissaoClick(Sender: TdxTileControlItem);
begin
	Permissao;
end;

procedure TfrmPrincipal.mnuParPerClick(Sender: TObject);
begin
	Permissao;
end;

procedure TfrmPrincipal.mnuRelAdmClick(Sender: TObject);
begin
   Relatorio;
end;

procedure TfrmPrincipal.BtnMnuPessoaClick(Sender: TdxTileControlItem);
begin
	Pessoa;
end;

procedure TfrmPrincipal.BtnMnuPlanoClick(Sender: TdxTileControlItem);
begin
	Plano;
end;

procedure TfrmPrincipal.BtnMnuRelatorioClick(Sender: TdxTileControlItem);
begin
   Relatorio;
end;

procedure TfrmPrincipal.BtnMnuTesourariaClick(Sender: TdxTileControlItem);
begin
	Tesouraria;
end;

procedure TfrmPrincipal.mnuParConClick(Sender: TObject);
begin
	Configuracao;
end;

procedure TfrmPrincipal.mnuParImpClick(Sender: TObject);
begin
   Importar;
end;

procedure TfrmPrincipal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
	CanClose := Application.MessageBox('Atenção!'#13'Deseja realmente sair do sistema?', PChar(Application.Title), MB_YESNO Or MB_ICONQUESTION ) = IDYES;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
	Brush.Style := bsClear;

   TraducaoFormulario('TraduçãoDev.ini', locCargo);

	try
      Application.CreateForm(TfrmLogin, frmLogin);
      frmLogin.ShowModal;
   finally
      frmLogin.Free;
   end;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
   TituloForm(frmPrincipal, '', '');

   CarregaPermissaoAcessoMenu( glbUsuario );
   CarregaPermissaoAcessoBotao( glbUsuario );

   CarregaConfiguracao;
end;

procedure TfrmPrincipal.mnuSisSaiClick(Sender: TObject);
begin
	Close;
end;

procedure TfrmPrincipal.mnuSisSobClick(Sender: TObject);
begin
	Notificacao('Em breve será disponibilizado o manual eletrônico para utilização do sistema. Aguarde!');
end;

procedure TfrmPrincipal.dxTileControlPrincipalActionBarItemSairClick(
  Sender: TdxTileControlActionBarItem);
begin
   Close;
end;

end.
