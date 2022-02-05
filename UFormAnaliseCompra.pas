unit UFormAnaliseCompra;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  Vcl.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts, FMX.Ani,
  FMX.Edit, Data.DB, MemDS, DBAccess, Uni, FMX.Types, FMX.Controls;

type
  TFormAnalisaCompra = class(TForm)
    Layout2: TLayout;
    Rectangle2: TRectangle;
    Image5: TImage;
    VertScrollBox1: TVertScrollBox;
    Rectangle1: TRectangle;
    Layout1: TLayout;
    RectAnimation1: TRectAnimation;
    Rectangle3: TRectangle;
    RctAno: TRectangle;
    Label1: TLabel;
    EditAno: TEdit;
    RctModelo: TRectangle;
    Label2: TLabel;
    EditModelo: TEdit;
    RctCodFipe: TRectangle;
    Label3: TLabel;
    EditCodFipe: TEdit;
    RctVlrFipe: TRectangle;
    Label4: TLabel;
    EditVlrFipe: TEdit;
    RctEstoqueAtual: TRectangle;
    Label5: TLabel;
    EditEstoqueAtual: TEdit;
    RctVlrUltVenda: TRectangle;
    Label6: TLabel;
    EditVlrUltVenda: TEdit;
    RctVnd30Dias: TRectangle;
    Label7: TLabel;
    EditVnd30dias: TEdit;
    RctAvarias: TRectangle;
    Label8: TLabel;
    EditAvarias: TEdit;
    Rectangle4: TRectangle;
    Label9: TLabel;
    EditMargem: TEdit;
    Rectangle5: TRectangle;
    Label10: TLabel;
    EditVlrG0: TEdit;
    Rectangle6: TRectangle;
    Label11: TLabel;
    EditVlrSugCompra: TEdit;
    btnAtualiza: TSpeedButton;
    Rectangle7: TRectangle;
    Label12: TLabel;
    EditVlrSugVenda: TEdit;
    QConsultaDados: TUniQuery;
    procedure SpeedButtonVoltarClick(Sender: TObject);
    procedure EditModeloEnter(Sender: TObject);
    procedure btnAtualizaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAnalisaCompra: TFormAnalisaCompra;

implementation

{$R *.fmx}

uses
  UFormPrincipal, UDataModuleConexao,
  UFormAnaliseCompraQuery, UFormAnaliseComprasTabela, UFormAplicaMargem,
  UFormAtualizaTabelaFipe, UFormAtuHistFIPE, UFormColunasOcultas,
  UFormConcFipeModelo, UFormDownloadNovaVersao, UFormExcelCompras,
  UFormHistFIPE, UFormImagem, UFormImportacoesEfetuadas, UFormLoading,
  UFormNovoProcessamento, UFormPadroesPlanilhas, UFormProcPlanAcelero,
  UFormProcPlanFinal;

procedure TFormAnalisaCompra.btnAtualizaClick(Sender: TObject);
begin

 EditVlrSugCompra.Text := '';

 EditVlrSugCompra.Text := CurrToStr( StrToCurr(EditVlrG0.Text) - StrToCurr(EditAvarias.Text) - strToCurr(EditMargem.Text) );

 EditVlrSugVenda.Text := CurrToStr(StrToCurr(EditVlrSugCompra.Text) + StrToCurr(EditMargem.Text));

end;

procedure TFormAnalisaCompra.EditModeloEnter(Sender: TObject);
begin

 if editAno.text <> '' then
 Begin
  //FormConsultaFIPEAnalise.Show;
 End;

end;

procedure TFormAnalisaCompra.SpeedButtonVoltarClick(Sender: TObject);
begin

 Close;

end;

end.
