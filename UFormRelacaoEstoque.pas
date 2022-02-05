unit UFormRelacaoEstoque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, MemDS, DBAccess, Uni,
  dxGDIPlusClasses;

type
  TFormRelacaoEstoque = class(TForm)
    Panel3: TPanel;
    Image5: TImage;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel15: TPanel;
    Label26: TLabel;
    DbGridRelEstoque: TDBGrid;
    DataSource1: TDataSource;
    TableProjVeiculos: TUniTable;
    TableProjVeiculosid: TIntegerField;
    TableProjVeiculosdescricao: TStringField;
    TableProjVeiculosqtd: TFloatField;
    TableProjVeiculospercentual: TFloatField;
    Panel4: TPanel;
    Panel5: TPanel;
    EditTotalEstoque: TEdit;
    Image1: TImage;
    procedure FormShow(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRelacaoEstoque: TFormRelacaoEstoque;

implementation

{$R *.dfm}

uses FMX.UFormGraficosAtendimento, Loading, UDataModuleBancoVistoria,
  UDataModuleConexao, UDMPermissoes, UFormAgendamento, UFormAguarde,
  UFormAjusteDadosFipeAvaliacao, UFormAlteracaoProposta, UFormAlteracaoVeiculo,
  UFormAlteraDadosCliente, UFormAlteraFipeDePaxa, UFormAlteraMidiaAnuncio,
  UFormAlteraPermissaoAppTransp, UFormAlteraPlaca, UFormAnaliseCompra,
  UFormAnaliseCompraQuery, UFormAnaliseComprasTabela, UFormAplicaMargem,
  UFormAtendimentoMultasVeiculo, UFormAtendimentoNovo, UFormAtendimentos,
  UFormAtualizaTabelaFipe, UFormAtuHistFIPE, UFormAtuTabFIpe,
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
  UFormProcPlanFinal, UFormQuitacoesVeiculo, UFormRefFipes, UFormSegIPVALic,
  UFormUltimasAtualizacoes, UFormUsuarios, UFormVistoriadores,
  UFormVistoriasDetalhes, UFormWebBrowse, UforTestesDiversos, UnitLogin;

procedure TFormRelacaoEstoque.FormShow(Sender: TObject);
begin

 var total : currency;

 total := 0;

 DbGridRelEstoque.DataSource.DataSet.First;
 while not DbGridRelEstoque.DataSource.DataSet.Eof do
 Begin
   total := total + DbGridRelEstoque.DataSource.DataSet.FieldByName('qtd').AsCurrency;

   DbGridRelEstoque.DataSource.DataSet.Next;
 End;

 EditTotalEstoque.Text := CurrToStr(total);

end;

procedure TFormRelacaoEstoque.Image1Click(Sender: TObject);
begin

 FormGestaoDadosSavauto.GeraEstoqueVeiculo;
 FormGestaoDadosSavauto.AtualizaPercentuais;

 TableProjVeiculos.Refresh;

 var total : currency;

 total := 0;

 DbGridRelEstoque.DataSource.DataSet.First;
 while not DbGridRelEstoque.DataSource.DataSet.Eof do
 Begin
   total := total + DbGridRelEstoque.DataSource.DataSet.FieldByName('qtd').AsCurrency;

   DbGridRelEstoque.DataSource.DataSet.Next;
 End;

 EditTotalEstoque.Text := CurrToStr(total);

end;

end.
