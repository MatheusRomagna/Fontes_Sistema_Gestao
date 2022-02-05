unit UFormRefFipes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, MemDS,
  DBAccess, Uni, Vcl.StdCtrls;

type
  TFormRefFipes = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    qBuscaRef: TUniQuery;
    qBuscaRefid: TIntegerField;
    qBuscaRefref1: TStringField;
    qBuscaRefref2: TStringField;
    qBuscaRefref3: TStringField;
    qBuscaRefprincipal: TStringField;
    GroupBox1: TGroupBox;
    DBGrid2: TDBGrid;
    DataSource2: TDataSource;
    QAtuVlr: TUniQuery;
    QAtuVlrid: TIntegerField;
    QAtuVlrfipe1: TFloatField;
    QAtuVlrfipe2: TFloatField;
    QAtuVlrfipe3: TFloatField;
    QAtuVlrfipePrincipal: TFloatField;
    qBuscaVlrs: TUniQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRefFipes: TFormRefFipes;

implementation

{$R *.dfm}

uses FMX.UFormGraficosAtendimento, Loading, UDataModuleBancoVistoria,
  UDataModuleConexao, UDMPermissoes, UFormAgendamento, UFormAlteraFipeDePaxa,
  UFormAnaliseCompra, UFormAnaliseCompraQuery, UFormAnaliseComprasTabela,
  UFormAplicaMargem, UFormAtendimentoMultasVeiculo, UFormAtendimentoNovo,
  UFormAtendimentos, UFormAtualizaTabelaFipe, UFormAtuHistFIPE, UFormAtuTabFIpe,
  UFormAvaliarAvaliacao, UFormAvarias, UFormCadaNovoUsuMobile, UFormCadaUsuario,
  UFormCadaUsuariosMobile, UFormCadVistoriadores, UFormColunasOcultas,
  UFormConcedePermissao, UFormConcFipeModelo, UFormConsutaPlacaAvaliacao,
  UFormCruzamentoFipes, UFormDadosPerfil, UFormDetalhesAtendimento,
  UFormDetalhesAvaliacao, UFormDownloadNovaVersao, UFormExcelCompras,
  UFormGestaoAvaliacoes, UFormGestaoVistoria, UFormHistFIPE,
  UFormHistoricoAvaliacoes, UFormImagem, UFormImportacoesEfetuadas,
  UFormInformacoes, UFormLiberaPermissao, UFormLoading, UFormLoadingOpaco,
  UFormLoginSavauto, UFormLotesArval, UFormNovoProcessamento,
  UFormNovoVistoriador, UFormPadroesPlanilhas, UFormPerfis,
  UFormPermissoesCarga, UFormPesquisaFipe, UFormPrincipal, UFormProcPlanAcelero,
  UFormProcPlanFinal, UFormQuitacoesVeiculo, UFormSegIPVALic,
  UFormUltimasAtualizacoes, UFormUsuarios, UFormVistoriadores,
  UFormVistoriasDetalhes, UFormWebBrowse, UforTestesDiversos, UnitLogin;

procedure TFormRefFipes.FormClose(Sender: TObject; var Action: TCloseAction);
begin

 FormRefFipes.GroupBox1.Visible := False;

end;

end.
