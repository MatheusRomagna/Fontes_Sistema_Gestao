unit UFormAvaliarAvaliacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, MemDS, DBAccess,
  Uni;

type
  TFormAvaliarAvaliacao = class(TForm)
    Label1: TLabel;
    EditVlrAvaliado: TEdit;
    Label2: TLabel;
    qAtuValorAvaliadoPlaca: TUniQuery;
    procedure FormShow(Sender: TObject);
    procedure EditVlrAvaliadoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditVlrAvaliadoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAvaliarAvaliacao: TFormAvaliarAvaliacao;

implementation

{$R *.dfm}

uses Loading, UDataModuleBancoVistoria, UDataModuleConexao,
  UDataModuleRESTDWvistoria, UDMRestDataWareDB, UFormAnaliseCompra,
  UFormAnaliseCompraQuery, UFormAnaliseComprasTabela, UFormAplicaMargem,
  UFormAtualizaTabelaFipe, UFormAtuHistFIPE, UFormAtuTabFIpe, UFormAvarias,
  UFormCadVistoriadores, UFormColunasOcultas, UFormConcFipeModelo,
  UFormConsutaPlacaAvaliacao, UFormDetalhesAvaliacao, UFormDownloadNovaVersao,
  UFormExcelCompras, UFormGestaoAvaliacoes, UFormGestaoVistoria, UFormHistFIPE,
  UFormImagem, UFormImportacoesEfetuadas, UFormLoading, UFormLoadingOpaco,
  UFormLotesArval, UFormNovoProcessamento, UFormNovoVistoriador,
  UFormPadroesPlanilhas, UFormPrincipal, UFormProcPlanAcelero,
  UFormProcPlanFinal, UFormUltimasAtualizacoes, UFormVistoriadores,
  UFormVistoriasDetalhes, UFormWebBrowse, UforTestesDiversos, UnitLogin,
  FMX.UFormGraficosAtendimento, UDMPermissoes, UFormAgendamento, UFormAguarde,
  UFormAjusteDadosFipeAvaliacao, UFormAlteracaoProposta, UFormAlteracaoVeiculo,
  UFormAlteraDadosCliente, UFormAlteraFipeDePaxa, UFormAlteraMidiaAnuncio,
  UFormAlteraPermissaoAppTransp, UFormAlteraPlaca,
  UFormAtendimentoMultasVeiculo, UFormAtendimentoNovo, UFormAtendimentos,
  UFormAvariasItens, UFormCadaNovoUsuMobile, UFormCadastroTransportadora,
  UFormCadastroTransportadoras, UFormCadaUsuario, UFormCadaUsuariosMobile,
  UFormCidadesCustos, UFormConcedePermissao, UFormCriacaoAvaria,
  UFormCruzamentoFipes, UFormDadosPagamento, UFormDadosPerfil,
  UFormDadosPgtoTransporte, UFormDataPagamento, UFormDetalhesAtendimento,
  UFormDetalhesAtendimentoBeta, UFormDetalheTransportes,
  UFormExtratoPgtoVeiculos, UFormFinanceiroTransportes,
  UFormFornecedoresFrotista, UFormFornecedorFrotistaAddEditar,
  UFormGestaoAvarias, UFormGestaoTransporte, UFormHistoricoAvaliacoes,
  UFormHistoricoObsAtn, UFormInformacoes, UFormLiberaPermissao,
  UFormListaBancos, UFormListaUsuarios, UFormLoadingCarregamento,
  UFormLoginSavauto, UFormMenuFinanceiro, UFormNovaAvaliacao,
  UFormNovaCidadeCusto, UformNovaObs, UFormNovoUsuarioTransporte,
  UFormPagamentoEmLoteTransportes, UFormPagamentoTransporte,
  UFormPagamentoVeiculo, UFormParametros, UFormPerfis, UFormPermissoesCarga,
  UFormPermissoesUsuarioAppTransporte, UFormPesquisaFipe,
  UFormPgtoExtratoVeiculo, UFormQuitacoesVeiculo, UFormRefFipes,
  UFormSegIPVALic, UFormUsuarios;

procedure TFormAvaliarAvaliacao.EditVlrAvaliadoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

if key=(VK_Escape) then
close;

end;

procedure TFormAvaliarAvaliacao.EditVlrAvaliadoKeyPress(Sender: TObject;
  var Key: Char);
begin

 if key = #13  then
 Begin

  if FormAguarde = nil then
  FormAguarde := TFormAguarde.Create(self);

  FormAguarde.Position := poScreenCenter;
  FormAguarde.Show;
  Application.ProcessMessages;
  Sleep(500);

  qAtuValorAvaliadoPlaca.SQL.Clear;
  qAtuValorAvaliadoPlaca.SQL.Add('update tbavaliacoes set avaliacao = :valor_avaliado where  placa = :placa');
  qAtuValorAvaliadoPlaca.ParamByName('valor_avaliado').AsCurrency := StrToCurr(EditVlrAvaliado.Text);
  qAtuValorAvaliadoPlaca.ParamByName('placa').Text                := FormDetalhesAvaliacao.EditPlaca.Text;
  qAtuValorAvaliadoPlaca.ExecSQL;

  qAtuValorAvaliadoPlaca.Close;

  var query : TUniQuery;
  query := TUniQuery.Create(self);
  query.Connection := DataModuleConexao.UniConnection1;

  query.SQL.Clear;
  query.SQL.Add('update tbcompras_atendimento set VlrAvaliacao=:vlr where placa=:placa and ID_AVALIACAO=:id  AND situacao <> ''Concluido''');
  query.ParamByName('vlr').AsCurrency := StrToCurr(EditVlrAvaliado.Text);
  query.ParamByName('placa').Text := FormDetalhesAvaliacao.EditPlaca.Text;
  query.ParamByName('id').AsInteger := FormGestaoAvaliacoes.DBGrid1.DataSource.DataSet.FieldByName('id').AsInteger;
  query.Execute;

  query.DisposeOf;

  FormAguarde.Close;

  MessageDlg('Valor aplicado com sucesso a placa '+ FormDetalhesAvaliacao.EditPlaca.Text + #13 +
             'A Avaliação de R$: '+EditVlrAvaliado.Text+'', mtInformation , [mbok] , 0);

  Close;

 End;

end;

procedure TFormAvaliarAvaliacao.FormShow(Sender: TObject);
begin

 EditVlrAvaliado.SelectAll;

end;

end.
