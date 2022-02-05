unit UFormGestaoTransporte;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, dxGDIPlusClasses, TCButton, Data.DB, Vcl.Grids, Vcl.DBGrids,
  MemDS, DBAccess, Uni;

type
  TFormGestaoTransporte = class(TForm)
    PanelTop: TPanel;
    Image5: TImage;
    Label1: TLabel;
    Panel1: TPanel;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    DataSourceTransportes: TDataSource;
    qBuscaTransportes: TUniQuery;
    imgRefresh: TImage;
    qBuscaTransportesid: TIntegerField;
    qBuscaTransportesplaca: TStringField;
    qBuscaTransportesendereco_auto: TStringField;
    qBuscaTransportesModelo: TStringField;
    qBuscaTransportesAno: TStringField;
    qBuscaTransportescod_fipe: TStringField;
    qBuscaTransportesvlr_fipe: TFloatField;
    qBuscaTransportesDataSaída: TDateField;
    qBuscaTransportesprevisao_chegada: TDateField;
    qBuscaTransportesdata_chegada: TDateField;
    qBuscaTransportesplaca_caminhao: TStringField;
    qBuscaTransportesTransportadora: TStringField;
    qBuscaTransportesCusto_Fixo: TFloatField;
    qBuscaTransportestotal_custo: TFloatField;
    qBuscaTransportesStatus_transporte: TStringField;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure imgRefreshClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Panel6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormGestaoTransporte: TFormGestaoTransporte;

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
  UFormVistoriasDetalhes, UFormWebBrowse, UforTestesDiversos, UnitLogin,
  UFormDetalheTransportes, UFormFinanceiroTransportes;


procedure ArredondarComponente(Componente: TWinControl; const Radius: SmallInt);
var
  R : TRect;
  Rgn : HRGN;
begin
  with Componente do
  begin
    R := ClientRect;
    Rgn := CreateRoundRectRgn(R.Left, R.Top, R.Right, R.Bottom, Radius, Radius);
    Perform(EM_GETRECT, 0, lParam(@R));
    InflateRect(R, -5, -5);
    Perform(EM_SETRECTNP, 0, lParam(@R));
    SetWindowRgn(Handle, Rgn, True);
    Invalidate;
  end;
end;

procedure TFormGestaoTransporte.DBGrid1DblClick(Sender: TObject);
begin

 {if FormDetalheTransporte = nil then
 Begin
   FormDetalheTransporte := TFormDetalheTransporte.Create(self);
 End;

 FormDetalheTransporte.EditTransportadora.Text := DBGrid1.DataSource.DataSet.FieldByName('transportadora').Text;
 FormDetalheTransporte.EditPlaca.Text          := DBGrid1.DataSource.DataSet.FieldByName('placa_caminhao').Text;
 FormDetalheTransporte.EditMotorista.Text      := DBGrid1.DataSource.DataSet.FieldByName('nome_motorista').Text;
 FormDetalheTransporte.EditFone.Text           := DBGrid1.DataSource.DataSet.FieldByName('telefone').Text;
 FormDetalheTransporte.EditDtSaida.Text        := DateToStr(DBGrid1.DataSource.DataSet.FieldByName('dt_criado').AsDateTime);
 FormDetalheTransporte.EditDvPrevChegada.Text  := DateToStr(DBGrid1.DataSource.DataSet.FieldByName('previsao_chegada').AsDateTime);
 FormDetalheTransporte.EditDtChegada.Text      := DateToStr(DBGrid1.DataSource.DataSet.FieldByName('data_chegada').AsDateTime);
 FormDetalheTransporte.EditTotalCusto.Text     := DBGrid1.DataSource.DataSet.FieldByName('custo').Text;

 FormDetalheTransporte.QBuscaPlacas.Filter := 'id_transporte = ' + QuotedStr(DBGrid1.DataSource.DataSet.FieldByName('id').Text);
 FormDetalheTransporte.QBuscaPlacas.Filtered := true;

 FormDetalheTransporte.QBuscaCustoPlaca.Close;

 FormDetalheTransporte.Position := poScreenCenter;
 FormDetalheTransporte.ShowModal;
}
end;

procedure TFormGestaoTransporte.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  If qBuscaTransportes.FieldByName('Status_transporte').Text = 'Em Transporte' then
  Begin
   Dbgrid1.Canvas.Brush.Color:= $006CB3FF;
   DBGrid1.Canvas.Font.Color := clBlack;
   Dbgrid1.DefaultDrawDataCell(Rect, dbgrid1.columns[datacol].field, State);
  End
  Else
  Begin
   Dbgrid1.Canvas.Brush.Color:= $0080FF00;
   DBGrid1.Canvas.Font.Color := clBlack;
   Dbgrid1.DefaultDrawDataCell(Rect, dbgrid1.columns[datacol].field, State);
  End;

end;

procedure TFormGestaoTransporte.imgRefreshClick(Sender: TObject);
begin

 qBuscaTransportes.Filtered := false;
 qBuscaTransportes.Filter := '';
 qBuscaTransportes.Refresh;

 ShowMessage('Transportes Atualizados com sucesso!');

end;

procedure TFormGestaoTransporte.Panel6Click(Sender: TObject);
begin

 if FormFinanceiroTransportes = nil then
 Begin
    FormFinanceiroTransportes := TFormFinanceiroTransportes.Create(self);
 End;

 FormFinanceiroTransportes.qBuscaFinanceiro.Refresh;

 FormFinanceiroTransportes.WindowState := wsMaximized;
 FormFinanceiroTransportes.ShowModal;

end;

end.
