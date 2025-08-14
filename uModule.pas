unit uModule;

interface

uses
  System.SysUtils, System.Classes, System.Notification, Data.DB, Data.Win.ADODB, MidasLib,
  Datasnap.DBClient;

type
  TdtModule = class(TDataModule)
    NotificationCenter: TNotificationCenter;
    ADOConnection: TADOConnection;
    ADOStoredProc: TADOStoredProc;
    ADOQuery: TADOQuery;
    DataSource: TDataSource;
    ADOQueryPermissao: TADOQuery;
    cfgConfiguracao: TADOTable;
    dscfgConfiguracao: TDataSource;
    cfgUsuario: TADOTable;
    dscfgUsuario: TDataSource;
    cfgPais: TADOTable;
    dscfgPais: TDataSource;
    cfgEstado: TADOTable;
    dscfgEstado: TDataSource;
    cfgCidade: TADOTable;
    dscfgCidade: TDataSource;
    cfgModulo: TADOTable;
    dscfgModulo: TDataSource;
    sisPessoa: TADOTable;
    dssisPessoa: TDataSource;
    ADOQueryAux: TADOQuery;
    DataSourceAux: TDataSource;
    cfgUsuarioModulo: TADOTable;
    dscfgUsuarioModulo: TDataSource;
    cfgVUsuarioModulo: TADOTable;
    dscfgVUsuarioModulo: TDataSource;
    sisPlano: TADOTable;
    dssisPlano: TDataSource;
    sisFilantropia: TADOTable;
    dssisFilantropia: TDataSource;
    sisPessoaPlano: TADOTable;
    dssisPessoaPlano: TDataSource;
    sisPessoaFilantropia: TADOTable;
    dssisPessoaFilantropia: TDataSource;
    sisVPessoaPlano: TADOTable;
    dssisVPessoaPlano: TDataSource;
    sisVPessoaFilantropia: TADOTable;
    dssisVPessoaFilantropia: TDataSource;
    sisVDadosPessoa: TADOTable;
    dssisVDadosPessoa: TDataSource;
    sisVPessoaPlanoFilantropia: TADOTable;
    dssisVPessoaPlanoFilantropia: TDataSource;
    sisFinanceiro: TADOTable;
    dssisFinanceiro: TDataSource;
    sisTipoContato: TADOTable;
    dssisTipoContato: TDataSource;
    sisTipoDocumento: TADOTable;
    dssisTipoDocumento: TDataSource;
    sisTipoEndereco: TADOTable;
    dssisTipoEndereco: TDataSource;
    sisClassificacao: TADOTable;
    dssisClassificacao: TDataSource;
    sisAtividade: TADOTable;
    dssisAtividade: TDataSource;
    sisContato: TADOTable;
    dssisContato: TDataSource;
    sisDocumento: TADOTable;
    dssisDocumento: TDataSource;
    sisEndereco: TADOTable;
    dssisEndereco: TDataSource;
    sisVDadosPessoaContato: TADOTable;
    dssisVDadosPessoaContato: TDataSource;
    sisVDadosPessoaDocumento: TADOTable;
    dssisVDadosPessoaDocumento: TDataSource;
    sisVDadosPessoaEndereco: TADOTable;
    dssisVDadosPessoaEndereco: TDataSource;
    sisVDadosPessoaFinanceiro: TADOTable;
    dssisVDadosPessoaFinanceiro: TDataSource;
    sisVDadosFinanceiro: TADOTable;
    dssisVDadosFinanceiro: TDataSource;
    cfgEstadoCivil: TADOTable;
    dscfgEstadoCivil: TDataSource;
    sisVDadosPessoaSanto: TADOTable;
    sisVDadosPessoaObrigacao: TADOTable;
    dssisVDadosPessoaSanto: TDataSource;
    dssisVDadosPessoaObrigacao: TDataSource;
    cfgVModulo: TADOTable;
    dscfgVModulo: TDataSource;
    sisFormaPagamento: TADOTable;
    dssisFormaPagamento: TDataSource;
    sisVDadosPagamentoDiverso: TADOTable;
    dssisVDadosPagamentoDiverso: TDataSource;
    ADOQueryAux2: TADOQuery;
    DataSourceAux2: TDataSource;
    oldVDadosAntigoCompleto: TADOTable;
    dsoldVDadosAntigoCompleto: TDataSource;
    sisMotivoStatus: TADOTable;
    dssisMotivoStatus: TDataSource;
    sisTipoPagamentoDiverso: TADOTable;
    dssisTipoPagamentoDiverso: TDataSource;
    sisVPessoaPlanoID_PESSOA_PLANO: TIntegerField;
    sisVPessoaPlanoID_PESSOA: TIntegerField;
    sisVPessoaPlanoID_PLANO: TIntegerField;
    sisVPessoaPlanoNOME: TStringField;
    sisVPessoaPlanoDESCRICAO: TStringField;
    sisVPessoaPlanoVALOR: TBCDField;
    sisVPessoaPlanoREFER_INICIO: TStringField;
    sisVPessoaPlanoREFER_FIM: TStringField;
    ADOQueryProcedure: TADOQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtModule: TdtModule;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uFuncao, uGlobal;

{$R *.dfm}

procedure TdtModule.DataModuleCreate(Sender: TObject);
begin
   CarregaArquivoIni( 'Straes_Xango_Menino.dll', ADOConnection );
end;

end.
