unit UFormImportacoesEfetuadas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, MemDS,
  DBAccess, Uni;

type
  TFormImportacoesEfetuadas = class(TForm)
    DBGrid1: TDBGrid;
    QBuscaImportacoes: TUniQuery;
    DataSource1: TDataSource;
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormImportacoesEfetuadas: TFormImportacoesEfetuadas;

implementation

{$R *.dfm}

uses UDataModuleConexao, UFormAnaliseCompraQuery, UFormAnaliseComprasTabela,
  UFormAplicaMargem, UFormAtualizaTabelaFipe, UFormAtuHistFIPE,
  UFormColunasOcultas, UFormConcFipeModelo, UFormDownloadNovaVersao,
  UFormExcelCompras, UFormHistFIPE, UFormImagem, UFormLoading,
  UFormNovoProcessamento, UFormPadroesPlanilhas, UFormPrincipal,
  UFormProcPlanAcelero, UFormProcPlanFinal;

procedure TFormImportacoesEfetuadas.DBGrid1DblClick(Sender: TObject);
Var
 Sit, Qtd : Integer;
 T_RESULTADO, T_AVARIAS : Currency;
begin

  if FormAnaliseCompraQuery = nil then
  Begin
    FormAnaliseCompraQuery := TFormAnaliseCompraQuery.Create(self);
  End;

  if FormLoading = nil then
  Begin
    FormLoading := TFormLoading.Create(self);
  End;

  T_RESULTADO := 0;
  T_AVARIAS := 0;
  Qtd := 0;

 Application.ProcessMessages;

 FormAnaliseCompraQuery.QBuscaPlan.SQL.Clear;
 FormAnaliseCompraQuery.QBuscaPlan.SQL.Add('select * from TBPROCPLANS');
 FormAnaliseCompraQuery.QBuscaPlan.SQL.Add('where');
 FormAnaliseCompraQuery.QBuscaPlan.SQL.Add('IMPORT_PLANILHA=:PLAN and IMPORT_DATA=:DT');
 FormAnaliseCompraQuery.QBuscaPlan.SQL.Add('order by MODELO');
 FormAnaliseCompraQuery.QBuscaPlan.ParamByName('PLAN').Text := DBGrid1.DataSource.DataSet.FieldByName('PLANILHA').Text;
 FormAnaliseCompraQuery.QBuscaPlan.ParamByName('DT').AsDate := DBGrid1.DataSource.DataSet.FieldByName('DATA').AsDateTime;
 FormAnaliseCompraQuery.QBuscaPlan.Open;

 {if FormAnaliseCompraQuery.QBuscaPlan.FieldByName('REF_FIPE2').Text <> ' ' then
 Begin
   FormAnaliseCompraQuery.DBGrid1.Columns[10].Title.Caption := 'FIPE ' + FormAnaliseCompraQuery.QBuscaPlan.FieldByName('REF_FIPE2').Text;
 End;

 if FormAnaliseCompraQuery.QBuscaPlan.FieldByName('REF_FIPE3').Text <> ' ' then
 Begin
   FormAnaliseCompraQuery.DBGrid1.Columns[11].Title.Caption := 'FIPE ' + FormAnaliseCompraQuery.QBuscaPlan.FieldByName('REF_FIPE3').Text;
 End;}

 FormAnaliseCompraQuery.EditPlanAnalise.Text := DBGrid1.DataSource.DataSet.FieldByName('PLANILHA').Text;

 FormAnaliseCompraQuery.CheckBox1.Checked := false;
 FormAnaliseCompraQuery.EditModelo.Text := '';
 FormAnaliseCompraQuery.EditFornecedor.Text := '';
 FormAnaliseCompraQuery.EditKM.Text := '';
 FormAnaliseCompraQuery.EditMargem.Text := '';
 FormAnaliseCompraQuery.ComboBoxCategoria.Text := '';
 FormAnaliseCompraQuery.ComboBoxSituacao.Text := '';
 FormAnaliseCompraQuery.ComboBoxFornecedor.Text := '';

 Application.ProcessMessages;

 FormAnaliseCompraQuery.DBGrid1.DataSource.DataSet.First;

 while not FormAnaliseCompraQuery.DBGrid1.DataSource.DataSet.Eof do
 Begin

 T_RESULTADO := T_RESULTADO + FormAnaliseCompraQuery.DBGrid1.DataSource.DataSet.FieldByName('RESULTADO').AsCurrency;
 T_AVARIAS   := T_AVARIAS   + FormAnaliseCompraQuery.DBGrid1.DataSource.DataSet.FieldByName('AVARIA').AsCurrency;

 FormAnaliseCompraQuery.DBGrid1.DataSource.DataSet.Next;

 Qtd := Qtd +1;

 Application.ProcessMessages;

 End;

 FormAnaliseCompraQuery.LblTotalResultado.Caption :=  FormatFloat('R$ #,,,,0.00', T_RESULTADO);
 FormAnaliseCompraQuery.LblTotalAvarias.Caption   :=  FormatFloat('R$ #,,,,0.00', T_AVARIAS);

 FormAnaliseCompraQuery.DBGrid1.DataSource.DataSet.First;

 FormAnaliseCompraQuery.LblQtd.Caption := IntToStr(Qtd);
 FormAnaliseCompraQuery.LblQtd.Refresh;

 FormLoading.Close;

 Close;
end;

procedure TFormImportacoesEfetuadas.DBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin

 if key = #27 then
 Begin
   Close;
 End;

end;

procedure TFormImportacoesEfetuadas.FormShow(Sender: TObject);
begin

 QBuscaImportacoes.SQL.Clear;
 QBuscaImportacoes.SQL.Add('select PLANILHA, DATAIMPORT as DATA, QTD_VEICULOS, FORNECEDOR, STATUS from TBIMPORTACOES order by DATAIMPORT desc');
 QBuscaImportacoes.Open;

end;

end.
