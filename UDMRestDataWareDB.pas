unit UDMRestDataWareDB;

interface

uses
  System.SysUtils, System.Classes;

type
  TDMRestDataWareDB = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMRestDataWareDB: TDMRestDataWareDB;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses UDataModuleConexao, UDataModuleRESTDWvistoria, UFormAnaliseCompra,
  UFormAnaliseCompraQuery, UFormAnaliseComprasTabela, UFormAplicaMargem,
  UFormAtualizaTabelaFipe, UFormAtuHistFIPE, UFormCadVistoriadores,
  UFormColunasOcultas, UFormConcFipeModelo, UFormDownloadNovaVersao,
  UFormExcelCompras, UFormGestaoVistoria, UFormHistFIPE, UFormImagem,
  UFormImportacoesEfetuadas, UFormLoading, UFormNovoProcessamento,
  UFormNovoVistoriador, UFormPadroesPlanilhas, UFormPrincipal,
  UFormProcPlanAcelero, UFormProcPlanFinal, UFormUltimasAtualizacoes,
  UFormVistoriadores, UFormWebBrowse;

{$R *.dfm}

end.
