unit UFormVistoriadores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls, MemDS, DBAccess, Uni;

type
  TFormVistoriadores = class(TForm)
    Label1: TLabel;
    Panel1: TPanel;
    btnConfirmarEnvio: TSpeedButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure btnConfirmarEnvioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormVistoriadores: TFormVistoriadores;

implementation

{$R *.dfm}

uses UDataModuleConexao, UDataModuleRESTDWvistoria, UFormAnaliseCompra,
  UFormAnaliseCompraQuery, UFormAnaliseComprasTabela, UFormAplicaMargem,
  UFormAtualizaTabelaFipe, UFormAtuHistFIPE, UFormCadVistoriadores,
  UFormColunasOcultas, UFormConcFipeModelo, UFormDownloadNovaVersao,
  UFormExcelCompras, UFormGestaoVistoria, UFormHistFIPE, UFormImagem,
  UFormImportacoesEfetuadas, UFormLoading, UFormNovoProcessamento,
  UFormNovoVistoriador, UFormPadroesPlanilhas, UFormPrincipal,
  UFormProcPlanAcelero, UFormProcPlanFinal, UFormUltimasAtualizacoes,
  UFormWebBrowse, Loading, UDataModuleBancoVistoria, UFormAtuTabFIpe,
  UFormAvaliarAvaliacao, UFormAvarias, UFormConsutaPlacaAvaliacao,
  UFormDetalhesAvaliacao, UFormGestaoAvaliacoes, UFormHistoricoAvaliacoes,
  UFormLoadingOpaco, UFormLoginSavauto, UFormLotesArval, UFormPermissoesCarga,
  UFormVistoriasDetalhes, UforTestesDiversos, UnitLogin;

procedure TFormVistoriadores.btnConfirmarEnvioClick(Sender: TObject);
Var
Contador_placas, Contador_Vistoria : integer;
begin

 FormLoading.LabelStatus.Caption := 'Aguarde...Enviando...';
 FormLoading.LabelStatus.Refresh;
 FormLoading.Position := poScreenCenter;
 FormLoading.Show;

 with FormAnaliseCompraQuery.DBGrid1 do
 Begin
  for Contador_placas := 0 to Pred(SelectedRows.Count) do
  Begin
   FormAnaliseCompraQuery.DataSource1.DataSet.Bookmark := SelectedRows[Contador_placas];
   With DBGrid1 do
   Begin
    for Contador_Vistoria:= 0 to Pred(SelectedRows.Count) do
    Begin
       Datasource.Dataset.Bookmark:= SelectedRows[Contador_Vistoria]; //O comando SelectedRows irá indicar qual o registro atual no DataSet

       DataModuleBancoVistoria.QEnviaVistoria.SQL.Clear;
       DataModuleBancoVistoria.QEnviaVistoria.SQL.Add('insert into tbVistoriaRecebida (VISTORIADOR, PLACA, MODELO, ANO_MOD, KM, COR, FORNECEDOR, DtEnvio, StatusVistoria)');
       DataModuleBancoVistoria.QEnviaVistoria.SQL.Add('values (:v, :p, :m, :a, :k, :c, :f, :Dt, ''Pendente'')');
       DataModuleBancoVistoria.QEnviaVistoria.ParamByName('v').Text := DBGrid1.DataSource.DataSet.FieldByName('nome').Text;
       DataModuleBancoVistoria.QEnviaVistoria.ParamByName('p').Text := FormAnaliseCompraQuery.DataSource1.DataSet.FieldByName('PLACA').Text;
       DataModuleBancoVistoria.QEnviaVistoria.ParamByName('m').Text := FormAnaliseCompraQuery.DataSource1.DataSet.FieldByName('MODELO').Text;
       DataModuleBancoVistoria.QEnviaVistoria.ParamByName('a').Text := FormAnaliseCompraQuery.DataSource1.DataSet.FieldByName('ANO_MOD').Text;
       DataModuleBancoVistoria.QEnviaVistoria.ParamByName('k').AsCurrency := FormAnaliseCompraQuery.DataSource1.DataSet.FieldByName('KM').AsCurrency;
       DataModuleBancoVistoria.QEnviaVistoria.ParamByName('c').Text := FormAnaliseCompraQuery.DataSource1.DataSet.FieldByName('COR').Text;
       DataModuleBancoVistoria.QEnviaVistoria.ParamByName('f').Text := FormAnaliseCompraQuery.DataSource1.DataSet.FieldByName('FORNECEDOR').Text;
       DataModuleBancoVistoria.QEnviaVistoria.ParamByName('Dt').AsDateTime := NOW;
       DataModuleBancoVistoria.QEnviaVistoria.ExecSQL;

       FormLoading.LabelStatus.Caption := 'Enviou para '+DBGrid1.DataSource.DataSet.FieldByName('nome').Text+' a placa '+FormAnaliseCompraQuery.DataSource1.DataSet.FieldByName('PLACA').Text;
       Application.ProcessMessages;

       DataModuleBancoVistoria.QEnviaVistoria.Active := false;
    end;
   End;
  End;
 End;
 FormLoading.Close;
 ShowMessage('Placas enviadas para vistoriadores com sucesso!');
end;

procedure TFormVistoriadores.FormShow(Sender: TObject);
begin

 DataModuleBancoVistoria.QBuscaVistoriadores.SQL.Clear;
 DataModuleBancoVistoria.QBuscaVistoriadores.SQL.Add('select nome as Nome from tbUsuarios order by nome');
 DataModuleBancoVistoria.QBuscaVistoriadores.Open;

 DBGrid1.Columns[0].Alignment := taCenter;
 DBGrid1.Columns[0].Title.Alignment := taCenter;
 DBGrid1.TitleFont.Size := 20;

end;

end.
