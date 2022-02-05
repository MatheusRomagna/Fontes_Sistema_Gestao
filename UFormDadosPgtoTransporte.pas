unit UFormDadosPgtoTransporte;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls, Uni,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TFormDadosPgtoTransporte = class(TForm)
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    Label1: TLabel;
    btnLancPgto: TButton;
    ComboTipo: TComboBox;
    EditCodBanco: TEdit;
    EditBanco: TEdit;
    SpeedButton1: TSpeedButton;
    EditAgencia: TEdit;
    EditConta: TEdit;
    EditChavePix: TEdit;
    EditTotalPgto: TEdit;
    Label2: TLabel;
    DataPgto: TDateTimePicker;
    PanelTop: TPanel;
    Image5: TImage;
    Label3: TLabel;
    Label4: TLabel;
    EditFavorecidoPix: TEdit;
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnLancPgtoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDadosPgtoTransporte: TFormDadosPgtoTransporte;

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
  UFormPadroesPlanilhas, UFormPagamentoTransporte, UFormPagamentoVeiculo,
  UFormParametros, UFormPerfis, UFormPermissoesCarga,
  UFormPermissoesUsuarioAppTransporte, UFormPesquisaFipe,
  UFormPgtoExtratoVeiculo, UFormPrincipal, UFormProcPlanAcelero,
  UFormProcPlanFinal, UFormQuitacoesVeiculo, UFormRefFipes, UFormSegIPVALic,
  UFormUltimasAtualizacoes, UFormUsuarios, UFormVistoriadores,
  UFormVistoriasDetalhes, UFormWebBrowse, UforTestesDiversos, UnitLogin,
  UFormListaBancos;

procedure TFormDadosPgtoTransporte.btnLancPgtoClick(Sender: TObject);
var
 query : TUniQuery;
begin

 if ComboTipo.Text = 'Transferência' then
 Begin
   if EditAgencia.Text = '' then
   Begin
     MessageDlg('Agencia inválida!' , mtError, [mbok] , 0);
     Abort;
   End;
   if EditConta.Text = '' then
   Begin
     MessageDlg('Conta inválida!' , mtError, [mbok] , 0);
     Abort;
   End;
 End;


 try

  query := TUniQuery.Create(self);
  query.Connection := DataModuleBancoVistoria.UniConnection1;

  if StrToCurr(EditTotalPgto.Text) > StrToCurr(FormPagamentoTransporte.EditTotalSaldo.Text) then
  Begin
    MessageDlg('Total pago meior que o saldo a paga!' , mtError, [mbok] , 0);
    Abort;
  End
  Else
  Begin

    with query do begin

     sql.Clear;
     sql.Add('insert into tbfinanceirotransportepgto (id_transp_financ, data_pgto, tipo, cod_banco, banco, agencia, conta, chave_pix, valor, usuario)');
     sql.Add('values (:id, :dt, :tipo, :codbanco, :banco, :agencia, :conta, :pix, :vlr, :usuario )');

     ParamByName('id').AsInteger := FormFinanceiroTransportes.DBGridFinanceiro.DataSource.DataSet.FieldByName('id_transporte').AsInteger;

     //ShowMessage('Gravou ID ' + IntToStr(FormFinanceiroTransportes.DBGridFinanceiro.DataSource.DataSet.FieldByName('id_transporte').AsInteger));

     ParamByName('dt').AsDateTime := DataPgto.DateTime;
     ParamByName('tipo').Text := ComboTipo.Text;
     ParamByName('codbanco').Text := EditCodBanco.Text;
     ParamByName('banco').Text := EditBanco.Text;
     ParamByName('agencia').Text := EditAgencia.Text;
     ParamByName('conta').Text := EditConta.Text;
     ParamByName('pix').Text := EditChavePix.Text;
     ParamByName('vlr').AsCurrency := StrToCurr(EditTotalPgto.Text);
     ParamByName('usuario').Text := FormLoginSavauto.EditUsuario.Text;
     ExecSQL;

     sql.Clear;
     sql.Add('update tbfinanceirotransporte set valor_pago = valor_pago + :vlr, status = 2, dt_pgto=:dt where id_transporte=:id');
     ParamByName('vlr').AsCurrency := StrToCurr(EditTotalPgto.Text);
     ParamByName('id').AsInteger := FormFinanceiroTransportes.DBGridFinanceiro.DataSource.DataSet.FieldByName('id_transporte').AsInteger;
     ParamByName('dt').AsDateTime := NOW;
     Execute;

     if FormPagamentoTransporte = nil then
     FormPagamentoTransporte := TFormPagamentoTransporte.Create(self);

     FormPagamentoTransporte.CarregaFinanceiro(tag);

     if FormGestaoTransporte = nil then
     FormGestaoTransporte := TFormGestaoTransporte.Create(self);

     FormFinanceiroTransportes.qBuscaFinanceiro.Refresh;

     FormPagamentoTransporte.QPgtos.Refresh;

     ShowMessage('Pagamento efetuado com sucesso!');

    end;

    Close;

  End;


 Except
 On E:Exception do Begin

  ShowMessage('Falha ao processar pagamento, refaça a operação! ' + E.Message);

 End;

 end;

end;

procedure TFormDadosPgtoTransporte.FormShow(Sender: TObject);
begin

// ShowMessage('Trouxe id ' + IntToStr(tag));

end;

procedure TFormDadosPgtoTransporte.SpeedButton1Click(Sender: TObject);
begin

 if FormListaBancos = nil then
 Begin
   FormListaBancos := TFormListaBancos.Create(self);
 End;

 FormListaBancos.Position := poScreenCenter;
 FormListaBancos.ShowModal;

end;

end.
