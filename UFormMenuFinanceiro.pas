unit UFormMenuFinanceiro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFormMenuFinanceiro = class(TForm)
    Panel1: TPanel;
    btnPgtoVeiculos: TBitBtn;
    Panel2: TPanel;
    Panel3: TPanel;
    btnPgtoTransportes: TBitBtn;
    procedure btnPgtoVeiculosClick(Sender: TObject);
    procedure btnPgtoTransportesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMenuFinanceiro: TFormMenuFinanceiro;

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
  UFormCruzamentoFipes, UFormDadosPagamento, UFormDadosPerfil,
  UFormDataPagamento, UFormDetalhesAtendimento, UFormDetalhesAvaliacao,
  UFormDownloadNovaVersao, UFormExcelCompras, UFormGestaoAvaliacoes,
  UFormGestaoVistoria, UFormHistFIPE, UFormHistoricoAvaliacoes,
  UFormHistoricoObsAtn, UFormImagem, UFormImportacoesEfetuadas,
  UFormInformacoes, UFormLiberaPermissao, UFormLoading,
  UFormLoadingCarregamento, UFormLoadingOpaco, UFormLoginSavauto,
  UFormLotesArval, UFormNovaAvaliacao, UformNovaObs, UFormNovoProcessamento,
  UFormNovoVistoriador, UFormPadroesPlanilhas, UFormPagamentoVeiculo,
  UFormPerfis, UFormPermissoesCarga, UFormPesquisaFipe, UFormPrincipal,
  UFormProcPlanAcelero, UFormProcPlanFinal, UFormQuitacoesVeiculo,
  UFormRefFipes, UFormSegIPVALic, UFormUltimasAtualizacoes, UFormUsuarios,
  UFormVistoriadores, UFormVistoriasDetalhes, UFormWebBrowse,
  UforTestesDiversos, UnitLogin, UFormExtratoPgtoVeiculos,
  UFormAjusteDadosFipeAvaliacao, UFormAlteracaoProposta, UFormAlteracaoVeiculo,
  UFormAlteraDadosCliente, UFormAlteraMidiaAnuncio,
  UFormAlteraPermissaoAppTransp, UFormAlteraPlaca, UFormAvariasItens,
  UFormCadastroTransportadora, UFormCadastroTransportadoras, UFormCriacaoAvaria,
  UFormDetalheTransportes, UFormFinanceiroTransportes,
  UFormFornecedoresFrotista, UFormFornecedorFrotistaAddEditar,
  UFormGestaoAvarias, UFormGestaoTransporte, UFormListaUsuarios,
  UFormNovoUsuarioTransporte, UFormParametros,
  UFormPermissoesUsuarioAppTransporte, UFormPgtoExtratoVeiculo;

procedure TFormMenuFinanceiro.btnPgtoTransportesClick(Sender: TObject);
begin
 if FormFinanceiroTransportes = nil then
 Begin
    FormFinanceiroTransportes := TFormFinanceiroTransportes.Create(self);
 End;

 FormFinanceiroTransportes.qBuscaFinanceiro.Refresh;

 FormFinanceiroTransportes.WindowState := wsMaximized;
 FormFinanceiroTransportes.ShowModal;
end;

procedure TFormMenuFinanceiro.btnPgtoVeiculosClick(Sender: TObject);
begin

 if FormExtratoPgtoVeiculos = nil then
 Begin
   FormExtratoPgtoVeiculos := TFormExtratoPgtoVeiculos.Create(self);
 End;

  FormExtratoPgtoVeiculos.Position := poScreenCenter;
  FormExtratoPgtoVeiculos.ShowModal;

end;

end.
