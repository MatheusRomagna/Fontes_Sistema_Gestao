unit UFormNovaAvaliacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, MemDS, DBAccess,
  Uni;

type
  TFormNovaAvaliacao = class(TForm)
    Label1: TLabel;
    EditNovaAvaliacao: TEdit;
    Label2: TLabel;
    qAlteraAvaliacaoGestao: TUniQuery;
    qAlteraAvaliacaoMobile: TUniQuery;
    procedure EditNovaAvaliacaoEnter(Sender: TObject);
    procedure EditNovaAvaliacaoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormNovaAvaliacao: TFormNovaAvaliacao;

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
  UFormCruzamentoFipes, UFormDadosPerfil, UFormDetalhesAtendimento,
  UFormDetalhesAvaliacao, UFormDownloadNovaVersao, UFormExcelCompras,
  UFormGestaoAvaliacoes, UFormGestaoVistoria, UFormHistFIPE,
  UFormHistoricoAvaliacoes, UFormHistoricoObsAtn, UFormImagem,
  UFormImportacoesEfetuadas, UFormInformacoes, UFormLiberaPermissao,
  UFormLoading, UFormLoadingOpaco, UFormLoginSavauto, UFormLotesArval,
  UformNovaObs, UFormNovoProcessamento, UFormNovoVistoriador,
  UFormPadroesPlanilhas, UFormPerfis, UFormPermissoesCarga, UFormPesquisaFipe,
  UFormPrincipal, UFormProcPlanAcelero, UFormProcPlanFinal,
  UFormQuitacoesVeiculo, UFormRefFipes, UFormSegIPVALic,
  UFormUltimasAtualizacoes, UFormUsuarios, UFormVistoriadores,
  UFormVistoriasDetalhes, UFormWebBrowse, UforTestesDiversos, UnitLogin;

procedure TFormNovaAvaliacao.EditNovaAvaliacaoEnter(Sender: TObject);
begin

 EditNovaAvaliacao.SelectAll;

end;

procedure TFormNovaAvaliacao.EditNovaAvaliacaoKeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
 Begin
  if EditNovaAvaliacao.Text <> '' then
  Begin
   if MessageDlg('Deseja mesmo alterar o valor?', mtInformation, [mbok, mbno], 0) = mrYes then
    Begin
      qAlteraAvaliacaoMobile.SQL.Clear;
      qAlteraAvaliacaoMobile.SQL.Add('update tbavaliacoes set avaliacao=:new where placa=:pl');
      qAlteraAvaliacaoMobile.ParamByName('new').AsCurrency := StrToCurr(EditNovaAvaliacao.Text);
      qAlteraAvaliacaoMobile.ParamByName('pl').Text := FormAtendimentoNovo.EditPlaca.Text;
      qAlteraAvaliacaoMobile.Execute;
      qAlteraAvaliacaoMobile.Close;
      EditNovaAvaliacao.Text := '0,00';
      Close;
    End;
  End
  Else
  Begin
    MessageDlg('Valor inválido', mtError, [mbok] , 0);
    Abort;
  End;
 End;
end;

end.
