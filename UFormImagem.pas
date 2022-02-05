unit UFormImagem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, System.ImageList,
  Vcl.ImgList, Vcl.Imaging.pngimage;

type
  TFormImagem = class(TForm)
    Image1: TImage;
    ImageList1: TImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormImagem: TFormImagem;

implementation

{$R *.dfm}

uses UDataModuleConexao, UFormAnaliseCompraQuery, UFormAnaliseComprasTabela,
  UFormAplicaMargem, UFormAtualizaTabelaFipe, UFormAtuHistFIPE,
  UFormColunasOcultas, UFormConcFipeModelo, UFormDownloadNovaVersao,
  UFormExcelCompras, UFormHistFIPE, UFormLoading, UFormNovoProcessamento,
  UFormPadroesPlanilhas, UFormPrincipal, UFormProcPlanAcelero,
  UFormProcPlanFinal;

end.
