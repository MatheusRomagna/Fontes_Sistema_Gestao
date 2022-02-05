unit UFormCadVistoriadores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.Buttons, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uDWConstsData,
  uRESTDWPoolerDB, Vcl.Imaging.pngimage;

type
  TFormCadVistoriadores = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    DSvistoriadores: TDataSource;
    QBuscaVistoriadores: TRESTDWClientSQL;
    img_add: TImage;
    Image2: TImage;
    Image3: TImage;
    procedure FormShow(Sender: TObject);
    procedure btnNovoVistoriadorClick(Sender: TObject);
    procedure img_addClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadVistoriadores: TFormCadVistoriadores;

implementation

{$R *.dfm}

uses UDataModuleConexao, UFormAnaliseCompra, UFormAnaliseCompraQuery,
  UFormAnaliseComprasTabela, UFormAplicaMargem, UFormAtualizaTabelaFipe,
  UFormAtuHistFIPE, UFormColunasOcultas, UFormConcFipeModelo,
  UFormDownloadNovaVersao, UFormExcelCompras, UFormGestaoVistoria,
  UFormHistFIPE, UFormImagem, UFormImportacoesEfetuadas, UFormLoading,
  UFormNovoProcessamento, UFormPadroesPlanilhas, UFormPrincipal,
  UFormProcPlanAcelero, UFormProcPlanFinal, UFormUltimasAtualizacoes,
  UFormWebBrowse, UDataModuleRESTDWvistoria, UFormNovoVistoriador;

procedure TFormCadVistoriadores.btnNovoVistoriadorClick(Sender: TObject);
begin

 FormNovoVistoriador.Position := poScreenCenter;
 FormNovoVistoriador.ShowModal;

end;

procedure TFormCadVistoriadores.FormShow(Sender: TObject);
begin

 QBuscaVistoriadores.Close;

 QBuscaVistoriadores.SQL.Clear;
 QBuscaVistoriadores.SQL.Add('select id, nome, email from tbUsuarios order by nome');
 QBuscaVistoriadores.Open;

 DBGrid1.Columns[1].Width := 150;
 DBGrid1.Columns[2].Width := 250;

end;

procedure TFormCadVistoriadores.img_addClick(Sender: TObject);
begin

 FormNovoVistoriador.Position := poScreenCenter;
 FormNovoVistoriador.ShowModal;

end;

end.
