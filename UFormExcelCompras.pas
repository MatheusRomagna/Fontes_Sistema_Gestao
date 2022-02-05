unit UFormExcelCompras;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, Comobj,
  MemDS, DBAccess, Uni, Vcl.StdCtrls;

type
  TFormExcelCompras = class(TForm)
    DBGrid1: TDBGrid;
    QPlan: TUniQuery;
    DataSource1: TDataSource;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormExcelCompras: TFormExcelCompras;

implementation



{$R *.dfm}




uses UDataModuleConexao, UFormAtualizaTabelaFipe, UFormConcFipeModelo,
  UFormLoading, UFormNovoProcessamento, UFormPrincipal, UFormProcPlanAcelero;

procedure TFormExcelCompras.Button1Click(Sender: TObject);
Var
 PLANILHA : Variant;
 LINHA, CONT : Integer;
begin

  CONT := QPlan.RecordCount;

  QPlan.Filtered := false;

  LINHA := 2;

  PLANILHA := CreateOleObject('Excel.Application');

  PLANILHA.caption := 'Analise de Compras';

  PLANILHA.visible := false;

  PLANILHA.workbooks.add(1);

  PLANILHA.cells[1,1] := 'PLACA';
  //PLANILHA.cells[1,2] := 'Nome';
  //PLANILHA.cells[1,3] := 'KM';

  QPlan.First;

  QPlan.DisableControls;

  try
    while not QPlan.Eof do
    Begin


      PLANILHA.cells[linha, 1] := QPlan.DataSource.DataSet.FieldByName('PLACA').AsString;
      //PLANILHA.cells[linha, 2] := QPlan.FieldByName('MODELO').Value;
      //PLANILHA.cells[linha, 3] := QPlan.FieldByName('KM').AsCurrency;

      LINHA := LINHA+1;

      QPlan.Next;

      Application.ProcessMessages;
    End;

      PLANILHA.columns.autofit;
      PLANILHA.visible := true;

      PLANILHA.saveas('C:\');

  finally

      QPlan.EnableControls;
      PLANILHA:= Unassigned;

  end;

end;

end.
