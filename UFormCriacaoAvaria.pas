unit UFormCriacaoAvaria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.Buttons, Data.DB, MemDS, DBAccess, Uni;

type
  TFormCriacaoAvaria = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    LblItens: TLabel;
    Panel2: TPanel;
    btnSalvar: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EditTipo: TEdit;
    EditNome: TEdit;
    EditVlr: TEdit;
    Label4: TLabel;
    qInsereAvaria: TUniQuery;
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCriacaoAvaria: TFormCriacaoAvaria;

implementation

{$R *.dfm}

uses FMX.UFormGraficosAtendimento, Loading, UDataModuleBancoVistoria,
  UDataModuleConexao, UDMPermissoes, UFormAgendamento,
  UFormAjusteDadosFipeAvaliacao, UFormAlteraFipeDePaxa, UFormAnaliseCompra,
  UFormAnaliseCompraQuery, UFormAnaliseComprasTabela, UFormAplicaMargem,
  UFormAtendimentoMultasVeiculo, UFormAtendimentoNovo, UFormAtendimentos,
  UFormAtualizaTabelaFipe, UFormAtuHistFIPE, UFormAtuTabFIpe,
  UFormAvaliarAvaliacao, UFormAvarias, UFormAvariasItens,
  UFormCadaNovoUsuMobile, UFormCadaUsuario, UFormCadaUsuariosMobile,
  UFormCadVistoriadores, UFormColunasOcultas, UFormConcedePermissao,
  UFormConcFipeModelo, UFormConsutaPlacaAvaliacao, UFormCruzamentoFipes,
  UFormDadosPagamento, UFormDadosPerfil, UFormDataPagamento,
  UFormDetalhesAtendimento, UFormDetalhesAvaliacao, UFormDownloadNovaVersao,
  UFormExcelCompras, UFormExtratoPgtoVeiculos, UFormGestaoAvaliacoes,
  UFormGestaoAvarias, UFormGestaoVistoria, UFormHistFIPE,
  UFormHistoricoAvaliacoes, UFormHistoricoObsAtn, UFormImagem,
  UFormImportacoesEfetuadas, UFormInformacoes, UFormLiberaPermissao,
  UFormListaUsuarios, UFormLoading, UFormLoadingCarregamento, UFormLoadingOpaco,
  UFormLoginSavauto, UFormLotesArval, UFormMenuFinanceiro, UFormNovaAvaliacao,
  UformNovaObs, UFormNovoProcessamento, UFormNovoVistoriador,
  UFormPadroesPlanilhas, UFormPagamentoVeiculo, UFormPerfis,
  UFormPermissoesCarga, UFormPesquisaFipe, UFormPgtoExtratoVeiculo,
  UFormPrincipal, UFormProcPlanAcelero, UFormProcPlanFinal,
  UFormQuitacoesVeiculo, UFormRefFipes, UFormSegIPVALic,
  UFormUltimasAtualizacoes, UFormUsuarios, UFormVistoriadores,
  UFormVistoriasDetalhes, UFormWebBrowse, UforTestesDiversos, UnitLogin;

procedure TFormCriacaoAvaria.btnSalvarClick(Sender: TObject);
begin

 if EditNome.Text <> '' then
 Begin
    if StrToCurr(EditVlr.Text) > 0 then
    Begin

      DataModuleBancoVistoria.UniTransaction1.StartTransaction;

      qInsereAvaria.SQL.Clear;
      qInsereAvaria.SQL.Add('insert into tbreparos (tipo, nome, valor) values (:tipo, :nome, :vlr)');
      qInsereAvaria.ParamByName('tipo').Text := EditTipo.Text;
      qInsereAvaria.ParamByName('nome').Text := EditNome.Text;
      qInsereAvaria.ParamByName('vlr').AsCurrency := StrToCurr(EditVlr.Text);
      qInsereAvaria.ExecSQL;

      DataModuleBancoVistoria.UniTransaction1.Commit;

      FormAvariasItens.qBuscaItensReparo.Refresh;

      Close;

    End;
 End;

end;

procedure TFormCriacaoAvaria.FormShow(Sender: TObject);
begin

 EditNome.Text := '';
 EditVlr.Text := '0,00';

end;

end.
