unit UFormPerfis;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, MemDS, DBAccess, Uni, Vcl.Imaging.pngimage;

type
  TFormPerfis = class(TForm)
    Label1: TLabel;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    qBuscaPerfis: TUniQuery;
    qBuscaPerfisid: TIntegerField;
    qBuscaPerfisnome: TStringField;
    img_add: TImage;
    img_edit: TImage;
    img_delete: TImage;
    procedure img_addClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPerfis: TFormPerfis;

implementation

{$R *.dfm}

uses Loading, UDataModuleBancoVistoria, UDataModuleConexao, UFormAnaliseCompra,
  UFormAnaliseCompraQuery, UFormAnaliseComprasTabela, UFormAplicaMargem,
  UFormAtualizaTabelaFipe, UFormAtuHistFIPE, UFormAtuTabFIpe,
  UFormAvaliarAvaliacao, UFormAvarias, UFormCadVistoriadores,
  UFormColunasOcultas, UFormConcFipeModelo, UFormConsutaPlacaAvaliacao,
  UFormDetalhesAvaliacao, UFormDownloadNovaVersao, UFormExcelCompras,
  UFormGestaoAvaliacoes, UFormGestaoVistoria, UFormHistFIPE,
  UFormHistoricoAvaliacoes, UFormImagem, UFormImportacoesEfetuadas,
  UFormLoading, UFormLoadingOpaco, UFormLoginSavauto, UFormLotesArval,
  UFormNovoProcessamento, UFormNovoVistoriador, UFormPadroesPlanilhas,
  UFormPermissoesCarga, UFormPrincipal, UFormProcPlanAcelero,
  UFormProcPlanFinal, UFormUltimasAtualizacoes, UFormVistoriadores,
  UFormVistoriasDetalhes, UFormWebBrowse, UforTestesDiversos, UnitLogin,
  UFormDadosPerfil, UFormCadaUsuario, UFormConcedePermissao, UFormUsuarios,
  FMX.UFormGraficosAtendimento, UDMPermissoes, UFormAgendamento,
  UFormAlteraFipeDePaxa, UFormAtendimentoMultasVeiculo, UFormAtendimentoNovo,
  UFormAtendimentos, UFormCadaNovoUsuMobile, UFormCadaUsuariosMobile,
  UFormCruzamentoFipes, UFormDetalhesAtendimento, UFormInformacoes,
  UFormLiberaPermissao, UFormPesquisaFipe, UFormQuitacoesVeiculo,
  UFormSegIPVALic;

procedure TFormPerfis.DBGrid1DblClick(Sender: TObject);
begin

 if FormLiberaPermissao = nil then
 Begin
   FormLiberaPermissao := TFormLiberaPermissao.Create(self);
 End;

 if FormCadastroUsuario = nil then
 Begin
   FormCadastroUsuario := TFormCadastroUsuario.Create(self);
 End;


 if FormLiberaPermissao.Visible then
 Begin
   FormLiberaPermissao.EditPerfil.Text   := DBGrid1.DataSource.DataSet.FieldByName('nome').Text;
   Close;
 End;

 if FormCadastroUsuario.Visible then
 Begin
   FormCadastroUsuario.editIdPerfil.Text := IntToStr(DBGrid1.DataSource.DataSet.FieldByName('id').AsInteger);
   FormCadastroUsuario.EditPerfil.Text   := DBGrid1.DataSource.DataSet.FieldByName('nome').Text;
   Close;
 End;



end;

procedure TFormPerfis.img_addClick(Sender: TObject);
begin

 if FormDadosPerfil = nil then
 Begin
   FormDadosPerfil := tFormDadosPerfil.Create(self);
 End;

 FormDadosPerfil.WindowState := wsMaximized;
 FormDadosPerfil.ShowModal;

end;

end.
