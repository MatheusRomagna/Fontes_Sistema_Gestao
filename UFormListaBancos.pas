unit UFormListaBancos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.DBGrids, MemDS, DBAccess, Uni, Vcl.StdCtrls;

type
  TFormListaBancos = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    DSbancos: TDataSource;
    qBuscaBancos: TUniQuery;
    Label1: TLabel;
    Label2: TLabel;
    EditCodBanco: TEdit;
    EditBanco: TEdit;
    btnSalvar: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormListaBancos: TFormListaBancos;

implementation

{$R *.dfm}

uses FMX.UFormGraficosAtendimento, Loading, UDataModuleBancoVistoria,
  UDataModuleConexao, UDMPermissoes, UFormAgendamento,
  UFormAjusteDadosFipeAvaliacao, UFormAlteracaoProposta, UFormAlteracaoVeiculo,
  UFormAlteraDadosCliente, UFormAlteraFipeDePaxa, UFormAlteraMidiaAnuncio,
  UFormAlteraPermissaoAppTransp, UFormAlteraPlaca, UFormAnaliseCompra,
  UFormAnaliseCompraQuery, UFormAnaliseComprasTabela, UFormAplicaMargem,
  UFormAtendimentoMultasVeiculo, UFormAtendimentoNovo, UFormAtendimentos,
  UFormAtualizaTabelaFipe, UFormAtuHistFIPE, UFormAtuTabFIpe,
  UFormAvaliarAvaliacao, UFormAvarias, UFormAvariasItens,
  UFormCadaNovoUsuMobile, UFormCadastroTransportadora,
  UFormCadastroTransportadoras, UFormCadaUsuario, UFormCadaUsuariosMobile,
  UFormCadVistoriadores, UFormColunasOcultas, UFormConcedePermissao,
  UFormConcFipeModelo, UFormConsutaPlacaAvaliacao, UFormCriacaoAvaria,
  UFormCruzamentoFipes, UFormDadosPagamento, UFormDadosPerfil,
  UFormDadosPgtoTransporte, UFormDataPagamento, UFormDetalhesAtendimento,
  UFormDetalhesAvaliacao, UFormDetalheTransportes, UFormDownloadNovaVersao,
  UFormExcelCompras, UFormExtratoPgtoVeiculos, UFormFinanceiroTransportes,
  UFormFornecedoresFrotista, UFormFornecedorFrotistaAddEditar,
  UFormGestaoAvaliacoes, UFormGestaoAvarias, UFormGestaoTransporte,
  UFormGestaoVistoria, UFormHistFIPE, UFormHistoricoAvaliacoes,
  UFormHistoricoObsAtn, UFormImagem, UFormImportacoesEfetuadas,
  UFormInformacoes, UFormLiberaPermissao, UFormListaUsuarios, UFormLoading,
  UFormLoadingCarregamento, UFormLoadingOpaco, UFormLoginSavauto,
  UFormLotesArval, UFormMenuFinanceiro, UFormNovaAvaliacao, UformNovaObs,
  UFormNovoProcessamento, UFormNovoUsuarioTransporte, UFormNovoVistoriador,
  UFormPadroesPlanilhas, UFormPagamentoTransporte, UFormPagamentoVeiculo,
  UFormParametros, UFormPerfis, UFormPermissoesCarga,
  UFormPermissoesUsuarioAppTransporte, UFormPesquisaFipe,
  UFormPgtoExtratoVeiculo, UFormPrincipal, UFormProcPlanAcelero,
  UFormProcPlanFinal, UFormQuitacoesVeiculo, UFormRefFipes, UFormSegIPVALic,
  UFormUltimasAtualizacoes, UFormUsuarios, UFormVistoriadores,
  UFormVistoriasDetalhes, UFormWebBrowse, UforTestesDiversos, UnitLogin;

procedure TFormListaBancos.btnSalvarClick(Sender: TObject);
var
 query : TUniQuery;
begin

 query := TUniQuery.Create(self);
 query.Connection := DataModuleConexao.UniConnection1;

 if EditBanco.Text <> '' then
 Begin
    if EditCodBanco.Text <> '' then
     Begin

      with query do begin

       sql.Clear;
       sql.Add('insert into tbbancos (codigo, banco) values (:cod, :banco)');
       ParamByName('cod').Text := EditCodBanco.Text;
       ParamByName('banco').Text := EditBanco.Text;
       ExecSQL;

       EditCodBanco.Text := '';
       EditBanco.Text := '';

       query.DisposeOf;

       qBuscaBancos.Refresh;

      end;

     End;
 End;

end;

procedure TFormListaBancos.DBGrid1DblClick(Sender: TObject);
begin

 FormDadosPgtoTransporte.EditCodBanco.Text := DBGrid1.DataSource.DataSet.FieldByName('codigo').Text;
 FormDadosPgtoTransporte.EditBanco.Text    := DBGrid1.DataSource.DataSet.FieldByName('banco').Text;

 Close;

end;

procedure TFormListaBancos.FormShow(Sender: TObject);
begin

 EditCodBanco.Text := '';
 EditBanco.Text    := '';

end;

end.
