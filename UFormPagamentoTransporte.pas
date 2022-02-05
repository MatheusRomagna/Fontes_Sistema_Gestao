unit UFormPagamentoTransporte;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Uni, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, MemDS, DBAccess, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TFormPagamentoTransporte = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBGrid1: TDBGrid;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    DBGrid2: TDBGrid;
    EditTransportadora: TEdit;
    EditMotorista: TEdit;
    EditPlaca: TEdit;
    EditDtSaida: TEdit;
    EditDtChegada: TEdit;
    EditTotalPagar: TEdit;
    EditTotalPago: TEdit;
    EditTotalSaldo: TEdit;
    btnLancPgto: TButton;
    btnLimparPgto: TButton;
    DSVeiculos: TDataSource;
    DSPgtos: TDataSource;
    QVeiculos: TUniQuery;
    QPgtos: TUniQuery;
    QVeiculosid: TIntegerField;
    QVeiculosid_placa: TIntegerField;
    QVeiculosplaca: TStringField;
    QVeiculosdata: TDateTimeField;
    QVeiculosvalor: TFloatField;
    QVeiculosobs: TStringField;
    QVeiculosusuario: TStringField;
    QVeiculosid_transporte: TIntegerField;
    QPgtosid: TIntegerField;
    QPgtosdata_pgto: TDateTimeField;
    QPgtostipo: TStringField;
    QPgtoscod_banco: TStringField;
    QPgtosbanco: TStringField;
    QPgtosagencia: TStringField;
    QPgtosconta: TStringField;
    QPgtosoperacao: TStringField;
    QPgtoschave_pix: TStringField;
    QPgtosvalor: TFloatField;
    QPgtosusuario: TStringField;
    QPgtosid_transp_financ: TIntegerField;
    PanelTop: TPanel;
    Image5: TImage;
    Label11: TLabel;
    Label12: TLabel;
    EditCustoTransporte: TEdit;
    Label13: TLabel;
    EditCustoExtra: TEdit;
    procedure FormShow(Sender: TObject);
    procedure btnLancPgtoClick(Sender: TObject);
    procedure btnLimparPgtoClick(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
    procedure CarregaFinanceiro(id: integer);
  end;

var
  FormPagamentoTransporte: TFormPagamentoTransporte;

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
  UFormExtratoPgtoVeiculos, UFormFinanceiroTransportes,
  UFormFornecedoresFrotista, UFormFornecedorFrotistaAddEditar,
  UFormGestaoAvaliacoes, UFormGestaoAvarias, UFormGestaoTransporte,
  UFormGestaoVistoria, UFormHistFIPE, UFormHistoricoAvaliacoes,
  UFormHistoricoObsAtn, UFormImagem, UFormImportacoesEfetuadas,
  UFormInformacoes, UFormLiberaPermissao, UFormListaUsuarios, UFormLoading,
  UFormLoadingCarregamento, UFormLoadingOpaco, UFormLoginSavauto,
  UFormLotesArval, UFormMenuFinanceiro, UFormNovaAvaliacao, UformNovaObs,
  UFormNovoProcessamento, UFormNovoUsuarioTransporte, UFormNovoVistoriador,
  UFormPadroesPlanilhas, UFormPagamentoVeiculo, UFormParametros, UFormPerfis,
  UFormPermissoesCarga, UFormPermissoesUsuarioAppTransporte, UFormPesquisaFipe,
  UFormPgtoExtratoVeiculo, UFormPrincipal, UFormProcPlanAcelero,
  UFormProcPlanFinal, UFormQuitacoesVeiculo, UFormRefFipes, UFormSegIPVALic,
  UFormUltimasAtualizacoes, UFormUsuarios, UFormVistoriadores,
  UFormVistoriasDetalhes, UFormWebBrowse, UforTestesDiversos, UnitLogin,
  UFormDadosPgtoTransporte;

procedure TFormPagamentoTransporte.btnLancPgtoClick(Sender: TObject);
begin

 if FormDadosPgtoTransporte = nil then
 Begin
   FormDadosPgtoTransporte := TFormDadosPgtoTransporte.Create(self);
 End;

 if StrToFloat(EditTotalSaldo.Text) <= 0 then
 Begin
   MessageDlg('Transporte já liquidado!', mtWarning, [mbok] , 0);
 End
 Else
 Begin

   var QCarregaDados : TUniQuery;

   QCarregaDados := TUniQuery.Create(self);
   QCarregaDados.Connection := DataModuleBancoVistoria.UniConnection1;

   QCarregaDados.SQL.Clear;
   QCarregaDados.SQL.Add('select id from tbtransportadoras where nome=:nome');
   QCarregaDados.ParamByName('nome').Text := EditTransportadora.Text;
   QCarregaDados.Open;

   var id : integer;

   id := QCarregaDados.FieldByName('id').AsInteger;

   QCarregaDados.SQL.Clear;
   QCarregaDados.SQL.Add('select * from tbtransportadoras_dadosbancarios where id_transportadora=:id');
   QCarregaDados.ParamByName('id').AsInteger := id;
   QCarregaDados.Open;

   FormDadosPgtoTransporte.EditAgencia.Text := QCarregaDados.FieldByName('agencia').Text;
   FormDadosPgtoTransporte.EditConta.Text   := QCarregaDados.FieldByName('conta').Text;
   FormDadosPgtoTransporte.EditChavePix.Text:= QCarregaDados.FieldByName('pix').Text;
   FormDadosPgtoTransporte.EditFavorecidoPix.Text := QCarregaDados.FieldByName('favorecido').Text;

   FormDadosPgtoTransporte.Tag := FormPagamentoTransporte.tag;
   FormDadosPgtoTransporte.EditTotalPgto.Text := EditTotalSaldo.Text;
   FormDadosPgtoTransporte.Position := poScreenCenter;
   FormDadosPgtoTransporte.ShowModal;
 End;

end;

procedure TFormPagamentoTransporte.btnLimparPgtoClick(Sender: TObject);
var
 queryDelete : TUniQuery;
begin

 if QPgtos.RecordCount < 1 then
 Begin
   ShowMessage('Não há pagamento carregado para limpeza!');
 End
 Else
 Begin
    if MessageDlg('Deseja limpar os pagamentos já lançados?' , mtInformation, [mbno, mbyes] , 0) = mrYes then
    Begin

     queryDelete := TUniQuery.Create(self);
     queryDelete.Connection := DataModuleBancoVistoria.UniConnection1;

     with queryDelete do begin

      sql.Clear;
      sql.Add('delete from tbfinanceirotransportepgto where id_transp_financ = :id');
      ParamByName('id').AsInteger := FormFinanceiroTransportes.DBGridFinanceiro.DataSource.DataSet.FieldByName('id_transporte').AsInteger;
      Execute;

      sql.Clear;
      sql.Add('update tbfinanceirotransporte set valor_pago = 0 , status = 0 where id=:id');
      ParamByName('id').AsInteger := FormFinanceiroTransportes.DBGridFinanceiro.DataSource.DataSet.FieldByName('id').AsInteger;
      Execute;

      FormFinanceiroTransportes.qBuscaFinanceiro.Refresh;

      QPgtos.Open;
      QPgtos.Refresh;

      MessageDlg('Liquidação estornada com sucesso!', mtInformation, [mbok] , 0);

     end;

    End;
 End;

end;

procedure TFormPagamentoTransporte.CarregaFinanceiro(id :integer);
Var
 query : TUniQuery;
Begin

 query := TUniQuery.Create(self);
 query.Connection := DataModuleBancoVistoria.UniConnection1;

 try

  with query do begin

   sql.Clear;
   sql.Add('select * from tbfinanceirotransporte where id_transporte=:id');
   ParamByName('id').AsInteger := id;
   Open;

   if RecordCount > 0 then
   Begin

    EditTransportadora.Text := FieldByName('transportadora').Text;
    EditMotorista.Text      := FieldByName('motorista').Text;
    EditPlaca.Text          := FieldByName('placa').Text;
    EditDtSaida.Text        := DateToStr(FieldByName('data_inicio').AsDateTime);
    EditDtChegada.Text      := DateToStr(FieldByName('data_chegada').AsDateTime);
    EditTotalPagar.Text     := CurrToStr(FieldByName('Total_Custo').AsCurrency);
    EditTotalPago.Text      := CurrToStr(FieldByName('valor_pago').AsCurrency);
    EditTotalSaldo.Text     := CurrToStr(FieldByName('Total_Custo').AsCurrency - FieldByName('valor_pago').AsCurrency);

    if FieldByName('custo_extra').IsNull then
    EditCustoExtra.Text := '0,00'
    Else
    EditCustoExtra.Text      := CurrToStr(FieldByName('custo_extra').AsCurrency);

    EditCustoTransporte.Text := CurrToStr(FieldByName('Total_custo').AsCurrency);


    QVeiculos.Filtered := false;
    QVeiculos.Filter := 'id_transporte = ' + QuotedStr( IntToStr(id) );
    QVeiculos.Filtered := true;
    QVeiculos.Open;

    QPgtos.Filtered := false;
    QPgtos.Filter := 'id_transp_financ = ' + QuotedStr( IntToStr(id) );
    QPgtos.Filtered := true;
    QPgtos.Open;

   End;

  end;

 Except
   On E:Exception do
   Begin
      ShowMessage('Falha ao carregar dados, refaça a operação! ' + E.Message);
   End;
 end;

End;

procedure TFormPagamentoTransporte.FormShow(Sender: TObject);
begin

 CarregaFinanceiro( Tag );

end;

end.
