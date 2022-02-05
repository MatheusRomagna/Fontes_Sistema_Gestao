unit UFormFinanceiroTransportes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, MemDS, DBAccess, Uni, Vcl.Mask,
  System.ImageList, Vcl.ImgList, Vcl.Menus;

type
  TFormFinanceiroTransportes = class(TForm)
    PanelTop: TPanel;
    Image5: TImage;
    Label1: TLabel;
    Panel1: TPanel;
    DBGridFinanceiro: TDBGrid;
    Panel2: TPanel;
    DataSource1: TDataSource;
    qBuscaFinanceiro: TUniQuery;
    qBuscaFinanceiroid: TIntegerField;
    qBuscaFinanceiroid_transporte: TIntegerField;
    qBuscaFinanceirotransportadora: TStringField;
    qBuscaFinanceiromotorista: TStringField;
    qBuscaFinanceiroplaca: TStringField;
    qBuscaFinanceirodata_inicio: TDateField;
    qBuscaFinanceirodata_chegada: TDateField;
    qBuscaFinanceiroquantidade_veiculos: TIntegerField;
    qBuscaFinanceiroTotal_custo: TFloatField;
    qBuscaFinanceirovalor_pago: TFloatField;
    qBuscaFinanceirostatus: TStringField;
    EditPesqTransportadora: TEdit;
    ComboStatus: TComboBox;
    MaskEditDtChegada: TMaskEdit;
    ImageList1: TImageList;
    qBuscaFinanceirocusto_extra: TStringField;
    PopupMenu1: TPopupMenu;
    PagarEmLote1: TMenuItem;
    Panel3: TPanel;
    Label2: TLabel;
    EditTotalCusto: TEdit;
    Panel4: TPanel;
    Label3: TLabel;
    EditTotalPago: TEdit;
    Panel5: TPanel;
    Label4: TLabel;
    EditTotalPagar: TEdit;
    procedure DBGridFinanceiroDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure EditPesqTransportadoraKeyPress(Sender: TObject; var Key: Char);
    procedure ComboStatusChange(Sender: TObject);
    procedure MaskEditDtChegadaKeyPress(Sender: TObject; var Key: Char);
    procedure DBGridFinanceiroDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PagarEmLote1Click(Sender: TObject);
    procedure qBuscaFinanceiroAfterRefresh(DataSet: TDataSet);
  private
  selecionados: integer;
    procedure AtualizaValores;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormFinanceiroTransportes: TFormFinanceiroTransportes;

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
  UFormDataPagamento, UFormDetalhesAtendimento, UFormDetalhesAvaliacao,
  UFormDetalheTransportes, UFormDownloadNovaVersao, UFormExcelCompras,
  UFormExtratoPgtoVeiculos, UFormFornecedoresFrotista,
  UFormFornecedorFrotistaAddEditar, UFormGestaoAvaliacoes, UFormGestaoAvarias,
  UFormGestaoTransporte, UFormGestaoVistoria, UFormHistFIPE,
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
  UFormVistoriasDetalhes, UFormWebBrowse, UforTestesDiversos, UnitLogin,
  UFormPagamentoTransporte, UFormCidadesCustos, UFormDadosPgtoTransporte,
  UFormListaBancos, UFormNovaCidadeCusto, UFormPagamentoEmLoteTransportes;


Procedure TFormFinanceiroTransportes.AtualizaValores;
Begin

 Var Total, Pago, saldo : currency;

 Total := 0;
 Pago  := 0;
 Saldo := 0;


  DBGridFinanceiro.DataSource.DataSet.First;

  while not DBGridFinanceiro.DataSource.DataSet.Eof do
  Begin

   Total := Total + DBGridFinanceiro.DataSource.DataSet.FieldByName('Total_custo').AsCurrency;

   Pago  := Pago + DBGridFinanceiro.DataSource.DataSet.FieldByName('Valor_pago').AsCurrency;

   DBGridFinanceiro.DataSource.DataSet.Next;

  End;

  EditTotalCusto.Text := 'R$ ' + CurrToStr(Total);
  EditTotalPago.Text  := 'R$ ' + CurrToStr(Pago);

  Saldo := Total - Pago;

  EditTotalPagar.Text := 'R$ ' + CurrToStr(Saldo);

End;

procedure TFormFinanceiroTransportes.ComboStatusChange(Sender: TObject);
var
 status : integer;
