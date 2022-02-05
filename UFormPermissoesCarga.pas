unit UFormPermissoesCarga;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, MemDS, DBAccess, Uni;

type
  TFormPermissoesCarga = class(TForm)
    Button1: TButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    qCriaPermissoesTelas: TUniQuery;
    qBuscaTelas: TUniQuery;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPermissoesCarga: TFormPermissoesCarga;

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
  UFormImportacoesEfetuadas, UFormLoading, UFormLoadingOpaco, UFormLotesArval,
  UFormNovoProcessamento, UFormNovoVistoriador, UFormPadroesPlanilhas,
  UFormPrincipal, UFormProcPlanAcelero, UFormProcPlanFinal,
  UFormUltimasAtualizacoes, UFormVistoriadores, UFormVistoriasDetalhes,
  UFormWebBrowse, UforTestesDiversos, UnitLogin;

procedure TFormPermissoesCarga.Button1Click(Sender: TObject);
Var
   Cont : Integer;
begin

 qCriaPermissoesTelas.SQL.Clear;
 qCriaPermissoesTelas.SQL.Add('select * from tbtelas');
 qCriaPermissoesTelas.Open;

  if qCriaPermissoesTelas.RecordCount > 0 then
   Begin
     ShowMessage('Telas já criadas, resete as mesmas para processar novamente');
     abort;
   End
   Else
   Begin

    With(Application)Do
    Begin
       For Cont := 0 To ComponentCount -1 Do
       Begin
          If(Components[Cont] Is TForm)Then
          Begin

            qCriaPermissoesTelas.SQL.Clear;
            qCriaPermissoesTelas.SQL.Add('insert into tbtelas (nome)');
            qCriaPermissoesTelas.SQL.Add('values (:nome_tela)');
            qCriaPermissoesTelas.ParamByName('nome_tela').AsString := TControl(Components[Cont]).Name;
            qCriaPermissoesTelas.ExecSQL;

          End;
       End;
    End;
     ShowMessage('Processo finalizado!');
   End;
end;


end.
