unit UFormCruzamentoFipes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, MemDS, DBAccess, Uni;

type
  TFormCruzamentoFipes = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Panel2: TPanel;
    btnAlterar: TButton;
    DBGrid1: TDBGrid;
    DataSourceFipe: TDataSource;
    qBuscaFipes: TUniQuery;
    qBuscaFipesID: TIntegerField;
    qBuscaFipesCOD_FIPE: TStringField;
    qBuscaFipesMODELO: TStringField;
    qBuscaFipesDATA: TDateField;
    qBuscaFipesVLR_FIPE: TFloatField;
    qBuscaFipesFORNECEDOR: TStringField;
    qBuscaFipesMODELO_FIPE: TStringField;
    qBuscaFipesANO: TStringField;
    Label2: TLabel;
    ComboBoxFornecedor: TComboBox;
    qBuscaFornecedores: TUniQuery;
    Label3: TLabel;
    EditModelo: TEdit;
    Label4: TLabel;
    EditAno: TEdit;
    Button1: TButton;
    qBuscaFipesREF_FIPE: TStringField;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCruzamentoFipes: TFormCruzamentoFipes;

implementation

{$R *.dfm}

uses FMX.UFormGraficosAtendimento, Loading, UDataModuleBancoVistoria,
  UDataModuleConexao, UFormAgendamento, UFormAnaliseCompra,
  UFormAnaliseCompraQuery, UFormAnaliseComprasTabela, UFormAplicaMargem,
  UFormAtendimentoMultasVeiculo, UFormAtendimentoNovo, UFormAtendimentos,
  UFormAtualizaTabelaFipe, UFormAtuHistFIPE, UFormAtuTabFIpe,
  UFormAvaliarAvaliacao, UFormAvarias, UFormCadaNovoUsuMobile, UFormCadaUsuario,
  UFormCadaUsuariosMobile, UFormCadVistoriadores, UFormColunasOcultas,
  UFormConcedePermissao, UFormConcFipeModelo, UFormConsutaPlacaAvaliacao,
  UFormDadosPerfil, UFormDetalhesAtendimento, UFormDetalhesAvaliacao,
  UFormDownloadNovaVersao, UFormExcelCompras, UFormGestaoAvaliacoes,
  UFormGestaoVistoria, UFormHistFIPE, UFormHistoricoAvaliacoes, UFormImagem,
  UFormImportacoesEfetuadas, UFormInformacoes, UFormLoading, UFormLoadingOpaco,
  UFormLoginSavauto, UFormLotesArval, UFormNovoProcessamento,
  UFormNovoVistoriador, UFormPadroesPlanilhas, UFormPerfis,
  UFormPermissoesCarga, UFormPesquisaFipe, UFormPrincipal, UFormProcPlanAcelero,
  UFormProcPlanFinal, UFormQuitacoesVeiculo, UFormSegIPVALic,
  UFormUltimasAtualizacoes, UFormUsuarios, UFormVistoriadores,
  UFormVistoriasDetalhes, UFormWebBrowse, UforTestesDiversos, UnitLogin,
  UFormAlteraFipeDePaxa;

procedure TFormCruzamentoFipes.btnAlterarClick(Sender: TObject);
begin

 FormAlteraFipeDePara.EditCodFipe.Text := DBGrid1.DataSource.DataSet.FieldByName('cod_fipe').Text;
 FormAlteraFipeDePara.EditAno.Text := DBGrid1.DataSource.DataSet.FieldByName('ano').Text;
 FormAlteraFipeDePara.EditModeloFipe.Text := DBGrid1.DataSource.DataSet.FieldByName('modelo_fipe').Text;
 FormAlteraFipeDePara.EditValorFipe.Text := CurrToStr(DBGrid1.DataSource.DataSet.FieldByName('VLR_FIPE').AsCurrency);

 FormAlteraFipeDePara.Position := poScreenCenter;
 FormAlteraFipeDePara.ShowModal;

end;

procedure TFormCruzamentoFipes.Button1Click(Sender: TObject);
Var
 Filter: TStringList;
begin

  if ComboBoxFornecedor.Text <> '' then
  qBuscaFipes.Filter := 'fornecedor = '+QuotedStr(ComboBoxFornecedor.Text) +
                        'and upper(modelo) like '+UpperCase(QuotedStr('%'+EditModelo.Text+'%')) +
                        'and ano like '+UpperCase(QuotedStr('%'+EditAno.Text+'%'));

 qBuscaFipes.Filtered := true;

 if EditAno.Text = '' then
 Begin
   if EditModelo.Text = '' then
   Begin
     if ComboBoxFornecedor.Text = '' then
     Begin
       qBuscaFipes.Filtered := false;
       qBuscaFipes.Active := false;
       qBuscaFipes.Active := true;
     End;
   End;
 End;

end;

procedure TFormCruzamentoFipes.FormShow(Sender: TObject);
begin

  qBuscaFornecedores.SQL.Clear;
  qBuscaFornecedores.SQL.Add('select distinct fornecedor from tbconcfipemodelo');
  qBuscaFornecedores.Open;

  ComboBoxFornecedor.Clear;

  qBuscaFornecedores.First;

  while not qBuscaFornecedores.Eof do
  Begin
     ComboBoxFornecedor.Items.Add(qBuscaFornecedores.FieldByName('fornecedor').Text);
     qBuscaFornecedores.Next;
  End;

end;

end.
