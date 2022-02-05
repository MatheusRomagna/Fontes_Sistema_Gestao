unit UFormHistoricoAvaliacoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, MemDS, DBAccess, Uni;

type
  TFormHistoricoAvaliacoes = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    qBuscaHistoricoAval: TUniQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormHistoricoAvaliacoes: TFormHistoricoAvaliacoes;

implementation

{$R *.dfm}

uses Loading, UDataModuleBancoVistoria, UDataModuleConexao,
  UDataModuleRESTDWvistoria, UDMRestDataWareDB, UFormAnaliseCompra,
  UFormAnaliseCompraQuery, UFormAnaliseComprasTabela, UFormAplicaMargem,
  UFormAtualizaTabelaFipe, UFormAtuHistFIPE, UFormAtuTabFIpe,
  UFormAvaliarAvaliacao, UFormAvarias, UFormCadVistoriadores,
  UFormColunasOcultas, UFormConcFipeModelo, UFormConsutaPlacaAvaliacao,
  UFormDetalhesAvaliacao, UFormDownloadNovaVersao, UFormExcelCompras,
  UFormGestaoAvaliacoes, UFormGestaoVistoria, UFormHistFIPE, UFormImagem,
  UFormImportacoesEfetuadas, UFormLoading, UFormLoadingOpaco, UFormLoginSavauto,
  UFormLotesArval, UFormNovoProcessamento, UFormNovoVistoriador,
  UFormPadroesPlanilhas, UFormPermissoesCarga, UFormPrincipal,
  UFormProcPlanAcelero, UFormProcPlanFinal, UFormUltimasAtualizacoes,
  UFormVistoriadores, UFormVistoriasDetalhes, UFormWebBrowse,
  UforTestesDiversos, UnitLogin;

end.
