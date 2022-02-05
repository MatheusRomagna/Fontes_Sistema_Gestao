unit UDataModuleBancoVistoria;

interface

uses
  System.SysUtils, System.Classes, UniProvider, MySQLUniProvider, DBAccess, Uni,
  Data.DB, MemDS;

type
  TDataModuleBancoVistoria = class(TDataModule)
    UniConnection1: TUniConnection;
    UniTransaction1: TUniTransaction;
    MySQLUniProvider1: TMySQLUniProvider;
    qConsultaPlaca: TUniQuery;
    qConsultaFotos: TUniQuery;
    qBuscaAvaliacoes: TUniQuery;
    qBuscaAvaliacoesdata_avaliacao: TDateTimeField;
    qBuscaAvaliacoesplaca: TStringField;
    qBuscaAvaliacoesano: TStringField;
    qBuscaAvaliacoesmodelo: TStringField;
    qBuscaAvaliacoesnome_cliente: TStringField;
    qBuscaAvaliacoestelefone: TStringField;
    qBuscaAvaliacoestipo: TStringField;
    qBuscaAvaliacoesportas: TStringField;
    qBuscaAvaliacoeskm: TFloatField;
    qBuscaAvaliacoescor: TStringField;
    qBuscaAvaliacoesopcionais: TStringField;
    qBuscaAvaliacoestotal_avarias: TFloatField;
    qBuscaAvaliacoesavaliacao: TFloatField;
    qBuscaAvaliacoesvlr_fipe: TFloatField;
    qBuscaAvaliacoescod_fipe: TStringField;
    QEnviaVistoria: TUniQuery;
    QBuscaVistoriadores: TUniQuery;
    qBuscaAvaliacoesusuario: TStringField;
    qBuscaAvaliacoesobs: TStringField;
    qBuscaAvaliacoesid: TIntegerField;
    qBuscaUsuarios: TUniQuery;
    qBuscaUsuariosid: TIntegerField;
    qBuscaUsuariosnome: TStringField;
    qBuscaUsuariossenha: TStringField;
    qBuscaUsuariosnivel: TStringField;
    qBuscaUsuariostroca: TIntegerField;
    qBuscaUsuariosperfil: TIntegerField;
    qBuscaUsuariosemail: TStringField;
    qBuscaUsuarioslogado: TIntegerField;
    qBuscaUsuariosMEI: TStringField;
    qBuscaUsuariosfoto: TBlobField;
    qBuscaUsuariosversao_app: TStringField;
    qCadaNovoUsuario: TUniQuery;
    qAjustaUsuarios: TUniQuery;
    qBuscaUsuarioscheck_versao: TStringField;
    qValidaUsuario: TUniQuery;
    qValidaUsuarioid: TIntegerField;
    qValidaUsuarionome: TStringField;
    qValidaUsuariosenha: TStringField;
    qValidaUsuarionivel: TStringField;
    qValidaUsuariotroca: TIntegerField;
    qValidaUsuarioperfil: TIntegerField;
    qValidaUsuarioemail: TStringField;
    qValidaUsuariologado: TIntegerField;
    qValidaUsuarioMEI: TStringField;
    qValidaUsuariofoto: TBlobField;
    qValidaUsuarioversao_app: TStringField;
    qValidaUsuariocheck_versao: TStringField;
    qAlteraUsuarios: TUniQuery;
    qVerificaAvaliacoes: TUniQuery;
    qConsultaFotosid: TIntegerField;
    qConsultaFotosplaca: TStringField;
    qConsultaFotosFoto: TBlobField;
    qConsultaFotosid_vistoria: TIntegerField;
    qConsultaFotosAvaliacao: TUniQuery;
    qConsultaFotosAvaliacaoplaca: TStringField;
    qConsultaFotosAvaliacaoFoto: TBlobField;
    qConsultaFotosAvaliacaoid: TIntegerField;
    qConsultaFotosAvaliacaoid_avaliacao: TIntegerField;
    qBuscaAvaliacoescategoria: TStringField;
    qBuscaAvaliacoesipva: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModuleBancoVistoria: TDataModuleBancoVistoria;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Loading, UDataModuleConexao, UDataModuleRESTDWvistoria, UDMRestDataWareDB,
  UFormAnaliseCompra, UFormAnaliseCompraQuery, UFormAnaliseComprasTabela,
  UFormAplicaMargem, UFormAtualizaTabelaFipe, UFormAtuHistFIPE, UFormAtuTabFIpe,
  UFormAvarias, UFormCadVistoriadores, UFormColunasOcultas, UFormConcFipeModelo,
  UFormConsutaPlacaAvaliacao, UFormDetalhesAvaliacao, UFormDownloadNovaVersao,
  UFormExcelCompras, UFormGestaoAvaliacoes, UFormGestaoVistoria, UFormHistFIPE,
  UFormImagem, UFormImportacoesEfetuadas, UFormLoading, UFormLoadingOpaco,
  UFormLotesArval, UFormNovoProcessamento, UFormNovoVistoriador,
  UFormPadroesPlanilhas, UFormPrincipal, UFormProcPlanAcelero,
  UFormProcPlanFinal, UFormUltimasAtualizacoes, UFormVistoriadores,
  UFormVistoriasDetalhes, UFormWebBrowse, UforTestesDiversos, UnitLogin,
  UFormAvaliarAvaliacao, UFormPermissoesCarga, UFormLoginSavauto,
  UFormHistoricoAvaliacoes, UFormAtendimentoMultasVeiculo, UFormAtendimentoNovo,
  UFormAtendimentos, UFormCadaUsuario, UFormConcedePermissao, UFormDadosPerfil,
  UFormDetalhesAtendimento, UFormPerfis, UFormPesquisaFipe, UFormUsuarios,
  UFormCadaUsuariosMobile, UFormCadaNovoUsuMobile, FMX.UFormGraficosAtendimento,
  UDMPermissoes, UFormAgendamento, UFormAlteraFipeDePaxa, UFormCruzamentoFipes,
  UFormHistoricoObsAtn, UFormInformacoes, UFormLiberaPermissao, UformNovaObs,
  UFormQuitacoesVeiculo, UFormRefFipes, UFormSegIPVALic,
  UFormLoadingCarregamento, UFormNovaAvaliacao, UFormAjusteDadosFipeAvaliacao,
  UFormAlteracaoProposta, UFormAlteracaoVeiculo, UFormAlteraDadosCliente,
  UFormAlteraMidiaAnuncio, UFormAlteraPlaca, UFormAvariasItens,
  UFormCriacaoAvaria, UFormDadosPagamento, UFormDataPagamento,
  UFormExtratoPgtoVeiculos, UFormGestaoAvarias, UFormListaUsuarios,
  UFormMenuFinanceiro, UFormPagamentoVeiculo, UFormParametros,
  UFormPgtoExtratoVeiculo, UFormFornecedoresFrotista,
  UFormCadastroTransportadoras, UFormFornecedorFrotistaAddEditar,
  UFormCadastroTransportadora, UFormAlteraPermissaoAppTransp,
  UFormNovoUsuarioTransporte, UFormPermissoesUsuarioAppTransporte,
  UFormTransportes, UFormGestaoTransporte, UFormDetalheTransportes,
  UFormFinanceiroTransportes, UFormCidadesCustos, UFormDadosPgtoTransporte,
  UFormListaBancos, UFormPagamentoTransporte, UFormNovaCidadeCusto,
  UFormPagamentoEmLoteTransportes, UFormAguarde, UFormDetalhesAtendimentoBeta;

{$R *.dfm}

end.
