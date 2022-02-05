unit UFormAvariasItens;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, MemDS, DBAccess,
  Uni;

type
  TFormAvariasItens = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    LblItens: TLabel;
    Panel2: TPanel;
    btnAddTipo: TBitBtn;
    btnDelTipo: TBitBtn;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    qBuscaItensReparo: TUniQuery;
    qBuscaItensReparoid: TIntegerField;
    qBuscaItensReparotipo: TStringField;
    qBuscaItensReparonome: TStringField;
    qBuscaItensReparovalor: TFloatField;
    qDeletaItem: TUniQuery;
    procedure FormShow(Sender: TObject);
    procedure btnAddTipoClick(Sender: TObject);
    procedure btnDelTipoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAvariasItens: TFormAvariasItens;

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
  UFormGestaoAvaliacoes, UFormGestaoAvarias, UFormGestaoVistoria, UFormHistFIPE,
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
  UFormVistoriasDetalhes, UFormWebBrowse, UforTestesDiversos, UnitLogin,
  UFormCriacaoAvaria;

procedure TFormAvariasItens.btnAddTipoClick(Sender: TObject);
begin

 if FormCriacaoAvaria = nil then
 Begin
   FormCriacaoAvaria := TFormCriacaoAvaria.Create(self);
 End;

 FormCriacaoAvaria.EditTipo.Text := FormGestaoAvarias.DataSource1.DataSet.FieldByName('nome').Text;
 FormCriacaoAvaria.Position := poScreenCenter;
 FormCriacaoAvaria.ShowModal;

end;

procedure TFormAvariasItens.btnDelTipoClick(Sender: TObject);
begin

 if DBGrid1.DataSource.DataSet.RecordCount > 0 then
 Begin
   if MessageDlg('Deseja deletar o item: ' + DBGrid1.DataSource.DataSet.FieldByName('nome').Text, mtInformation, [mbno, mbyes] , 0) = mrYes then
   Begin
     DataModuleBancoVistoria.UniTransaction1.StartTransaction;

      qDeletaItem.SQL.Clear;
      qDeletaItem.SQL.Add('delete from tbreparos where id=:id');
      qDeletaItem.ParamByName('id').AsInteger := DBGrid1.DataSource.DataSet.FieldByName('id').AsInteger;
      qDeletaItem.Execute;

      DataModuleBancoVistoria.UniTransaction1.Commit;

      qBuscaItensReparo.Refresh;
   End;
 End
 Else
 Begin
   ShowMessage('Nenhum item selecionado');
 End;

end;

procedure TFormAvariasItens.FormShow(Sender: TObject);
begin

 qBuscaItensReparo.Filter := 'tipo=' + QuotedStr( FormGestaoAvarias.DataSource1.DataSet.FieldByName('nome').Text );
 qBuscaItensReparo.Filtered := true;

end;

end.
