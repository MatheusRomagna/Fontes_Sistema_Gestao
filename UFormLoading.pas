unit UFormLoading;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.GIFImg, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.StdCtrls;

type
  TFormLoading = class(TForm)
    Image1: TImage;
    LabelStatus: TLabel;
    ProgressBar1: TProgressBar;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormLoading: TFormLoading;

implementation

{$R *.dfm}

uses UDataModuleConexao, UFormAtualizaTabelaFipe, UFormPrincipal,
  UFormAnaliseCompraQuery, UFormAnaliseComprasTabela, UFormAplicaMargem,
  UFormAtuHistFIPE, UFormColunasOcultas, UFormConcFipeModelo,
  UFormDownloadNovaVersao, UFormExcelCompras, UFormHistFIPE, UFormImagem,
  UFormImportacoesEfetuadas, UFormNovoProcessamento, UFormPadroesPlanilhas,
  UFormProcPlanAcelero, UFormProcPlanFinal, UFormLotesArval;

procedure TFormLoading.FormShow(Sender: TObject);
begin

 (Image1.Picture.Graphic as TGIFImage).Animate := True;

 if FormConciliacaoFipeModelo = nil then
 Begin
   FormConciliacaoFipeModelo := TFormConciliacaoFipeModelo.Create(self);
 End;

 if FormLotesArval = nil then
 Begin
   FormLotesArval := TFormLotesArval.Create(self);
 End;

 if FormProcPlanAcelero = nil then
 Begin
     FormProcPlanAcelero := TFormProcPlanAcelero.Create(self);
 End;


end;

end.
