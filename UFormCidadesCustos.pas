unit UFormCidadesCustos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Data.DB, MemDS, DBAccess, Uni, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons;

type
  TFormCidadesCustos = class(TForm)
    PanelTop: TPanel;
    Image5: TImage;
    Label11: TLabel;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    QBuscaDados: TUniQuery;
    QBuscaDadosid: TIntegerField;
    QBuscaDadosnome: TStringField;
    QBuscaDadosuf: TStringField;
    QBuscaDadoscusto: TFloatField;
    QBuscaDadosusuario: TStringField;
    QBuscaDadosDtAlteracao: TDateTimeField;
    btnCriar: TSpeedButton;
    Panel2: TPanel;
    EditPesqNome: TEdit;
    btnExcluir: TSpeedButton;
    btnEditar: TSpeedButton;
    procedure EditPesqNomeKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btnCriarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCidadesCustos: TFormCidadesCustos;

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
  UFormInformacoes, UFormLiberaPermissao, UFormListaBancos, UFormListaUsuarios,
  UFormLoading, UFormLoadingCarregamento, UFormLoadingOpaco, UFormLoginSavauto,
  UFormLotesArval, UFormMenuFinanceiro, UFormNovaAvaliacao, UformNovaObs,
  UFormNovoProcessamento, UFormNovoUsuarioTransporte, UFormNovoVistoriador,
  UFormPadroesPlanilhas, UFormPagamentoTransporte, UFormPagamentoVeiculo,
  UFormParametros, UFormPerfis, UFormPermissoesCarga,
  UFormPermissoesUsuarioAppTransporte, UFormPesquisaFipe,
  UFormPgtoExtratoVeiculo, UFormPrincipal, UFormProcPlanAcelero,
  UFormProcPlanFinal, UFormQuitacoesVeiculo, UFormRefFipes, UFormSegIPVALic,
  UFormUltimasAtualizacoes, UFormUsuarios, UFormVistoriadores,
  UFormVistoriasDetalhes, UFormWebBrowse, UforTestesDiversos, UnitLogin,
  UFormNovaCidadeCusto;

procedure TFormCidadesCustos.btnCriarClick(Sender: TObject);
begin

 FormNovaCidadeCusto.Position := poScreenCenter;
 FormNovaCidadeCusto.ShowModal;

end;

procedure TFormCidadesCustos.btnEditarClick(Sender: TObject);
begin

 FormNovaCidadeCusto.Tag := 1;

 FormNovaCidadeCusto.EditCidade.Text := DBGrid1.DataSource.DataSet.FieldByName('nome').Text;
 FormNovaCidadeCusto.EditUF.Text     := DBGrid1.DataSource.DataSet.FieldByName('uf').Text;
 FormNovaCidadeCusto.EditCusto.Text  := CurrToStr(DBGrid1.DataSource.DataSet.FieldByName('custo').AsCurrency);

 FormNovaCidadeCusto.Position := poScreenCenter;
 FormNovaCidadeCusto.ShowModal;

end;

procedure TFormCidadesCustos.btnExcluirClick(Sender: TObject);
begin

 if MessageDlg('Deseja mesmo excluir o registro selecionado?' , mtWarning, [mbno, mbyes] , 0) = mryes then
 Begin

   var Query: TUniQuery;

   query := TUniQuery.Create(self);
   query.Connection := DataModuleConexao.UniConnection1;

   try

    with query do Begin

     sql.Clear;
     sql.Add('delete from tbcidadecustotransporte where id=:id');
     ParamByName('id').AsInteger := DBGrid1.DataSource.DataSet.FieldByName('id').AsInteger;
     execute;

    End;

    QBuscaDados.Filtered := false;
    QBuscaDados.Refresh;

    MessageDlg('Exclusão efetuada com sucesso!' , mtInformation, [mbok] , 0);

    Query.DisposeOf;

    Except
    On E:Exception Do
    Begin
       ShowMessage('Falha ao processar exclusão! ' + E.Message);
    End;

   end;

 End;

end;

procedure TFormCidadesCustos.EditPesqNomeKeyPress(Sender: TObject;
  var Key: Char);
begin

 if key = #13 then
 Begin
   QBuscaDados.Filter := 'nome like ' + QuotedStr('%'+ EditPesqNome.Text +'%');
   QBuscaDados.Filtered := True;
 End;

end;

procedure TFormCidadesCustos.FormShow(Sender: TObject);
begin

 EditPesqNome.Text := '';
 QBuscaDados.Filtered := false;

 QBuscaDados.Refresh;

end;

end.
