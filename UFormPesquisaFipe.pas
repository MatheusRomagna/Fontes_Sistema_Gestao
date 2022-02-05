unit UFormPesquisaFipe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, MemDS, DBAccess, Uni;

type
  TFormPesquisaFipe = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    EditAnoModelo: TEdit;
    Label2: TLabel;
    EditModelo: TEdit;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    DataSourceFipe: TDataSource;
    qBuscaFipe: TUniQuery;
    procedure FormShow(Sender: TObject);
    procedure EditModeloKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditModeloKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPesquisaFipe: TFormPesquisaFipe;

implementation

{$R *.dfm}

uses Loading, UDataModuleBancoVistoria, UDataModuleConexao, UFormAnaliseCompra,
  UFormAnaliseCompraQuery, UFormAnaliseComprasTabela, UFormAplicaMargem,
  UFormAtendimentoNovo, UFormAtendimentos, UFormAtualizaTabelaFipe,
  UFormAtuHistFIPE, UFormAtuTabFIpe, UFormAvaliarAvaliacao, UFormAvarias,
  UFormCadaUsuario, UFormCadVistoriadores, UFormColunasOcultas,
  UFormConcedePermissao, UFormConcFipeModelo, UFormConsutaPlacaAvaliacao,
  UFormDadosPerfil, UFormDetalhesAvaliacao, UFormDownloadNovaVersao,
  UFormExcelCompras, UFormGestaoAvaliacoes, UFormGestaoVistoria, UFormHistFIPE,
  UFormHistoricoAvaliacoes, UFormImagem, UFormImportacoesEfetuadas,
  UFormLoading, UFormLoadingOpaco, UFormLoginSavauto, UFormLotesArval,
  UFormNovoProcessamento, UFormNovoVistoriador, UFormPadroesPlanilhas,
  UFormPerfis, UFormPermissoesCarga, UFormPrincipal, UFormProcPlanAcelero,
  UFormProcPlanFinal, UFormUltimasAtualizacoes, UFormUsuarios,
  UFormVistoriadores, UFormVistoriasDetalhes, UFormWebBrowse,
  UforTestesDiversos, UnitLogin;


procedure TFormPesquisaFipe.DBGrid1DblClick(Sender: TObject);
begin

 if DBGrid1.DataSource.DataSet.RecordCount > 0 then
 Begin

  FormAtendimentoNovo.EditCodFipe.Text := DBGrid1.DataSource.DataSet.FieldByName('COD_FIPE').Text;
  FormAtendimentoNovo.EditModelo.Text  := DBGrid1.DataSource.DataSet.FieldByName('MODELO').Text;
  FormAtendimentoNovo.EditVlrFipe.Text := DBGrid1.DataSource.DataSet.FieldByName('FIPE').Text;

  FormAtendimentoNovo.EditProposta.SetFocus;
  Close;
 End;
end;

procedure TFormPesquisaFipe.EditModeloKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

 if key = VK_ESCAPE then
 Begin
    Close;
 End;

end;

procedure TFormPesquisaFipe.EditModeloKeyPress(Sender: TObject; var Key: Char);
var
 QBuscaRefFipe : TUniQuery;
begin

 QBuscaRefFipe := TUniQuery.Create(Self);

 QBuscaRefFipe.Connection := DataModuleConexao.UniConnection1;

 QBuscaRefFipe.SQL.Clear;
 QBuscaRefFipe.SQL.Add('select FipeAtendimentos from tbfiperef');
 QBuscaRefFipe.Open;

 if key = #13 then
 Begin
  if EditModelo.Text <> '' then
  Begin

     qBuscaFipe.SQL.Clear;
     qBuscaFipe.SQL.Add('select COD_FIPE, UPPER(modelo) as MODELO, "'+'ANO'+EditAnoModelo.Text+'" as FIPE');
     qBuscaFipe.SQL.Add('from TBFIPE where UPPER(modelo) like '+QuotedStr('%'+UpperCase(EditModelo.Text)+'%')+' and');
     qBuscaFipe.SQL.Add(' "'+'ANO'+EditAnoModelo.Text+'" > 0 and REF=:Ref order by marca, modelo');
     qBuscaFipe.ParamByName('Ref').Text := QBuscaRefFipe.FieldByName('FipeAtendimentos').Text;
     qBuscaFipe.Open;

     DBGrid1.Columns[0].Width := 100;
     DBGrid1.Columns[1].Width := 350;
     DBGrid1.Columns[2].Width := 150;

     TNumericField(qBuscaFipe.FieldByName('FIPE')).DisplayFormat := ',0.00;-,0.00';

  End;
 End;

end;

procedure TFormPesquisaFipe.FormShow(Sender: TObject);
begin

 EditAnoModelo.Text := FormAtendimentoNovo.EditAnoModelo.Text;
 EditModelo.Text    := FormAtendimentoNovo.EditModelo.Text;

 EditModelo.SetFocus;

end;

end.
