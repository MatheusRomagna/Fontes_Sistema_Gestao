unit UFormGestaoDadosSavauto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, MemDS, DBAccess, Uni, Vcl.StdCtrls;

type
  TFormGestaoDadosSavauto = class(TForm)
    Panel3: TPanel;
    Image5: TImage;
    Panel1: TPanel;
    Panel2: TPanel;
    DbGridAnaliseEstoqueQuadro1: TDBGrid;
    DataSourceQuadro1: TDataSource;
    QQuadro1: TUniQuery;
    QQuadro1PRAZOPROPRIO: TStringField;
    QQuadro1Origem: TStringField;
    QQuadro1Placa: TStringField;
    QQuadro1Veículo: TStringField;
    QQuadro1Ano: TStringField;
    QQuadro1FipeAnterior: TFloatField;
    QQuadro1FipeAtual: TFloatField;
    QQuadro1IndiceFipe: TFloatField;
    QQuadro1PV: TFloatField;
    QQuadro1PC: TFloatField;
    QQuadro1TempoEstoque: TIntegerField;
    QQuadro1TempoLoja: TIntegerField;
    QQuadro1Margem: TFloatField;
    QQuadro1MargemDia: TFloatField;
    QQuadro1Cod_Fipe: TStringField;
    PanelAtualizar: TPanel;
    Panel10: TPanel;
    QQuadro1Situação: TStringField;
    panelFiltros: TPanel;
    Panel5: TPanel;
    LblStatusFiltro: TLabel;
    ScrollBox1: TScrollBox;
    labelRefFipes: TLabel;
    QQuadro1PVFIPE: TFloatField;
    Panel4: TPanel;
    Panel6: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Panel7: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Panel8: TPanel;
    EditMMediaFipeAnt: TEdit;
    EditMediaFipe: TEdit;
    EditMediaIndice: TEdit;
    EditMediaPVFIPE: TEdit;
    EditMediaPV: TEdit;
    EditMediaPC: TEdit;
    EditMediaEstoque: TEdit;
    EditMediaLoja: TEdit;
    EditMediaMargem: TEdit;
    EditMediaMargemD: TEdit;
    EditTotalFipeAnt: TEdit;
    EditTotalFipe: TEdit;
    EditTotalIndice: TEdit;
    EditTotalPVFIPE: TEdit;
    EditTotalPV: TEdit;
    EditTotalPC: TEdit;
    EditTotalMg: TEdit;
    EditTotalMGD: TEdit;
    PanelGraficosFIltros: TPanel;
    PanelFixoFiltros: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    Panel19: TPanel;
    lblQtdVeiculos: TLabel;
    panelDivergencias: TPanel;
    Panel21: TPanel;
    QQuadro1LOJA: TStringField;
    QQuadro1Ref1: TStringField;
    QQuadro1Ref2: TStringField;
    Panel22: TPanel;
    Panel23: TPanel;
    Panel24: TPanel;
    Panel25: TPanel;
    Label17: TLabel;
    Label18: TLabel;
    Edit1: TEdit;
    EditTmpEstoqueFilProprio: TEdit;
    EditMetaTmpEstoqueFilProprio: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    EditQtdEstoqueFilProprio: TEdit;
    EditMgMedDiaEstoqueFilProprio: TEdit;
    EditVlrTotEstoqueEstoqueFilProprio: TEdit;
    EditPMEstoqueFilProprio: TEdit;
    EditPCEstoqueFilProprio: TEdit;
    EditMgMedEstoqueEstoqueFilProprio: TEdit;
    EditMetaQtdFilProprio: TEdit;
    EditMgMediaDiaFilProprio: TEdit;
    EditMetaValorTotalEstoqueFilProprio: TEdit;
    EditMetaPVFilProprio: TEdit;
    EditMetaPCFilProprio: TEdit;
    EditMetaMgMedEstFilProprio: TEdit;
    Panel11: TPanel;
    btnAlteraMetaFilProprio: TButton;
    Panel12: TPanel;
    Label21: TLabel;
    Label22: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    EditMetaMgMedEstFilPrazo: TEdit;
    EditMetaPCFilPrazo: TEdit;
    EditMetaPVFilPrazo: TEdit;
    EditMetaQtdFilPrazo: TEdit;
    EditMetaTmpEstoqueFilPrazo: TEdit;
    EditMetaValorTotalEstoqueFilPrazo: TEdit;
    EditMgMedDiaEstoqueFilPrazo: TEdit;
    EditMgMedEstoqueEstoqueFilPrazo: TEdit;
    EditMgMediaDiaFilPrazo: TEdit;
    EditPCEstoqueFilPrazo: TEdit;
    EditPMEstoqueFilPrazo: TEdit;
    EditQtdEstoqueFilPrazo: TEdit;
    EditTmpEstoqueFilPrazo: TEdit;
    EditVlrTotEstoqueEstoqueFilPrazo: TEdit;
    btnAlteraMetasFiltroPrazos: TButton;
    Panel13: TPanel;
    Label23: TLabel;
    Label24: TLabel;
    Edit29: TEdit;
    Edit30: TEdit;
    Edit31: TEdit;
    Edit32: TEdit;
    Edit33: TEdit;
    Edit34: TEdit;
    Edit35: TEdit;
    EditMetaMgMedEstFil: TEdit;
    EditMetaPCFil: TEdit;
    EditMetaPVFil: TEdit;
    EditMetaQtdFil: TEdit;
    EditMetaTmpEstoqueFil: TEdit;
    EditMetaValorTotalEstoqueFil: TEdit;
    EditMgMedDiaEstoqueFil: TEdit;
    EditMgMedEstoqueEstoqueFil: TEdit;
    EditMgMediaDiaFil: TEdit;
    EditPCEstoqueFil: TEdit;
    EditPMEstoqueFil: TEdit;
    EditQtdEstoqueFil: TEdit;
    EditTmpEstoqueFil: TEdit;
    EditVlrTotEstoqueEstoqueFil: TEdit;
    BtnAlteraFilTodos: TButton;
    Panel14: TPanel;
    Label25: TLabel;
    Label26: TLabel;
    Edit50: TEdit;
    Edit51: TEdit;
    Edit52: TEdit;
    Edit53: TEdit;
    Edit54: TEdit;
    Edit55: TEdit;
    Edit56: TEdit;
    EditMetaMgMedEstFixProprio: TEdit;
    EditMetaPCFixProprio: TEdit;
    EditMetaPVFixProprio: TEdit;
    EditMetaQtdFixProprio: TEdit;
    EditMetaTmpEstoqueFixProprio: TEdit;
    EditMetaValorTotalEstoqueFixProprio: TEdit;
    EditMgMedDiaEstoqueFixProprio: TEdit;
    EditMgMedEstoqueEstoqueFixProprio: TEdit;
    EditMgMediaDiaFixProprio: TEdit;
    EditPCEstoqueFixProprio: TEdit;
    EditPMEstoqueFixProprio: TEdit;
    EditQtdEstoqueFixProprio: TEdit;
    EditTmpEstoqueFixProprio: TEdit;
    EditVlrTotEstoqueEstoqueFixProprio: TEdit;
    Button3: TButton;
    Panel20: TPanel;
    Label27: TLabel;
    Label28: TLabel;
    Edit71: TEdit;
    Edit72: TEdit;
    Edit73: TEdit;
    Edit74: TEdit;
    Edit75: TEdit;
    Edit76: TEdit;
    Edit77: TEdit;
    EditMetaMgMedEstFixPrazo: TEdit;
    EditMetaPCFixPrazo: TEdit;
    EditMetaPVFixPrazo: TEdit;
    EditMetaQtdFixPrazo: TEdit;
    EditMetaTmpEstoqueFixPrazo: TEdit;
    EditMetaValorTotalEstoqueFixPrazo: TEdit;
    EditMgMedDiaEstoqueFixPrazo: TEdit;
    EditMgMedEstoqueEstoqueFixPrazo: TEdit;
    EditMgMediaDiaFixPrazo: TEdit;
    EditPCEstoqueFixPrazo: TEdit;
    EditPMEstoqueFixPrazo: TEdit;
    EditQtdEstoqueFixPrazo: TEdit;
    EditTmpEstoqueFixPrazo: TEdit;
    EditVlrTotEstoqueEstoqueFixPrazo: TEdit;
    Button4: TButton;
    Panel26: TPanel;
    Label29: TLabel;
    Label30: TLabel;
    Edit92: TEdit;
    Edit93: TEdit;
    Edit94: TEdit;
    Edit95: TEdit;
    Edit96: TEdit;
    Edit97: TEdit;
    Edit98: TEdit;
    EditMetaMgMedEstFixTodos: TEdit;
    EditMetaPCFixTodos: TEdit;
    EditMetaPVFixTodos: TEdit;
    EditMetaQtdFixTodos: TEdit;
    EditMetaTmpEstoqueFixTodos: TEdit;
    EditMetaValorTotalEstoqueFixTodos: TEdit;
    EditMgMedDiaEstoqueFixTodos: TEdit;
    EditMgMedEstoqueEstoqueFixTodos: TEdit;
    EditMgMediaDiaFixTodos: TEdit;
    EditPCEstoqueFixTodos: TEdit;
    EditPMEstoqueFixTodos: TEdit;
    EditQtdEstoqueFixTodos: TEdit;
    EditTmpEstoqueFixTodos: TEdit;
    EditVlrTotEstoqueEstoqueFixTodos: TEdit;
    Button5: TButton;
    btnCarregaMeta: TPanel;
    Panel28: TPanel;
    PanelDRE: TPanel;
    Panel29: TPanel;
    ScrollBoxGrficoFiltros: TScrollBox;
    btnVisualizar: TPanel;
    Panel15: TPanel;
    Panel9: TPanel;
    Panel27: TPanel;
    lblQtdVeiculosEmUso: TLabel;
    lblTotalVeiculos: TLabel;
    procedure PanelAtualizarMouseEnter(Sender: TObject);
    procedure PanelAtualizarClick(Sender: TObject);
    procedure PanelAtualizarMouseLeave(Sender: TObject);
    procedure panelFiltrosMouseEnter(Sender: TObject);
    procedure panelFiltrosMouseLeave(Sender: TObject);
    procedure panelFiltrosClick(Sender: TObject);
    procedure panelDivergenciasMouseEnter(Sender: TObject);
    procedure panelDivergenciasMouseLeave(Sender: TObject);
    procedure panelDivergenciasClick(Sender: TObject);
    procedure DbGridAnaliseEstoqueQuadro1TitleClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure btnCarregaMetaMouseEnter(Sender: TObject);
    procedure btnCarregaMetaMouseLeave(Sender: TObject);
    procedure btnCarregaMetaClick(Sender: TObject);
    procedure btnAlteraMetaFilProprioClick(Sender: TObject);
    procedure btnAlteraMetasFiltroPrazosClick(Sender: TObject);
    procedure BtnAlteraFilTodosClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure PanelDREMouseEnter(Sender: TObject);
    procedure PanelDREMouseLeave(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure PanelDREClick(Sender: TObject);
    procedure Panel9Click(Sender: TObject);
  private
    procedure AtualizaFipe;
    procedure GeraTotais;
    procedure AtualizaFipeDbGrid(grid: tdbgrid; fipe1, fipe2: string);
    procedure GeraDados;
    procedure GeraFiltroProprio;
    procedure GeraFiltroPrazos;
    procedure GeraFiltroTodos;
    procedure GeraFixoProprios;
    procedure GeraFixoPrazos;
    procedure GeraFixoTodos;
    procedure CarregaMetas;
    procedure AtualizaMeta;
    procedure AtualizaFiltroProprio;
    procedure AtualizaFiltroPrazo;
    procedure AtualizaFiltroTodos;
    procedure AtualizaFixoPrazo;
    procedure AtualizaFixoProprio;
    procedure AtualizaFixoTodos;
    procedure CarregaFiltroPrazo;
    procedure CarregaFiltroProprio;
    procedure CarregaFiltroTodos;
    procedure CarregaFixoPrazo;
    procedure CarregaFixoProprio;
    procedure CarregaFixoTodos;
    { Private declarations }
  public
    { Public declarations }
    QueryWhere: String;
    Ascendente : Boolean;
    procedure GeraEstoqueVeiculo;
    procedure AtualizaPercentuais;
  end;

var
  FormGestaoDadosSavauto: TFormGestaoDadosSavauto;

implementation

{$R *.dfm}


uses FMX.UFormGraficosAtendimento, Loading, UDataModuleBancoVistoria,
  UDataModuleConexao, UDMPermissoes, UFormAgendamento, UFormAguarde,
  UFormAjusteDadosFipeAvaliacao, UFormAlteracaoProposta, UFormAlteracaoVeiculo,
  UFormAlteraDadosCliente, UFormAlteraFipeDePaxa, UFormAlteraMidiaAnuncio,
  UFormAlteraPermissaoAppTransp, UFormAlteraPlaca, UFormAnaliseCompra,
  UFormAnaliseCompraQuery, UFormAnaliseComprasTabela, UFormAplicaMargem,
  UFormAtendimentoMultasVeiculo, UFormAtendimentoNovo, UFormAtendimentos,
  UFormAtualizaTabelaFipe, UFormAtuHistFIPE, UFormAtuTabFIpe,
  UFormAvaliarAvaliacao, UFormAvarias, UFormAvariasItens,
  UFormCadaNovoUsuMobile, UFormCadastroTransportadora,
  UFormCadastroTransportadoras, UFormCadaUsuario, UFormCadaUsuariosMobile,
  UFormCadVistoriadores, UFormCidadesCustos, UFormColunasOcultas,
  UFormConcedePermissao, UFormConcFipeModelo, UFormConsutaPlacaAvaliacao,
  UFormCriacaoAvaria, UFormCruzamentoFipes, UFormDadosPagamento,
  UFormDadosPerfil, UFormDadosPgtoTransporte, UFormDataPagamento,
  UFormDetalhesAtendimento, UFormDetalhesAtendimentoBeta,
  UFormDetalhesAvaliacao, UFormDetalheTransportes, UFormDownloadNovaVersao,
  UFormExcelCompras, UFormExtratoPgtoVeiculos, UFormFinanceiroTransportes,
  UFormFornecedoresFrotista, UFormFornecedorFrotistaAddEditar,
  UFormGestaoAvaliacoes, UFormGestaoAvarias, UFormGestaoTransporte,
  UFormGestaoVistoria, UFormHistFIPE, UFormHistoricoAvaliacoes,
  UFormHistoricoObsAtn, UFormImagem, UFormImportacoesEfetuadas,
  UFormInformacoes, UFormLiberaPermissao, UFormListaBancos, UFormListaUsuarios,
  UFormLoading, UFormLoadingCarregamento, UFormLoadingOpaco, UFormLoginSavauto,
  UFormLotesArval, UFormMenuFinanceiro, UFormNovaAvaliacao,
  UFormNovaCidadeCusto, UformNovaObs, UFormNovoProcessamento,
  UFormNovoUsuarioTransporte, UFormNovoVistoriador, UFormPadroesPlanilhas,
  UFormPagamentoEmLoteTransportes, UFormPagamentoTransporte,
  UFormPagamentoVeiculo, UFormParametros, UFormPerfis, UFormPermissoesCarga,
  UFormPermissoesUsuarioAppTransporte, UFormPesquisaFipe,
  UFormPgtoExtratoVeiculo, UFormPrincipal, UFormProcPlanAcelero,
  UFormProcPlanFinal, UFormQuitacoesVeiculo, UFormRefFipes, UFormSegIPVALic,
  UFormUltimasAtualizacoes, UFormUsuarios, UFormVistoriadores,
  UFormVistoriasDetalhes, UFormWebBrowse, UforTestesDiversos, UnitLogin,
  UFormFiltrosGestao, UFormDivergenciasDados, UFormDREDados,
  UFormRelacaoEstoque;

procedure TFormGestaoDadosSavauto.AtualizaPercentuais;
Var
 Query : TUniQuery;
 total : Currency;
Begin

 Query := TUniQuery.Create(self);
 Query.Connection := DataModuleConexao.UniConnection1;

 query.SQL.Clear;
 query.SQL.Add('select sum(qtd) as qtd from tbprojestoqueveiculos');
 query.Open;

 total := query.FieldByName('qtd').AsCurrency;

 query.SQL.Clear;
 query.SQL.Add('update tbprojestoqueveiculos set percentual = qtd * 100 / :total ');
 query.ParamByName('total').AsCurrency := total;
 query.Execute;

End;


procedure TFormGestaoDadosSavauto.GeraEstoqueVeiculo;
Var
 QueryC, QueryI : TUniQuery;
 Sertorio, Ipiranga, Gravatai, Teresopolis, Preparando, Aguardando, Arras, AutoAvaliar, TrocaCtb : Currency;
Begin

 QueryC := TUniQuery.Create(self);
 QueryI := TUniQuery.Create(self);

 QueryC.Connection := DataModuleConexao.UniConnectionSavanna;
 QueryI.Connection := DataModuleConexao.UniConnection1;

 QueryC.SQL.Clear;
 QueryC.SQL.Add('select COUNT(*) as Qtd, ''Sertorio'' as Loja');
 QueryC.SQL.Add('from CadCar where');
 QueryC.SQL.Add('Car_Loja = ''1-SER''');
 QueryC.SQL.Add('and Car_Sit = ''Em Venda''');
 QueryC.Open;

 Sertorio := QueryC.FieldByName('Qtd').AsCurrency;

 QueryC.SQL.Clear;
 QueryC.SQL.Add('select COUNT(*) as Qtd, ''Sertorio'' as Loja');
 QueryC.SQL.Add('from CadCar where');
 QueryC.SQL.Add('Car_Loja = ''4-IPI''');
 QueryC.SQL.Add('and Car_Sit = ''Em Venda''');
 QueryC.Open;

 Ipiranga := QueryC.FieldByName('Qtd').AsCurrency;

 QueryC.SQL.Clear;
 QueryC.SQL.Add('select COUNT(*) as Qtd, ''Sertorio'' as Loja');
 QueryC.SQL.Add('from CadCar where');
 QueryC.SQL.Add('Car_Loja = ''3-GRA''');
 QueryC.SQL.Add('and Car_Sit = ''Em Venda''');
 QueryC.Open;

 Gravatai := QueryC.FieldByName('Qtd').AsCurrency;

 QueryC.SQL.Clear;
 QueryC.SQL.Add('select COUNT(*) as Qtd, ''Sertorio'' as Loja');
 QueryC.SQL.Add('from CadCar where');
 QueryC.SQL.Add('Car_Loja = ''6-TER''');
 QueryC.SQL.Add('and Car_Sit = ''Em Venda''');
 QueryC.Open;

 Teresopolis := QueryC.FieldByName('Qtd').AsCurrency;

 QueryC.SQL.Clear;
 QueryC.SQL.Add('select COUNT(*) as Qtd, ''Sertorio'' as Loja');
 QueryC.SQL.Add('from CadCar where');
 QueryC.SQL.Add('Car_Sit = ''Preparando''');
 QueryC.Open;

 Preparando := QueryC.FieldByName('Qtd').AsCurrency;

 QueryC.SQL.Clear;
 QueryC.SQL.Add('select COUNT(*) as Qtd, ''Sertorio'' as Loja');
 QueryC.SQL.Add('from CadCar where');
 QueryC.SQL.Add('Car_Sit = ''Ag Transporte''');
 QueryC.Open;

 Aguardando := QueryC.FieldByName('Qtd').AsCurrency;

 QueryC.SQL.Clear;
 QueryC.SQL.Add('select COUNT(*) as Qtd, ''Sertorio'' as Loja');
 QueryC.SQL.Add('from CadCar where');
 QueryC.SQL.Add('Car_Sit = ''Arras''');
 QueryC.Open;

 Arras := QueryC.FieldByName('Qtd').AsCurrency;

 QueryC.SQL.Clear;
 QueryC.SQL.Add('select COUNT(*) as Qtd, ''Sertorio'' as Loja');
 QueryC.SQL.Add('from CadCar where');
 QueryC.SQL.Add('Car_Sit = ''Auto Avaliar''');
 QueryC.Open;

 AutoAvaliar := QueryC.FieldByName('Qtd').AsCurrency;

 QueryC.SQL.Clear;
 QueryC.SQL.Add('select COUNT(*) as Qtd, ''Troca Ctb'' as Loja');
 QueryC.SQL.Add('from CadCar where');
 QueryC.SQL.Add('Car_Sit = ''Troca Ctb''');
 QueryC.Open;

 TrocaCtb := QueryC.FieldByName('Qtd').AsCurrency;

 QueryI.SQL.Clear;
 QueryI.SQL.Add('update tbProjEstoqueVeiculos set qtd = :qtd where descricao = ''Troca Ctb''');
 queryI.ParamByName('qtd').AsCurrency := TrocaCtb;
 QueryI.ExecSQL;

 QueryI.SQL.Clear;
 QueryI.SQL.Add('update tbProjEstoqueVeiculos set qtd = :qtd where descricao = ''Sertório''');
 queryI.ParamByName('qtd').AsCurrency := Sertorio;
 QueryI.ExecSQL;

 QueryI.SQL.Clear;
 QueryI.SQL.Add('update tbProjEstoqueVeiculos set qtd = :qtd where descricao = ''Ipiranga''');
 queryI.ParamByName('qtd').AsCurrency := Ipiranga;
 QueryI.ExecSQL;

 QueryI.SQL.Clear;
 QueryI.SQL.Add('update tbProjEstoqueVeiculos set qtd = :qtd where descricao = ''Gravataí''');
 queryI.ParamByName('qtd').AsCurrency := Gravatai;
 QueryI.ExecSQL;

 QueryI.SQL.Clear;
 QueryI.SQL.Add('update tbProjEstoqueVeiculos set qtd = :qtd where descricao = ''Teresópolis''');
 queryI.ParamByName('qtd').AsCurrency := Teresopolis;
 QueryI.ExecSQL;

 QueryI.SQL.Clear;
 QueryI.SQL.Add('update tbProjEstoqueVeiculos set qtd = :qtd where descricao = ''Preparando''');
 queryI.ParamByName('qtd').AsCurrency := Preparando;
 QueryI.ExecSQL;

 QueryI.SQL.Clear;
 QueryI.SQL.Add('update tbProjEstoqueVeiculos set qtd = :qtd where descricao = ''Ag Transporte''');
 queryI.ParamByName('qtd').AsCurrency := Aguardando;
 QueryI.ExecSQL;

 QueryI.SQL.Clear;
 QueryI.SQL.Add('update tbProjEstoqueVeiculos set qtd = :qtd where descricao = ''Arras''');
 queryI.ParamByName('qtd').AsCurrency := Arras;
 QueryI.ExecSQL;

 QueryI.SQL.Clear;
 QueryI.SQL.Add('update tbProjEstoqueVeiculos set qtd = :qtd where descricao = ''Auto Avaliar''');
 queryI.ParamByName('qtd').AsCurrency := AutoAvaliar;
 QueryI.ExecSQL;

 queryC.SQL.Clear;
 queryC.SQL.Add('select count(*) as Qtd from cadcar where car_loja in (''1-SER'', ''4-IPI'', ''3-GRA'', ''6-TER'') ');
 queryC.SQL.Add('and car_sit in (''Preparando'', ''Ag Transporte'', ''Arras'', ''Auto Avaliar'', ''Troca Ctb'')');
 queryC.Open;

 AtualizaPercentuais;

End;

procedure TFormGestaoDadosSavauto.AtualizaFiltroProprio;
  var query: tuniquery;
Begin

  query := TUniQuery.Create(self);
  query.Connection := DataModuleConexao.UniConnection1;

  try

   query.SQL.Clear;
   query.SQL.Add('update tbfilcarrosestoquevendido set');
   query.SQL.Add('meta=:meta');
   query.SQL.Add('where parametro = ''Tempo de estoque'' and tipo = ''Proprios'' and referencia = ''Filtro'' ');
   if EditMetaTmpEstoqueFilProprio.Text = '' then
   EditMetaTmpEstoqueFilProprio.Text := '0';
   query.ParamByName('meta').AsFloat := StrToFloat(EditMetaTmpEstoqueFilProprio.Text);
   query.Execute;

   query.SQL.Clear;
   query.SQL.Add('update tbfilcarrosestoquevendido set');
   query.SQL.Add('meta=:meta');
   query.SQL.Add('where parametro = ''Qtd'' and tipo = ''Proprios'' and referencia = ''Filtro'' ');
   if EditMetaQtdFilProprio.Text = '' then
   EditMetaQtdFilProprio.Text := '0';
   query.ParamByName('meta').AsFloat := StrToFloat(EditMetaQtdFilProprio.Text);
   query.Execute;

   query.SQL.Clear;
   query.SQL.Add('update tbfilcarrosestoquevendido set');
   query.SQL.Add('meta=:meta');
   query.SQL.Add('where parametro = ''Margem Media Dia'' and tipo = ''Proprios'' and referencia = ''Filtro'' ');
   if EditMgMediaDiaFilProprio.Text = '' then
   EditMgMediaDiaFilProprio.Text := '0';
   query.ParamByName('meta').AsFloat := StrToFloat(EditMgMediaDiaFilProprio.Text);
   query.Execute;

   query.SQL.Clear;
   query.SQL.Add('update tbfilcarrosestoquevendido set');
   query.SQL.Add('meta=:meta');
   query.SQL.Add('where parametro = ''Valor Total em Estoque'' and tipo = ''Proprios'' and referencia = ''Filtro'' ');
   if EditMetaValorTotalEstoqueFilProprio.Text = '' then
   EditMetaValorTotalEstoqueFilProprio.Text := '0';
   query.ParamByName('meta').AsFloat := StrToFloat(EditMetaValorTotalEstoqueFilProprio.Text);
   query.Execute;

   query.SQL.Clear;
   query.SQL.Add('update tbfilcarrosestoquevendido set');
   query.SQL.Add('meta=:meta');
   query.SQL.Add('where parametro = ''Preço Médio Venda'' and tipo = ''Proprios'' and referencia = ''Filtro'' ');
   if EditMetaPVFilProprio.Text = '' then
   EditMetaPVFilProprio.Text := '0';
   query.ParamByName('meta').AsFloat := StrToFloat(EditMetaPVFilProprio.Text);
   query.Execute;

   query.SQL.Clear;
   query.SQL.Add('update tbfilcarrosestoquevendido set');
   query.SQL.Add('meta=:meta');
   query.SQL.Add('where parametro = ''Preço Médio Compra'' and tipo = ''Proprios'' and referencia = ''Filtro'' ');
   if EditMetaPCFilProprio.Text = '' then
   EditMetaPCFilProprio.Text := '0';
   query.ParamByName('meta').AsFloat := StrToFloat(EditMetaPCFilProprio.Text);
   query.Execute;

   query.SQL.Clear;
   query.SQL.Add('update tbfilcarrosestoquevendido set');
   query.SQL.Add('meta=:meta');
   query.SQL.Add('where parametro = ''Margem Média em Estoque'' and tipo = ''Proprios'' and referencia = ''Filtro'' ');
   if EditMetaMgMedEstFilProprio.Text = '' then
   EditMetaMgMedEstFilProprio.Text := '0';
   query.ParamByName('meta').AsFloat := StrToFloat(EditMetaMgMedEstFilProprio.Text);
   query.Execute;

   MessageDlg('Atualização de metas efetuada com sucesso!', mtInformation, [mbok] , 0);

   Except
   On E:Exception Do
   Begin
      ShowMessage('Falha ao atualizar Meta Filtro Proprios!' + E.Message);
   End;

  end;

End;
procedure TFormGestaoDadosSavauto.AtualizaFiltroPrazo;
  var query: tuniquery;
Begin
  query := TUniQuery.Create(self);
  query.Connection := DataModuleConexao.UniConnection1;

  try

   query.SQL.Clear;
   query.SQL.Add('update tbfilcarrosestoquevendido set');
   query.SQL.Add('meta=:meta');
   query.SQL.Add('where parametro = ''Tempo de estoque'' and tipo = ''Prazo'' and referencia = ''Filtro'' ');
   if EditMetaTmpEstoqueFilPrazo.Text = '' then
   EditMetaTmpEstoqueFilPrazo.Text := '0';
   query.ParamByName('meta').AsFloat := StrToFloat(EditMetaTmpEstoqueFilPrazo.Text);
   query.Execute;

   query.SQL.Clear;
   query.SQL.Add('update tbfilcarrosestoquevendido set');
   query.SQL.Add('meta=:meta');
   query.SQL.Add('where parametro = ''Qtd'' and tipo = ''Prazo'' and referencia = ''Filtro'' ');
   if EditMetaQtdFilPrazo.Text = '' then
   EditMetaQtdFilPrazo.Text := '0';
   query.ParamByName('meta').AsFloat := StrToFloat(EditMetaQtdFilPrazo.Text);
   query.Execute;

   query.SQL.Clear;
   query.SQL.Add('update tbfilcarrosestoquevendido set');
   query.SQL.Add('meta=:meta');
   query.SQL.Add('where parametro = ''Margem Media Dia'' and tipo = ''Prazo'' and referencia = ''Filtro'' ');
   if EditMgMediaDiaFilPrazo.Text = '' then
   EditMgMediaDiaFilPrazo.Text := '0';
   query.ParamByName('meta').AsFloat := StrToFloat(EditMgMediaDiaFilPrazo.Text);
   query.Execute;

   query.SQL.Clear;
   query.SQL.Add('update tbfilcarrosestoquevendido set');
   query.SQL.Add('meta=:meta');
   query.SQL.Add('where parametro = ''Valor Total em Estoque'' and tipo = ''Prazo'' and referencia = ''Filtro'' ');
   if EditMetaValorTotalEstoqueFilPrazo.Text = '' then
   EditMetaValorTotalEstoqueFilPrazo.Text := '0';
   query.ParamByName('meta').AsFloat := StrToFloat(EditMetaValorTotalEstoqueFilPrazo.Text);
   query.Execute;

   query.SQL.Clear;
   query.SQL.Add('update tbfilcarrosestoquevendido set');
   query.SQL.Add('meta=:meta');
   query.SQL.Add('where parametro = ''Preço Médio Venda'' and tipo = ''Prazo'' and referencia = ''Filtro'' ');
   if EditMetaPVFilPrazo.Text = '' then
   EditMetaPVFilPrazo.Text := '0';
   query.ParamByName('meta').AsFloat := StrToFloat(EditMetaPVFilPrazo.Text);
   query.Execute;

   query.SQL.Clear;
   query.SQL.Add('update tbfilcarrosestoquevendido set');
   query.SQL.Add('meta=:meta');
   query.SQL.Add('where parametro = ''Preço Médio Compra'' and tipo = ''Prazo'' and referencia = ''Filtro'' ');
   if EditMetaPCFilPrazo.Text = '' then
   EditMetaPCFilProprio.Text := '0';
   query.ParamByName('meta').AsFloat := StrToFloat(EditMetaPCFilPrazo.Text);
   query.Execute;

   query.SQL.Clear;
   query.SQL.Add('update tbfilcarrosestoquevendido set');
   query.SQL.Add('meta=:meta');
   query.SQL.Add('where parametro = ''Margem Média em Estoque'' and tipo = ''Prazo'' and referencia = ''Filtro'' ');
   if EditMetaMgMedEstFilPrazo.Text = '' then
   EditMetaMgMedEstFilPrazo.Text := '0';
   query.ParamByName('meta').AsFloat := StrToFloat(EditMetaMgMedEstFilPrazo.Text);
   query.Execute;

   MessageDlg('Atualização de metas efetuada com sucesso!', mtInformation, [mbok] , 0);

   Except
   On E:Exception Do
   Begin
      ShowMessage('Falha ao atualizar Meta Filtro Prazo!' + E.Message);
   End;

  End;
End;

procedure TFormGestaoDadosSavauto.AtualizaFiltroTodos;
  var query: tuniquery;
Begin


  query := TUniQuery.Create(self);
  query.Connection := DataModuleConexao.UniConnection1;

  try

   query.SQL.Clear;
   query.SQL.Add('update tbfilcarrosestoquevendido set');
   query.SQL.Add('meta=:meta');
   query.SQL.Add('where parametro = ''Tempo de estoque'' and tipo = ''Todos'' and referencia = ''Filtro'' ');
   if EditMetaTmpEstoqueFil.Text = '' then
   EditMetaTmpEstoqueFil.Text := '0';
   query.ParamByName('meta').AsFloat := StrToFloat(EditMetaTmpEstoqueFil.Text);
   query.Execute;

   query.SQL.Clear;
   query.SQL.Add('update tbfilcarrosestoquevendido set');
   query.SQL.Add('meta=:meta');
   query.SQL.Add('where parametro = ''Qtd'' and tipo = ''Todos'' and referencia = ''Filtro'' ');
   if EditMetaQtdFil.Text = '' then
   EditMetaQtdFil.Text := '0';
   query.ParamByName('meta').AsFloat := StrToFloat(EditMetaQtdFil.Text);
   query.Execute;

   query.SQL.Clear;
   query.SQL.Add('update tbfilcarrosestoquevendido set');
   query.SQL.Add('meta=:meta');
   query.SQL.Add('where parametro = ''Margem Media Dia'' and tipo = ''Todos'' and referencia = ''Filtro'' ');
   if EditMgMediaDiaFil.Text = '' then
   EditMgMediaDiaFil.Text := '0';
   query.ParamByName('meta').AsFloat := StrToFloat(EditMgMediaDiaFil.Text);
   query.Execute;

   query.SQL.Clear;
   query.SQL.Add('update tbfilcarrosestoquevendido set');
   query.SQL.Add('meta=:meta');
   query.SQL.Add('where parametro = ''Valor Total em Estoque'' and tipo = ''Todos'' and referencia = ''Filtro'' ');
   if EditMetaValorTotalEstoqueFil.Text = '' then
   EditMetaValorTotalEstoqueFil.Text := '0';
   query.ParamByName('meta').AsFloat := StrToFloat(EditMetaValorTotalEstoqueFil.Text);
   query.Execute;

   query.SQL.Clear;
   query.SQL.Add('update tbfilcarrosestoquevendido set');
   query.SQL.Add('meta=:meta');
   query.SQL.Add('where parametro = ''Preço Médio Venda'' and tipo = ''Todos'' and referencia = ''Filtro'' ');
   if EditMetaPVFil.Text = '' then
   EditMetaPVFil.Text := '0';
   query.ParamByName('meta').AsFloat := StrToFloat(EditMetaPVFil.Text);
   query.Execute;

   query.SQL.Clear;
   query.SQL.Add('update tbfilcarrosestoquevendido set');
   query.SQL.Add('meta=:meta');
   query.SQL.Add('where parametro = ''Preço Médio Compra'' and tipo = ''Todos'' and referencia = ''Filtro'' ');
   if EditMetaPCFil.Text = '' then
   EditMetaPCFil.Text := '0';
   query.ParamByName('meta').AsFloat := StrToFloat(EditMetaPCFil.Text);
   query.Execute;

   query.SQL.Clear;
   query.SQL.Add('update tbfilcarrosestoquevendido set');
   query.SQL.Add('meta=:meta');
   query.SQL.Add('where parametro = ''Margem Média em Estoque'' and tipo = ''Todos'' and referencia = ''Filtro'' ');
   if EditMetaMgMedEstFil.Text = '' then
   EditMetaMgMedEstFil.Text := '0';
   query.ParamByName('meta').AsFloat := StrToFloat(EditMetaMgMedEstFil.Text);
   query.Execute;

   MessageDlg('Atualização de metas efetuada com sucesso!', mtInformation, [mbok] , 0);

   Except
   On E:Exception Do
   Begin
      ShowMessage('Falha ao atualizar Meta Filtro Todos!' + E.Message);
   End;

  end;

End;


procedure TFormGestaoDadosSavauto.AtualizaFixoProprio;
  var query: tuniquery;
Begin

  query := TUniQuery.Create(self);
  query.Connection := DataModuleConexao.UniConnection1;

  try

   query.SQL.Clear;
   query.SQL.Add('update tbfilcarrosestoquevendido set');
   query.SQL.Add('meta=:meta');
   query.SQL.Add('where parametro = ''Tempo de estoque'' and tipo = ''Proprios'' and referencia = ''Fixo'' ');
   if EditMetaTmpEstoqueFixProprio.Text = '' then
   EditMetaTmpEstoqueFixProprio.Text := '0';
   query.ParamByName('meta').AsFloat := StrToFloat(EditMetaTmpEstoqueFixProprio.Text);
   query.Execute;

   query.SQL.Clear;
   query.SQL.Add('update tbfilcarrosestoquevendido set');
   query.SQL.Add('meta=:meta');
   query.SQL.Add('where parametro = ''Qtd'' and tipo = ''Proprios'' and referencia = ''Fixo'' ');
   if EditMetaQtdFixProprio.Text = '' then
   EditMetaQtdFixProprio.Text := '0';
   query.ParamByName('meta').AsFloat := StrToFloat(EditMetaQtdFixProprio.Text);
   query.Execute;

   query.SQL.Clear;
   query.SQL.Add('update tbfilcarrosestoquevendido set');
   query.SQL.Add('meta=:meta');
   query.SQL.Add('where parametro = ''Margem Media Dia'' and tipo = ''Proprios'' and referencia = ''Fixo'' ');
   if EditMgMediaDiaFixProprio.Text = '' then
   EditMgMediaDiaFixProprio.Text := '0';
   query.ParamByName('meta').AsFloat := StrToFloat(EditMgMediaDiaFixProprio.Text);
   query.Execute;

   query.SQL.Clear;
   query.SQL.Add('update tbfilcarrosestoquevendido set');
   query.SQL.Add('meta=:meta');
   query.SQL.Add('where parametro = ''Valor Total em Estoque'' and tipo = ''Proprios'' and referencia = ''Fixo'' ');
   if EditMetaValorTotalEstoqueFixProprio.Text = '' then
   EditMetaValorTotalEstoqueFixProprio.Text := '0';
   query.ParamByName('meta').AsFloat := StrToFloat(EditMetaValorTotalEstoqueFixProprio.Text);
   query.Execute;

   query.SQL.Clear;
   query.SQL.Add('update tbfilcarrosestoquevendido set');
   query.SQL.Add('meta=:meta');
   query.SQL.Add('where parametro = ''Preço Médio Venda'' and tipo = ''Proprios'' and referencia = ''Fixo'' ');
   if EditMetaPVFixProprio.Text = '' then
   EditMetaPVFixProprio.Text := '0';
   query.ParamByName('meta').AsFloat := StrToFloat(EditMetaPVFixProprio.Text);
   query.Execute;

   query.SQL.Clear;
   query.SQL.Add('update tbfilcarrosestoquevendido set');
   query.SQL.Add('meta=:meta');
   query.SQL.Add('where parametro = ''Preço Médio Compra'' and tipo = ''Proprios'' and referencia = ''Fixo'' ');
   if EditMetaPCFixProprio.Text = '' then
   EditMetaPCFixProprio.Text := '0';
   query.ParamByName('meta').AsFloat := StrToFloat(EditMetaPCFixProprio.Text);
   query.Execute;

   query.SQL.Clear;
   query.SQL.Add('update tbfilcarrosestoquevendido set');
   query.SQL.Add('meta=:meta');
   query.SQL.Add('where parametro = ''Margem Média em Estoque'' and tipo = ''Proprios'' and referencia = ''Fixo'' ');
   if EditMetaMgMedEstFixProprio.Text = '' then
   EditMetaMgMedEstFixProprio.Text := '0';
   query.ParamByName('meta').AsFloat := StrToFloat(EditMetaMgMedEstFixProprio.Text);
   query.Execute;

   MessageDlg('Atualização de metas efetuada com sucesso!', mtInformation, [mbok] , 0);

   Except
   On E:Exception Do
   Begin
      ShowMessage('Falha ao atualizar Meta Fixo Proprios!' + E.Message);
   End;

  end;

End;


procedure TFormGestaoDadosSavauto.AtualizaFixoPrazo;
  var query: tuniquery;
Begin

  query := TUniQuery.Create(self);
  query.Connection := DataModuleConexao.UniConnection1;

  try

   query.SQL.Clear;
   query.SQL.Add('update tbfilcarrosestoquevendido set');
   query.SQL.Add('meta=:meta');
   query.SQL.Add('where parametro = ''Tempo de estoque'' and tipo = ''Prazo'' and referencia = ''Fixo'' ');
   if EditMetaTmpEstoqueFixPrazo.Text = '' then
   EditMetaTmpEstoqueFixPrazo.Text := '0';
   query.ParamByName('meta').AsFloat := StrToFloat(EditMetaTmpEstoqueFixPrazo.Text);
   query.Execute;

   query.SQL.Clear;
   query.SQL.Add('update tbfilcarrosestoquevendido set');
   query.SQL.Add('meta=:meta');
   query.SQL.Add('where parametro = ''Qtd'' and tipo = ''Prazo'' and referencia = ''Fixo'' ');
   if EditMetaQtdFixPrazo.Text = '' then
   EditMetaQtdFixPrazo.Text := '0';
   query.ParamByName('meta').AsFloat := StrToFloat(EditMetaQtdFixPrazo.Text);
   query.Execute;

   query.SQL.Clear;
   query.SQL.Add('update tbfilcarrosestoquevendido set');
   query.SQL.Add('meta=:meta');
   query.SQL.Add('where parametro = ''Margem Media Dia'' and tipo = ''Prazo'' and referencia = ''Fixo'' ');
   if EditMgMediaDiaFixPrazo.Text = '' then
   EditMgMediaDiaFixPrazo.Text := '0';
   query.ParamByName('meta').AsFloat := StrToFloat(EditMgMediaDiaFixPrazo.Text);
   query.Execute;

   query.SQL.Clear;
   query.SQL.Add('update tbfilcarrosestoquevendido set');
   query.SQL.Add('meta=:meta');
   query.SQL.Add('where parametro = ''Valor Total em Estoque'' and tipo = ''Prazo'' and referencia = ''Fixo'' ');
   if EditMetaValorTotalEstoqueFixPrazo.Text = '' then
   EditMetaValorTotalEstoqueFixPrazo.Text := '0';
   query.ParamByName('meta').AsFloat := StrToFloat(EditMetaValorTotalEstoqueFixPrazo.Text);
   query.Execute;

   query.SQL.Clear;
   query.SQL.Add('update tbfilcarrosestoquevendido set');
   query.SQL.Add('meta=:meta');
   query.SQL.Add('where parametro = ''Preço Médio Venda'' and tipo = ''Prazo'' and referencia = ''Fixo'' ');
   if EditMetaPVFixPrazo.Text = '' then
   EditMetaPVFixPrazo.Text := '0';
   query.ParamByName('meta').AsFloat := StrToFloat(EditMetaPVFixPrazo.Text);
   query.Execute;

   query.SQL.Clear;
   query.SQL.Add('update tbfilcarrosestoquevendido set');
   query.SQL.Add('meta=:meta');
   query.SQL.Add('where parametro = ''Preço Médio Compra'' and tipo = ''Prazo'' and referencia = ''Fixo'' ');
   if EditMetaPCFixPrazo.Text = '' then
   EditMetaPCFixPrazo.Text := '0';
   query.ParamByName('meta').AsFloat := StrToFloat(EditMetaPCFixPrazo.Text);
   query.Execute;

   query.SQL.Clear;
   query.SQL.Add('update tbfilcarrosestoquevendido set');
   query.SQL.Add('meta=:meta');
   query.SQL.Add('where parametro = ''Margem Média em Estoque'' and tipo = ''Prazo'' and referencia = ''Fixo'' ');
   if EditMetaMgMedEstFixPrazo.Text = '' then
   EditMetaMgMedEstFixPrazo.Text := '0';
   query.ParamByName('meta').AsFloat := StrToFloat(EditMetaMgMedEstFixPrazo.Text);
   query.Execute;

   MessageDlg('Atualização de metas efetuada com sucesso!', mtInformation, [mbok] , 0);

   Except
   On E:Exception Do
   Begin
      ShowMessage('Falha ao atualizar Meta Fixo Prazo!' + E.Message);
   End;

  End;

End;


procedure TFormGestaoDadosSavauto.AtualizaFixoTodos;
  var query: tuniquery;
Begin

  query := TUniQuery.Create(self);
  query.Connection := DataModuleConexao.UniConnection1;

  try

   query.SQL.Clear;
   query.SQL.Add('update tbfilcarrosestoquevendido set');
   query.SQL.Add('meta=:meta');
   query.SQL.Add('where parametro = ''Tempo de estoque'' and tipo = ''Todos'' and referencia = ''Fixo'' ');
   if EditMetaTmpEstoqueFixTodos.Text = '' then
   EditMetaTmpEstoqueFixTodos.Text := '0';
   query.ParamByName('meta').AsFloat := StrToFloat(EditMetaTmpEstoqueFixTodos.Text);
   query.Execute;

   query.SQL.Clear;
   query.SQL.Add('update tbfilcarrosestoquevendido set');
   query.SQL.Add('meta=:meta');
   query.SQL.Add('where parametro = ''Qtd'' and tipo = ''Todos'' and referencia = ''Fixo'' ');
   if EditMetaQtdFixTodos.Text = '' then
   EditMetaQtdFixTodos.Text := '0';
   query.ParamByName('meta').AsFloat := StrToFloat(EditMetaQtdFixTodos.Text);
   query.Execute;

   query.SQL.Clear;
   query.SQL.Add('update tbfilcarrosestoquevendido set');
   query.SQL.Add('meta=:meta');
   query.SQL.Add('where parametro = ''Margem Media Dia'' and tipo = ''Todos'' and referencia = ''Fixo'' ');
   if EditMgMediaDiaFixTodos.Text = '' then
   EditMgMediaDiaFixTodos.Text := '0';
   query.ParamByName('meta').AsFloat := StrToFloat(EditMgMediaDiaFixTodos.Text);
   query.Execute;

   query.SQL.Clear;
   query.SQL.Add('update tbfilcarrosestoquevendido set');
   query.SQL.Add('meta=:meta');
   query.SQL.Add('where parametro = ''Valor Total em Estoque'' and tipo = ''Todos'' and referencia = ''Fixo'' ');
   if EditMetaValorTotalEstoqueFixTodos.Text = '' then
   EditMetaValorTotalEstoqueFixTodos.Text := '0';
   query.ParamByName('meta').AsFloat := StrToFloat(EditMetaValorTotalEstoqueFixTodos.Text);
   query.Execute;

   query.SQL.Clear;
   query.SQL.Add('update tbfilcarrosestoquevendido set');
   query.SQL.Add('meta=:meta');
   query.SQL.Add('where parametro = ''Preço Médio Venda'' and tipo = ''Todos'' and referencia = ''Fixo'' ');
   if EditMetaPVFixTodos.Text = '' then
   EditMetaPVFixTodos.Text := '0';
   query.ParamByName('meta').AsFloat := StrToFloat(EditMetaPVFixTodos.Text);
   query.Execute;

   query.SQL.Clear;
   query.SQL.Add('update tbfilcarrosestoquevendido set');
   query.SQL.Add('meta=:meta');
   query.SQL.Add('where parametro = ''Preço Médio Compra'' and tipo = ''Todos'' and referencia = ''Fixo'' ');
   if EditMetaPCFixTodos.Text = '' then
   EditMetaPCFixTodos.Text := '0';
   query.ParamByName('meta').AsFloat := StrToFloat(EditMetaPCFixTodos.Text);
   query.Execute;

   query.SQL.Clear;
   query.SQL.Add('update tbfilcarrosestoquevendido set');
   query.SQL.Add('meta=:meta');
   query.SQL.Add('where parametro = ''Margem Média em Estoque'' and tipo = ''Todos'' and referencia = ''Fixo'' ');
   if EditMetaMgMedEstFixTodos.Text = '' then
   EditMetaMgMedEstFixTodos.Text := '0';
   query.ParamByName('meta').AsFloat := StrToFloat(EditMetaMgMedEstFixTodos.Text);
   query.Execute;

   MessageDlg('Atualização de metas efetuada com sucesso!', mtInformation, [mbok] , 0);

   Except
   On E:Exception Do
   Begin
      ShowMessage('Falha ao atualizar Meta Fixo Todos!' + E.Message);
   End;

  end;

End;

procedure TFormGestaoDadosSavauto.CarregaFiltroProprio;
var
 query : TUniQuery;
Begin

 query := TUniQuery.Create(self);
 query.Connection := DataModuleConexao.UniConnection1;

 try

  query.SQL.Clear;
  query.SQL.Add('select * from tbfilcarrosestoquevendido where referencia = ''Filtro'' and tipo = ''Proprios'' ');
  query.Open;

  query.First;

   while not query.Eof do
   Begin

      if query.FieldByName('parametro').Text = 'Tempo de estoque' then
       EditMetaTmpEstoqueFilProprio.Text := query.FieldByName('meta').Text;

      if query.FieldByName('parametro').Text = 'Qtd' then
      EditMetaQtdFilProprio.Text := query.FieldByName('meta').Text;

      if query.FieldByName('parametro').Text = 'Margem Media Dia' then
      EditMgMediaDiaFilProprio.Text := query.FieldByName('meta').Text;

      if query.FieldByName('parametro').Text = 'Valor Total em Estoque' then
      EditMetaValorTotalEstoqueFilProprio.Text := query.FieldByName('meta').Text;

      if query.FieldByName('parametro').Text = 'Preço Médio Venda' then
      EditMetaPVFilProprio.Text := query.FieldByName('meta').Text;

      if query.FieldByName('parametro').Text = 'Preço Médio Compra' then
      EditMetaPCFilProprio.Text := query.FieldByName('meta').Text;

      if query.FieldByName('parametro').Text = 'Margem Média em Estoque' then
      EditMetaMgMedEstFilProprio.Text := query.FieldByName('meta').Text;

      query.Next;
   End;

 Except
   On E:Exception
   Do Begin
      ShowMessage('Falha ao carregar meta Filtros proprios! ' + E.Message);
   End;

 end;

End;


procedure TFormGestaoDadosSavauto.CarregaFiltroPrazo;
Var
 query : TUniQuery;
Begin

 query := TUniQuery.Create(self);
 query.Connection := DataModuleConexao.UniConnection1;

  query.SQL.Clear;
  query.SQL.Add('select * from tbfilcarrosestoquevendido where referencia = ''Filtro'' and tipo = ''Prazo'' ');
  query.Open;

  query.First;

  try

   while not query.Eof do
   Begin

      if query.FieldByName('parametro').Text = 'Tempo de estoque' then
      EditMetaTmpEstoqueFilPrazo.Text := query.FieldByName('meta').Text;

      if query.FieldByName('parametro').Text = 'Qtd' then
      EditMetaQtdFilPrazo.Text := query.FieldByName('meta').Text;

      if query.FieldByName('parametro').Text = 'Margem Media Dia' then
      EditMgMediaDiaFilPrazo.Text := query.FieldByName('meta').Text;

      if query.FieldByName('parametro').Text = 'Valor Total em Estoque' then
      EditMetaValorTotalEstoqueFilPrazo.Text := query.FieldByName('meta').Text;

      if query.FieldByName('parametro').Text = 'Preço Médio Venda' then
      EditMetaPVFilPrazo.Text := query.FieldByName('meta').Text;

      if query.FieldByName('parametro').Text = 'Preço Médio Compra' then
      EditMetaPCFilPrazo.Text := query.FieldByName('meta').Text;

      if query.FieldByName('parametro').Text = 'Margem Média em Estoque' then
      EditMetaMgMedEstFilPrazo.Text := query.FieldByName('meta').Text;

      query.Next;
   End;

  Except
  On E:Exception do
  Begin
    ShowMessage('Falha ao atualizar metas! ' + e.Message);
  End;

 end;
End;


procedure TFormGestaoDadosSavauto.CarregaFiltroTodos;
Var
 query : TUniQuery;
Begin

 query := TUniQuery.Create(self);
 query.Connection := DataModuleConexao.UniConnection1;

  query.SQL.Clear;
  query.SQL.Add('select * from tbfilcarrosestoquevendido where referencia = ''Filtro'' and tipo = ''Todos'' ');
  query.Open;

  query.First;

  try

   while not query.Eof do
   Begin

      if query.FieldByName('parametro').Text = 'Tempo de estoque' then
      EditMetaTmpEstoqueFil.Text := query.FieldByName('meta').Text;

      if query.FieldByName('parametro').Text = 'Qtd' then
      EditMetaQtdFil.Text := query.FieldByName('meta').Text;

      if query.FieldByName('parametro').Text = 'Margem Media Dia' then
      EditMgMediaDiaFil.Text := query.FieldByName('meta').Text;

      if query.FieldByName('parametro').Text = 'Valor Total em Estoque' then
      EditMetaValorTotalEstoqueFil.Text := query.FieldByName('meta').Text;

      if query.FieldByName('parametro').Text = 'Preço Médio Venda' then
      EditMetaPVFil.Text := query.FieldByName('meta').Text;

      if query.FieldByName('parametro').Text = 'Preço Médio Compra' then
      EditMetaPCFil.Text := query.FieldByName('meta').Text;

      if query.FieldByName('parametro').Text = 'Margem Média em Estoque' then
      EditMetaMgMedEstFil.Text := query.FieldByName('meta').Text;

      query.Next;
   End;

  Except
  On E:Exception do
  Begin
    ShowMessage('Falha ao atualizar metas! ' + e.Message);
  End;

 end;
End;


procedure TFormGestaoDadosSavauto.CarregaFixoProprio;
Var
 query : TUniQuery;
Begin

 query := TUniQuery.Create(self);
 query.Connection := DataModuleConexao.UniConnection1;

  query.SQL.Clear;
  query.SQL.Add('select * from tbfilcarrosestoquevendido where referencia = ''Fixo'' and tipo = ''Proprio'' ');
  query.Open;

  query.First;

  try

   while not query.Eof do
   Begin

      if query.FieldByName('parametro').Text = 'Tempo de estoque' then
      EditMetaTmpEstoqueFixProprio.Text := query.FieldByName('meta').Text;

      if query.FieldByName('parametro').Text = 'Qtd' then
      EditMetaQtdFixProprio.Text := query.FieldByName('meta').Text;

      if query.FieldByName('parametro').Text = 'Margem Media Dia' then
      EditMgMediaDiaFixProprio.Text := query.FieldByName('meta').Text;

      if query.FieldByName('parametro').Text = 'Valor Total em Estoque' then
      EditMetaValorTotalEstoqueFixProprio.Text := query.FieldByName('meta').Text;

      if query.FieldByName('parametro').Text = 'Preço Médio Venda' then
      EditMetaPVFixProprio.Text := query.FieldByName('meta').Text;

      if query.FieldByName('parametro').Text = 'Preço Médio Compra' then
      EditMetaPCFixProprio.Text := query.FieldByName('meta').Text;

      if query.FieldByName('parametro').Text = 'Margem Média em Estoque' then
      EditMetaMgMedEstFixProprio.Text := query.FieldByName('meta').Text;

      query.Next;
   End;

  Except
  On E:Exception do
  Begin
    ShowMessage('Falha ao atualizar metas! ' + e.Message);
  End;

 end;
End;


procedure TFormGestaoDadosSavauto.CarregaFixoPrazo;
Var
 query : TUniQuery;
Begin

 query := TUniQuery.Create(self);
 query.Connection := DataModuleConexao.UniConnection1;

  query.SQL.Clear;
  query.SQL.Add('select * from tbfilcarrosestoquevendido where referencia = ''Fixo'' and tipo = ''Prazo'' ');
  query.Open;

  query.First;

  try

   while not query.Eof do
   Begin

      if query.FieldByName('parametro').Text = 'Tempo de estoque' then
      EditMetaTmpEstoqueFixPrazo.Text := query.FieldByName('meta').Text;

      if query.FieldByName('parametro').Text = 'Qtd' then
      EditMetaQtdFixPrazo.Text := query.FieldByName('meta').Text;

      if query.FieldByName('parametro').Text = 'Margem Media Dia' then
      EditMgMediaDiaFixPrazo.Text := query.FieldByName('meta').Text;

      if query.FieldByName('parametro').Text = 'Valor Total em Estoque' then
      EditMetaValorTotalEstoqueFixPrazo.Text := query.FieldByName('meta').Text;

      if query.FieldByName('parametro').Text = 'Preço Médio Venda' then
      EditMetaPVFixPrazo.Text := query.FieldByName('meta').Text;

      if query.FieldByName('parametro').Text = 'Preço Médio Compra' then
      EditMetaPCFixPrazo.Text := query.FieldByName('meta').Text;

      if query.FieldByName('parametro').Text = 'Margem Média em Estoque' then
      EditMetaMgMedEstFixPrazo.Text := query.FieldByName('meta').Text;

      query.Next;
   End;

  Except
  On E:Exception do
  Begin
    ShowMessage('Falha ao atualizar metas! ' + e.Message);
  End;

 end;
End;



procedure TFormGestaoDadosSavauto.CarregaFixoTodos;
Var
 query : TUniQuery;
Begin

 query := TUniQuery.Create(self);
 query.Connection := DataModuleConexao.UniConnection1;

  query.SQL.Clear;
  query.SQL.Add('select * from tbfilcarrosestoquevendido where referencia = ''Fixo'' and tipo = ''Todos'' ');
  query.Open;

  query.First;

  try

   while not query.Eof do
   Begin

      if query.FieldByName('parametro').Text = 'Tempo de estoque' then
      EditMetaTmpEstoqueFixTodos.Text := query.FieldByName('meta').Text;

      if query.FieldByName('parametro').Text = 'Qtd' then
      EditMetaQtdFixTodos.Text := query.FieldByName('meta').Text;

      if query.FieldByName('parametro').Text = 'Margem Media Dia' then
      EditMgMediaDiaFixTodos.Text := query.FieldByName('meta').Text;

      if query.FieldByName('parametro').Text = 'Valor Total em Estoque' then
      EditMetaValorTotalEstoqueFixTodos.Text := query.FieldByName('meta').Text;

      if query.FieldByName('parametro').Text = 'Preço Médio Venda' then
      EditMetaPVFixTodos.Text := query.FieldByName('meta').Text;

      if query.FieldByName('parametro').Text = 'Preço Médio Compra' then
      EditMetaPCFixTodos.Text := query.FieldByName('meta').Text;

      if query.FieldByName('parametro').Text = 'Margem Média em Estoque' then
      EditMetaMgMedEstFixTodos.Text := query.FieldByName('meta').Text;

      query.Next;
   End;

  Except
  On E:Exception do
  Begin
    ShowMessage('Falha ao atualizar metas! ' + e.Message);
  End;

 end;
End;

procedure TFormGestaoDadosSavauto.AtualizaMeta;
Begin

  AtualizaFiltroProprio;

  AtualizaFiltroPrazo;

  AtualizaFiltroTodos;

  AtualizaFixoProprio;

  AtualizaFixoPrazo;

  AtualizaFixoTodos;

End;

procedure TFormGestaoDadosSavauto.BtnAlteraFilTodosClick(Sender: TObject);
begin
  if FormPrincipal.InputBoxPass('Digite a senha de Gerencia','','') <> 'raoni2021' then
  Begin
    MessageDlg('Falha ao acessar tela! ', mtError, [mbok] , 0);
    abort;
  End
  Else
  Begin
   AtualizaFiltroTodos;
  End;

end;

procedure TFormGestaoDadosSavauto.CarregaMetas;
Begin

 CarregaFiltroProprio;

 CarregaFiltroPrazo;

 CarregaFiltroTodos;

 CarregaFixoProprio;

 CarregaFixoPrazo;

 CarregaFixoTodos;

End;

procedure TFormGestaoDadosSavauto.GeraFiltroProprio;
Var
 query : TUniQuery;
 tmp_estoque: integer;
Begin

  query := TUniQuery.Create(self);
  query.Connection := DataModuleConexao.UniConnectionSavanna;

  tmp_estoque := 0;

  try

  query.SQL.Clear;
  query.SQL.Add('select');
  query.SQL.Add('count(*) as qtd');
  query.SQL.Add('from CadCar');
  query.SQL.Add('left join Inv on Inv_Cod = Car_Inv');
  query.SQL.Add('where 1 = 1');
  query.SQL.Add('  and  Car_DtEntrada is not null and Car_VLVenda > 0');
  query.SQL.Add('  and Car_VLVenda - (Car_VlRecibo) is not null');
  query.SQL.Add( QueryWhere );
  query.SQL.Add('and Inv.Inv_Fone = ''Sem prazo''');
  query.Open;

  EditQtdEstoqueFilProprio.Text := IntToStr( query.FieldByName('qtd').AsInteger );

  if StrToInt(EditQtdEstoqueFilProprio.Text) < StrToInt(EditMetaQtdFilProprio.Text) then
  Begin
    EditQtdEstoqueFilProprio.Font.Color := clWhite;
    EditQtdEstoqueFilProprio.Brush.Color := clRed;
  End
  Else
  Begin
    EditQtdEstoqueFilProprio.Font.Color := clWhite;
    EditQtdEstoqueFilProprio.Brush.Color := clGreen;
  End;

  query.SQL.Clear;
  query.SQL.Add('select');
  query.SQL.Add('avg(coalesce(DATEDIFF(day, Car_DtEntrada , case when Car_DtVenda is not null then Car_DtVenda else getdate() end) ,0)) as MediaEstoque,');
  query.SQL.Add('avg(coalesce(Car_VLVenda - (Car_VlRecibo),0) /');
  query.SQL.Add(' case when DATEDIFF(day,Car_DtEntrada , case when Car_DtVenda is not null then Car_DtVenda else getdate() end) = 0 then 1 else');
  query.SQL.Add('           DATEDIFF(day,Car_DtEntrada , case when Car_DtVenda is not null then Car_DtVenda else getdate() end) end) as ''MediaMargemDia'',');
  query.SQL.Add('sum(Car_VlRecibo) as ''VlrTotEstoque'',');
  query.SQL.Add('AVG(coalesce(Car_VlVenda,0)) as MPV,');
  query.SQL.Add('AVG(coalesce(Car_VlRecibo,0)) as MPC,');
  query.SQL.Add('avg(Car_VLVenda - (Car_VlRecibo)) as MMG');
  query.SQL.Add('from CadCar');
  query.SQL.Add('left join Inv on Inv_Cod = Car_Inv');
  query.SQL.Add('where 1 = 1');
  query.SQL.Add('  and  Car_DtEntrada is not null and Car_VLVenda > 0');
  query.SQL.Add('  and Car_VLVenda - (Car_VlRecibo) is not null');
  query.SQL.Add( QueryWhere );
  query.SQL.Add('and Inv.Inv_Fone = ''Sem prazo''');
  query.Open;


  EditMgMedDiaEstoqueFilProprio.Text :=      FormatFloat('R$ #,.##', query.FieldByName('MediaMargemDia').AsCurrency);
  EditTmpEstoqueFilProprio.Text :=           IntToStr( query.FieldByName('MediaEstoque').AsInteger );
  EditVlrTotEstoqueEstoqueFilProprio.Text := FormatFloat('R$ #,.##', query.FieldByName('VlrTotEstoque').AsCurrency);
  EditPMEstoqueFilProprio.Text :=            FormatFloat('R$ #,.##', query.FieldByName('MPV').AsCurrency);
  EditPCEstoqueFilProprio.Text :=            FormatFloat('R$ #,.##', query.FieldByName('MPC').AsCurrency);
  EditMgMedEstoqueEstoqueFilProprio.Text :=  FormatFloat('R$ #,.##', query.FieldByName('MMG').AsCurrency);


  if query.FieldByName('MediaMargemDia').AsCurrency > StrToCurr(EditMgMediaDiaFilProprio.Text) then
  Begin
    EditMgMedDiaEstoqueFilProprio.Font.Color := clWhite;
    EditMgMedDiaEstoqueFilProprio.Brush.Color := clGreen;
  End
  Else
  Begin
    EditMgMedDiaEstoqueFilProprio.Font.Color := clWhite;
    EditMgMedDiaEstoqueFilProprio.Brush.Color := clRed;
  End;

  if StrToInt(EditTmpEstoqueFilProprio.Text) > StrToInt(EditMetaTmpEstoqueFilProprio.Text) then
  Begin
    EditTmpEstoqueFilProprio.Font.Color := clWhite;
    EditTmpEstoqueFilProprio.Brush.Color := clGreen;
  End
  Else
  Begin
    EditTmpEstoqueFilProprio.Font.Color := clWhite;
    EditTmpEstoqueFilProprio.Brush.Color := clRed;
  End;

  if query.FieldByName('VlrTotEstoque').AsCurrency > StrToCurr(EditMetaValorTotalEstoqueFilProprio.Text) then
  Begin
    EditVlrTotEstoqueEstoqueFilProprio.Font.Color := clWhite;
    EditVlrTotEstoqueEstoqueFilProprio.Brush.Color := clGreen;
  End
  Else
  Begin
    EditVlrTotEstoqueEstoqueFilProprio.Font.Color := clWhite;
    EditVlrTotEstoqueEstoqueFilProprio.Brush.Color := clRed;
  End;

  if query.FieldByName('MPV').AsCurrency > StrToCurr(EditMetaPVFilProprio.Text) then
  Begin
    EditPMEstoqueFilProprio.Font.Color := clWhite;
    EditPMEstoqueFilProprio.Brush.Color := clGreen;
  End
  Else
  Begin
    EditPMEstoqueFilProprio.Font.Color := clWhite;
    EditPMEstoqueFilProprio.Brush.Color := clRed;
  End;

  if query.FieldByName('MPC').AsCurrency > StrToCurr(EditMetaPCFilProprio.Text) then
  Begin
    EditPCEstoqueFilProprio.Font.Color := clWhite;
    EditPCEstoqueFilProprio.Brush.Color := clGreen;
  End
  Else
  Begin
    EditPCEstoqueFilProprio.Font.Color := clWhite;
    EditPCEstoqueFilProprio.Brush.Color := clRed;
  End;

  if query.FieldByName('MMG').AsCurrency > StrToCurr(EditMetaMgMedEstFilProprio.Text) then
  Begin
    EditMgMedEstoqueEstoqueFilProprio.Font.Color := clWhite;
    EditMgMedEstoqueEstoqueFilProprio.Brush.Color := clGreen;
  End
  Else
  Begin
    EditMgMedEstoqueEstoqueFilProprio.Font.Color := clWhite;
    EditMgMedEstoqueEstoqueFilProprio.Brush.Color := clRed;
  End;

   Except
   On E:Exception do
   Begin
      ShowMessage('Falha ao carregar Filtro Carros Próprios! '+ E.Message);
   End;
  end;

End;

procedure TFormGestaoDadosSavauto.GeraFiltroPrazos;
Var
 query : TUniQuery;
 tmp_estoque: integer;
Begin

  query := TUniQuery.Create(self);
  query.Connection := DataModuleConexao.UniConnectionSavanna;

  tmp_estoque := 0;

  try

  query.SQL.Clear;
  query.SQL.Add('select');
  query.SQL.Add('count(*) as qtd');
  query.SQL.Add('from CadCar');
  query.SQL.Add('left join Inv on Inv_Cod = Car_Inv');
  query.SQL.Add('where 1 = 1');
  query.SQL.Add('  and  Car_DtEntrada is not null and Car_VLVenda > 0');
  query.SQL.Add('  and Car_VLVenda - (Car_VlRecibo) is not null');
  query.SQL.Add( QueryWhere );
  query.SQL.Add('and Inv.Inv_Fone = ''Prazo''');
  query.Open;

  EditQtdEstoqueFilPrazo.Text := IntToStr( query.FieldByName('qtd').AsInteger );

  if StrToInt(EditQtdEstoqueFilPrazo.Text) < StrToInt(EditMetaQtdFilPrazo.Text) then
  Begin
    EditQtdEstoqueFilPrazo.Font.Color := clWhite;
    EditQtdEstoqueFilPrazo.Brush.Color := clRed;
  End
  Else
  Begin
    EditQtdEstoqueFilPrazo.Font.Color := clWhite;
    EditQtdEstoqueFilPrazo.Brush.Color := clGreen;
  End;

  query.SQL.Clear;
  query.SQL.Add('select');
  query.SQL.Add('avg(coalesce(DATEDIFF(day, Car_DtEntrada , case when Car_DtVenda is not null then Car_DtVenda else getdate() end) ,0)) as MediaEstoque,');
  query.SQL.Add('avg(coalesce(Car_VLVenda - (Car_VlRecibo),0) /');
  query.SQL.Add(' case when DATEDIFF(day,Car_DtEntrada , case when Car_DtVenda is not null then Car_DtVenda else getdate() end) = 0 then 1 else');
  query.SQL.Add('           DATEDIFF(day,Car_DtEntrada , case when Car_DtVenda is not null then Car_DtVenda else getdate() end) end) as ''MediaMargemDia'',');
  query.SQL.Add('sum(Car_VlRecibo) as ''VlrTotEstoque'',');
  query.SQL.Add('AVG(coalesce(Car_VlVenda,0)) as MPV,');
  query.SQL.Add('AVG(coalesce(Car_VlRecibo,0)) as MPC,');
  query.SQL.Add('avg(Car_VLVenda - (Car_VlRecibo)) as MMG');
  query.SQL.Add('from CadCar');
  query.SQL.Add('left join Inv on Inv_Cod = Car_Inv');
  query.SQL.Add('where 1 = 1');
  query.SQL.Add('  and  Car_DtEntrada is not null and Car_VLVenda > 0');
  query.SQL.Add('  and Car_VLVenda - (Car_VlRecibo) is not null');
  query.SQL.Add( QueryWhere );
  query.SQL.Add('and Inv.Inv_Fone = ''Prazo''');
  query.Open;


  EditMgMedDiaEstoqueFilPrazo.Text :=      FormatFloat('R$ #,.##', query.FieldByName('MediaMargemDia').AsCurrency);
  EditTmpEstoqueFilPrazo.Text :=           IntToStr( query.FieldByName('MediaEstoque').AsInteger );
  EditVlrTotEstoqueEstoqueFilPrazo.Text := FormatFloat('R$ #,.##', query.FieldByName('VlrTotEstoque').AsCurrency);
  EditPMEstoqueFilPrazo.Text :=            FormatFloat('R$ #,.##', query.FieldByName('MPV').AsCurrency);
  EditPCEstoqueFilPrazo.Text :=            FormatFloat('R$ #,.##', query.FieldByName('MPC').AsCurrency);
  EditMgMedEstoqueEstoqueFilPrazo.Text :=  FormatFloat('R$ #,.##', query.FieldByName('MMG').AsCurrency);


  if query.FieldByName('MediaMargemDia').AsCurrency > StrToCurr(EditMgMediaDiaFilPrazo.Text) then
  Begin
    EditMgMedDiaEstoqueFilPrazo.Font.Color := clWhite;
    EditMgMedDiaEstoqueFilPrazo.Brush.Color := clGreen;
  End
  Else
  Begin
    EditMgMedDiaEstoqueFilPrazo.Font.Color := clWhite;
    EditMgMedDiaEstoqueFilPrazo.Brush.Color := clRed;
  End;

  if StrToInt(EditTmpEstoqueFilPrazo.Text) > StrToInt(EditMetaTmpEstoqueFilPrazo.Text) then
  Begin
    EditTmpEstoqueFilPrazo.Font.Color := clWhite;
    EditTmpEstoqueFilPrazo.Brush.Color := clGreen;
  End
  Else
  Begin
    EditTmpEstoqueFilPrazo.Font.Color := clWhite;
    EditTmpEstoqueFilPrazo.Brush.Color := clRed;
  End;

  if query.FieldByName('VlrTotEstoque').AsCurrency > StrToCurr(EditMetaValorTotalEstoqueFilPrazo.Text) then
  Begin
    EditVlrTotEstoqueEstoqueFilPrazo.Font.Color := clWhite;
    EditVlrTotEstoqueEstoqueFilPrazo.Brush.Color := clGreen;
  End
  Else
  Begin
    EditVlrTotEstoqueEstoqueFilPrazo.Font.Color := clWhite;
    EditVlrTotEstoqueEstoqueFilPrazo.Brush.Color := clRed;
  End;

  if query.FieldByName('MPV').AsCurrency > StrToCurr(EditMetaPVFilPrazo.Text) then
  Begin
    EditPMEstoqueFilPrazo.Font.Color := clWhite;
    EditPMEstoqueFilPrazo.Brush.Color := clGreen;
  End
  Else
  Begin
    EditPMEstoqueFilPrazo.Font.Color := clWhite;
    EditPMEstoqueFilPrazo.Brush.Color := clRed;
  End;

  if query.FieldByName('MPC').AsCurrency > StrToCurr(EditMetaPCFilPrazo.Text) then
  Begin
    EditPCEstoqueFilPrazo.Font.Color := clWhite;
    EditPCEstoqueFilPrazo.Brush.Color := clGreen;
  End
  Else
  Begin
    EditPCEstoqueFilPrazo.Font.Color := clWhite;
    EditPCEstoqueFilPrazo.Brush.Color := clRed;
  End;

  if query.FieldByName('MMG').AsCurrency > StrToCurr(EditMetaMgMedEstFilPrazo.Text) then
  Begin
    EditMgMedEstoqueEstoqueFilPrazo.Font.Color := clWhite;
    EditMgMedEstoqueEstoqueFilPrazo.Brush.Color := clGreen;
  End
  Else
  Begin
    EditMgMedEstoqueEstoqueFilPrazo.Font.Color := clWhite;
    EditMgMedEstoqueEstoqueFilPrazo.Brush.Color := clRed;
  End;

   Except
   On E:Exception do
   Begin
      ShowMessage('Falha ao carregar Filtro Carros Prazos! '+ E.Message);
   End;
  end;

End;

procedure TFormGestaoDadosSavauto.GeraFiltroTodos;
Var
 query : TUniQuery;
 tmp_estoque: integer;
Begin

  query := TUniQuery.Create(self);
  query.Connection := DataModuleConexao.UniConnectionSavanna;

  tmp_estoque := 0;

  try

  query.SQL.Clear;
  query.SQL.Add('select');
  query.SQL.Add('count(*) as qtd');
  query.SQL.Add('from CadCar');
  query.SQL.Add('left join Inv on Inv_Cod = Car_Inv');
  query.SQL.Add('where 1 = 1');
  query.SQL.Add('  and  Car_DtEntrada is not null and Car_VLVenda > 0');
  query.SQL.Add('  and Car_VLVenda - (Car_VlRecibo) is not null');
  query.SQL.Add( QueryWhere );
  query.SQL.Add('and Inv.Inv_Fone in (''Sem prazo'', ''Prazo'')');
  query.Open;

  EditQtdEstoqueFil.Text := IntToStr( query.FieldByName('qtd').AsInteger );

  if StrToInt(EditQtdEstoqueFil.Text) < StrToInt(EditMetaQtdFil.Text) then
  Begin
    EditQtdEstoqueFil.Font.Color := clWhite;
    EditQtdEstoqueFil.Brush.Color := clRed;
  End
  Else
  Begin
    EditQtdEstoqueFil.Font.Color := clWhite;
    EditQtdEstoqueFil.Brush.Color := clGreen;
  End;

  query.SQL.Clear;
  query.SQL.Add('select');
  query.SQL.Add('avg(coalesce(DATEDIFF(day, Car_DtEntrada , case when Car_DtVenda is not null then Car_DtVenda else getdate() end) ,0)) as MediaEstoque,');
  query.SQL.Add('avg(coalesce(Car_VLVenda - (Car_VlRecibo),0) /');
  query.SQL.Add(' case when DATEDIFF(day,Car_DtEntrada , case when Car_DtVenda is not null then Car_DtVenda else getdate() end) = 0 then 1 else');
  query.SQL.Add('           DATEDIFF(day,Car_DtEntrada , case when Car_DtVenda is not null then Car_DtVenda else getdate() end) end) as ''MediaMargemDia'',');
  query.SQL.Add('sum(Car_VlRecibo) as ''VlrTotEstoque'',');
  query.SQL.Add('AVG(coalesce(Car_VlVenda,0)) as MPV,');
  query.SQL.Add('AVG(coalesce(Car_VlRecibo,0)) as MPC,');
  query.SQL.Add('avg(Car_VLVenda - (Car_VlRecibo)) as MMG');
  query.SQL.Add('from CadCar');
  query.SQL.Add('left join Inv on Inv_Cod = Car_Inv');
  query.SQL.Add('where 1 = 1');
  query.SQL.Add('  and  Car_DtEntrada is not null and Car_VLVenda > 0');
  query.SQL.Add('  and Car_VLVenda - (Car_VlRecibo) is not null');
  query.SQL.Add( QueryWhere );
  query.SQL.Add('and Inv.Inv_Fone in (''Sem prazo'', ''Prazo'')');
  query.Open;


  EditMgMedDiaEstoqueFil.Text :=      FormatFloat('R$ #,.##', query.FieldByName('MediaMargemDia').AsCurrency);
  EditTmpEstoqueFil.Text :=           IntToStr( query.FieldByName('MediaEstoque').AsInteger );
  EditVlrTotEstoqueEstoqueFil.Text := FormatFloat('R$ #,.##', query.FieldByName('VlrTotEstoque').AsCurrency);
  EditPMEstoqueFil.Text :=            FormatFloat('R$ #,.##', query.FieldByName('MPV').AsCurrency);
  EditPCEstoqueFil.Text :=            FormatFloat('R$ #,.##', query.FieldByName('MPC').AsCurrency);
  EditMgMedEstoqueEstoqueFil.Text :=  FormatFloat('R$ #,.##', query.FieldByName('MMG').AsCurrency);


  if query.FieldByName('MediaMargemDia').AsCurrency > StrToCurr(EditMgMediaDiaFil.Text) then
  Begin
    EditMgMedDiaEstoqueFil.Font.Color := clWhite;
    EditMgMedDiaEstoqueFil.Brush.Color := clGreen;
  End
  Else
  Begin
    EditMgMedDiaEstoqueFil.Font.Color := clWhite;
    EditMgMedDiaEstoqueFil.Brush.Color := clRed;
  End;

  if StrToInt(EditTmpEstoqueFil.Text) > StrToInt(EditMetaTmpEstoqueFil.Text) then
  Begin
    EditTmpEstoqueFil.Font.Color := clWhite;
    EditTmpEstoqueFil.Brush.Color := clGreen;
  End
  Else
  Begin
    EditTmpEstoqueFil.Font.Color := clWhite;
    EditTmpEstoqueFil.Brush.Color := clRed;
  End;

  if query.FieldByName('VlrTotEstoque').AsCurrency > StrToCurr(EditMetaValorTotalEstoqueFil.Text) then
  Begin
    EditVlrTotEstoqueEstoqueFil.Font.Color := clWhite;
    EditVlrTotEstoqueEstoqueFil.Brush.Color := clGreen;
  End
  Else
  Begin
    EditVlrTotEstoqueEstoqueFil.Font.Color := clWhite;
    EditVlrTotEstoqueEstoqueFil.Brush.Color := clRed;
  End;

  if query.FieldByName('MPV').AsCurrency > StrToCurr(EditMetaPVFil.Text) then
  Begin
    EditPMEstoqueFil.Font.Color := clWhite;
    EditPMEstoqueFil.Brush.Color := clGreen;
  End
  Else
  Begin
    EditPMEstoqueFil.Font.Color := clWhite;
    EditPMEstoqueFil.Brush.Color := clRed;
  End;

  if query.FieldByName('MPC').AsCurrency > StrToCurr(EditMetaPCFil.Text) then
  Begin
    EditPCEstoqueFil.Font.Color := clWhite;
    EditPCEstoqueFil.Brush.Color := clGreen;
  End
  Else
  Begin
    EditPCEstoqueFil.Font.Color := clWhite;
    EditPCEstoqueFil.Brush.Color := clRed;
  End;

  if query.FieldByName('MMG').AsCurrency > StrToCurr(EditMetaMgMedEstFil.Text) then
  Begin
    EditMgMedEstoqueEstoqueFil.Font.Color := clWhite;
    EditMgMedEstoqueEstoqueFil.Brush.Color := clGreen;
  End
  Else
  Begin
    EditMgMedEstoqueEstoqueFil.Font.Color := clWhite;
    EditMgMedEstoqueEstoqueFil.Brush.Color := clRed;
  End;

   Except
   On E:Exception do
   Begin
      ShowMessage('Falha ao carregar Filtro Carros Todos! '+ E.Message);
   End;
  end;

End;

procedure TFormGestaoDadosSavauto.GeraFixoProprios;
Var
 query : TUniQuery;
 tmp_estoque: integer;
Begin

  query := TUniQuery.Create(self);
  query.Connection := DataModuleConexao.UniConnectionSavanna;

  tmp_estoque := 0;

  try

  query.SQL.Clear;
  query.SQL.Add('select');
  query.SQL.Add('count(*) as qtd');
  query.SQL.Add('from CadCar');
  query.SQL.Add('left join Inv on Inv_Cod = Car_Inv');
  query.SQL.Add('where 1 = 1');
  //query.SQL.Add( QueryWhere );
  query.SQL.Add( ' and MONTH(Car_DtVenda) = MONTH(getdate()) AND YEAR(Car_DtVenda) = YEAR(getdate())' );
  query.SQL.Add('and Inv.Inv_Fone = ''Sem prazo''');
  query.SQL.Add('and cadcar.car_sit not in (''Arras Repasse'',''Vendido Repasse'')');
  query.Open;

  EditQtdEstoqueFixProprio.Text := IntToStr( query.FieldByName('qtd').AsInteger );

  if StrToInt(EditQtdEstoqueFixProprio.Text) < StrToInt(EditMetaQtdFixProprio.Text) then
  Begin
    EditQtdEstoqueFixProprio.Font.Color := clWhite;
    EditQtdEstoqueFixProprio.Brush.Color := clRed;
  End
  Else
  Begin
    EditQtdEstoqueFixProprio.Font.Color := clWhite;
    EditQtdEstoqueFixProprio.Brush.Color := clGreen;
  End;

  query.SQL.Clear;
  query.SQL.Add('select');
  query.SQL.Add('avg(coalesce(DATEDIFF(day, Car_DtEntrada , case when Car_DtVenda is not null then Car_DtVenda else getdate() end) ,0)) as MediaEstoque,');
  query.SQL.Add('avg(coalesce(Car_VLVenda - (Car_VlRecibo),0) /');
  query.SQL.Add(' case when DATEDIFF(day,Car_DtEntrada , case when Car_DtVenda is not null then Car_DtVenda else getdate() end) = 0 then 1 else');
  query.SQL.Add('           DATEDIFF(day,Car_DtEntrada , case when Car_DtVenda is not null then Car_DtVenda else getdate() end) end) as ''MediaMargemDia'',');
  query.SQL.Add('sum(Car_VlRecibo) as ''VlrTotEstoque'',');
  query.SQL.Add('AVG(coalesce(Car_VlVenda,0)) as MPV,');
  query.SQL.Add('AVG(coalesce(Car_VlRecibo,0)) as MPC,');
  query.SQL.Add('avg(Car_VLVenda - (Car_VlRecibo)) as MMG');
  query.SQL.Add('from CadCar');
  query.SQL.Add('left join Inv on Inv_Cod = Car_Inv');
  query.SQL.Add('where 1 = 1');
  //query.SQL.Add( QueryWhere );
  query.SQL.Add( ' and MONTH(Car_DtVenda) = MONTH(getdate()) AND YEAR(Car_DtVenda) = YEAR(getdate())' );
  query.SQL.Add('and Inv.Inv_Fone = ''Sem prazo''');
  query.SQL.Add('and cadcar.car_sit not in (''Arras Repasse'',''Vendido Repasse'')');
  query.Open;


  EditMgMedDiaEstoqueFixProprio.Text :=      FormatFloat('R$ #,.##', query.FieldByName('MediaMargemDia').AsCurrency);
  EditTmpEstoqueFixProprio.Text :=           IntToStr( query.FieldByName('MediaEstoque').AsInteger );
  EditVlrTotEstoqueEstoqueFixProprio.Text := FormatFloat('R$ #,.##', query.FieldByName('VlrTotEstoque').AsCurrency);
  EditPMEstoqueFixProprio.Text :=            FormatFloat('R$ #,.##', query.FieldByName('MPV').AsCurrency);
  EditPCEstoqueFixProprio.Text :=            FormatFloat('R$ #,.##', query.FieldByName('MPC').AsCurrency);
  EditMgMedEstoqueEstoqueFixProprio.Text :=  FormatFloat('R$ #,.##', query.FieldByName('MMG').AsCurrency);


  if query.FieldByName('MediaMargemDia').AsCurrency > StrToCurr(EditMgMediaDiaFixProprio.Text) then
  Begin
    EditMgMedDiaEstoqueFixProprio.Font.Color := clWhite;
    EditMgMedDiaEstoqueFixProprio.Brush.Color := clGreen;
  End
  Else
  Begin
    EditMgMedDiaEstoqueFixProprio.Font.Color := clWhite;
    EditMgMedDiaEstoqueFixProprio.Brush.Color := clRed;
  End;

  if StrToInt(EditTmpEstoqueFixProprio.Text) > StrToInt(EditMetaTmpEstoqueFixProprio.Text) then
  Begin
    EditTmpEstoqueFixProprio.Font.Color := clWhite;
    EditTmpEstoqueFixProprio.Brush.Color := clGreen;
  End
  Else
  Begin
    EditTmpEstoqueFixProprio.Font.Color := clWhite;
    EditTmpEstoqueFixProprio.Brush.Color := clRed;
  End;

  if query.FieldByName('VlrTotEstoque').AsCurrency > StrToCurr(EditMetaValorTotalEstoqueFixProprio.Text) then
  Begin
    EditVlrTotEstoqueEstoqueFixProprio.Font.Color := clWhite;
    EditVlrTotEstoqueEstoqueFixProprio.Brush.Color := clGreen;
  End
  Else
  Begin
    EditVlrTotEstoqueEstoqueFixProprio.Font.Color := clWhite;
    EditVlrTotEstoqueEstoqueFixProprio.Brush.Color := clRed;
  End;

  if query.FieldByName('MPV').AsCurrency > StrToCurr(EditMetaPVFixProprio.Text) then
  Begin
    EditPMEstoqueFixProprio.Font.Color := clWhite;
    EditPMEstoqueFixProprio.Brush.Color := clGreen;
  End
  Else
  Begin
    EditPMEstoqueFixProprio.Font.Color := clWhite;
    EditPMEstoqueFixProprio.Brush.Color := clRed;
  End;

  if query.FieldByName('MPC').AsCurrency > StrToCurr(EditMetaPCFixProprio.Text) then
  Begin
    EditPCEstoqueFixProprio.Font.Color := clWhite;
    EditPCEstoqueFixProprio.Brush.Color := clGreen;
  End
  Else
  Begin
    EditPCEstoqueFixProprio.Font.Color := clWhite;
    EditPCEstoqueFixProprio.Brush.Color := clRed;
  End;

  if query.FieldByName('MMG').AsCurrency > StrToCurr(EditMetaMgMedEstFixProprio.Text) then
  Begin
    EditMgMedEstoqueEstoqueFixProprio.Font.Color := clWhite;
    EditMgMedEstoqueEstoqueFixProprio.Brush.Color := clGreen;
  End
  Else
  Begin
    EditMgMedEstoqueEstoqueFixProprio.Font.Color := clWhite;
    EditMgMedEstoqueEstoqueFixProprio.Brush.Color := clRed;
  End;

   Except
   On E:Exception do
   Begin
      ShowMessage('Falha ao carregar Fixo Carros Proprios! '+ E.Message);
   End;
  end;

End;

procedure TFormGestaoDadosSavauto.GeraFixoPrazos;
Var
 query : TUniQuery;
 tmp_estoque: integer;
Begin

  query := TUniQuery.Create(self);
  query.Connection := DataModuleConexao.UniConnectionSavanna;

  tmp_estoque := 0;

  try

  query.SQL.Clear;
  query.SQL.Add('select');
  query.SQL.Add('count(*) as qtd');
  query.SQL.Add('from CadCar');
  query.SQL.Add('left join Inv on Inv_Cod = Car_Inv');
  query.SQL.Add('where 1 = 1');
  //query.SQL.Add( QueryWhere );
  query.SQL.Add( ' and MONTH(Car_DtVenda) = MONTH(getdate()) AND YEAR(Car_DtVenda) = YEAR(getdate())' );
  query.SQL.Add('and Inv.Inv_Fone = ''Prazo''');
    query.SQL.Add('and cadcar.car_sit not in (''Arras Repasse'',''Vendido Repasse'')');
  query.Open;

  EditQtdEstoqueFixPrazo.Text := IntToStr( query.FieldByName('qtd').AsInteger );

  if StrToInt(EditQtdEstoqueFixPrazo.Text) < StrToInt(EditMetaQtdFixPrazo.Text) then
  Begin
    EditQtdEstoqueFixPrazo.Font.Color := clWhite;
    EditQtdEstoqueFixPrazo.Brush.Color := clRed;
  End
  Else
  Begin
    EditQtdEstoqueFixPrazo.Font.Color := clWhite;
    EditQtdEstoqueFixPrazo.Brush.Color := clGreen;
  End;

  query.SQL.Clear;
  query.SQL.Add('select');
  query.SQL.Add('avg(coalesce(DATEDIFF(day, Car_DtEntrada , case when Car_DtVenda is not null then Car_DtVenda else getdate() end) ,0)) as MediaEstoque,');
  query.SQL.Add('avg(coalesce(Car_VLVenda - (Car_VlRecibo),0) /');
  query.SQL.Add(' case when DATEDIFF(day,Car_DtEntrada , case when Car_DtVenda is not null then Car_DtVenda else getdate() end) = 0 then 1 else');
  query.SQL.Add('           DATEDIFF(day,Car_DtEntrada , case when Car_DtVenda is not null then Car_DtVenda else getdate() end) end) as ''MediaMargemDia'',');
  query.SQL.Add('sum(Car_VlRecibo) as ''VlrTotEstoque'',');
  query.SQL.Add('AVG(coalesce(Car_VlVenda,0)) as MPV,');
  query.SQL.Add('AVG(coalesce(Car_VlRecibo,0)) as MPC,');
  query.SQL.Add('avg(Car_VLVenda - (Car_VlRecibo)) as MMG');
  query.SQL.Add('from CadCar');
  query.SQL.Add('left join Inv on Inv_Cod = Car_Inv');
  query.SQL.Add('where 1 = 1');
  //query.SQL.Add( QueryWhere );
  query.SQL.Add( ' and MONTH(Car_DtVenda) = MONTH(getdate()) AND YEAR(Car_DtVenda) = YEAR(getdate())' );
  query.SQL.Add('and Inv.Inv_Fone = ''Prazo''');
  query.SQL.Add('and cadcar.car_sit not in (''Arras Repasse'',''Vendido Repasse'')');
  query.Open;


  EditMgMedDiaEstoqueFixPrazo.Text :=      FormatFloat('R$ #,.##', query.FieldByName('MediaMargemDia').AsCurrency);
  EditTmpEstoqueFixPrazo.Text :=           IntToStr( query.FieldByName('MediaEstoque').AsInteger );
  EditVlrTotEstoqueEstoqueFixPrazo.Text := FormatFloat('R$ #,.##', query.FieldByName('VlrTotEstoque').AsCurrency);
  EditPMEstoqueFixPrazo.Text :=            FormatFloat('R$ #,.##', query.FieldByName('MPV').AsCurrency);
  EditPCEstoqueFixPrazo.Text :=            FormatFloat('R$ #,.##', query.FieldByName('MPC').AsCurrency);
  EditMgMedEstoqueEstoqueFixPrazo.Text :=  FormatFloat('R$ #,.##', query.FieldByName('MMG').AsCurrency);


  if query.FieldByName('MediaMargemDia').AsCurrency > StrToCurr(EditMgMediaDiaFixPrazo.Text) then
  Begin
    EditMgMedDiaEstoqueFixPrazo.Font.Color := clWhite;
    EditMgMedDiaEstoqueFixPrazo.Brush.Color := clGreen;
  End
  Else
  Begin
    EditMgMedDiaEstoqueFixPrazo.Font.Color := clWhite;
    EditMgMedDiaEstoqueFixPrazo.Brush.Color := clRed;
  End;

  if StrToInt(EditTmpEstoqueFixPrazo.Text) > StrToInt(EditMetaTmpEstoqueFixPrazo.Text) then
  Begin
    EditTmpEstoqueFixPrazo.Font.Color := clWhite;
    EditTmpEstoqueFixPrazo.Brush.Color := clGreen;
  End
  Else
  Begin
    EditTmpEstoqueFixPrazo.Font.Color := clWhite;
    EditTmpEstoqueFixPrazo.Brush.Color := clRed;
  End;

  if query.FieldByName('VlrTotEstoque').AsCurrency > StrToCurr(EditMetaValorTotalEstoqueFixPrazo.Text) then
  Begin
    EditVlrTotEstoqueEstoqueFixPrazo.Font.Color := clWhite;
    EditVlrTotEstoqueEstoqueFixPrazo.Brush.Color := clGreen;
  End
  Else
  Begin
    EditVlrTotEstoqueEstoqueFixPrazo.Font.Color := clWhite;
    EditVlrTotEstoqueEstoqueFixPrazo.Brush.Color := clRed;
  End;

  if query.FieldByName('MPV').AsCurrency > StrToCurr(EditMetaPVFixPrazo.Text) then
  Begin
    EditPMEstoqueFixPrazo.Font.Color := clWhite;
    EditPMEstoqueFixPrazo.Brush.Color := clGreen;
  End
  Else
  Begin
    EditPMEstoqueFixPrazo.Font.Color := clWhite;
    EditPMEstoqueFixPrazo.Brush.Color := clRed;
  End;

  if query.FieldByName('MPC').AsCurrency > StrToCurr(EditMetaPCFixPrazo.Text) then
  Begin
    EditPCEstoqueFixPrazo.Font.Color := clWhite;
    EditPCEstoqueFixPrazo.Brush.Color := clGreen;
  End
  Else
  Begin
    EditPCEstoqueFixPrazo.Font.Color := clWhite;
    EditPCEstoqueFixPrazo.Brush.Color := clRed;
  End;

  if query.FieldByName('MMG').AsCurrency > StrToCurr(EditMetaMgMedEstFixPrazo.Text) then
  Begin
    EditMgMedEstoqueEstoqueFixPrazo.Font.Color := clWhite;
    EditMgMedEstoqueEstoqueFixPrazo.Brush.Color := clGreen;
  End
  Else
  Begin
    EditMgMedEstoqueEstoqueFixPrazo.Font.Color := clWhite;
    EditMgMedEstoqueEstoqueFixPrazo.Brush.Color := clRed;
  End;

   Except
   On E:Exception do
   Begin
      ShowMessage('Falha ao carregar Fixo Carros Prazo! '+ E.Message);
   End;
  end;

End;

procedure TFormGestaoDadosSavauto.GeraFixoTodos;
Var
 query : TUniQuery;
 tmp_estoque: integer;
Begin

  query := TUniQuery.Create(self);
  query.Connection := DataModuleConexao.UniConnectionSavanna;

  tmp_estoque := 0;

  try

  query.SQL.Clear;
  query.SQL.Add('select');
  query.SQL.Add('count(*) as qtd');
  query.SQL.Add('from CadCar');
  query.SQL.Add('left join Inv on Inv_Cod = Car_Inv');
  query.SQL.Add('where 1 = 1');
  //query.SQL.Add( QueryWhere );
  query.SQL.Add( ' and MONTH(Car_DtVenda) = MONTH(getdate()) AND YEAR(Car_DtVenda) = YEAR(getdate())' );
  query.SQL.Add('and Inv.Inv_Fone in (''Sem prazo'', ''Prazo'')');
  query.SQL.Add('and cadcar.car_sit not in (''Arras Repasse'',''Vendido Repasse'')');
  query.Open;

  EditQtdEstoqueFixTodos.Text := IntToStr( query.FieldByName('qtd').AsInteger );

  if StrToInt(EditQtdEstoqueFixTodos.Text) < StrToInt(EditMetaQtdFixTodos.Text) then
  Begin
    EditQtdEstoqueFixTodos.Font.Color := clWhite;
    EditQtdEstoqueFixTodos.Brush.Color := clRed;
  End
  Else
  Begin
    EditQtdEstoqueFixTodos.Font.Color := clWhite;
    EditQtdEstoqueFixTodos.Brush.Color := clGreen;
  End;

  query.SQL.Clear;
  query.SQL.Add('select');
  query.SQL.Add('avg(coalesce(DATEDIFF(day, Car_DtEntrada , case when Car_DtVenda is not null then Car_DtVenda else getdate() end) ,0)) as MediaEstoque,');
  query.SQL.Add('avg(coalesce(Car_VLVenda - (Car_VlRecibo),0) /');
  query.SQL.Add(' case when DATEDIFF(day,Car_DtEntrada , case when Car_DtVenda is not null then Car_DtVenda else getdate() end) = 0 then 1 else');
  query.SQL.Add('           DATEDIFF(day,Car_DtEntrada , case when Car_DtVenda is not null then Car_DtVenda else getdate() end) end) as ''MediaMargemDia'',');
  query.SQL.Add('sum(Car_VlRecibo) as ''VlrTotEstoque'',');
  query.SQL.Add('AVG(coalesce(Car_VlVenda,0)) as MPV,');
  query.SQL.Add('AVG(coalesce(Car_VlRecibo,0)) as MPC,');
  query.SQL.Add('avg(Car_VLVenda - (Car_VlRecibo)) as MMG');
  query.SQL.Add('from CadCar');
  query.SQL.Add('left join Inv on Inv_Cod = Car_Inv');
  query.SQL.Add('where 1 = 1');
  //query.SQL.Add( QueryWhere );
  query.SQL.Add( ' and MONTH(Car_DtVenda) = MONTH(getdate()) AND YEAR(Car_DtVenda) = YEAR(getdate())' );
  query.SQL.Add('and Inv.Inv_Fone in (''Sem prazo'', ''Prazo'')');
  query.SQL.Add('and cadcar.car_sit not in (''Arras Repasse'',''Vendido Repasse'')');
  query.Open;


  EditMgMedDiaEstoqueFixTodos.Text :=      FormatFloat('R$ #,.##', query.FieldByName('MediaMargemDia').AsCurrency);
  EditTmpEstoqueFixTodos.Text :=           IntToStr( query.FieldByName('MediaEstoque').AsInteger );
  EditVlrTotEstoqueEstoqueFixTodos.Text := FormatFloat('R$ #,.##', query.FieldByName('VlrTotEstoque').AsCurrency);
  EditPMEstoqueFixTodos.Text :=            FormatFloat('R$ #,.##', query.FieldByName('MPV').AsCurrency);
  EditPCEstoqueFixTodos.Text :=            FormatFloat('R$ #,.##', query.FieldByName('MPC').AsCurrency);
  EditMgMedEstoqueEstoqueFixTodos.Text :=  FormatFloat('R$ #,.##', query.FieldByName('MMG').AsCurrency);


  if query.FieldByName('MediaMargemDia').AsCurrency > StrToCurr(EditMgMediaDiaFixTodos.Text) then
  Begin
    EditMgMedDiaEstoqueFixTodos.Font.Color := clWhite;
    EditMgMedDiaEstoqueFixTodos.Brush.Color := clGreen;
  End
  Else
  Begin
    EditMgMedDiaEstoqueFixTodos.Font.Color := clWhite;
    EditMgMedDiaEstoqueFixTodos.Brush.Color := clRed;
  End;

  if StrToInt(EditTmpEstoqueFixTodos.Text) > StrToInt(EditMetaTmpEstoqueFixTodos.Text) then
  Begin
    EditTmpEstoqueFixTodos.Font.Color := clWhite;
    EditTmpEstoqueFixTodos.Brush.Color := clGreen;
  End
  Else
  Begin
    EditTmpEstoqueFixTodos.Font.Color := clWhite;
    EditTmpEstoqueFixTodos.Brush.Color := clRed;
  End;

  if query.FieldByName('VlrTotEstoque').AsCurrency > StrToCurr(EditMetaValorTotalEstoqueFixTodos.Text) then
  Begin
    EditVlrTotEstoqueEstoqueFixTodos.Font.Color := clWhite;
    EditVlrTotEstoqueEstoqueFixTodos.Brush.Color := clGreen;
  End
  Else
  Begin
    EditVlrTotEstoqueEstoqueFixTodos.Font.Color := clWhite;
    EditVlrTotEstoqueEstoqueFixTodos.Brush.Color := clRed;
  End;

  if query.FieldByName('MPV').AsCurrency > StrToCurr(EditMetaPVFixTodos.Text) then
  Begin
    EditPMEstoqueFixTodos.Font.Color := clWhite;
    EditPMEstoqueFixTodos.Brush.Color := clGreen;
  End
  Else
  Begin
    EditPMEstoqueFixTodos.Font.Color := clWhite;
    EditPMEstoqueFixTodos.Brush.Color := clRed;
  End;

  if query.FieldByName('MPC').AsCurrency > StrToCurr(EditMetaPCFixTodos.Text) then
  Begin
    EditPCEstoqueFixTodos.Font.Color := clWhite;
    EditPCEstoqueFixTodos.Brush.Color := clGreen;
  End
  Else
  Begin
    EditPCEstoqueFixTodos.Font.Color := clWhite;
    EditPCEstoqueFixTodos.Brush.Color := clRed;
  End;

  if query.FieldByName('MMG').AsCurrency > StrToCurr(EditMetaMgMedEstFixTodos.Text) then
  Begin
    EditMgMedEstoqueEstoqueFixTodos.Font.Color := clWhite;
    EditMgMedEstoqueEstoqueFixTodos.Brush.Color := clGreen;
  End
  Else
  Begin
    EditMgMedEstoqueEstoqueFixTodos.Font.Color := clWhite;
    EditMgMedEstoqueEstoqueFixTodos.Brush.Color := clRed;
  End;

   Except
   On E:Exception do
   Begin
      ShowMessage('Falha ao carregar Fixo Carros Todos! '+ E.Message);
   End;
  end;

End;

procedure TFormGestaoDadosSavauto.GeraDados;
Begin

 try

  GeraFiltroProprio;
  GeraFiltroPrazos;
  GeraFiltroTodos;

  GeraFixoProprios;
  GeraFixoPrazos;
  GeraFixoTodos;

  Except
  On E:Exception Do
  Begin
     ShowMessage('Falha ao atualizar dados! ' + E.Message);
  End;

 end;

End;

procedure MudaCor(panel : TPanel);
Begin
    if panel.Color = $000000B0 then
  panel.Color := $007777FF
  Else
  Panel.Color :=$000000B0;
End;

procedure TFormGestaoDadosSavauto.GeraTotais;
var
 query : TUniQuery;
Begin

 query := TUniQuery.Create(self);
 query.Connection := DataModuleConexao.UniConnectionSavanna;

 try

  query.SQL.Clear;
  query.SQL.Add('select ');
  query.SQL.Add('sum(fipe2) as ''Total Fipe Ant'', --- Vai trazer do sistema atual');
  query.SQL.Add(' AVG(fipe2) as ''Media Fipe Ant'',');
  query.SQL.Add(' sum(fipe1) as ''Total Fipe Atual'',');
  query.SQL.Add(' AVG(fipe1) as ''Media Fipe Atual'',');
  query.SQL.Add(' sum(fipe1 - fipe2) as ''Total Indice Fipe'',');
  query.SQL.Add(' AVG(fipe1 - fipe2) as ''Media Indice Fipe'',');
  query.SQL.Add(' sum(coalesce(fipe2 - Car_VLVenda,0)) as ''Total PV-FIPE'',');
  query.SQL.Add(' AVG(coalesce(fipe2 - Car_vlVenda,0)) as ''Media PV-FIPE'',');
  query.SQL.Add(' sum(coalesce(Car_VLVenda,0)) as ''Total PV'',');
  query.SQL.Add(' AVG(coalesce(Car_VlVenda,0)) as ''Media PV'',');
  query.SQL.Add(' sum(coalesce(Car_VlRecibo,0)) as ''Total PC'',');
  query.SQL.Add(' AVG(coalesce(Car_VlRecibo,0)) as ''Media PC'',');
  query.SQL.Add(' avg(coalesce(DATEDIFF(day, Car_DtEntrada , case when Car_DtVenda is not null then Car_DtVenda else getdate() end) ,0)) as ''Media Tempo Estoque'',');
  query.SQL.Add(' avg(coalesce(DATEDIFF(day, Car_DtPatio ,   case when Car_DtVenda is not null then Car_DtVenda else getdate() end) ,0))   as ''Media Tempo Loja'',');
  query.SQL.Add(' sum(coalesce(Car_VLVenda - coalesce(Car_VlRecibo,0) ,0)) as ''Total Margem'',');
  //query.SQL.Add(' avg(sum(coalesce(Car_VLVenda - coalesce(Car_VlRecibo,0) ,0))) as ''Media Margem'',');
  query.SQL.Add(' avg(Car_VLVenda - (Car_VlRecibo)) as ''Media Margem'',');
  query.SQL.Add(' sum(coalesce(Car_VLVenda - (Car_VlRecibo),0) /');
  query.SQL.Add(' case when DATEDIFF(day,Car_DtEntrada , case when Car_DtVenda is not null then Car_DtVenda else getdate() end) = 0 then 1 else');
  query.SQL.Add('           DATEDIFF(day,Car_DtEntrada , case when Car_DtVenda is not null then Car_DtVenda else getdate() end) end) as ''Total Margem/Dia'',');
  query.SQL.Add(' avg(coalesce(Car_VLVenda - (Car_VlRecibo),0) /');
  query.SQL.Add(' case when DATEDIFF(day,Car_DtEntrada , case when Car_DtVenda is not null then Car_DtVenda else getdate() end) = 0 then 1 else');
  query.SQL.Add('           DATEDIFF(day,Car_DtEntrada , case when Car_DtVenda is not null then Car_DtVenda else getdate() end) end) as ''Media Margem/Dia''');
  query.SQL.Add(' from CadCar ');
  query.SQL.Add('left join Inv on Inv_Cod = Car_Inv');
   query.SQL.Add(' where');
   query.SQL.Add(' Car_DtEntrada is not null and Car_VLVenda > 0');
   query.SQL.Add(' and Car_VLVenda - (car_vlrecibo) is not null');
   query.SQL.Add(' and inv.Inv_Fone not in ( ''Excluido'') ');

   if QueryWhere <> '' then
   query.SQL.Add( QueryWhere );

   query.Open;

   EditMMediaFipeAnt.Text := FloatToStrF(query.FieldByName('Media Fipe Ant').ascurrency , ffCurrency, 12,2);
   EditMediaFipe.Text     := FloatToStrF(query.FieldByName('Media Fipe Atual').ascurrency , ffCurrency, 12,2);
   EditMediaIndice.Text   := FloatToStrF(query.FieldByName('Media Indice Fipe').ascurrency , ffCurrency, 12,2);
   EditMediaPVFIPE.Text   := FloatToStrF(query.FieldByName('Media PV-FIPE').ascurrency , ffCurrency, 12,2);
   EditMediaPV.Text       := FloatToStrF(query.FieldByName('Media PV').ascurrency , ffCurrency, 12,2);
   EditMediaPC.Text       := FloatToStrF(query.FieldByName('Media PC').ascurrency , ffCurrency, 12,2);
   EditMediaEstoque.Text  := IntToStr(query.FieldByName('Media Tempo Estoque').AsInteger);
   EditMediaLoja.Text     := IntToStr(query.FieldByName('Media Tempo Loja').AsInteger);
   EditMediaMargem.Text   := FloatToStrF(query.FieldByName('Media Margem').ascurrency , ffCurrency, 12,2);
   EditMediaMargemD.Text  := FloatToStrF(query.FieldByName('Media Margem/Dia').ascurrency , ffCurrency, 12,2);

   EditTotalFipeAnt.Text  := FloatToStrF(query.FieldByName('Total Fipe Ant').ascurrency, ffCurrency, 12,2);
   EditTotalFipe.Text     := FloatToStrF(query.FieldByName('Total Fipe Atual').ascurrency , ffCurrency, 12,2);
   EditTotalIndice.Text   := FloatToStrF(query.FieldByName('Total Indice Fipe').ascurrency , ffCurrency, 12,2);
   EditTotalPVFIPE.Text   := FloatToStrF(query.FieldByName('Total PV-FIPE').ascurrency , ffCurrency, 12,2);
   EditTotalPV.Text       := FloatToStrF(query.FieldByName('Total PV').ascurrency , ffCurrency, 12,2);
   EditTotalPC.Text       := FloatToStrF(query.FieldByName('Total PC').ascurrency , ffCurrency, 12,2);
   EditTotalMg.Text       := FloatToStrF(query.FieldByName('Total Margem').ascurrency , ffCurrency, 12,2);
   EditTotalMGD.Text      := FloatToStrF(query.FieldByName('Total Margem/Dia').ascurrency, ffCurrency, 12,2);


  Except
  On E:Exception Do
  Begin
     ShowMessage('Falha ao gerar totais! '+ e.Message);
  End;
 end;

End;

procedure TFormGestaoDadosSavauto.AtualizaFipeDbGrid(grid :tdbgrid; fipe1, fipe2:string);
Var
 qBuscaFipe: TUniQuery;
 vlr1, vlr2 : currency;
 ref1 , ref2 : string;
Begin

 qBuscaFipe :=  TUniQuery.Create(self);
 qBuscaFipe.Connection := DataModuleConexao.UniConnectionSavanna;

 if grid.DataSource.DataSet.RecordCount > 0 then
 Begin

  FormAguarde.Label1.Caption := 'Atualizando Fipe...';

  grid.DataSource.DataSet.First;

   while not grid.DataSource.DataSet.Eof do
   Begin

      qBuscaFipe.SQL.Clear;
      qBuscaFipe.SQL.Add('select valor from tbnewfipe where ano = :ano');
      qBuscaFipe.SQL.Add('and cod_fipe = :codfipe and ref = :ref');
      qBuscaFipe.ParamByName('ano').Text :=     grid.DataSource.DataSet.FieldByName('ano').Text; // qBusca.FieldByName('Car_Ano').Text;
      qBuscaFipe.ParamByName('codfipe').Text := grid.DataSource.DataSet.FieldByName('cod_fipe').Text;
      qBuscaFipe.ParamByName('ref').Text :=     fipe1;
      qBuscaFipe.Open;

      vlr1 := qBuscaFipe.FieldByName('valor').AsCurrency;
      ref1 := fipe1;

      qBuscaFipe.SQL.Clear;
      qBuscaFipe.SQL.Add('select valor from tbnewfipe where ano = :ano');
      qBuscaFipe.SQL.Add('and cod_fipe = :codfipe and ref = :ref');
      qBuscaFipe.ParamByName('ano').Text :=     grid.DataSource.DataSet.FieldByName('ano').Text; // qBusca.FieldByName('Car_Ano').Text;
      qBuscaFipe.ParamByName('codfipe').Text := grid.DataSource.DataSet.FieldByName('cod_fipe').Text;
      qBuscaFipe.ParamByName('ref').Text :=     fipe2;
      qBuscaFipe.Open;

      vlr2 := qBuscaFipe.FieldByName('valor').AsCurrency;
      ref2 := fipe2;

       if grid.DataSource.DataSet.FieldByName('Ref1').Text <> ref1 then
       Begin
         grid.DataSource.DataSet.Edit;
         //QQuadro1.Edit;
         grid.DataSource.DataSet.FieldByName('Fipe Atual').AsCurrency    := vlr1;
         grid.DataSource.DataSet.FieldByName('Ref1').Text                := ref1;
         QQuadro1.FieldByName('Fipe Atual').AsCurrency := vlr1;
         //QQuadro1.Post;
         grid.DataSource.DataSet.Post;
       End;

       if grid.DataSource.DataSet.FieldByName('Ref2').Text <> ref2 then
       Begin
         grid.DataSource.DataSet.Edit;
         //QQuadro1.Edit;
         grid.DataSource.DataSet.Edit;
         grid.DataSource.DataSet.FieldByName('Fipe Anterior').AsCurrency := vlr2;
         grid.DataSource.DataSet.FieldByName('Ref2').Text                := ref2;
         //QQuadro1.Post;
         grid.DataSource.DataSet.Post;
       End;

       {
        QQuadro1.SQL.Add(' fipe1 - fipe2 as ''Indice Fipe'',');
         QQuadro1.SQL.Add(' coalesce(Car_VLVenda - fipe1,0) as ''PV-FIPE'',');
         }
      grid.DataSource.DataSet.Edit;
      grid.DataSource.DataSet.FieldByName('Indice Fipe').AsCurrency := grid.DataSource.DataSet.FieldByName('Fipe Atual').AsCurrency - grid.DataSource.DataSet.FieldByName('Fipe Anterior').AsCurrency;
      grid.DataSource.DataSet.Post;
      grid.DataSource.DataSet.Edit;
      grid.DataSource.DataSet.FieldByName('PV-FIPE').AsCurrency := grid.DataSource.DataSet.FieldByName('PV').AsCurrency - grid.DataSource.DataSet.FieldByName('Fipe Atual').AsCurrency;
      grid.DataSource.DataSet.Post;

      grid.DataSource.DataSet.Next;

   End;

  FormAguarde.Label1.Caption := 'Aguarde...';

 End;

End;

procedure TFormGestaoDadosSavauto.btnAlteraMetaFilProprioClick(Sender: TObject);
begin

  if FormPrincipal.InputBoxPass('Digite a senha de Gerencia','','') <> 'raoni2021' then
  Begin
    MessageDlg('Falha ao acessar tela! ', mtError, [mbok] , 0);
    abort;
  End
  Else
  Begin

   AtualizaFiltroProprio;

  End;

end;

procedure TFormGestaoDadosSavauto.btnAlteraMetasFiltroPrazosClick(
  Sender: TObject);
begin
  if FormPrincipal.InputBoxPass('Digite a senha de Gerencia','','') <> 'raoni2021' then
  Begin
    MessageDlg('Falha ao acessar tela! ', mtError, [mbok] , 0);
    abort;
  End
  Else
  Begin
   AtualizaFiltroPrazo;
  End;

end;

procedure TFormGestaoDadosSavauto.btnCarregaMetaClick(Sender: TObject);
begin

 try

   CarregaMetas;

   MessageDlg('Metas atualizadas! ', mtInformation, [mbok], 0);

  Except
  On E:Exception do
  Begin
    MessageDlg('Falha ao atualizar metas! ' + E.Message , mtError, [mbok], 0);
  End;

 end;


end;

procedure TFormGestaoDadosSavauto.btnCarregaMetaMouseEnter(Sender: TObject);
begin

  if btnCarregaMeta.Color = $0000BF00 then
  btnCarregaMeta.Color := clGreen
  Else
  btnCarregaMeta.Color := $0000BF00;

end;

procedure TFormGestaoDadosSavauto.btnCarregaMetaMouseLeave(Sender: TObject);
begin
  if btnCarregaMeta.Color = $0000BF00 then
  btnCarregaMeta.Color := clGreen
  Else
  btnCarregaMeta.Color := $0000BF00;
end;

procedure TFormGestaoDadosSavauto.btnVisualizarClick(Sender: TObject);
begin

 if tag = 0 then
 Begin
   PanelGraficosFIltros.Visible := false;
   PanelFixoFiltros.Visible := false;
   tag := 1;

   Panel8.Align := alBottom;
   Panel7.Align := alBottom;
   Panel4.Align := alBottom;
   Panel6.Align := alBottom;

   DbGridAnaliseEstoqueQuadro1.Align := alClient;
 End
 Else
 Begin
   tag := 0;


   DbGridAnaliseEstoqueQuadro1.Align := alTop;

   Panel6.Align := alTop;
   Panel4.Align := alTop;
   Panel7.Align := alTop;
   Panel8.Align := alTop;

   PanelGraficosFIltros.Visible := true;
   PanelFixoFiltros.Visible := true;

 End;

end;

procedure TFormGestaoDadosSavauto.Button3Click(Sender: TObject);
begin
  if FormPrincipal.InputBoxPass('Digite a senha de Gerencia','','') <> 'raoni2021' then
  Begin
    MessageDlg('Falha ao acessar tela! ', mtError, [mbok] , 0);
    abort;
  End
  Else
  Begin
   AtualizaFixoProprio;
  End;

end;

procedure TFormGestaoDadosSavauto.Button4Click(Sender: TObject);
begin
  if FormPrincipal.InputBoxPass('Digite a senha de Gerencia','','') <> 'raoni2021' then
  Begin
    MessageDlg('Falha ao acessar tela! ', mtError, [mbok] , 0);
    abort;
  End
  Else
  Begin
    AtualizaFixoPrazo;
  End;

end;

procedure TFormGestaoDadosSavauto.Button5Click(Sender: TObject);
begin
  if FormPrincipal.InputBoxPass('Digite a senha de Gerencia','','') <> 'raoni2021' then
  Begin
    MessageDlg('Falha ao acessar tela! ', mtError, [mbok] , 0);
    abort;
  End
  Else
  Begin
    AtualizaFixoTodos;
  End;

end;

procedure TFormGestaoDadosSavauto.DbGridAnaliseEstoqueQuadro1TitleClick(
  Column: TColumn);
var
  sIndexName: string;
  oOrdenacao: TIndexOptions;
  i: smallint;
begin

 if Ascendente = false then
 Begin
   QQuadro1.IndexFieldNames := Column.FieldName + ' ASC';
   Ascendente := true;
   DbGridAnaliseEstoqueQuadro1.DataSource.DataSet.First;
 End
 Else
 Begin
   QQuadro1.IndexFieldNames := Column.FieldName + ' DESC';
   Ascendente := false;
   DbGridAnaliseEstoqueQuadro1.DataSource.DataSet.First;
 End;

end;

procedure TFormGestaoDadosSavauto.FormShow(Sender: TObject);
begin

 CarregaMetas;

 Ascendente := False;

end;

procedure TFormGestaoDadosSavauto.AtualizaFipe;
var
 query, qBusca, qBuscaFipe : TUniQuery;
 fipe1, fipe2 : string;
Begin

 query := TUniQuery.Create(self);
 query.Connection := DataModuleConexao.UniConnectionSavanna;

 qBusca := TUniQuery.Create(self);
 qBusca.Connection := DataModuleConexao.UniConnectionSavanna;

 qBuscaFipe :=  TUniQuery.Create(self);
 qBuscaFipe.Connection := DataModuleConexao.UniConnectionSavanna;

 query.SQL.clear;
 query.SQL.Add('select distinct top 2  ref from tbnewfipe order by ref desc');
 query.Open;

 query.First;

 fipe1 := query.FieldByName('ref').Text;

 //ShowMessage('Fipe 1: ' + fipe1);

 query.Next;

 fipe2 := query.FieldByName('ref').Text;

 //ShowMessage('Fipe 2: ' + fipe2);

  try

   qBusca.SQL.Clear;
   qBusca.SQL.Add('select * from CadCar where 1 = 1');
   if QueryWhere <> '' then
   qBusca.SQL.Add( QueryWhere );
   qBusca.Open;

   //ShowMessage('SQL: ' + qBusca.SQL.Text);

   qBusca.First;

   while not qBusca.eof do
   Begin

      qBuscaFipe.SQL.Clear;
      qBuscaFipe.SQL.Add('select valor from tbnewfipe where ano = SUBSTRING( :ano, 6, 4)');
      qBuscaFipe.SQL.Add('and cod_fipe = SUBSTRING( :codfipe, 1, 8 ) and ref = :ref');
      qBuscaFipe.ParamByName('ano').Text :=     qBusca.FieldByName('Car_Ano').Text;
      qBuscaFipe.ParamByName('codfipe').Text := qBusca.FieldByName('car_codfipe').Text;
      qBuscaFipe.ParamByName('ref').Text :=     fipe1;
      qBuscaFipe.Open;

     {    ShowMessage('Valor FIPE1: ' + CurrToStr(qBuscaFipe.FieldByName('valor').AsCurrency));
         ShowMessage('Car_Cod: ' + IntTOStr(qBusca.FieldByName('car_cod').AsInteger)); }

      query.SQL.Clear;
      query.SQL.Add('update CadCar set fipe1=:valor where Car_cod=:cod');
      query.ParamByName('valor').AsCurrency := qBuscaFipe.FieldByName('valor').AsCurrency;
      query.ParamByName('cod').AsInteger :=    qBusca.FieldByName('car_cod').AsInteger;
      query.Execute;

      qBuscaFipe.SQL.Clear;
      qBuscaFipe.SQL.Add('select valor from tbnewfipe where ano = SUBSTRING( :ano, 6, 4)');
      qBuscaFipe.SQL.Add('and cod_fipe = SUBSTRING( :codfipe, 1, 8 ) and ref = :ref');
      qBuscaFipe.ParamByName('ano').Text := qBusca.FieldByName('Car_Ano').Text;
      qBuscaFipe.ParamByName('codfipe').Text := qBusca.FieldByName('car_codfipe').Text;
      qBuscaFipe.ParamByName('ref').Text := fipe2;
      qBuscaFipe.Open;

      query.SQL.Clear;
      query.SQL.Add('update CadCar set fipe2=:valor where Car_cod=:cod');
      query.ParamByName('valor').AsCurrency := qBuscaFipe.FieldByName('valor').AsCurrency;
      query.ParamByName('cod').AsInteger := qBusca.FieldByName('car_cod').AsInteger;
      query.Execute;

      qBusca.Next;

   End;

  {
   query.SQL.Clear;
   query.SQL.Add('  update CadCar set fipe2 = (select valor from tbnewfipe where ano = SUBSTRING( CadCar.Car_Ano, 6, 4)');
   query.SQL.Add('  and cod_fipe = SUBSTRING( CadCar.car_codfipe, 1, 8 ) and ref = :ref) ');
   query.SQL.Add('  where ');
   query.SQL.Add('  Car_DtEntrada is not null and Car_VLVenda > 0 ');
   query.SQL.Add('  and Car_VLVenda - (Car_VLBase + Car_Custos) is not null ');
   if QueryWhere <> '' then
   query.SQL.Add(QueryWhere);
   query.ParamByName('ref').Text := fipe2;
   query.Execute;

   query.SQL.Clear;
   query.SQL.Add('  update CadCar set fipe1 = (select valor from tbnewfipe where ano = SUBSTRING( CadCar.Car_Ano, 6, 4)');
   query.SQL.Add('  and cod_fipe = SUBSTRING( CadCar.car_codfipe, 1, 8 ) and ref = :ref) ');
   query.SQL.Add('  where ');
   query.SQL.Add(' Car_DtEntrada is not null and Car_VLVenda > 0 ');
   query.SQL.Add('  and Car_VLVenda - (Car_VLBase + Car_Custos) is not null ');
   if QueryWhere <> '' then
   query.SQL.Add(QueryWhere);
   query.ParamByName('ref').Text := fipe1;
   query.Execute; }

   query.DisposeOf;
   qBusca.DisposeOf;
   qBuscaFipe.DisposeOf;

    except
    On E:Exception do
    Begin
      ShowMessage('Falha ao atualizar fipe! ' + e.Message);
    End;
  end;

  End;

procedure TFormGestaoDadosSavauto.PanelDREClick(Sender: TObject);
begin

 if LblStatusFiltro.Caption = '' then
 Begin
   MessageDlg('Antes de consultar o DRE, faça uma pesquisa dos dados na tela! ', mtWarning, [mbok] , 0);
   Abort;
 End;


 FormDREDados.Position := poScreenCenter;
 FormDREDados.Show;

end;

procedure TFormGestaoDadosSavauto.PanelDREMouseEnter(Sender: TObject);
begin

 if PanelDRE.Color = $00808040 then
 PanelDRE.Color := clSilver
 Else
 PanelDRE.Color := $00808040;


end;

procedure TFormGestaoDadosSavauto.PanelDREMouseLeave(Sender: TObject);
begin
 if PanelDRE.Color = $00808040 then
 PanelDRE.Color := clSilver
 Else
 PanelDRE.Color := $00808040;
end;

procedure TFormGestaoDadosSavauto.Panel9Click(Sender: TObject);
begin

 FormRelacaoEstoque.Position := poScreenCenter;
 FormRelacaoEstoque.Show;

end;

procedure TFormGestaoDadosSavauto.PanelAtualizarClick(Sender: TObject);
var
  Query, QTotais : TUniQuery;
  fipe1 , fipe2, veiculos : string;
begin

 if LblStatusFiltro.Caption = '' then
 Begin
   MessageDlg('Filtre antes de fazer a pesquisa! ', mtWarning, [mbok] , 0);
   Abort;
 End;

 query := TUniQuery.Create(self);
 query.Connection := DataModuleConexao.UniConnection1;

 QTotais := TUniQuery.Create(self);
 QTotais.Connection := DataModuleConexao.UniConnectionSavanna;

 query.SQL.clear;
 query.SQL.Add('select fipe from tblistfipes order by id desc limit 2');
 query.Open;

 query.First;

 fipe1 := query.FieldByName('fipe').Text;

 query.Next;

 fipe2 := query.FieldByName('fipe').Text;

 labelRefFipes.Caption := 'Fipe Atual: ' + fipe1 +' | ' + ' Fipe Anterior: ' + fipe2;
 labelRefFipes.Refresh;

 if FormAguarde = nil then
 Begin
   FormAguarde := TFormAguarde.Create(self);
 End;

 FormAguarde.Position := poScreenCenter;
 Application.ProcessMessages;
 FormAguarde.Show;
 Application.ProcessMessages;

 Sleep(1000);

 GeraTotais;

 QTotais.SQL.Clear;
 QTotais.SQL.Add(' select count(*) as qtd');
 QTotais.SQL.Add(' from CadCar');
 QTotais.SQL.Add(' left join Inv on Inv_Cod = Car_Inv');
 QTotais.SQL.Add(' where');
 QTotais.SQL.Add(' Car_DtEntrada is not null and Car_VLVenda > 0');
 QTotais.SQL.Add(' and Car_VLVenda - (car_vlrecibo) is not null');
 QTotais.SQL.Add(' and inv.Inv_Fone not in ( ''Excluido'') ');
 //QTotais.SQL.Add(' and Inv.Inv_Cod is not null');

 if QueryWhere <> '' then
 QTotais.SQL.Add( QueryWhere );
 QTotais.Active := true;

 lblQtdVeiculos.Caption := 'Quantidade de Veículos: '+ IntToStr(QTotais.FieldByName('qtd').AsInteger);
 lblQtdVeiculos.Refresh;

 QTotais.SQL.Clear;
 QTotais.SQL.Add(' select count(*) as qtd');
 QTotais.SQL.Add(' from CadCar');
 QTotais.SQL.Add(' left join Inv on Inv_Cod = Car_Inv');
 QTotais.SQL.Add(' where');
 QTotais.SQL.Add(' Car_DtEntrada is not null and Car_VLVenda > 0');
 QTotais.SQL.Add(' and Car_VLVenda - (car_vlrecibo) is not null');
 QTotais.SQL.Add(' and inv.Inv_Fone in ( ''Excluido'') ');
 //QTotais.SQL.Add(' and Inv.Inv_Cod is not null');

 if QueryWhere <> '' then
 QTotais.SQL.Add( QueryWhere );
 QTotais.Active := true;


 lblQtdVeiculosEmUso.Caption := 'Quantidade veículos em uso: '+  IntToStr(QTotais.FieldByName('qtd').AsInteger);
 lblQtdVeiculosEmUso.Refresh;

 lblTotalVeiculos.Caption := 'Veículos:';
 veiculos := '';

 QTotais.SQL.Clear;
 QTotais.SQL.Add(' select car_sit, count(*) as qtd');
 QTotais.SQL.Add(' from CadCar');
 QTotais.SQL.Add(' left join Inv on Inv_Cod = Car_Inv');
 QTotais.SQL.Add(' where');
 QTotais.SQL.Add(' Car_DtEntrada is not null and Car_VLVenda > 0');
 QTotais.SQL.Add(' and Car_VLVenda - (car_vlrecibo) is not null');
 QTotais.SQL.Add(' and inv.Inv_Fone not in ( ''Excluido'') ');

 if QueryWhere <> '' then
 QTotais.SQL.Add( QueryWhere );
 QTotais.SQL.Add('group by car_sit');
 QTotais.Active := true;

 QTotais.First;
 while not QTotais.Eof do
 Begin
    //ShowMessage(QTotais.FieldByName('car_sit').Text + ':' + IntToStr(QTotais.FieldByName('qtd').AsInteger));
    veiculos := veiculos + ' ' + QTotais.FieldByName('car_sit').Text + ':' + IntToStr(QTotais.FieldByName('qtd').AsInteger) + ' ';
    QTotais.Next;
 End;

 lblTotalVeiculos.Caption := lblTotalVeiculos.Caption + veiculos;
 lblTotalVeiculos.Refresh;

 //ShowMessage(veiculos);

 QQuadro1.SQL.Clear;
 QQuadro1.SQL.Add('select ');
 QQuadro1.SQL.Add(' case when Inv.Inv_Fone is null then ''N/A'' else Inv.Inv_fone end as ''PRAZO/PROPRIO'', -- Verificar com Raoni');
 QQuadro1.SQL.Add(' Inv.Inv_Nome as ''Origem'',');
 QQuadro1.SQL.Add(' Car_Placa as ''Placa'',');
 QQuadro1.SQL.Add(' Car_Modelo as ''Veículo'',');
 QQuadro1.SQL.Add(' SUBSTRING( Car_Ano, 6, 4) as ''Ano'',');
 QQuadro1.SQL.Add(' fipe2 as ''Fipe Anterior'', --- Vai trazer do sistema atual');
 QQuadro1.SQL.Add(' fipe1 as ''Fipe Atual'',');
 QQuadro1.SQL.Add(' fipe1 - fipe2 as ''Indice Fipe'',');
 QQuadro1.SQL.Add(' coalesce(Car_VLVenda - fipe1,0) as ''PV-FIPE'',');
 QQuadro1.SQL.Add(' coalesce(Car_VLVenda,0) as ''PV'',');
 QQuadro1.SQL.Add(' coalesce(Car_VlRecibo,0) as ''PC'',');
 QQuadro1.SQL.Add(' coalesce(DATEDIFF(day, Car_DtEntrada , case when Car_DtVenda is not null then Car_DtVenda else getdate() end) ,0) as ''Tempo Estoque'',');
 QQuadro1.SQL.Add(' coalesce(DATEDIFF(day, Car_DtPatio ,   case when Car_DtVenda is not null then Car_DtVenda else getdate() end) ,0)   as ''Tempo Loja'',');
 QQuadro1.SQL.Add(' coalesce(Car_VLVenda - coalesce(Car_VlRecibo,0) ,0) as ''Margem'',');
 QQuadro1.SQL.Add(' coalesce(Car_VLVenda - (Car_VlRecibo),0) /');
 QQuadro1.SQL.Add(' case when DATEDIFF(day,Car_DtEntrada , case when Car_DtVenda is not null then Car_DtVenda else getdate() end) = 0 then 1 else');
 QQuadro1.SQL.Add('           DATEDIFF(day,Car_DtEntrada , case when Car_DtVenda is not null then Car_DtVenda else getdate() end) end as ''Margem/Dia'',');
 QQuadro1.SQL.Add(' SUBSTRING( car_codfipe, 1, 8 ) as Cod_Fipe,');
 QQuadro1.SQL.Add(' Car_Sit as ''Situação'',  Car_loja as LOJA, Ref1, Ref2');
 QQuadro1.SQL.Add(' from CadCar');
 QQuadro1.SQL.Add(' left join Inv on Inv_Cod = Car_Inv');
 QQuadro1.SQL.Add(' where');
 QQuadro1.SQL.Add(' Car_DtEntrada is not null and Car_VLVenda > 0');
 QQuadro1.SQL.Add(' and Car_VLVenda - (Car_VlRecibo) is not null');
 QQuadro1.SQL.Add('and Inv.Inv_Fone not in (''Excluido'')');
 //QQuadro1.SQL.Add(' and Inv.Inv_Cod is not null');

 if QueryWhere <> '' then
 QQuadro1.SQL.Add( QueryWhere );

 QQuadro1.SQL.Add('order by Car_Cod desc');

 //QQuadro1.SQL.SaveToFile('C:\Users\matheus\Documents\Delphi\Projetos\Mescla_PlanilhasCompras\fontes\Consulta.sql');

 QQuadro1.Active := true;

 GeraDados;

 AtualizaFipeDbGrid(DbGridAnaliseEstoqueQuadro1, fipe1, fipe2);

 GeraEstoqueVeiculo;

 //AtualizaFipe;

 if QQuadro1.RecordCount > 0 then
 Begin
  FormAguarde.Close;
 End
 Else
 Begin
  FormAguarde.Close;
 End;

end;

procedure TFormGestaoDadosSavauto.PanelAtualizarMouseEnter(Sender: TObject);
begin

  MudaCor( PanelAtualizar );

end;

procedure TFormGestaoDadosSavauto.PanelAtualizarMouseLeave(Sender: TObject);
begin

 MudaCor( PanelAtualizar );

end;

procedure TFormGestaoDadosSavauto.panelDivergenciasClick(Sender: TObject);
begin

 if FormDivergenciasDados = nil then
 Begin
    FormDivergenciasDados := TFormDivergenciasDados.Create(self);
 End;

 FormDivergenciasDados.WindowState := wsMaximized;
 FormDivergenciasDados.ShowModal;

end;

procedure TFormGestaoDadosSavauto.panelDivergenciasMouseEnter(Sender: TObject);
begin

  if panelDivergencias.Color = $00FF0080 then
  panelDivergencias.Color := clBlue
  Else
  panelDivergencias.Color := $00FF0080;

end;

procedure TFormGestaoDadosSavauto.panelDivergenciasMouseLeave(Sender: TObject);
begin

  if panelDivergencias.Color = $00FF0080 then
  panelDivergencias.Color := clBlue
  Else
  panelDivergencias.Color := $00FF0080;

end;

procedure TFormGestaoDadosSavauto.panelFiltrosClick(Sender: TObject);
begin

 FormFiltrosGestao.Position := poScreenCenter;
 FormFiltrosGestao.Show;

end;

procedure TFormGestaoDadosSavauto.panelFiltrosMouseEnter(Sender: TObject);
begin

  if panelFiltros.Color = $000080FF then
  panelFiltros.Color := clYellow
  Else
  panelFiltros.Color :=$000080FF;

end;

procedure TFormGestaoDadosSavauto.panelFiltrosMouseLeave(Sender: TObject);
begin

  if panelFiltros.Color = $000080FF then
  panelFiltros.Color := clYellow
  Else
  panelFiltros.Color :=$000080FF;

end;

end.
