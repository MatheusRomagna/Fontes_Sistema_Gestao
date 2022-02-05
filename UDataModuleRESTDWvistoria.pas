unit UDataModuleRESTDWvistoria;

interface

uses
  System.SysUtils, System.Classes,FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TDataModuleRESTDWvistoria = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModuleRESTDWvistoria: TDataModuleRESTDWvistoria;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses UDataModuleConexao, UFormAnaliseCompra, UFormAnaliseCompraQuery,
  UFormAnaliseComprasTabela, UFormAplicaMargem, UFormAtualizaTabelaFipe,
  UFormAtuHistFIPE, UFormCadVistoriadores, UFormColunasOcultas,
  UFormConcFipeModelo, UFormDownloadNovaVersao, UFormExcelCompras,
  UFormGestaoVistoria, UFormHistFIPE, UFormImagem, UFormImportacoesEfetuadas,
  UFormLoading, UFormNovoProcessamento, UFormPadroesPlanilhas, UFormPrincipal,
  UFormProcPlanAcelero, UFormProcPlanFinal, UFormUltimasAtualizacoes,
  UFormWebBrowse;

{$R *.dfm}

end.
