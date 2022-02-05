unit UFormDEV;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Uni;

type
  TFormDEV = class(TForm)
    btnAjustaVlrAvaliadoPagamentos: TButton;
    procedure btnAjustaVlrAvaliadoPagamentosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDEV: TFormDEV;

implementation

{$R *.dfm}

uses FMX.UFormGraficosAtendimento, Loading, UClasseVeiculoAvaliacao,
  UDataModuleBancoVistoria, UDataModuleConexao, UDMPermissoes, UFormAgendamento,
  UFormAguarde, UFormAjusteDadosFipeAvaliacao, UFormAlteracaoProposta,
  UFormAlteracaoVeiculo, UFormAlteraDadosCliente, UFormAlteraFipeDePaxa,
  UFormAlteraMidiaAnuncio, UFormAlteraPermissaoAppTransp, UFormAlteraPlaca,
  UFormAnaliseCompra, UFormAnaliseCompraQuery, UFormAnaliseComprasTabela,
  UFormAplicaMargem, UFormAtendimentoMultasVeiculo, UFormAtendimentoNovo,
  UFormAtendimentos, UFormAtualizaTabelaFipe, UFormAtuHistFIPE, UFormAtuTabFIpe,
  UFormAvaliarAvaliacao, UFormAvarias, UFormAvariasItens,
  UFormCadaNovoUsuMobile, UFormCadastroTransportadora,
  UFormCadastroTransportadoras, UFormCadaUsuario, UFormCadaUsuariosMobile,
  UFormCadVistoriadores, UFormCidadesCustos, UFormColunasOcultas,
  UFormConcedePermissao, UFormConcFipeModelo, UFormConsutaPlacaAvaliacao,
  UFormCriacaoAvaria, UFormCruzamentoFipes, UFormDadosPagamento,
  UFormDadosPerfil, UFormDadosPgtoTransporte, UFormDataPagamento,
  UFormDetalhesAtendimento, UFormDetalhesAtendimentoBeta,
  UFormDetalhesAvaliacao, UFormDetalhesResumoCompra, UFormDetalheTransportes,
  UFormDivergenciasDados, UFormDownloadNovaVersao, UFormDREDados,
  UFormExcelCompras, UFormExtratoPgtoVeiculos, UFormFiltrosGestao,
  UFormFinanceiroTransportes, UFormFornecedoresFrotista,
  UFormFornecedorFrotistaAddEditar, UFormGestaoAvaliacoes, UFormGestaoAvarias,
  UFormGestaoDadosSavauto, UFormGestaoTransporte, UFormGestaoVistoria,
  UFormHistFIPE, UFormHistoricoAvaliacoes, UFormHistoricoObsAtn, UFormImagem,
  UFormImportacoesEfetuadas, UFormInformacoes, UFormLiberaPermissao,
  UFormListaBancos, UFormListaUsuarios, UFormLoading, UFormLoadingCarregamento,
  UFormLoadingOpaco, UFormLoginSavauto, UFormLotesArval, UFormMenuFinanceiro,
  UFormNovaAvaliacao, UFormNovaCidadeCusto, UformNovaObs,
  UFormNovoProcessamento, UFormNovoUsuarioTransporte, UFormNovoVistoriador,
  UFormPadroesPlanilhas, UFormPagamentoEmLoteTransportes,
  UFormPagamentoTransporte, UFormPagamentoVeiculo, UFormParametros, UFormPerfis,
  UFormPermissoesCarga, UFormPermissoesUsuarioAppTransporte, UFormPesquisaFipe,
  UFormPgtoExtratoVeiculo, UFormPrincipal, UFormProcPlanAcelero,
  UFormProcPlanFinal, UFormQuitacoesVeiculo, UFormRefFipes, UFormRelacaoEstoque,
  UFormSegIPVALic, UFormTabelaCompra, UFormUltimasAtualizacoes, UFormUsuarios,
  UFormVerCarrosClasse, UFormVistoriadores, UFormVistoriasDetalhes,
  UFormWebBrowse, UforTestesDiversos, UnitLogin;

procedure TFormDEV.btnAjustaVlrAvaliadoPagamentosClick(Sender: TObject);
var
 querySelect, queryUpdate : TUniQuery;
begin

 querySelect := TUniQuery.Create(self);
 queryUpdate := TUniQuery.Create(self);

 querySelect.Connection := DataModuleConexao.UniConnection1;
 queryUpdate.Connection := DataModuleConexao.UniConnection1;

 try

  with querySelect do
  Begin
   sql.Clear;
   sql.Add('select * from tbcompras_pagamento_detalhe');
   sql.Add('where valor_pago = 0');
   sql.Add('order by id desc ');
   Open;

    if RecordCount > 0 then
    Begin
      First;
       while not Eof do
       Begin
         queryUpdate.SQL.Clear;
         queryUpdate.SQL.Add('select vlrAvaliacao from tbcompras_atendimento where id=:id');
         queryUpdate.ParamByName('id').AsInteger := FieldByName('id_atendimento').AsInteger;
         queryUpdate.Open;

         var vlrAvaliado : currency;

         vlrAvaliado := queryUpdate.FieldByName('vlrAvaliacao').AsCurrency;

         queryUpdate.SQL.Clear;
         queryUpdate.SQL.Add('update tbcompras_pagamento_detalhe set valor_avaliacao=:vlr where id_atendimento=:id');
         queryUpdate.ParamByName('id').AsInteger := FieldByName('id_atendimento').AsInteger;
         queryUpdate.ParamByName('vlr').AsCurrency := vlrAvaliado;
         queryUpdate.Execute;

         Next;

       End;

       ShowMessage('Processo finalizado!');

       querySelect.DisposeOf;
       queryUpdate.DisposeOf;

    End;

  End;

  Except
  On E:Exception Do
  Begin
     ShowMessage('Falha! '+ e.Message);
  End;

 end;


end;

end.
