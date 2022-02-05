unit UformNovaObs;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  MemDS, DBAccess, Uni;

type
  TFormNovaObs = class(TForm)
    MemoObs: TMemo;
    Panel1: TPanel;
    btnSalvar: TButton;
    qInsereObs: TUniQuery;
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormNovaObs: TFormNovaObs;

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
  UFormHistoricoAvaliacoes, UFormHistoricoObsAtn, UFormImagem,
  UFormImportacoesEfetuadas, UFormInformacoes, UFormLiberaPermissao,
  UFormLoading, UFormLoadingOpaco, UFormLoginSavauto, UFormLotesArval,
  UFormNovoProcessamento, UFormNovoVistoriador, UFormPadroesPlanilhas,
  UFormPerfis, UFormPermissoesCarga, UFormPesquisaFipe, UFormPrincipal,
  UFormProcPlanAcelero, UFormProcPlanFinal, UFormQuitacoesVeiculo,
  UFormRefFipes, UFormSegIPVALic, UFormUltimasAtualizacoes, UFormUsuarios,
  UFormVistoriadores, UFormVistoriasDetalhes, UFormWebBrowse,
  UforTestesDiversos, UnitLogin;

procedure TFormNovaObs.btnSalvarClick(Sender: TObject);
begin

  qInsereObs.SQL.Clear;
  qInsereObs.SQL.Add('insert into tbatendimento_obs (id_atendimento, usuario, data, obs)');
  qInsereObs.SQL.Add('values (:id, :usuario, :data, :obs)');
  qInsereObs.ParamByName('id').AsInteger := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger;
  qInsereObs.ParamByName('usuario').Text := FormLoginSavauto.EditUsuario.Text;
  qInsereObs.ParamByName('data').AsDateTime := NOW;
  qInsereObs.ParamByName('OBS').Text := MemoObs.Text;
  qInsereObs.ExecSQL;

  MemoObs.Text := '';

  FormHistoricoObsAtn.qBuscaAtendimento.Refresh;

  Close;

end;

end.
