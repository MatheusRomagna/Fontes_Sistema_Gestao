unit UFormGestaoAvarias;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, MemDS, DBAccess, Uni,
  Vcl.Buttons;

type
  TFormGestaoAvarias = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    QbuscaTipos: TUniQuery;
    btnAddTipo: TBitBtn;
    btnDelTipo: TBitBtn;
    QbuscaTiposid: TIntegerField;
    QbuscaTiposnome: TStringField;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormGestaoAvarias: TFormGestaoAvarias;

implementation

{$R *.dfm}

uses FMX.UFormGraficosAtendimento, Loading, UDataModuleBancoVistoria,
  UDataModuleConexao, UDMPermissoes, UFormAgendamento,
  UFormAjusteDadosFipeAvaliacao, UFormAlteraFipeDePaxa, UFormAnaliseCompra,
  UFormAnaliseCompraQuery, UFormAnaliseComprasTabela, UFormAplicaMargem,
  UFormAtendimentoMultasVeiculo, UFormAtendimentoNovo, UFormAtendimentos,
  UFormAtualizaTabelaFipe, UFormAtuHistFIPE, UFormAtuTabFIpe,
  UFormAvaliarAvaliacao, UFormAvarias, UFormCadaNovoUsuMobile, UFormCadaUsuario,
  UFormCadaUsuariosMobile, UFormCadVistoriadores, UFormColunasOcultas,
  UFormConcedePermissao, UFormConcFipeModelo, UFormConsutaPlacaAvaliacao,
  UFormCruzamentoFipes, UFormDadosPagamento, UFormDadosPerfil,
  UFormDataPagamento, UFormDetalhesAtendimento, UFormDetalhesAvaliacao,
  UFormDownloadNovaVersao, UFormExcelCompras, UFormExtratoPgtoVeiculos,
  UFormGestaoAvaliacoes, UFormGestaoVistoria, UFormHistFIPE,
  UFormHistoricoAvaliacoes, UFormHistoricoObsAtn, UFormImagem,
  UFormImportacoesEfetuadas, UFormInformacoes, UFormLiberaPermissao,
  UFormListaUsuarios, UFormLoading, UFormLoadingCarregamento, UFormLoadingOpaco,
  UFormLoginSavauto, UFormLotesArval, UFormMenuFinanceiro, UFormNovaAvaliacao,
  UformNovaObs, UFormNovoProcessamento, UFormNovoVistoriador,
  UFormPadroesPlanilhas, UFormPagamentoVeiculo, UFormPerfis,
  UFormPermissoesCarga, UFormPesquisaFipe, UFormPgtoExtratoVeiculo,
  UFormPrincipal, UFormProcPlanAcelero, UFormProcPlanFinal,
  UFormQuitacoesVeiculo, UFormRefFipes, UFormSegIPVALic,
  UFormUltimasAtualizacoes, UFormUsuarios, UFormVistoriadores,
  UFormVistoriasDetalhes, UFormWebBrowse, UforTestesDiversos, UnitLogin,
  UFormAvariasItens;

procedure TFormGestaoAvarias.DBGrid1DblClick(Sender: TObject);
begin

 if FormAvariasItens = nil then
 Begin
   FormAvariasItens := TFormAvariasItens.Create(self);
 End;

 FormAvariasItens.LblItens.Caption := 'Itens do tipo: ' + DBGrid1.DataSource.DataSet.FieldByName('nome').Text;
 FormAvariasItens.Position := poScreenCenter;
 FormAvariasItens.ShowModal;

end;

procedure TFormGestaoAvarias.FormShow(Sender: TObject);
begin

 QbuscaTipos.Open;
 QbuscaTipos.Refresh;

end;

end.
