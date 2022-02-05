unit UFormDownloadNovaVersao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, IdBaseComponent, IdAntiFreezeBase,
  //IdAntiFreeze,
  Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls;
  // IdAntiFreeze;

type
  TFormDownloadNovaVersao = class(TForm)
    Panel16: TPanel;
    Image5: TImage;
    Label1: TLabel;
    EditURL: TEdit;
    //IdAntiFreeze1: TIdAntiFreeze;
    IdHTTP1: TIdHTTP;
    SaveDialog1: TSaveDialog;
    ProgressBar1: TProgressBar;
    Button1: TButton;
    lblStatus: TLabel;
    LblPrincipal: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure IdHTTP1WorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Int64);
    procedure IdHTTP1Work(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
    procedure IdHTTP1WorkEnd(ASender: TObject; AWorkMode: TWorkMode);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private


    { Private declarations }
  public
    { Public declarations }

  end;

var
  FormDownloadNovaVersao: TFormDownloadNovaVersao;

implementation

{$R *.dfm}


uses UDataModuleConexao, UFormAnaliseCompraQuery, UFormAnaliseComprasTabela,
  UFormAplicaMargem, UFormAtualizaTabelaFipe, UFormAtuHistFIPE,
  UFormColunasOcultas, UFormConcFipeModelo, UFormExcelCompras, UFormHistFIPE,
  UFormLoading, UFormNovoProcessamento, UFormPrincipal, UFormProcPlanAcelero,
  UFormProcPlanFinal;


function RetornaPorcentagem(ValorMaximo, ValorAtual: real): string;
var
resultado: Real;
begin
resultado := ((ValorAtual * 100) / ValorMaximo);
Result    := FormatFloat('0%', resultado);
end;

function RetornaKiloBytes(ValorAtual: real): string;
var
resultado : real;
begin
resultado := ((ValorAtual / 1024) / 1024);
Result    := FormatFloat('0.000 KBs', resultado);
end;

procedure TFormDownloadNovaVersao.Button1Click(Sender: TObject);
var
fileDownload : TFileStream;
  begin
    SaveDialog1.Filter := 'Arquivos' + ExtractFileExt(EditURL.Text) + '|*' + ExtractFileExt(EditURL.Text);
    SaveDialog1.FileName := 'Nova_VersaoAnaliseCompra';
  if SaveDialog1.Execute then
 begin
  fileDownload := TFileStream.Create(SaveDialog1.FileName + ExtractFileExt(EditURL.Text), fmCreate);
 try
  ProgressBar1.Visible := True;
  lblStatus.Visible   := True;
  Button1.Enabled   := false;
  IdHTTP1.Get(EditURL.Text, fileDownload);
  finally
   FreeAndNil(fileDownload);
   MessageDlg('O Sistema será finalizado, vá no diretório em que o download foi efetuado, e substitu-a o aplicativo', mtWarning, [mbok] , 0);
   Application.Terminate;
  end;
 end;
end;

procedure TFormDownloadNovaVersao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

 lblStatus.Caption := '';
 LblPrincipal.Caption := '';

end;

procedure TFormDownloadNovaVersao.IdHTTP1Work(ASender: TObject;
  AWorkMode: TWorkMode; AWorkCount: Int64);
begin
begin
ProgressBar1.Position := AWorkCount;
lblStatus.Caption    := 'Baixando ... ' + RetornaKiloBytes(AWorkCount);
LblPrincipal.Caption := 'Download em ... ' + RetornaPorcentagem(ProgressBar1.Max, AWorkCount);
end;
end;

procedure TFormDownloadNovaVersao.IdHTTP1WorkBegin(ASender: TObject;
  AWorkMode: TWorkMode; AWorkCountMax: Int64);
begin
ProgressBar1.Max := AWorkCountMax;
end;

procedure TFormDownloadNovaVersao.IdHTTP1WorkEnd(ASender: TObject;
  AWorkMode: TWorkMode);
begin
ProgressBar1.Position := 0;
LblPrincipal.Caption := 'Finalizado ...';
lblStatus.Caption    := 'Download Finalizado ...';
ProgressBar1.Visible  := false;
Button1.Enabled    := true;
end;

end.

