unit UFormParametros;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons,
  System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, Data.DB, MemDS,
  DBAccess, Uni, Vcl.Grids, Vcl.DBGrids;

type
  TFormParametros = class(TForm)
    tabAvaliacoes: TPageControl;
    Avaliações: TTabSheet;
    tabVistorias: TTabSheet;
    tabCompras: TTabSheet;
    tabAtendimento: TTabSheet;
    tabFinanceiro: TTabSheet;
    Label1: TLabel;
    EdirVlrPadraoTransf: TEdit;
    btnSalvar: TBitBtn;
    UniTableParametros: TUniTable;
    UniTableParametrosvlrTransf: TFloatField;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    QAlteraDados: TUniQuery;
    Label2: TLabel;
    Label3: TLabel;
    EditFipeCompraPorta: TEdit;
    EditFipeComraTroca: TEdit;
    Label4: TLabel;
    EditFipeVistorias: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    QCarregaParametrosDiversos: TUniQuery;
    Label5: TLabel;
    EditVlrMargemCompras: TEdit;
    UniTableParametrosvlrMargemCompras: TFloatField;
    LinkControlToField2: TLinkControlToField;
    BitBtn3: TBitBtn;
    Label6: TLabel;
    EditFipeAtendimentos: TEdit;
    TabRegrasCompras: TTabSheet;
    Label7: TLabel;
    DbGridValorCompra: TDBGrid;
    DataSource1: TDataSource;
    TableParamCompra: TUniTable;
    TableParamCompraid: TIntegerField;
    TableParamCompradescricao: TStringField;
    TableParamCompravalor_de: TFloatField;
    TableParamCompravalor_ate: TFloatField;
    TableParamCompraclasse: TStringField;
    Label8: TLabel;
    DBGrid1: TDBGrid;
    DataSource2: TDataSource;
    TableMercado: TUniTable;
    TableMercadoid: TIntegerField;
    TableMercadoqtd_d_vendida: TIntegerField;
    TableMercadosinal: TStringField;
    TableMercadovalor_de: TFloatField;
    TableMercadovalor_ate: TFloatField;
    TableMercadoclasse: TStringField;
    Label9: TLabel;
    DBGrid2: TDBGrid;
    DataSource3: TDataSource;
    TableKM: TUniTable;
    TableKMid: TIntegerField;
    TableKMdescricao: TStringField;
    TableKMvalor_de: TFloatField;
    TableKMvalor_ate: TFloatField;
    TableKMclasse: TStringField;
    btnAcessaTabelaCompra: TButton;
    TabSheet1: TTabSheet;
    Label10: TLabel;
    DBGrid3: TDBGrid;
    DataSource4: TDataSource;
    ParamProj: TUniTable;
    procedure FormCreate(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure btnAcessaTabelaCompraClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormParametros: TFormParametros;

implementation

{$R *.dfm}

uses UDataModuleBancoVistoria, UDataModuleConexao, UFormDataPagamento,
  FMX.UFormGraficosAtendimento, Loading, UClasseVeiculoAvaliacao, UDMPermissoes,
  UFormAgendamento, UFormAguarde, UFormAjusteDadosFipeAvaliacao,
  UFormAlteracaoProposta, UFormAlteracaoVeiculo, UFormAlteraDadosCliente,
  UFormAlteraFipeDePaxa, UFormAlteraMidiaAnuncio, UFormAlteraPermissaoAppTransp,
  UFormAlteraPlaca, UFormAnaliseCompra, UFormAnaliseCompraQuery,
  UFormAnaliseComprasTabela, UFormAplicaMargem, UFormAtendimentoMultasVeiculo,
  UFormAtendimentoNovo, UFormAtendimentos, UFormAtualizaTabelaFipe,
  UFormAtuHistFIPE, UFormAtuTabFIpe, UFormAvaliarAvaliacao, UFormAvarias,
  UFormAvariasItens, UFormCadaNovoUsuMobile, UFormCadastroTransportadora,
  UFormCadastroTransportadoras, UFormCadaUsuario, UFormCadaUsuariosMobile,
  UFormCadVistoriadores, UFormCidadesCustos, UFormColunasOcultas,
  UFormConcedePermissao, UFormConcFipeModelo, UFormConsutaPlacaAvaliacao,
  UFormCriacaoAvaria, UFormCruzamentoFipes, UFormDadosPagamento,
  UFormDadosPerfil, UFormDadosPgtoTransporte, UFormDetalhesAtendimento,
  UFormDetalhesAtendimentoBeta, UFormDetalhesAvaliacao, UFormDetalheTransportes,
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
  UFormPagamentoTransporte, UFormPagamentoVeiculo, UFormPerfis,
  UFormPermissoesCarga, UFormPermissoesUsuarioAppTransporte, UFormPesquisaFipe,
  UFormPgtoExtratoVeiculo, UFormPrincipal, UFormProcPlanAcelero,
  UFormProcPlanFinal, UFormQuitacoesVeiculo, UFormRefFipes, UFormRelacaoEstoque,
  UFormSegIPVALic, UFormTabelaCompra, UFormUltimasAtualizacoes, UFormUsuarios,
  UFormVistoriadores, UFormVistoriasDetalhes, UFormWebBrowse,
  UforTestesDiversos, UnitLogin;

procedure TFormParametros.BitBtn1Click(Sender: TObject);
begin

 if EditFipeVistorias.Text = '' then
 Begin
   MessageDlg('Fipe inválida: Fipe Vistoria. Revise o campo!' , mtWarning , [mbok] , 0);
   Abort;
 End;


 QAlteraDados.SQL.Clear;
 QAlteraDados.SQL.Add('update tbfiperef set FipeVistoria=:FVistoria');
 QAlteraDados.ParamByName('FVistoria').Text := EditFipeVistorias.Text;
 QAlteraDados.Execute;

 MessageDlg('Atualização de dados efetuado com sucesso! Caso a alteração reflita nas Fipes, solicitar aos usuários de app que fechem o app e abram novamente' , mtInformation , [mbok] , 0);

end;

procedure TFormParametros.BitBtn2Click(Sender: TObject);
begin

 if EditFipeCompraPorta.Text = '' then
 Begin
   MessageDlg('Fipe inválida: Compra na Porta. Revise o campo!' , mtWarning , [mbok] , 0);
   Abort;
 End;

 if EditFipeComraTroca.Text = '' then
 Begin
   MessageDlg('Fipe inválida: Compra em Troca. Revise o campo!' , mtWarning , [mbok] , 0);
   Abort;
 End;

 QAlteraDados.SQL.Clear;
 QAlteraDados.SQL.Add('update tbfiperef set FipeCompraPorta=:CompraP, FipeCompraTroca=:CompraT');
 QAlteraDados.ParamByName('CompraP').Text := EditFipeCompraPorta.Text;
 QAlteraDados.ParamByName('CompraT').Text := EditFipeComraTroca.Text;
 QAlteraDados.Execute;

 MessageDlg('Atualização de dados efetuado com sucesso! Caso a alteração reflita nas Fipes, solicitar aos usuários de app que fechem o app e abram novamente' , mtInformation , [mbok] , 0);

end;

procedure TFormParametros.BitBtn3Click(Sender: TObject);
begin

 try


 if UniTableParametros.Active = true then
 Begin
  QAlteraDados.SQL.Clear;
  QAlteraDados.SQL.Add('update tbparametros set vlrMargemCompras=:vl');
  QAlteraDados.ParamByName('vl').AsCurrency := StrToCurr(EditVlrMargemCompras.Text);
  QAlteraDados.Execute;

  UniTableParametros.Refresh;

  ShowMessage('Alteração aplicada com sucesso!');
 End;

 Except
 On E:Exception do
 Begin
    ShowMessage('Falha ao salvar! Refaça a operação! ' + E.Message);
 End;
 end;

end;

procedure TFormParametros.btnAcessaTabelaCompraClick(Sender: TObject);
begin

 FormTabelaCompra.Position := poScreenCenter;
 FormTabelaCompra.ShowModal;

end;

procedure TFormParametros.btnSalvarClick(Sender: TObject);
begin

 if UniTableParametros.Active = true then
 Begin
  QAlteraDados.SQL.Clear;
  QAlteraDados.SQL.Add('update tbparametros set vlrTransf=:vl, FipeAtendimentos=:fipe');
  QAlteraDados.ParamByName('vl').AsCurrency := StrToCurr(EdirVlrPadraoTransf.Text);
  QAlteraDados.ParamByName('fipe').Text := EditFipeAtendimentos.Text;
  QAlteraDados.Execute;

   QAlteraDados.SQL.Clear;
   QAlteraDados.SQL.Add('update tbfiperef set FipeAtendimentos=:fipe');
   QAlteraDados.ParamByName('fipe').Text := EditFipeAtendimentos.Text;
   QAlteraDados.Execute;

  UniTableParametros.Refresh;

  try
    MessageDlg('Alteração efetuada com êxito', mtInformation, [mbok] , 0);
    Exit
  except
    on E : Exception do
    ShowMessage('Ocorreu uma falha ao atualizar os parametros. Refaça a operação. Mensagem: ' + e.Message );
  end;

 End;

end;

procedure TFormParametros.FormCreate(Sender: TObject);
begin

 if UniTableParametros.Active = false then

 Begin


  try

    UniTableParametros.Active := true;

    except on E : Exception do
    ShowMessage('Ocorreu uma falha ao atualizar os parametros. Refaça a operação. Mensagem: ' + e.Message );

  end;

 End;


end;

procedure TFormParametros.FormShow(Sender: TObject);
begin

 QCarregaParametrosDiversos.SQL.Clear;
 QCarregaParametrosDiversos.SQL.Add('select * from tbfiperef');
 QCarregaParametrosDiversos.Open;



 // carrega fipes
 EditFipeCompraPorta.Text := QCarregaParametrosDiversos.FieldByName('FipeCompraPorta').Text;

 EditFipeComraTroca.Text  := QCarregaParametrosDiversos.FieldByName('FipeCompraTroca').Text;

 EditFipeVistorias.Text   := QCarregaParametrosDiversos.FieldByName('FipeVistoria').Text;

 EditFipeAtendimentos.Text:= QCarregaParametrosDiversos.FieldByName('FipeAtendimentos').Text;

end;

end.
