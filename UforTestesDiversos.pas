unit UforTestesDiversos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.OleCtrls, SHDocVw, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TFormTestesDiversos = class(TForm)
    WebBrowser1: TWebBrowser;
    Panel1: TPanel;
    Button1: TButton;
    Label1: TLabel;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormTestesDiversos: TFormTestesDiversos;

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
  UFormVistoriasDetalhes, UFormWebBrowse;

procedure TFormTestesDiversos.Button1Click(Sender: TObject);
Begin

  Label1.Caption := IntToStr(StrToInt(Label1.Caption) + StrToInt('1'));
  WebBrowser1.OleObject.Document.Body.Style.Zoom := Label1.Caption;

end;

procedure TFormTestesDiversos.Button2Click(Sender: TObject);
begin
  Label1.Caption := IntToStr(StrToInt(Label1.Caption) - StrToInt('1'));
  WebBrowser1.OleObject.Document.Body.Style.Zoom := Label1.Caption;
end;

procedure TFormTestesDiversos.Button3Click(Sender: TObject);
begin

  WebBrowser1.OleObject.Document.Body.Style.Zoom := '1';
  Label1.Caption := '1';

End;

procedure TFormTestesDiversos.TrackBar1Change(Sender: TObject);
begin

  WebBrowser1.OleObject.Document.Body.Style.Zoom := Label1.Caption + '1';

  Label1.Caption := Label1.Caption + WebBrowser1.OleObject.Document.Body.Style.Zoom;

end;

end.
