unit UFormDetalhesResumoCompra;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Uni;

type
  TFormDetalhesResumoCompra = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label41: TLabel;
    EditVlrMultasPgto: TEdit;
    EditVlrDocsPgto: TEdit;
    EditVlrQuitacaoPgto: TEdit;
    EditVlrTransPgto: TEdit;
    EditVlrDutPgto: TEdit;
    EditTotalDescontos: TEdit;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    GroupBox3: TGroupBox;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    EditVlrFipePgto: TEdit;
    EditVlrPropostaPgto: TEdit;
    EditVlrAvaliacaoPgto: TEdit;
    GroupBox4: TGroupBox;
    Label39: TLabel;
    Label40: TLabel;
    EditLiqPgto: TEdit;
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    procedure CarregaResumoFinanceiro(id: integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDetalhesResumoCompra: TFormDetalhesResumoCompra;

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
  UFormDetalhesAvaliacao, UFormDetalheTransportes, UFormDivergenciasDados,
  UFormDownloadNovaVersao, UFormDREDados, UFormExcelCompras,
  UFormExtratoPgtoVeiculos, UFormFiltrosGestao, UFormFinanceiroTransportes,
  UFormFornecedoresFrotista, UFormFornecedorFrotistaAddEditar,
  UFormGestaoAvaliacoes, UFormGestaoAvarias, UFormGestaoDadosSavauto,
  UFormGestaoTransporte, UFormGestaoVistoria, UFormHistFIPE,
  UFormHistoricoAvaliacoes, UFormHistoricoObsAtn, UFormImagem,
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

procedure TFormDetalhesResumoCompra.Button2Click(Sender: TObject);
begin
 if FormAtendimentoMultasVeiculo = nil then
 Begin
   FormAtendimentoMultasVeiculo := TFormAtendimentoMultasVeiculo.Create(self);
 End;

 FormAtendimentoMultasVeiculo.qBuscaMultas.Filter := 'id_atendimento='+QuotedStr( IntToStr(Tag));
 FormAtendimentoMultasVeiculo.qBuscaMultas.Filtered := true;

 FormAtendimentoMultasVeiculo.Position := poScreenCenter;
 FormAtendimentoMultasVeiculo.ShowModal;
end;

procedure TFormDetalhesResumoCompra.Button3Click(Sender: TObject);
begin
 if FormSeguroIPVALic = nil then
 Begin
   FormSeguroIPVALic := TFormSeguroIPVALic.Create(self);
 End;

 FormSeguroIPVALic.qBuscaDocs.Filter := 'id_atendimento='+QuotedStr(IntToStr(Tag));
 FormSeguroIPVALic.qBuscaDocs.Filtered := true;

 FormSeguroIPVALic.Position := poScreenCenter;
 FormSeguroIPVALic.ShowModal;
end;

procedure TFormDetalhesResumoCompra.Button4Click(Sender: TObject);
begin
 if FormQuitacoesVeiculo = nil then
 Begin
   FormQuitacoesVeiculo := TFormQuitacoesVeiculo.Create(self);
 End;

 FormQuitacoesVeiculo.qBuscaQuitacoes.Filter := 'id_atendimento='+QuotedStr( IntToStr(Tag));
 FormQuitacoesVeiculo.qBuscaQuitacoes.Filtered := true;

 FormQuitacoesVeiculo.Position := poScreenCenter;
 FormQuitacoesVeiculo.ShowModal;
end;

procedure TFormDetalhesResumoCompra.CarregaResumoFinanceiro(id : integer);
var
 query : TUniQuery;
 id_placa: integer;
Begin

 query := TUniQuery.Create(self);
 query.Connection := DataModuleConexao.UniConnection1;

 try

   query.SQL.Clear;
   query.SQL.Add('select id from tbcompras_atendimento where id=:id');
   query.ParamByName('id').asInteger := id;
   query.Open;

   id_placa := query.FieldByName('id').AsInteger;

   FormDetalhesResumoCompra.Tag := id_placa;

   query.SQL.Clear;
   query.SQL.Add('select * from tbcompras_doc_leilao where id_atendimento = :id');
   query.ParamByName('id').AsInteger := id_placa;
   query.Open;

   if query.RecordCount > 0 then
   Begin

     EditVlrMultasPgto.Text   := floatToStrF(query.FieldByName('total_multas').AsCurrency, ffCurrency,10,2);

     EditVlrDocsPgto.Text     := floatToStrF(query.FieldByName('total_ipva_seg_lic').AsCurrency, ffCurrency,10,2);

     EditVlrQuitacaoPgto.Text := floatToStrF(query.FieldByName('quitacao').AsCurrency,  ffCurrency,10,2);

     EditVlrTransPgto.Text    := floatToStrF(query.FieldByName('transferencia').AsCurrency,  ffCurrency,10,2);

     EditVlrDutPgto.Text      := floatToStrF(query.FieldByName('2_via_dut').AsCurrency,  ffCurrency,10,2);

     EditTotalDescontos.Text  := floatToStrF(query.FieldByName('total_multas').AsCurrency+
                                             query.FieldByName('total_ipva_seg_lic').AsCurrency+
                                             query.FieldByName('quitacao').AsCurrency+
                                             query.FieldByName('transferencia').AsCurrency+
                                             query.FieldByName('2_via_dut').AsCurrency,  ffCurrency,10,2);
   End;


   query.SQL.Clear;
   query.SQL.Add('select * from tbcompras_atendimento where id = :id');
   query.ParamByName('id').AsInteger := id;
   query.Open;

   if query.RecordCount > 0 then
   Begin
     EditVlrFipePgto.Text     := floatToStrF(query.FieldByName('fipe').AsCurrency,  ffCurrency,10,2);

     EditVlrPropostaPgto.Text := floatToStrF(query.FieldByName('proposta').AsCurrency,  ffCurrency,10,2);

     EditVlrAvaliacaoPgto.Text := floatToStrF(query.FieldByName('VlrAvaliacao').AsCurrency,  ffCurrency,10,2);
   End;

    EditLiqPgto.Text :=
    CurrToStrF(
    StrToCurr(StringReplace(StringReplace(EditVlrAvaliacaoPgto.Text, 'R$', '',[rfReplaceAll, rfIgnoreCase]), '.', '',[rfReplaceAll, rfIgnoreCase]))
     -
    StrToCurr(StringReplace(StringReplace(EditTotalDescontos.Text, 'R$', '',[rfReplaceAll, rfIgnoreCase]), '.', '',[rfReplaceAll, rfIgnoreCase]))
    ,  ffCurrency,2);

 Except
 ON E:Exception Do
 Begin
    ShowMessage('Falha ao listar resumo! ' + e.Message);
 End;

 end;

End;

procedure TFormDetalhesResumoCompra.FormShow(Sender: TObject);
begin

  CarregaResumoFinanceiro( FormExtratoPgtoVeiculos.DataSource1.DataSet.FieldByName('id_atendimento').asinteger );

end;

end.
