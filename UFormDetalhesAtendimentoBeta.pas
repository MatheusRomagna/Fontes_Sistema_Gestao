unit UFormDetalhesAtendimentoBeta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Uni;

type
  TFormDetalhesAtendimentoBeta = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    EditPlaca: TEdit;
    EditModelo: TEdit;
    EditAno: TEdit;
    EditCliente: TEdit;
    EditTelefone: TEdit;
    Panel2: TPanel;
    Label6: TLabel;
    PanelAgDocumento: TPanel;
    imgAgDocumentos: TImage;
    Panel4: TPanel;
    Label7: TLabel;
    PanelAgAgendamento: TPanel;
    ImgAgAgendamento: TImage;
    Panel6: TPanel;
    Label8: TLabel;
    PanelAgVerificacao: TPanel;
    ImgAgVerificacao: TImage;
    Panel8: TPanel;
    Label9: TLabel;
    PanelAgPagamento: TPanel;
    ImgAgPagamento: TImage;
    Panel10: TPanel;
    Label10: TLabel;
    PanelCancelado: TPanel;
    ImgCancelado: TImage;
    Label11: TLabel;
    EditVlrFipe: TEdit;
    procedure FormShow(Sender: TObject);
    procedure PanelAgDocumentoMouseEnter(Sender: TObject);
    procedure PanelAgDocumentoMouseLeave(Sender: TObject);
  private

    procedure BuscaAtendimento(id: integer);
    procedure MudaCor(panel: tpanel; img: timage);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDetalhesAtendimentoBeta: TFormDetalhesAtendimentoBeta;

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
  UFormDetalhesAtendimento, UFormDetalhesAvaliacao, UFormDetalheTransportes,
  UFormDownloadNovaVersao, UFormExcelCompras, UFormExtratoPgtoVeiculos,
  UFormFinanceiroTransportes, UFormFornecedoresFrotista,
  UFormFornecedorFrotistaAddEditar, UFormGestaoAvaliacoes, UFormGestaoAvarias,
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
  UFormProcPlanFinal, UFormQuitacoesVeiculo, UFormRefFipes, UFormSegIPVALic,
  UFormUltimasAtualizacoes, UFormUsuarios, UFormVistoriadores,
  UFormVistoriasDetalhes, UFormWebBrowse, UforTestesDiversos, UnitLogin;

procedure TFormDetalhesAtendimentoBeta.FormShow(Sender: TObject);
begin

 BuscaAtendimento(FormAtendimentos.DBGridAtendimentos.DataSource.DataSet.FieldByName('id').AsInteger);

end;

procedure TFormDetalhesAtendimentoBeta.BuscaAtendimento(id: integer);
var
 query :TUniQuery;
Begin

 query := TUniQuery.Create(self);
 query.Connection := DataModuleConexao.UniConnection1;

 try

  query.SQL.Clear;
  query.SQL.Add('select * from tbcompras_hist_status_atendimento where id_atendimento=:id');
  query.ParamByName('id').AsInteger := id;
  query.Open;

  if query.FieldByName('documentos').AsInteger = 1 then
  Begin
  imgAgDocumentos.Picture.LoadFromFile('C:\Sistema Savauto\imagens\confirma.png');
  PanelAgDocumento.Color := clLime;
  End
  Else
  Begin
  imgAgDocumentos.Picture.LoadFromFile('C:\Sistema Savauto\imagens\nega.png');
  End;

  if query.FieldByName('verificacao').AsInteger = 1 then
  Begin
  ImgAgVerificacao.Picture.LoadFromFile('C:\Sistema Savauto\imagens\confirma.png');
  PanelAgVerificacao.Color := clLime;
  End
  Else
  Begin
  ImgAgVerificacao.Picture.LoadFromFile('C:\Sistema Savauto\imagens\nega.png');
  End;

  if query.FieldByName('agendamento').AsInteger = 1 then
  Begin
  ImgAgAgendamento.Picture.LoadFromFile('C:\Sistema Savauto\imagens\confirma.png');
  PanelAgAgendamento.Color := clLime;
  End
  Else
  Begin
  ImgAgAgendamento.Picture.LoadFromFile('C:\Sistema Savauto\imagens\nega.png');
  End;

  if query.FieldByName('pagamento').AsInteger = 1 then
  Begin
  ImgAgPagamento.Picture.LoadFromFile('C:\Sistema Savauto\imagens\confirma.png');
  PanelAgPagamento.Color := clLime;
  End
  Else
  Begin
  ImgAgPagamento.Picture.LoadFromFile('C:\Sistema Savauto\imagens\nega.png');
  End;

  if query.FieldByName('cancelado').AsInteger = 1 then
  Begin
  ImgCancelado.Picture.LoadFromFile('C:\Sistema Savauto\imagens\confirma.png');
  PanelCancelado.Color := clLime;
  End
  Else
  Begin
  ImgCancelado.Picture.LoadFromFile('C:\Sistema Savauto\imagens\nega.png');
  End;


 Except
   On E:Exception Do
   Begin
     ShowMessage('Falha ao coletar atendimento! '+ e.Message);
     Close;
   End;
 end;

End;

procedure TFormDetalhesAtendimentoBeta.MudaCor(panel: tpanel; img: timage);
var
 diretorio : string;
Begin

diretorio := img.GetNamePath;

 if diretorio = 'C:\Sistema Savauto\imagens\nega.png' then
 Begin
   if panel.Color = $009797FF then
   Begin
    panel.Color := $00CACAFF
   End
   Else
   Begin
    panel.Color := $009797FF;
   End;
 End;

 if diretorio = 'C:\Sistema Savauto\imagens\confirma.png' then
 Begin
   if panel.Color = $009797FF then
   Begin
    panel.Color := $00CACAFF
   End
   Else
   Begin
    panel.Color := $009797FF;
   End;
 End;


End;

procedure TFormDetalhesAtendimentoBeta.PanelAgDocumentoMouseEnter(
  Sender: TObject);
begin

 MudaCor(PanelAgDocumento, imgAgDocumentos);

end;

procedure TFormDetalhesAtendimentoBeta.PanelAgDocumentoMouseLeave(
  Sender: TObject);
begin

  MudaCor(PanelAgDocumento, imgAgDocumentos);

end;

end.

