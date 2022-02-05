unit UFormAvarias;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uDWConstsData, uRESTDWPoolerDB, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  Vcl.StdCtrls, System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors,
  Data.Bind.EngExt, Vcl.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope,
  MemDS, DBAccess, Uni;

type
  TFormAvarias = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    EditCategoria: TEdit;
    Label2: TLabel;
    EditTotalAvaria: TEdit;
    qBuscaAvarias: TUniQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAvarias: TFormAvarias;

implementation

{$R *.dfm}

uses Loading, UDataModuleConexao, UDataModuleRESTDWvistoria, UDMRestDataWareDB,
  UFormAnaliseCompra, UFormAnaliseCompraQuery, UFormAnaliseComprasTabela,
  UFormAplicaMargem, UFormAtualizaTabelaFipe, UFormAtuHistFIPE,
  UFormCadVistoriadores, UFormColunasOcultas, UFormConcFipeModelo,
  UFormDownloadNovaVersao, UFormExcelCompras, UFormGestaoVistoria,
  UFormHistFIPE, UFormImagem, UFormImportacoesEfetuadas, UFormLoading,
  UFormLoadingOpaco, UFormNovoProcessamento, UFormNovoVistoriador,
  UFormPadroesPlanilhas, UFormPrincipal, UFormProcPlanAcelero,
  UFormProcPlanFinal, UFormUltimasAtualizacoes, UFormVistoriadores,
  UFormVistoriasDetalhes, UFormWebBrowse, UforTestesDiversos,
  UDataModuleBancoVistoria, UFormAtuTabFIpe, UFormAvaliarAvaliacao,
  UFormConsutaPlacaAvaliacao, UFormDetalhesAvaliacao, UFormGestaoAvaliacoes,
  UFormLoginSavauto, UFormLotesArval, UFormPermissoesCarga, UnitLogin;

procedure TFormAvarias.FormClose(Sender: TObject; var Action: TCloseAction);
begin

 qBuscaAvarias.Close;

end;

procedure TFormAvarias.FormShow(Sender: TObject);
Var
 Total : Currency;
begin

 {Total := 0;

 // valor_reparo

 DBGrid1.DataSource.DataSet.First;

 while not DBGrid1.DataSource.DataSet.Eof do
 Begin
   Total := Total + DBGrid1.DataSource.DataSet.FieldByName('valor_reparo').AsCurrency;
   DBGrid1.DataSource.DataSet.Next;
 End;

  EditTotalAvaria.Text := CurrToStr(Total);}

end;

end.
