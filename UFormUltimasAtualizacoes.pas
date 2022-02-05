unit UFormUltimasAtualizacoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.XPMan, Vcl.WindowsStore, Vcl.Grids, Vcl.DBGrids, MemDS, DBAccess, Uni;

type
  TFormUltimasAtualizacoes = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    Memo1: TMemo;
    WindowsStore1: TWindowsStore;
    XPManifest1: TXPManifest;
    QBuscaVersao: TUniQuery;
    QBuscaNotas: TUniQuery;
    DataSource1: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormUltimasAtualizacoes: TFormUltimasAtualizacoes;

implementation

{$R *.dfm}

uses UDataModuleConexao, UFormAnaliseCompra, UFormAnaliseCompraQuery,
  UFormAnaliseComprasTabela, UFormAplicaMargem, UFormAtualizaTabelaFipe,
  UFormAtuHistFIPE, UFormColunasOcultas, UFormConcFipeModelo,
  UFormDownloadNovaVersao, UFormExcelCompras, UFormHistFIPE, UFormImagem,
  UFormImportacoesEfetuadas, UFormLoading, UFormNovoProcessamento,
  UFormPadroesPlanilhas, UFormPrincipal, UFormProcPlanAcelero,
  UFormProcPlanFinal;

procedure TFormUltimasAtualizacoes.DBGrid1CellClick(Column: TColumn);
begin

 if DBGrid1.DataSource.DataSet.RecordCount > 0 then
 Begin
   QBuscaNotas.SQL.Clear;
   QBuscaNotas.SQL.Add('select nota from tbVersoesNotas where versao = :versao');
   QBuscaNotas.ParamByName('versao').Text := DBGrid1.DataSource.DataSet.FieldByName('versao').Text;
   QBuscaNotas.Open;

   Memo1.Text := QBuscaNotas.FieldByName('nota').Text;

 End;

end;

procedure TFormUltimasAtualizacoes.FormShow(Sender: TObject);
begin

 Memo1.Text := '';

 QBuscaVersao.SQL.Clear;
 QBuscaVersao.SQL.Add('select versao, data from tbVersoes order by data desc');
 QBuscaVersao.Open;

 DBGrid1.Columns[0].Width := 150;

end;

end.
