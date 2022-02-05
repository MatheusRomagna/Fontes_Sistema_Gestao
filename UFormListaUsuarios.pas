unit UFormListaUsuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  MemDS, DBAccess, Uni;

type
  TFormListaUsuarios = class(TForm)
    Label1: TLabel;
    ComboBoxUsuarios: TComboBox;
    BitBtn1: TBitBtn;
    qBuscaUsuarios: TUniQuery;
    qTrocaUsuarios: TUniQuery;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormListaUsuarios: TFormListaUsuarios;

implementation

{$R *.dfm}

uses FMX.UFormGraficosAtendimento, Loading, UDataModuleBancoVistoria,
  UDataModuleConexao, UDMPermissoes, UFormAgendamento,
  UFormAjusteDadosFipeAvaliacao, UFormAlteraFipeDePaxa, UFormAnaliseCompra,
  UFormAnaliseCompraQuery, UFormAnaliseComprasTabela, UFormAplicaMargem,
  UFormAtendimentoMultasVeiculo, UFormAtendimentoNovo, UFormAtendimentos,
  UFormAtualizaTabelaFipe, UFormAtuHistFIPE, UFormAtuTabFIpe,
  UFormAvaliarAvaliacao, UFormAvarias, UFormCadaNovoUsuMobile, UFormCadaUsuario,
  UFormCadaUsuariosMobile, UFormCadVistoriadores, UFormColunasOcultas,
  UFormConcedePermissao, UFormConcFipeModelo, UFormConsutaPlacaAvaliacao,
  UFormCruzamentoFipes, UFormDadosPagamento, UFormDadosPerfil,
  UFormDataPagamento, UFormDetalhesAtendimento, UFormDetalhesAvaliacao,
  UFormDownloadNovaVersao, UFormExcelCompras, UFormExtratoPgtoVeiculos,
  UFormGestaoAvaliacoes, UFormGestaoVistoria, UFormHistFIPE,
  UFormHistoricoAvaliacoes, UFormHistoricoObsAtn, UFormImagem,
  UFormImportacoesEfetuadas, UFormInformacoes, UFormLiberaPermissao,
  UFormLoading, UFormLoadingCarregamento, UFormLoadingOpaco, UFormLoginSavauto,
  UFormLotesArval, UFormMenuFinanceiro, UFormNovaAvaliacao, UformNovaObs,
  UFormNovoProcessamento, UFormNovoVistoriador, UFormPadroesPlanilhas,
  UFormPagamentoVeiculo, UFormPerfis, UFormPermissoesCarga, UFormPesquisaFipe,
  UFormPgtoExtratoVeiculo, UFormPrincipal, UFormProcPlanAcelero,
  UFormProcPlanFinal, UFormQuitacoesVeiculo, UFormRefFipes, UFormSegIPVALic,
  UFormUltimasAtualizacoes, UFormUsuarios, UFormVistoriadores,
  UFormVistoriasDetalhes, UFormWebBrowse, UforTestesDiversos, UnitLogin;

procedure TFormListaUsuarios.BitBtn1Click(Sender: TObject);
begin

  if ComboBoxUsuarios.Text <> '' then
  Begin

   qTrocaUsuarios.SQL.Clear;
   qTrocaUsuarios.SQL.Add('update tbcompras_atendimento set usuario=:novo where id=:id');
   qTrocaUsuarios.ParamByName('id').AsInteger := FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger;
   qTrocaUsuarios.ParamByName('novo').Text    := ComboBoxUsuarios.Text;
   qTrocaUsuarios.Execute;

   FormAtendimentos.qBuscaAtendimentos.Refresh;

   Close;

  End;

end;

procedure TFormListaUsuarios.FormShow(Sender: TObject);
begin

 ComboBoxUsuarios.Items.Clear;

 qBuscaUsuarios.SQL.Clear;
 qBuscaUsuarios.SQL.Add('select nome from tbusuarios order by nome');
 qBuscaUsuarios.Open;

 qBuscaUsuarios.First;

 while not qBuscaUsuarios.Eof do
 Begin
   ComboBoxUsuarios.Items.Add(qBuscaUsuarios.FieldByName('nome').Text);
   qBuscaUsuarios.Next;
 End;

end;

end.
