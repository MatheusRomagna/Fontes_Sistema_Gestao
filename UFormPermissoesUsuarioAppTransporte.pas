unit UFormPermissoesUsuarioAppTransporte;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Data.DB, MemDS, DBAccess, Uni, Vcl.Grids, Vcl.DBGrids,
  dxGDIPlusClasses;

type
  TFormPermissoesUsuarioAppTransporte = class(TForm)
    PanelTop: TPanel;
    Image5: TImage;
    Label1: TLabel;
    PanelBootom: TPanel;
    imgSalvar: TImage;
    DBGrid1: TDBGrid;
    DataSourcePermissoes: TDataSource;
    qBuscaPermissoes: TUniQuery;
    qBuscaPermissoesid_usuario: TIntegerField;
    qBuscaPermissoestela: TStringField;
    qBuscaPermissoesVisualiza: TStringField;
    qBuscaPermissoesAltera: TStringField;
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPermissoesUsuarioAppTransporte: TFormPermissoesUsuarioAppTransporte;

implementation

{$R *.dfm}

uses FMX.UFormGraficosAtendimento, Loading, UDataModuleBancoVistoria,
  UDataModuleConexao, UDMPermissoes, UFormAgendamento,
  UFormAjusteDadosFipeAvaliacao, UFormAlteracaoProposta, UFormAlteracaoVeiculo,
  UFormAlteraDadosCliente, UFormAlteraFipeDePaxa, UFormAlteraMidiaAnuncio,
  UFormAlteraPlaca, UFormAnaliseCompra, UFormAnaliseCompraQuery,
  UFormAnaliseComprasTabela, UFormAplicaMargem, UFormAtendimentoMultasVeiculo,
  UFormAtendimentoNovo, UFormAtendimentos, UFormAtualizaTabelaFipe,
  UFormAtuHistFIPE, UFormAtuTabFIpe, UFormAvaliarAvaliacao, UFormAvarias,
  UFormAvariasItens, UFormCadaNovoUsuMobile, UFormCadastroTransportadora,
  UFormCadastroTransportadoras, UFormCadaUsuario, UFormCadaUsuariosMobile,
  UFormCadVistoriadores, UFormColunasOcultas, UFormConcedePermissao,
  UFormConcFipeModelo, UFormConsutaPlacaAvaliacao, UFormCriacaoAvaria,
  UFormCruzamentoFipes, UFormDadosPagamento, UFormDadosPerfil,
  UFormDataPagamento, UFormDetalhesAtendimento, UFormDetalhesAvaliacao,
  UFormDownloadNovaVersao, UFormExcelCompras, UFormExtratoPgtoVeiculos,
  UFormFornecedoresFrotista, UFormFornecedorFrotistaAddEditar,
  UFormGestaoAvaliacoes, UFormGestaoAvarias, UFormGestaoVistoria, UFormHistFIPE,
  UFormHistoricoAvaliacoes, UFormHistoricoObsAtn, UFormImagem,
  UFormImportacoesEfetuadas, UFormInformacoes, UFormLiberaPermissao,
  UFormListaUsuarios, UFormLoading, UFormLoadingCarregamento, UFormLoadingOpaco,
  UFormLoginSavauto, UFormLotesArval, UFormMenuFinanceiro, UFormNovaAvaliacao,
  UformNovaObs, UFormNovoProcessamento, UFormNovoUsuarioTransporte,
  UFormNovoVistoriador, UFormPadroesPlanilhas, UFormPagamentoVeiculo,
  UFormParametros, UFormPerfis, UFormPermissoesCarga, UFormPesquisaFipe,
  UFormPgtoExtratoVeiculo, UFormPrincipal, UFormProcPlanAcelero,
  UFormProcPlanFinal, UFormQuitacoesVeiculo, UFormRefFipes, UFormSegIPVALic,
  UFormUltimasAtualizacoes, UFormUsuarios, UFormVistoriadores,
  UFormVistoriasDetalhes, UFormWebBrowse, UforTestesDiversos, UnitLogin,
  UFormAlteraPermissaoAppTransp;

procedure TFormPermissoesUsuarioAppTransporte.DBGrid1DblClick(Sender: TObject);
var
 ALTERA, VISUALIZA: string;
begin

 if DBGrid1.DataSource.DataSet.FieldByName('visualiza').Text = 'NAO' then
 VISUALIZA := 'NAO'
 Else
 VISUALIZA := 'SIM';

 if DBGrid1.DataSource.DataSet.FieldByName('altera').Text = 'NAO' then
 ALTERA := 'NAO'
 Else
 ALTERA := 'SIM';

 FormAlteraPermissaoAppTransp.ComboBoxVisualiza.Text := VISUALIZA;
 FormAlteraPermissaoAppTransp.ComboBoxAltera.Text    := ALTERA;

 FormAlteraPermissaoAppTransp.Position := poScreenCenter;

 FormAlteraPermissaoAppTransp.ShowModal;

end;

end.
