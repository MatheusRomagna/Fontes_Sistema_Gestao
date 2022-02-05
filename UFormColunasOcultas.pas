unit UFormColunasOcultas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Data.DB, MemDS,
  DBAccess, Uni, Vcl.DBGrids;

type
  TFormColunasOcultas = class(TForm)
    DBGrid1: TDBGrid;
    QColunas: TUniQuery;
    DataSource1: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormColunasOcultas: TFormColunasOcultas;

implementation

{$R *.dfm}

uses UDataModuleConexao, UFormAnaliseCompraQuery, UFormAnaliseComprasTabela,
  UFormAplicaMargem, UFormAtualizaTabelaFipe, UFormAtuHistFIPE,
  UFormConcFipeModelo, UFormExcelCompras, UFormHistFIPE, UFormLoading,
  UFormNovoProcessamento, UFormPrincipal, UFormProcPlanAcelero,
  UFormProcPlanFinal;

function GetNomeComputador : String;
const
  Buff_Size = MAX_COMPUTERNAME_LENGTH + 1;
var
  lpBuffer : PChar;
  nSize : DWord;
begin
  nSize := Buff_Size;
  lpBuffer := StrAlloc(Buff_Size);
  GetComputerName(lpBuffer, nSize);
  Result := String(lpBuffer);
  StrDispose(lpBuffer);
end;


procedure TFormColunasOcultas.DBGrid1DblClick(Sender: TObject);
Var
 i : integer;
begin

 if DBGrid1.DataSource.DataSet.FieldByName('nome').Text <> '' then
 Begin
   FormAnaliseCompraQuery.DBGrid1.Columns.Items[DBGrid1.DataSource.DataSet.FieldByName('id').AsInteger].Visible := true;

   i := DBGrid1.DataSource.DataSet.FieldByName('id').AsInteger;
   QColunas.SQL.Clear;
   QColunas.SQL.Add('delete from TBCOLUNASOCULTAS where id = :i and HOSTNAME = :HOST');
   QColunas.ParamByName('i').AsInteger := i;
   QColunas.ParamByName('HOST').Text := GetNomeComputador;
   QColunas.Execute;

   QColunas.SQL.Clear;
   QColunas.SQL.Add('select * from TBCOLUNASOCULTAS where HOSTNAME=:HOST ');
   QColunas.ParamByName('HOST').Text := GetNomeComputador;
   QColunas.Open;

 End;

end;

procedure TFormColunasOcultas.FormShow(Sender: TObject);
begin

 QColunas.SQL.Clear;
 QColunas.SQL.Add('select * from TBCOLUNASOCULTAS where HOSTNAME = :HOST');
 QColunas.ParamByName('HOST').Text := GetNomeComputador;
 QColunas.Open;

end;

end.
