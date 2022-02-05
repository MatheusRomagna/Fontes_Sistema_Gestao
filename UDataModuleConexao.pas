unit UDataModuleConexao;

interface

uses
  System.SysUtils, System.Classes, UniProvider, InterBaseUniProvider, Data.DB,
  DBAccess, Uni, MemDS, SQLServerUniProvider, MySQLUniProvider;

type
  TDataModuleConexao = class(TDataModule)
    UniConnection1: TUniConnection;
    InterBaseUniProvider1: TInterBaseUniProvider;
    UniTransaction1: TUniTransaction;
    QInsereExcelFIPE: TUniQuery;
    QInsereAcelero: TUniQuery;
    UniConnectionSavanna: TUniConnection;
    SQLServerUniProvider1: TSQLServerUniProvider;
    QueryBuscaCarSavanna: TUniQuery;
    MySQLUniProvider1: TMySQLUniProvider;
    qBuscaFipesRef: TUniQuery;
    qBuscaRefFipe: TUniQuery;
    qBuscaUsuarios: TUniQuery;
    qBuscaUsuariosID: TIntegerField;
    qBuscaUsuariosNOME: TStringField;
    qBuscaUsuariosSENHA: TStringField;
    qBuscaUsuariosHOSTNAME: TStringField;
    qBuscaUsuariosDT_LOGIN: TDateField;
    qBuscaUsuariosID_PERFIL: TIntegerField;
    qBuscaUsuariosNOME_PERFIL: TStringField;
    qBuscaUsuariosEMAIL: TStringField;
    qBuscaUsuariosTELEFONE: TStringField;
    qBuscaUsuariosNIVEL: TIntegerField;
    qAtualizaChamado: TUniQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModuleConexao: TDataModuleConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses UFormPrincipal, UFormAtualizaTabelaFipe, UFormLoading,
  UFormNovoProcessamento, UFormProcPlanAcelero, FMX.UFormGraficosAtendimento,
  Loading, UDataModuleBancoVistoria, UDMPermissoes, UFormAgendamento,
  UFormAjusteDadosFipeAvaliacao, UFormAlteracaoProposta, UFormAlteracaoVeiculo,
  UFormAlteraDadosCliente, UFormAlteraFipeDePaxa, UFormAlteraMidiaAnuncio,
  UFormAlteraPermissaoAppTransp, UFormAlteraPlaca, UFormAnaliseCompra,
  UFormAnaliseCompraQuery, UFormAnaliseComprasTabela, UFormAplicaMargem,
  UFormAtendimentoMultasVeiculo, UFormAtendimentoNovo, UFormAtendimentos,
  UFormAtuHistFIPE, UFormAtuTabFIpe, UFormAvaliarAvaliacao, UFormAvarias,
  UFormAvariasItens, UFormCadaNovoUsuMobile, UFormCadastroTransportadora,
  UFormCadastroTransportadoras, UFormCadaUsuario, UFormCadaUsuariosMobile,
  UFormCadVistoriadores, UFormCidadesCustos, UFormColunasOcultas,
  UFormConcedePermissao, UFormConcFipeModelo, UFormConsutaPlacaAvaliacao,
  UFormCriacaoAvaria, UFormCruzamentoFipes, UFormDadosPagamento,
  UFormDadosPerfil, UFormDadosPgtoTransporte, UFormDataPagamento,
  UFormDetalhesAtendimento, UFormDetalhesAvaliacao, UFormDetalheTransportes,
  UFormDownloadNovaVersao, UFormExcelCompras, UFormExtratoPgtoVeiculos,
  UFormFinanceiroTransportes, UFormFornecedoresFrotista,
  UFormFornecedorFrotistaAddEditar, UFormGestaoAvaliacoes, UFormGestaoAvarias,
  UFormGestaoTransporte, UFormGestaoVistoria, UFormHistFIPE,
  UFormHistoricoAvaliacoes, UFormHistoricoObsAtn, UFormImagem,
  UFormImportacoesEfetuadas, UFormInformacoes, UFormLiberaPermissao,
  UFormListaBancos, UFormListaUsuarios, UFormLoadingCarregamento,
  UFormLoadingOpaco, UFormLoginSavauto, UFormLotesArval, UFormMenuFinanceiro,
  UFormNovaAvaliacao, UformNovaObs, UFormNovoUsuarioTransporte,
  UFormNovoVistoriador, UFormPadroesPlanilhas, UFormPagamentoTransporte,
  UFormPagamentoVeiculo, UFormParametros, UFormPerfis, UFormPermissoesCarga,
  UFormPermissoesUsuarioAppTransporte, UFormPesquisaFipe,
  UFormPgtoExtratoVeiculo, UFormProcPlanFinal, UFormQuitacoesVeiculo,
  UFormRefFipes, UFormSegIPVALic, UFormUltimasAtualizacoes, UFormUsuarios,
  UFormVistoriadores, UFormVistoriasDetalhes, UFormWebBrowse,
  UforTestesDiversos, UnitLogin, UFormAguarde, UFormDetalhesAtendimentoBeta,
  UFormNovaCidadeCusto, UFormPagamentoEmLoteTransportes,
  UFormGestaoDadosSavauto;

{$R *.dfm}

end.