begin

 if ComboStatus.Text = 'Pendente' then
 status := 0;
 if ComboStatus.Text = 'Solicitado' then
 status := 1;
 if ComboStatus.Text = 'Pago' then
 status := 2;

 qBuscaFinanceiro.Filter := 'status = ' + QuotedStr( ComboStatus.Text );
 qBuscaFinanceiro.Filtered := true;

 if ComboStatus.Text = 'Todos' then
 Begin
   if qBuscaFinanceiro.Filtered = true then
   Begin
     qBuscaFinanceiro.Filter := 'status like ' + QuotedStr( '%' + '' + '%'  );
     qBuscaFinanceiro.Filtered := true;
   End
   Else
   Begin
     qBuscaFinanceiro.Filter := 'status like ' + QuotedStr( '%' + '' + '%'  );
     qBuscaFinanceiro.Filtered := true;
   End;
 End;

end;

procedure TFormFinanceiroTransportes.DBGridFinanceiroDblClick(Sender: TObject);
begin

 FormPagamentoTransporte.Tag := DBGridFinanceiro.DataSource.DataSet.FieldByName('id_transporte').AsInteger;

 //ShowMessage('Vai levar id ' + IntToStr(FormPagamentoTransporte.Tag));

 FormPagamentoTransporte.Position := poScreenCenter;

 FormPagamentoTransporte.ShowModal;

end;

procedure TFormFinanceiroTransportes.DBGridFinanceiroDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
vl_icone : TPngImage;
vl_fixo : TRect;
Begin



  If qBuscaFinanceiro.FieldByName('status').Text = 'Pendente' then
  Begin
   //DBGridFinanceiro.Canvas.Brush.Color:= $0080FF00;
   DBGridFinanceiro.Canvas.Font.Color := clBlack;
   DBGridFinanceiro.Canvas.Brush.Color:= $009595FF;
   DBGridFinanceiro.Canvas.FillRect(Rect);
   DBGridFinanceiro.DefaultDrawDataCell(Rect, DBGridFinanceiro.columns[datacol].field, State);
   //DBGridFinanceiro.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  End;

  If qBuscaFinanceiro.FieldByName('status').Text = 'Pago' then
  Begin
   //DBGridFinanceiro.Canvas.Brush.Color:= $0080FF00;
   DBGridFinanceiro.Canvas.Font.Color := clBlack;
   DBGridFinanceiro.Canvas.Brush.Color:= $0076EC00;
   DBGridFinanceiro.Canvas.FillRect(Rect);
   DBGridFinanceiro.DefaultDrawDataCell(Rect, DBGridFinanceiro.columns[datacol].field, State);
   //DBGridFinanceiro.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  End;

  If qBuscaFinanceiro.FieldByName('status').Text = 'Solicitado' then
  Begin
   //DBGridFinanceiro.Canvas.Brush.Color:= $0080FF00;
   DBGridFinanceiro.Canvas.Font.Color := clBlack;
   DBGridFinanceiro.Canvas.Brush.Color:= clYellow;
   DBGridFinanceiro.Canvas.FillRect(Rect);
   DBGridFinanceiro.DefaultDrawDataCell(Rect, DBGridFinanceiro.columns[datacol].field, State);
   //DBGridFinanceiro.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  End;

end;

procedure TFormFinanceiroTransportes.EditPesqTransportadoraKeyPress(
  Sender: TObject; var Key: Char);
begin

 if key = #13 then
 Begin

  qBuscaFinanceiro.Filter := 'upper(transportadora) like ' + QuotedStr('%' + UpperCase( EditPesqTransportadora.Text ) + '%');
  qBuscaFinanceiro.Filtered := true;

 End;

end;

procedure TFormFinanceiroTransportes.FormShow(Sender: TObject);
begin

 selecionados := 0;

 AtualizaValores;

end;

procedure TFormFinanceiroTransportes.MaskEditDtChegadaKeyPress(Sender: TObject;
  var Key: Char);
begin

 if key = #13 then
 Begin

  if MaskEditDtChegada.Text <> '__/__/____' then
  Begin

  qBuscaFinanceiro.Filter := 'data_chegada like ' + QuotedStr('%' + MaskEditDtChegada.Text + '%' );
  qBuscaFinanceiro.Filtered := true;

  End
  Else
  Begin

  //qBuscaFinanceiro.Filter := 'data_chegada like ' + QuotedStr('%' + MaskEditDtChegada.Text + '%' );
  qBuscaFinanceiro.Filtered := true;

  End;

 End;

end;

procedure TFormFinanceiroTransportes.PagarEmLote1Click(Sender: TObject);
var
contador: Integer;
query : TUniQuery;
begin

 if FormPagamentoEmLoteTransportes = nil then
 Begin
   FormPagamentoEmLoteTransportes := TFormPagamentoEmLoteTransportes.Create(self);
 End;

 FormPagamentoEmLoteTransportes.Position := poScreenCenter;
 FormPagamentoEmLoteTransportes.ShowModal;

end;

procedure TFormFinanceiroTransportes.qBuscaFinanceiroAfterRefresh(
  DataSet: TDataSet);
begin

 AtualizaValores;

end;

end.
