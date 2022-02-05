unit UFormDetalheTransportes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, MemDS, DBAccess, Uni;

type
  TFormDetalheTransporte = class(TForm)
    PanelTop: TPanel;
    Image5: TImage;
    Label1: TLabel;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    EditTransportadora: TEdit;
    Label3: TLabel;
    EditPlaca: TEdit;
    Label4: TLabel;
    EditMotorista: TEdit;
    Label5: TLabel;
    EditFone: TEdit;
    Label6: TLabel;
    EditDtSaida: TEdit;
    Label7: TLabel;
    EditDvPrevChegada: TEdit;
    Label8: TLabel;
    EditDtChegada: TEdit;
    Label9: TLabel;
    EditTotalCusto: TEdit;
    GroupBox2: TGroupBox;
    DBGridPlacas: TDBGrid;
    GroupBox3: TGroupBox;
    DBGridCustoPlaca: TDBGrid;
    DataSourcePlacas: TDataSource;
    DataSourceCustoPlaca: TDataSource;
    QBuscaPlacas: TUniQuery;
    QBuscaCustoPlaca: TUniQuery;
    QBuscaPlacasid: TIntegerField;
    QBuscaPlacasplaca: TStringField;
    QBuscaPlacasavaliador: TStringField;
    QBuscaPlacasorigem: TStringField;
    QBuscaPlacasmodelo: TStringField;
    QBuscaPlacasano: TStringField;
    QBuscaPlacastransportadora: TStringField;
    QBuscaPlacasendereco_auto: TStringField;
    QBuscaPlacastotal_custo: TFloatField;
    QBuscaPlacasid_transporte: TIntegerField;
    QBuscaPlacascoletado: TIntegerField;
    QBuscaPlacasData: TDateTimeField;
    QBuscaPlacasusuario: TStringField;
    QBuscaPlacascod_fipe: TStringField;
    QBuscaPlacasvlr_fipe: TFloatField;
    QBuscaPlacasref_fipe: TStringField;
    QBuscaCustoPlacaid: TIntegerField;
    QBuscaCustoPlacaid_placa: TIntegerField;
    QBuscaCustoPlacaplaca: TStringField;
    QBuscaCustoPlacadata: TDateTimeField;
    QBuscaCustoPlacavalor: TFloatField;
    QBuscaCustoPlacaobs: TStringField;
    QBuscaCustoPlacausuario: TStringField;
    procedure DBGridPlacasCellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDetalheTransporte: TFormDetalheTransporte;

implementation

{$R *.dfm}

uses FMX.UFormGraficosAtendimento, Loading, UDataModuleBancoVistoria,
  UDataModuleConexao, UDMPermissoes, UFormAgendamento,
  UFormAjusteDadosFipeAvaliacao, UFormAlteracaoProposta, UFormAlteracaoVeiculo,
  UFormAlteraDadosCliente, UFormAlteraFipeDePaxa, UFormAlteraMidiaAnuncio,
  UFormAlteraPermissaoAppTransp, UFormAlteraPlaca, UFormAnaliseCompra,
  UFormAnaliseCompraQuery, UFormAnaliseComprasTabela, UFormAplicaMargem,
  UFormAtendimentoMultasVeiculo, UFormAtendimentoNovo, UFormAtendimentos,
  UFormAtualizaTabelaFipe, UFormAtuHistFIPE, UFormAtuTabFIpe,
  UFormAvaliarAvaliacao, UFormAvarias, UFormAvariasItens,
  UFormCadaNovoUsuMobile, UFormCadastroTransportadora,
  UFormCadastroTransportadoras, UFormCadaUsuario, UFormCadaUsuariosMobile,
  UFormCadVistoriadores, UFormColunasOcultas, UFormConcedePermissao,
  UFormConcFipeModelo, UFormConsutaPlacaAvaliacao, UFormCriacaoAvaria,
  UFormCruzamentoFipes, UFormDadosPagamento, UFormDadosPerfil,
  UFormDataPagamento, UFormDetalhesAtendimento, UFormDetalhesAvaliacao,
  UFormDownloadNovaVersao, UFormExcelCompras, UFormExtratoPgtoVeiculos,
  UFormFornecedoresFrotista, UFormFornecedorFrotistaAddEditar,
  UFormGestaoAvaliacoes, UFormGestaoAvarias, UFormGestaoTransporte,
  UFormGestaoVistoria, UFormHistFIPE, UFormHistoricoAvaliacoes,
  UFormHistoricoObsAtn, UFormImagem, UFormImportacoesEfetuadas,
  UFormInformacoes, UFormLiberaPermissao, UFormListaUsuarios, UFormLoading,
  UFormLoadingCarregamento, UFormLoadingOpaco, UFormLoginSavauto,
  UFormLotesArval, UFormMenuFinanceiro, UFormNovaAvaliacao, UformNovaObs,
  UFormNovoProcessamento, UFormNovoUsuarioTransporte, UFormNovoVistoriador,
  UFormPadroesPlanilhas, UFormPagamentoVeiculo, UFormParametros, UFormPerfis,
  UFormPermissoesCarga, UFormPermissoesUsuarioAppTransporte, UFormPesquisaFipe,
  UFormPgtoExtratoVeiculo, UFormPrincipal, UFormProcPlanAcelero,
  UFormProcPlanFinal, UFormQuitacoesVeiculo, UFormRefFipes, UFormSegIPVALic,
  UFormUltimasAtualizacoes, UFormUsuarios, UFormVistoriadores,
  UFormVistoriasDetalhes, UFormWebBrowse, UforTestesDiversos, UnitLogin;

procedure TFormDetalheTransporte.DBGridPlacasCellClick(Column: TColumn);
begin

 QBuscaCustoPlaca.Close;

 QBuscaCustoPlaca.Filter := 'id_placa = ' + QuotedStr( DBGridPlacas.DataSource.DataSet.FieldByName('id').Text );
 QBuscaCustoPlaca.Filtered := true;

 QBuscaCustoPlaca.Open;

end;

end.
