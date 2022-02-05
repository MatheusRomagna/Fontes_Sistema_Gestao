unit UFormCadastroTransportadoras;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.Grids, Vcl.DBGrids, dxGDIPlusClasses, Vcl.ExtCtrls,
  MemDS, DBAccess, Uni;

type
  TFormCadastroTransportadoras = class(TForm)
    PanelBootom: TPanel;
    imgAddTransportadora: TImage;
    PanelCentral: TPanel;
    DBGridListaTransp: TDBGrid;
    PanelTop: TPanel;
    Image5: TImage;
    Label1: TLabel;
    DataSource1: TDataSource;
    qBuscaTransportadoras: TUniQuery;
    procedure imgAddTransportadoraClick(Sender: TObject);
    procedure DBGridListaTranspDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadastroTransportadoras: TFormCadastroTransportadoras;

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
  UFormExtratoPgtoVeiculos, UFormFornecedoresFrotista,
  UFormFornecedorFrotistaAddEditar, UFormGestaoAvaliacoes, UFormGestaoAvarias,
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
  UforTestesDiversos, UnitLogin, UFormCadastroTransportadora,
  UFormNovoUsuarioTransporte, UFormPermissoesUsuarioAppTransporte;

procedure TFormCadastroTransportadoras.DBGridListaTranspDblClick(
  Sender: TObject);
  var
   query : TUniQuery;
begin

 if FormCadastroTransportadora = nil then
 Begin
    FormCadastroTransportadora := TFormCadastroTransportadora.Create(self);
 End;

 FormCadastroTransportadora.EditNomeTransp.Text := DBGridListaTransp.DataSource.DataSet.FieldByName('nome').Text;
 FormCadastroTransportadora.EditCnpj.Text       := DBGridListaTransp.DataSource.DataSet.FieldByName('cnpj').Text;
 FormCadastroTransportadora.EditCEP.Text        := DBGridListaTransp.DataSource.DataSet.FieldByName('cep').Text;
 FormCadastroTransportadora.EditCidade.Text     := DBGridListaTransp.DataSource.DataSet.FieldByName('cidade').Text;
 FormCadastroTransportadora.EditUF.Text         := DBGridListaTransp.DataSource.DataSet.FieldByName('uf').Text;
 FormCadastroTransportadora.EditBairro.Text     := DBGridListaTransp.DataSource.DataSet.FieldByName('bairro').Text;
 FormCadastroTransportadora.EditRua.Text        := DBGridListaTransp.DataSource.DataSet.FieldByName('rua').Text;

 FormCadastroTransportadora.Tag := 0;

 query := TUniQuery.Create(self);
 query.Connection := DataModuleBancoVistoria.UniConnection1;

 query.SQL.Clear;
 query.SQL.Add('select * from tbtransportadoras_dadosbancarios where id_transportadora=:id');
 query.ParamByName('id').AsInteger := DBGridListaTransp.DataSource.DataSet.FieldByName('id').AsInteger;
 query.Open;

 if query.RecordCount > 0 then
 Begin
    FormCadastroTransportadora.EditPix.Text     := query.FieldByName('pix').Text;
    FormCadastroTransportadora.EditAgencia.Text := query.FieldByName('agencia').Text;
    FormCadastroTransportadora.EditConta.Text   := query.FieldByName('conta').Text;
    FormCadastroTransportadora.EditBanco.Text   := query.FieldByName('banco').Text;
 End
 Else
 Begin
    FormCadastroTransportadora.EditPix.Text     := '';
    FormCadastroTransportadora.EditAgencia.Text := '';
    FormCadastroTransportadora.EditConta.Text   := '';
    FormCadastroTransportadora.EditBanco.Text   := '';
 End;

 FormCadastroTransportadora.qBuscaUsuarios.Filter := 'id_transportadora = ' + QuotedStr( DBGridListaTransp.DataSource.DataSet.FieldByName('id').Text );
 FormCadastroTransportadora.qBuscaUsuarios.Filtered := true;

 FormCadastroTransportadora.Position := poScreenCenter;
 FormCadastroTransportadora.ShowModal;

end;

procedure TFormCadastroTransportadoras.FormShow(Sender: TObject);
begin

 qBuscaTransportadoras.Open;

end;

procedure TFormCadastroTransportadoras.imgAddTransportadoraClick(
  Sender: TObject);
begin

 FormCadastroTransportadora.Position := poScreenCenter;

 FormCadastroTransportadora.Tag := 1;

 FormCadastroTransportadora.ShowModal;

end;

end.
