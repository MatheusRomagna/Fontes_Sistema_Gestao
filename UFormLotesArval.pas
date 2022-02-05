unit UFormLotesArval;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFormLotesArval = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label4: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Lote: String;
  end;

var
  FormLotesArval: TFormLotesArval;

implementation

{$R *.dfm}

uses Loading, UDataModuleConexao, UDataModuleRESTDWvistoria, UDMRestDataWareDB,
  UFormAnaliseCompra, UFormAnaliseCompraQuery, UFormAnaliseComprasTabela,
  UFormAplicaMargem, UFormAtualizaTabelaFipe, UFormAtuHistFIPE, UFormAtuTabFIpe,
  UFormAvarias, UFormCadVistoriadores, UFormColunasOcultas, UFormConcFipeModelo,
  UFormDownloadNovaVersao, UFormExcelCompras, UFormGestaoVistoria,
  UFormHistFIPE, UFormImagem, UFormImportacoesEfetuadas, UFormLoading,
  UFormLoadingOpaco, UFormNovoProcessamento, UFormNovoVistoriador,
  UFormPadroesPlanilhas, UFormPrincipal, UFormProcPlanAcelero,
  UFormProcPlanFinal, UFormUltimasAtualizacoes, UFormVistoriadores,
  UFormVistoriasDetalhes, UFormWebBrowse, UforTestesDiversos;

procedure TFormLotesArval.Button1Click(Sender: TObject);
begin

  FormLotesArval.Visible := False;

  Lote := 'A';

  if FormNovoProcessamento = nil then
  Begin
    FormNovoProcessamento := TFormNovoProcessamento.Create(self);
  End;

  FormNovoProcessamento.ImportaPlanARVAL;

  FormLotesArval.Visible := true;
  FormLotesArval.Close;


end;

procedure TFormLotesArval.Button2Click(Sender: TObject);
begin

  FormLotesArval.Visible := False;

  Lote := 'B';

  FormNovoProcessamento.ImportaPlanARVAL;

  FormLotesArval.Visible := true;
  FormLotesArval.Close;

end;

procedure TFormLotesArval.Button3Click(Sender: TObject);
begin

  FormLotesArval.Visible := false;

  Lote := 'C';

  FormNovoProcessamento.ImportaPlanARVAL;

  FormLotesArval.Visible := true;
  FormLotesArval.Close;

end;

end.
