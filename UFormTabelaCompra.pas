unit UFormTabelaCompra;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, MemDS, DBAccess, Uni,
  Vcl.Grids, Vcl.DBGrids;

type
  TFormTabelaCompra = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    tableTabelaCompras: TUniTable;
    tableTabelaComprasclasse_valor: TStringField;
    tableTabelaComprasclasse_avaria: TStringField;
    tableTabelaComprasclasse_mercado: TStringField;
    tableTabelaComprasclasse_KM: TStringField;
    tableTabelaComprasvalor_margem: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormTabelaCompra: TFormTabelaCompra;

implementation

{$R *.dfm}

uses FMX.UFormGraficosAtendimento, Loading, UClasseVeiculoAvaliacao,
  UDataModuleBancoVistoria, UDataModuleConexao, UDMPermissoes, UFormAgendamento,
  UFormAguarde, UFormAjusteDadosFipeAvaliacao, UFormAlteracaoProposta,
  UFormAlteracaoVeiculo, UFormAlteraDadosCliente, UFormAlteraFipeDePaxa,
  UFormAlteraMidiaAnuncio, UFormAlteraPermissaoAppTransp, UFormAlteraPlaca,
  UFormAnaliseCompra, UFormAnaliseCompraQuery, UFormAnaliseComprasTabela,
  UFormAplicaMargem, UFormAtendimentoMultasVeiculo, UFormAtendimentoNovo,
  UFormAtendimentos, UFormAtualizaTabelaFipe, UFormAtuHistFIPE, UFormAtuTabFIpe,
  UFormAvaliarAvaliacao, UFormAvarias, UFormAvariasItens,
  UFormCadaNovoUsuMobile, UFormCadastroTransportadora,
  UFormCadastroTransportadoras, UFormCadaUsuario, UFormCadaUsuariosMobile,
  UFormCadVistoriadores, UFormCidadesCustos, UFormColunasOcultas,
  UFormConcedePermissao, UFormConcFipeModelo, UFormConsutaPlacaAvaliacao,
  UFormCriacaoAvaria, UFormCruzamentoFipes, UFormDadosPagamento,
  UFormDadosPerfil, UFormDadosPgtoTransporte, UFormDataPagamento,
  UFormDetalhesAtendimento, UFormDetalhesAtendimentoBeta,
  UFormDetalhesAvaliacao, UFormDetalheTransportes, UFormDivergenciasDados,
  UFormDownloadNovaVersao, UFormDREDados, UFormExcelCompras,
  UFormExtratoPgtoVeiculos, UFormFiltrosGestao, UFormFinanceiroTransportes,
  UFormFornecedoresFrotista, UFormFornecedorFrotistaAddEditar,
  UFormGestaoAvaliacoes, UFormGestaoAvarias, UFormGestaoDadosSavauto,
  UFormGestaoTransporte, UFormGestaoVistoria, UFormHistFIPE,
  UFormHistoricoAvaliacoes, UFormHistoricoObsAtn, UFormImagem,
  UFormImportacoesEfetuadas, UFormInformacoes, UFormLiberaPermissao,
  UFormListaBancos, UFormListaUsuarios, UFormLoading, UFormLoadingCarregamento,
  UFormLoadingOpaco, UFormLoginSavauto, UFormLotesArval, UFormMenuFinanceiro,
  UFormNovaAvaliacao, UFormNovaCidadeCusto, UformNovaObs,
  UFormNovoProcessamento, UFormNovoUsuarioTransporte, UFormNovoVistoriador,
  UFormPadroesPlanilhas, UFormPagamentoEmLoteTransportes,
  UFormPagamentoTransporte, UFormPagamentoVeiculo, UFormParametros, UFormPerfis,
  UFormPermissoesCarga, UFormPermissoesUsuarioAppTransporte, UFormPesquisaFipe,
  UFormPgtoExtratoVeiculo, UFormPrincipal, UFormProcPlanAcelero,
  UFormProcPlanFinal, UFormQuitacoesVeiculo, UFormRefFipes, UFormRelacaoEstoque,
  UFormSegIPVALic, UFormUltimasAtualizacoes, UFormUsuarios, UFormVistoriadores,
  UFormVistoriasDetalhes, UFormWebBrowse, UforTestesDiversos, UnitLogin;

end.
