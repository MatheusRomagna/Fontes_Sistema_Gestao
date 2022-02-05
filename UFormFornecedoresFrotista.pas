unit UFormFornecedoresFrotista;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, MemDS, DBAccess, Uni,
  dxGDIPlusClasses;

type
  TFormFornecedoresFrotista = class(TForm)
    PanelTop: TPanel;
    Image5: TImage;
    Label1: TLabel;
    PanelBootom: TPanel;
    PanelCentral: TPanel;
    DBGridListaFornecedores: TDBGrid;
    DataSource1: TDataSource;
    qBuscaFornecedores: TUniQuery;
    imgAddForn: TImage;
    imgEditar: TImage;
    procedure imgAddFornClick(Sender: TObject);
    procedure DBGridListaFornecedoresDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormFornecedoresFrotista: TFormFornecedoresFrotista;

implementation

{$R *.dfm}

uses FMX.UFormGraficosAtendimento, Loading, UDataModuleBancoVistoria,
  UDataModuleConexao, UDMPermissoes, UFormAgendamento,
  UFormAjusteDadosFipeAvaliacao, UFormAlteracaoProposta, UFormAlteracaoVeiculo,
  UFormAlteraDadosCliente, UFormAlteraFipeDePaxa, UFormAlteraMidiaAnuncio,
  UFormAlteraPlaca, UFormAnaliseCompra, UFormAnaliseCompraQuery,
  UFormAnaliseComprasTabela, UFormAplicaMargem, UFormAtendimentoMultasVeiculo,
  UFormAtendimentoNovo, UFormAtendimentos, UFormAtualizaTabelaFipe,
  UFormAtuHistFIPE, UFormAtuTabFIpe, UFormAvaliarAvaliacao, UFormAvarias,
  UFormAvariasItens, UFormCadaNovoUsuMobile, UFormCadaUsuario,
  UFormCadaUsuariosMobile, UFormCadVistoriadores, UFormColunasOcultas,
  UFormConcedePermissao, UFormConcFipeModelo, UFormConsutaPlacaAvaliacao,
  UFormCriacaoAvaria, UFormCruzamentoFipes, UFormDadosPagamento,
  UFormDadosPerfil, UFormDataPagamento, UFormDetalhesAtendimento,
  UFormDetalhesAvaliacao, UFormDownloadNovaVersao, UFormExcelCompras,
  UFormExtratoPgtoVeiculos, UFormGestaoAvaliacoes, UFormGestaoAvarias,
  UFormGestaoVistoria, UFormHistFIPE, UFormHistoricoAvaliacoes,
  UFormHistoricoObsAtn, UFormImagem, UFormImportacoesEfetuadas,
  UFormInformacoes, UFormLiberaPermissao, UFormListaUsuarios, UFormLoading,
  UFormLoadingCarregamento, UFormLoadingOpaco, UFormLoginSavauto,
  UFormLotesArval, UFormMenuFinanceiro, UFormNovaAvaliacao, UformNovaObs,
  UFormNovoProcessamento, UFormNovoVistoriador, UFormPadroesPlanilhas,
  UFormPagamentoVeiculo, UFormParametros, UFormPerfis, UFormPermissoesCarga,
  UFormPesquisaFipe, UFormPgtoExtratoVeiculo, UFormPrincipal,
  UFormProcPlanAcelero, UFormProcPlanFinal, UFormQuitacoesVeiculo,
  UFormRefFipes, UFormSegIPVALic, UFormUltimasAtualizacoes, UFormUsuarios,
  UFormVistoriadores, UFormVistoriasDetalhes, UFormWebBrowse,
  UforTestesDiversos, UnitLogin, UFormFornecedorFrotistaAddEditar;

procedure TFormFornecedoresFrotista.DBGridListaFornecedoresDblClick(
  Sender: TObject);
begin

 FormFornecedorFrotistaAddEditar.EditCnpj.Text := DBGridListaFornecedores.DataSource.DataSet.FieldByName('CNPJ').Text;
 FormFornecedorFrotistaAddEditar.EditFornecedor.Text := DBGridListaFornecedores.DataSource.DataSet.FieldByName('Nome').Text;
 FormFornecedorFrotistaAddEditar.EditCep.Text := DBGridListaFornecedores.DataSource.DataSet.FieldByName('CEP').Text;
 FormFornecedorFrotistaAddEditar.EditCidade.Text := DBGridListaFornecedores.DataSource.DataSet.FieldByName('Cidade').Text;
 FormFornecedorFrotistaAddEditar.EditBairro.Text := DBGridListaFornecedores.DataSource.DataSet.FieldByName('Bairro').Text;
 FormFornecedorFrotistaAddEditar.EditUF.Text := DBGridListaFornecedores.DataSource.DataSet.FieldByName('UF').Text;
 FormFornecedorFrotistaAddEditar.EditLogradouro.Text := DBGridListaFornecedores.DataSource.DataSet.FieldByName('Logradouro').Text;

 FormFornecedorFrotistaAddEditar.Tag :=  StrToInt(DBGridListaFornecedores.DataSource.DataSet.FieldByName('id').Text);

 FormFornecedorFrotistaAddEditar.Position := poScreenCenter;

 FormFornecedorFrotistaAddEditar.ShowModal;

end;

procedure TFormFornecedoresFrotista.imgAddFornClick(Sender: TObject);
begin

 FormFornecedorFrotistaAddEditar.Tag := 0;
 FormFornecedorFrotistaAddEditar.Position := poScreenCenter;
 FormFornecedorFrotistaAddEditar.Show;

end;

end.
