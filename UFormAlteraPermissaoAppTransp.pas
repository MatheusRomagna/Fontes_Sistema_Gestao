unit UFormAlteraPermissaoAppTransp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, MemDS, DBAccess,
  Uni;

type
  TFormAlteraPermissaoAppTransp = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    ComboBoxVisualiza: TComboBox;
    ComboBoxAltera: TComboBox;
    btnAlterar: TButton;
    qAlteraPermissao: TUniQuery;
    procedure btnAlterarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAlteraPermissaoAppTransp: TFormAlteraPermissaoAppTransp;

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
  UFormAvariasItens, UFormCadaNovoUsuMobile, UFormCadastroTransportadora,
  UFormCadastroTransportadoras, UFormCadaUsuario, UFormCadaUsuariosMobile,
  UFormCadVistoriadores, UFormColunasOcultas, UFormConcedePermissao,
  UFormConcFipeModelo, UFormConsutaPlacaAvaliacao, UFormCriacaoAvaria,
  UFormCruzamentoFipes, UFormDadosPagamento, UFormDadosPerfil,
  UFormDataPagamento, UFormDetalhesAtendimento, UFormDetalhesAvaliacao,
  UFormDownloadNovaVersao, UFormExcelCompras, UFormExtratoPgtoVeiculos,
  UFormFornecedoresFrotista, UFormFornecedorFrotistaAddEditar,
  UFormGestaoAvaliacoes, UFormGestaoAvarias, UFormGestaoVistoria, UFormHistFIPE,
  UFormHistoricoAvaliacoes, UFormHistoricoObsAtn, UFormImagem,
  UFormImportacoesEfetuadas, UFormInformacoes, UFormLiberaPermissao,
  UFormListaUsuarios, UFormLoading, UFormLoadingCarregamento, UFormLoadingOpaco,
  UFormLoginSavauto, UFormLotesArval, UFormMenuFinanceiro, UFormNovaAvaliacao,
  UformNovaObs, UFormNovoProcessamento, UFormNovoUsuarioTransporte,
  UFormNovoVistoriador, UFormPadroesPlanilhas, UFormPagamentoVeiculo,
  UFormParametros, UFormPerfis, UFormPermissoesCarga,
  UFormPermissoesUsuarioAppTransporte, UFormPesquisaFipe,
  UFormPgtoExtratoVeiculo, UFormPrincipal, UFormProcPlanAcelero,
  UFormProcPlanFinal, UFormQuitacoesVeiculo, UFormRefFipes, UFormSegIPVALic,
  UFormUltimasAtualizacoes, UFormUsuarios, UFormVistoriadores,
  UFormVistoriasDetalhes, UFormWebBrowse, UforTestesDiversos, UnitLogin;

procedure TFormAlteraPermissaoAppTransp.btnAlterarClick(Sender: TObject);
begin

 if MessageDlg('Deseja mesmo alterar as seguinte permissões?' + #13 +
               ' ' + #13 +
               'Tela: ' + FormPermissoesUsuarioAppTransporte.DBGrid1.DataSource.DataSet.FieldByName('tela').Text + #13 +
               ' ' + #13 +
               'Permmissao: ' + 'Visualizar: De: ' + FormPermissoesUsuarioAppTransporte.DBGrid1.DataSource.DataSet.FieldByName('Visualiza').Text + ' Para: ' + ComboBoxVisualiza.Text + #13 +
               'Permmissao: ' + 'Altera: De: '     + FormPermissoesUsuarioAppTransporte.DBGrid1.DataSource.DataSet.FieldByName('Altera').Text + ' Para: ' + ComboBoxAltera.Text
               + #13
               , mtInformation , [mbno, mbyes ] , 0 ) = mrYes
               then
               Begin

                qAlteraPermissao.SQL.Clear;
                qAlteraPermissao.SQL.Add('update tbusuarios_app_transp_permissoes set visualiza=:v, altera=:a where id_usuario = :id and id_tela = (select id from tbapp_transportes where tela =:tela) ');
                if ComboBoxVisualiza.Text = 'SIM' then
                qAlteraPermissao.ParamByName('v').AsInteger := 1
                Else
                qAlteraPermissao.ParamByName('v').AsInteger := 0;
                if ComboBoxAltera.Text = 'SIM' then
                qAlteraPermissao.ParamByName('a').AsInteger := 1
                Else
                qAlteraPermissao.ParamByName('a').AsInteger := 0;
                qAlteraPermissao.ParamByName('id').AsInteger  := FormNovoUsuarioTransporte.Tag;
                qAlteraPermissao.ParamByName('tela').Text := FormPermissoesUsuarioAppTransporte.DataSourcePermissoes.DataSet.FieldByName('tela').Text;
                qAlteraPermissao.Execute;

                FormPermissoesUsuarioAppTransporte.qBuscaPermissoes.Refresh;

                ShowMessage('Alteração efetuada com sucesso!');
                Close;

               End;

end;

end.
