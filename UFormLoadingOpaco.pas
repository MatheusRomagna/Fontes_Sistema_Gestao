unit UFormLoadingOpaco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFormLoadingOpaco = class(TForm)
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormLoadingOpaco: TFormLoadingOpaco;

implementation

{$R *.dfm}

uses Loading, UDataModuleConexao, UDataModuleRESTDWvistoria, UDMRestDataWareDB,
  UFormAnaliseCompra, UFormAnaliseCompraQuery, UFormAnaliseComprasTabela,
  UFormAplicaMargem, UFormAtualizaTabelaFipe, UFormAtuHistFIPE,
  UFormCadVistoriadores, UFormColunasOcultas, UFormConcFipeModelo,
  UFormDownloadNovaVersao, UFormExcelCompras, UFormGestaoVistoria,
  UFormHistFIPE, UFormImagem, UFormImportacoesEfetuadas, UFormLoading,
  UFormNovoProcessamento, UFormNovoVistoriador, UFormPadroesPlanilhas,
  UFormPrincipal, UFormProcPlanAcelero, UFormProcPlanFinal,
  UFormUltimasAtualizacoes, UFormVistoriadores, UFormVistoriasDetalhes,
  UFormWebBrowse, FMX.UFormGraficosAtendimento, UDataModuleBancoVistoria,
  UDMPermissoes, UFormAgendamento, UFormAjusteDadosFipeAvaliacao,
  UFormAlteraFipeDePaxa, UFormAtendimentoMultasVeiculo, UFormAtendimentoNovo,
  UFormAtendimentos, UFormAtuTabFIpe, UFormAvaliarAvaliacao, UFormAvarias,
  UFormCadaNovoUsuMobile, UFormCadaUsuario, UFormCadaUsuariosMobile,
  UFormConcedePermissao, UFormConsutaPlacaAvaliacao, UFormCruzamentoFipes,
  UFormDadosPagamento, UFormDadosPerfil, UFormDataPagamento,
  UFormDetalhesAtendimento, UFormDetalhesAvaliacao, UFormExtratoPgtoVeiculos,
  UFormGestaoAvaliacoes, UFormHistoricoAvaliacoes, UFormHistoricoObsAtn,
  UFormInformacoes, UFormLiberaPermissao, UFormListaUsuarios,
  UFormLoadingCarregamento, UFormLoginSavauto, UFormLotesArval,
  UFormMenuFinanceiro, UFormNovaAvaliacao, UformNovaObs, UFormPagamentoVeiculo,
  UFormPerfis, UFormPermissoesCarga, UFormPesquisaFipe, UFormPgtoExtratoVeiculo,
  UFormQuitacoesVeiculo, UFormRefFipes, UFormSegIPVALic, UFormUsuarios,
  UforTestesDiversos, UnitLogin;

end.
