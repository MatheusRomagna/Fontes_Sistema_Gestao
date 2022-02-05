program SistemaGestaoSavauto;

uses
  Vcl.Forms,
  UFormPrincipal in 'UFormPrincipal.pas' {FormPrincipal},
  UFormLoginSavauto in 'UFormLoginSavauto.pas' {FormLoginSavauto},
  UDataModuleConexao in 'UDataModuleConexao.pas' {DataModuleConexao: TDataModule},
  UFormAtualizaTabelaFipe in 'UFormAtualizaTabelaFipe.pas' {FormAtualizaTabelaFipe},
  UFormLoading in 'UFormLoading.pas' {FormLoading},
  UFormNovoProcessamento in 'UFormNovoProcessamento.pas' {FormNovoProcessamento},
  UFormProcPlanAcelero in 'UFormProcPlanAcelero.pas' {FormProcPlanAcelero},
  UFormConcFipeModelo in 'UFormConcFipeModelo.pas' {FormConciliacaoFipeModelo},
  UFormExcelCompras in 'UFormExcelCompras.pas' {FormExcelCompras},
  UFormHistFIPE in 'UFormHistFIPE.pas' {FormHistFIPE},
  UFormAtuHistFIPE in 'UFormAtuHistFIPE.pas' {FormAtualizaHistoricoFIPE},
  UFormProcPlanFinal in 'UFormProcPlanFinal.pas' {FormProcPlanFinal},
  UFormAnaliseComprasTabela in 'UFormAnaliseComprasTabela.pas' {FormAnaliseComprasTabela},
  UFormAnaliseCompraQuery in 'UFormAnaliseCompraQuery.pas' {FormAnaliseCompraQuery},
  UFormAplicaMargem in 'UFormAplicaMargem.pas' {FormAplicaMargem},
  UFormColunasOcultas in 'UFormColunasOcultas.pas' {FormColunasOcultas},
  UFormDownloadNovaVersao in 'UFormDownloadNovaVersao.pas' {FormDownloadNovaVersao},
  UFormPadroesPlanilhas in 'UFormPadroesPlanilhas.pas' {FormPadroesPlanilhas},
  UFormImagem in 'UFormImagem.pas' {FormImagem},
  UFormImportacoesEfetuadas in 'UFormImportacoesEfetuadas.pas' {FormImportacoesEfetuadas},
  UFormAnaliseCompra in 'UFormAnaliseCompra.pas' {FormAnalisaCompra},
  UFormUltimasAtualizacoes in 'UFormUltimasAtualizacoes.pas' {FormUltimasAtualizacoes},
  UFormWebBrowse in 'UFormWebBrowse.pas' {FormWebBrowse},
  UFormGestaoVistoria in 'UFormGestaoVistoria.pas' {FormGestaoVistoria},
  UFormCadVistoriadores in 'UFormCadVistoriadores.pas' {FormCadVistoriadores},
  UFormNovoVistoriador in 'UFormNovoVistoriador.pas' {FormNovoVistoriador},
  UFormVistoriadores in 'UFormVistoriadores.pas' {FormVistoriadores},
  UFormVistoriasDetalhes in 'UFormVistoriasDetalhes.pas' {FormVistoriaDetalhes},
  Loading in '..\..\..\Componentes_Delphi\054-Fontes-Carregando\Loading.pas',
  UFormLoadingOpaco in 'UFormLoadingOpaco.pas' {FormLoadingOpaco},
  UforTestesDiversos in 'UforTestesDiversos.pas' {FormTestesDiversos},
  UFormAvarias in 'UFormAvarias.pas' {FormAvarias},
  UFormAtuTabFIpe in 'UFormAtuTabFIpe.pas' {FormAtuTabFIpe},
  UFormLotesArval in 'UFormLotesArval.pas' {FormLotesArval},
  UFormGestaoAvaliacoes in 'UFormGestaoAvaliacoes.pas' {FormGestaoAvaliacoes},
  UFormConsutaPlacaAvaliacao in 'UFormConsutaPlacaAvaliacao.pas' {FormConsultaPlacaAvaliacao},
  UFormDetalhesAvaliacao in 'UFormDetalhesAvaliacao.pas' {FormDetalhesAvaliacao},
  UnitLogin in 'UnitLogin.pas' {FormLogin},
  UDataModuleBancoVistoria in 'UDataModuleBancoVistoria.pas' {DataModuleBancoVistoria: TDataModule},
  UFormAvaliarAvaliacao in 'UFormAvaliarAvaliacao.pas' {FormAvaliarAvaliacao},
  UFormPermissoesCarga in 'UFormPermissoesCarga.pas' {FormPermissoesCarga},
  UFormHistoricoAvaliacoes in 'UFormHistoricoAvaliacoes.pas' {FormHistoricoAvaliacoes},
  UFormPerfis in 'UFormPerfis.pas' {FormPerfis},
  UFormDadosPerfil in 'UFormDadosPerfil.pas' {FormDadosPerfil},
  UFormConcedePermissao in 'UFormConcedePermissao.pas' {FormConcedePermissao},
  UFormUsuarios in 'UFormUsuarios.pas' {FormUsuarios},
  UFormCadaUsuario in 'UFormCadaUsuario.pas' {FormCadastroUsuario},
  UFormAtendimentos in 'UFormAtendimentos.pas' {FormAtendimentos},
  UFormAtendimentoNovo in 'UFormAtendimentoNovo.pas' {FormAtendimentoNovo},
  UFormPesquisaFipe in 'UFormPesquisaFipe.pas' {FormPesquisaFipe},
  UFormDetalhesAtendimento in 'UFormDetalhesAtendimento.pas' {FormDetalhesAtendimento},
  UFormAtendimentoMultasVeiculo in 'UFormAtendimentoMultasVeiculo.pas' {FormAtendimentoMultasVeiculo},
  UFormCadaUsuariosMobile in 'UFormCadaUsuariosMobile.pas' {FormCadaUsuariosMobile},
  UFormCadaNovoUsuMobile in 'UFormCadaNovoUsuMobile.pas' {FormCadaNovoUsuMobile},
  UFormAgendamento in 'UFormAgendamento.pas' {FormAgendamentoViita},
  FMX.UFormGraficosAtendimento in 'FMX.UFormGraficosAtendimento.pas' {FormGraficosAtendimentos},
  UFormSegIPVALic in 'UFormSegIPVALic.pas' {FormSeguroIPVALic},
  UFormQuitacoesVeiculo in 'UFormQuitacoesVeiculo.pas' {FormQuitacoesVeiculo},
  UFormInformacoes in 'UFormInformacoes.pas' {FormInformacoes},
  UFormCruzamentoFipes in 'UFormCruzamentoFipes.pas' {FormCruzamentoFipes},
  UFormAlteraFipeDePaxa in 'UFormAlteraFipeDePaxa.pas' {FormAlteraFipeDePara},
  UDMPermissoes in 'UDMPermissoes.pas' {DMPermissoes: TDataModule},
  UFormLiberaPermissao in 'UFormLiberaPermissao.pas' {FormLiberaPermissao},
  UFormRefFipes in 'UFormRefFipes.pas' {FormRefFipes},
  UFormHistoricoObsAtn in 'UFormHistoricoObsAtn.pas' {FormHistoricoObsAtn},
  UformNovaObs in 'UformNovaObs.pas' {FormNovaObs},
  UFormNovaAvaliacao in 'UFormNovaAvaliacao.pas' {FormNovaAvaliacao},
  UFormLoadingCarregamento in 'UFormLoadingCarregamento.pas' {FormLoadingCarregamento},
  UFormDadosPagamento in 'UFormDadosPagamento.pas' {FormDadosPagamento},
  UFormDataPagamento in 'UFormDataPagamento.pas' {FormDataPagamento},
  UFormPagamentoVeiculo in 'UFormPagamentoVeiculo.pas' {FormPagamentoVeiculo},
  UFormMenuFinanceiro in 'UFormMenuFinanceiro.pas' {FormMenuFinanceiro},
  UFormExtratoPgtoVeiculos in 'UFormExtratoPgtoVeiculos.pas' {FormExtratoPgtoVeiculos},
  UFormPgtoExtratoVeiculo in 'UFormPgtoExtratoVeiculo.pas' {FormPgtoExtratoVeiculo},
  UFormAjusteDadosFipeAvaliacao in 'UFormAjusteDadosFipeAvaliacao.pas' {FormAjusteDadosFipeAvaliacao},
  UFormListaUsuarios in 'UFormListaUsuarios.pas' {FormListaUsuarios},
  UFormGestaoAvarias in 'UFormGestaoAvarias.pas' {FormGestaoAvarias},
  UFormAvariasItens in 'UFormAvariasItens.pas' {FormAvariasItens},
  UFormCriacaoAvaria in 'UFormCriacaoAvaria.pas' {FormCriacaoAvaria},
  UFormParametros in 'UFormParametros.pas' {FormParametros},
  UFormAlteraMidiaAnuncio in 'UFormAlteraMidiaAnuncio.pas' {FormAlteraMidiaAnuncio},
  UFormAlteraDadosCliente in 'UFormAlteraDadosCliente.pas' {FormAlteraDadosCliente},
  UFormAlteraPlaca in 'UFormAlteraPlaca.pas' {FormAlteraPlaca},
  UFormAlteracaoVeiculo in 'UFormAlteracaoVeiculo.pas' {FormAlteracaoVeiculo},
  UFormAlteracaoProposta in 'UFormAlteracaoProposta.pas' {FormAlteracaoProposta},
  UFormFornecedoresFrotista in 'UFormFornecedoresFrotista.pas' {FormFornecedoresFrotista},
  UFormFornecedorFrotistaAddEditar in 'UFormFornecedorFrotistaAddEditar.pas' {FormFornecedorFrotistaAddEditar},
  UFormCadastroTransportadoras in 'UFormCadastroTransportadoras.pas' {FormCadastroTransportadoras},
  UFormCadastroTransportadora in 'UFormCadastroTransportadora.pas' {FormCadastroTransportadora},
  UFormNovoUsuarioTransporte in 'UFormNovoUsuarioTransporte.pas' {FormNovoUsuarioTransporte},
  UFormPermissoesUsuarioAppTransporte in 'UFormPermissoesUsuarioAppTransporte.pas' {FormPermissoesUsuarioAppTransporte},
  UFormAlteraPermissaoAppTransp in 'UFormAlteraPermissaoAppTransp.pas' {FormAlteraPermissaoAppTransp},
  UFormGestaoTransporte in 'UFormGestaoTransporte.pas' {FormGestaoTransporte},
  UFormDetalheTransportes in 'UFormDetalheTransportes.pas' {FormDetalheTransporte},
  UFormFinanceiroTransportes in 'UFormFinanceiroTransportes.pas' {FormFinanceiroTransportes},
  UFormPagamentoTransporte in 'UFormPagamentoTransporte.pas' {FormPagamentoTransporte},
  UFormDadosPgtoTransporte in 'UFormDadosPgtoTransporte.pas' {FormDadosPgtoTransporte},
  UFormListaBancos in 'UFormListaBancos.pas' {FormListaBancos},
  UFormCidadesCustos in 'UFormCidadesCustos.pas' {FormCidadesCustos},
  UFormNovaCidadeCusto in 'UFormNovaCidadeCusto.pas' {FormNovaCidadeCusto},
  UFormPagamentoEmLoteTransportes in 'UFormPagamentoEmLoteTransportes.pas' {FormPagamentoEmLoteTransportes},
  UFormAguarde in 'UFormAguarde.pas' {FormAguarde},
  UFormDetalhesAtendimentoBeta in 'UFormDetalhesAtendimentoBeta.pas' {FormDetalhesAtendimentoBeta},
  UFormGestaoDadosSavauto in 'UFormGestaoDadosSavauto.pas' {FormGestaoDadosSavauto},
  UFormFiltrosGestao in 'UFormFiltrosGestao.pas' {FormFiltrosGestao},
  UFormDivergenciasDados in 'UFormDivergenciasDados.pas' {FormDivergenciasDados},
  UFormDREDados in 'UFormDREDados.pas' {FormDREDados},
  UFormRelacaoEstoque in 'UFormRelacaoEstoque.pas' {FormRelacaoEstoque},
  UClasseVeiculoAvaliacao in 'UClasseVeiculoAvaliacao.pas' {ClasseVeiculoAvaliacao},
  UFormTabelaCompra in 'UFormTabelaCompra.pas' {FormTabelaCompra},
  UFormVerCarrosClasse in 'UFormVerCarrosClasse.pas' {FormVerCarrosClasse},
  UFormDetalhesResumoCompra in 'UFormDetalhesResumoCompra.pas' {FormDetalhesResumoCompra},
  UFormDEV in 'UFormDEV.pas' {FormDEV};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(TDataModuleConexao, DataModuleConexao);
  Application.CreateForm(TDataModuleBancoVistoria, DataModuleBancoVistoria);
  Application.CreateForm(TDMPermissoes, DMPermissoes);
  Application.CreateForm(TFormLoginSavauto, FormLoginSavauto);
  Application.CreateForm(TFormParametros, FormParametros);
  Application.CreateForm(TFormAlteraMidiaAnuncio, FormAlteraMidiaAnuncio);
  Application.CreateForm(TFormAlteraDadosCliente, FormAlteraDadosCliente);
  Application.CreateForm(TFormAlteraPlaca, FormAlteraPlaca);
  Application.CreateForm(TFormAlteracaoVeiculo, FormAlteracaoVeiculo);
  Application.CreateForm(TFormAlteracaoProposta, FormAlteracaoProposta);
  Application.CreateForm(TFormFornecedoresFrotista, FormFornecedoresFrotista);
  Application.CreateForm(TFormFornecedorFrotistaAddEditar, FormFornecedorFrotistaAddEditar);
  Application.CreateForm(TFormCadastroTransportadoras, FormCadastroTransportadoras);
  Application.CreateForm(TFormCadastroTransportadora, FormCadastroTransportadora);
  Application.CreateForm(TFormNovoUsuarioTransporte, FormNovoUsuarioTransporte);
  Application.CreateForm(TFormPermissoesUsuarioAppTransporte, FormPermissoesUsuarioAppTransporte);
  Application.CreateForm(TFormAlteraPermissaoAppTransp, FormAlteraPermissaoAppTransp);
  Application.CreateForm(TFormDetalheTransporte, FormDetalheTransporte);
  Application.CreateForm(TFormFinanceiroTransportes, FormFinanceiroTransportes);
  Application.CreateForm(TFormPagamentoTransporte, FormPagamentoTransporte);
  Application.CreateForm(TFormDadosPgtoTransporte, FormDadosPgtoTransporte);
  Application.CreateForm(TFormListaBancos, FormListaBancos);
  Application.CreateForm(TFormCidadesCustos, FormCidadesCustos);
  Application.CreateForm(TFormNovaCidadeCusto, FormNovaCidadeCusto);
  Application.CreateForm(TFormPagamentoEmLoteTransportes, FormPagamentoEmLoteTransportes);
  Application.CreateForm(TFormDetalhesAtendimentoBeta, FormDetalhesAtendimentoBeta);
  Application.CreateForm(TFormFiltrosGestao, FormFiltrosGestao);
  Application.CreateForm(TFormDivergenciasDados, FormDivergenciasDados);
  Application.CreateForm(TFormDREDados, FormDREDados);
  Application.CreateForm(TFormRelacaoEstoque, FormRelacaoEstoque);
  Application.CreateForm(TClasseVeiculoAvaliacao, ClasseVeiculoAvaliacao);
  Application.CreateForm(TFormTabelaCompra, FormTabelaCompra);
  Application.CreateForm(TFormVerCarrosClasse, FormVerCarrosClasse);
  Application.CreateForm(TFormDetalhesResumoCompra, FormDetalhesResumoCompra);
  Application.CreateForm(TFormDEV, FormDEV);
  Application.Run;
end.
