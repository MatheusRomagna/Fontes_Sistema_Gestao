unit UFormHistoricoObsAtn;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, MemDS, DBAccess, Uni, System.Rtti,
  System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope;

type
  TFormHistoricoObsAtn = class(TForm)
    Panel1: TPanel;
    MemoObs: TMemo;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    qBuscaAtendimento: TUniQuery;
    qBuscaAtendimentoid: TIntegerField;
    qBuscaAtendimentoid_atendimento: TIntegerField;
    qBuscaAtendimentousuario: TStringField;
    qBuscaAtendimentodata: TDateTimeField;
    qBuscaAtendimentoobs: TStringField;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    btnCriar: TButton;
    procedure btnCriarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormHistoricoObsAtn: TFormHistoricoObsAtn;

implementation

{$R *.dfm}

uses FMX.UFormGraficosAtendimento, Loading, UDataModuleBancoVistoria,
  UDataModuleConexao, UDMPermissoes, UFormAgendamento, UFormAlteraFipeDePaxa,
  UFormAnaliseCompra, UFormAnaliseCompraQuery, UFormAnaliseComprasTabela,
  UFormAplicaMargem, UFormAtendimentoMultasVeiculo, UFormAtendimentoNovo,
  UFormAtendimentos, UFormAtualizaTabelaFipe, UFormAtuHistFIPE, UFormAtuTabFIpe,
  UFormAvaliarAvaliacao, UFormAvarias, UFormCadaNovoUsuMobile, UFormCadaUsuario,
  UFormCadaUsuariosMobile, UFormCadVistoriadores, UFormColunasOcultas,
  UFormConcedePermissao, UFormConcFipeModelo, UFormConsutaPlacaAvaliacao,
  UFormCruzamentoFipes, UFormDadosPerfil, UFormDetalhesAtendimento,
  UFormDetalhesAvaliacao, UFormDownloadNovaVersao, UFormExcelCompras,
  UFormGestaoAvaliacoes, UFormGestaoVistoria, UFormHistFIPE,
  UFormHistoricoAvaliacoes, UFormImagem, UFormImportacoesEfetuadas,
  UFormInformacoes, UFormLiberaPermissao, UFormLoading, UFormLoadingOpaco,
  UFormLoginSavauto, UFormLotesArval, UFormNovoProcessamento,
  UFormNovoVistoriador, UFormPadroesPlanilhas, UFormPerfis,
  UFormPermissoesCarga, UFormPesquisaFipe, UFormPrincipal, UFormProcPlanAcelero,
  UFormProcPlanFinal, UFormQuitacoesVeiculo, UFormRefFipes, UFormSegIPVALic,
  UFormUltimasAtualizacoes, UFormUsuarios, UFormVistoriadores,
  UFormVistoriasDetalhes, UFormWebBrowse, UforTestesDiversos, UnitLogin,
  UformNovaObs;

procedure TFormHistoricoObsAtn.btnCriarClick(Sender: TObject);
begin


 if FormNovaObs = nil then
 Begin
   FormNovaObs := TFormNovaObs.Create(self);
 End;


 FormNovaObs.Position := poScreenCenter;
 FormNovaObs.MemoObs.Text := '';
 FormNovaObs.ShowModal;

end;

end.
