unit UFormPagamentoVeiculo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, MemDS, DBAccess, Uni;

type
  TFormPagamentoVeiculo = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    BtnPagar: TBitBtn;
    DataSource1: TDataSource;
    qPgtos: TUniQuery;
    qPgtosid: TIntegerField;
    qPgtosid_atendimento: TIntegerField;
    qPgtosusuario: TStringField;
    qPgtosvalor: TFloatField;
    qPgtosvalor_pgto: TFloatField;
    qPgtosdata_env: TDateTimeField;
    qPgtosdata_pgto: TDateTimeField;
    qPgtosusuario_pgto: TStringField;
    qPgtosobs: TStringField;
    lblPagar: TLabel;
    lblPago: TLabel;
    LblSaldo: TLabel;
    procedure FormShow(Sender: TObject);
    procedure BtnPagarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPagamentoVeiculo: TFormPagamentoVeiculo;

implementation

{$R *.dfm}

uses FMX.UFormGraficosAtendimento, Loading, UDataModuleBancoVistoria,
  UDataModuleConexao, UDMPermissoes, UFormAgendamento, UFormAlteraFipeDePaxa,
  UFormAnaliseCompra, UFormAnaliseCompraQuery, UFormAnaliseComprasTabela,
  UFormAplicaMargem, UFormAtendimentoMultasVeiculo, UFormAtendimentoNovo,
  UFormAtendimentos, UFormAtualizaTabelaFipe, UFormAtuHistFIPE, UFormAtuTabFIpe,
  UFormAvaliarAvaliacao, UFormAvarias, UFormCadaNovoUsuMobile, UFormCadaUsuario,
  UFormCadaUsuariosMobile, UFormCadVistoriadores, UFormColunasOcultas,
  UFormConcedePermissao, UFormConcFipeModelo, UFormConsutaPlacaAvaliacao,
  UFormCruzamentoFipes, UFormDadosPagamento, UFormDadosPerfil,
  UFormDataPagamento, UFormDetalhesAtendimento, UFormDetalhesAvaliacao,
  UFormDownloadNovaVersao, UFormExcelCompras, UFormGestaoAvaliacoes,
  UFormGestaoVistoria, UFormHistFIPE, UFormHistoricoAvaliacoes,
  UFormHistoricoObsAtn, UFormImagem, UFormImportacoesEfetuadas,
  UFormInformacoes, UFormLiberaPermissao, UFormLoading,
  UFormLoadingCarregamento, UFormLoadingOpaco, UFormLoginSavauto,
  UFormLotesArval, UFormNovaAvaliacao, UformNovaObs, UFormNovoProcessamento,
  UFormNovoVistoriador, UFormPadroesPlanilhas, UFormPerfis,
  UFormPermissoesCarga, UFormPesquisaFipe, UFormPrincipal, UFormProcPlanAcelero,
  UFormProcPlanFinal, UFormQuitacoesVeiculo, UFormRefFipes, UFormSegIPVALic,
  UFormUltimasAtualizacoes, UFormUsuarios, UFormVistoriadores,
  UFormVistoriasDetalhes, UFormWebBrowse, UforTestesDiversos, UnitLogin;

procedure TFormPagamentoVeiculo.BtnPagarClick(Sender: TObject);
begin

  if qPgtosvalor_pgto.AsCurrency < qPgtosvalor.AsCurrency then
  Begin
    FormDataPagamento.Position := poScreenCenter;
    FormDataPagamento.ShowModal;
  End
  Else
  Begin
    MessageDlg('Veículo já liquidado, verifique com o administrador', mtInformation, [mbok] , 0);
  End;
end;

procedure TFormPagamentoVeiculo.FormShow(Sender: TObject);
begin

 lblPagar.Caption := 'Pagar: ' +CurrToStr(qPgtosvalor.AsCurrency);
 lblPago.Caption  :=  'Pago: ' +CurrToStr(qPgtosvalor_pgto.AsCurrency);
 LblSaldo.Caption := 'Saldo: ' +CurrToStr(qPgtosvalor.AsCurrency - qPgtosvalor_pgto.AsCurrency);

end;

end.
