unit UFormPgtoExtratoVeiculo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors,
  Data.Bind.EngExt, Vcl.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope,
  Vcl.Buttons, Vcl.ComCtrls, Data.DB, MemDS, DBAccess, Uni;

type
  TFormPgtoExtratoVeiculo = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    EditTipo: TEdit;
    Label3: TLabel;
    EditNome: TEdit;
    Label4: TLabel;
    EditCPF: TEdit;
    Label5: TLabel;
    EditBanco: TEdit;
    Label6: TLabel;
    EditAg: TEdit;
    Label7: TLabel;
    EditConta: TEdit;
    Label8: TLabel;
    EditPIX: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    EditValorPagar: TEdit;
    Label11: TLabel;
    DtPgto: TDateTimePicker;
    Label12: TLabel;
    HrPgto: TDateTimePicker;
    btnEfetuaPgto: TBitBtn;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
    LinkControlToField5: TLinkControlToField;
    LinkControlToField6: TLinkControlToField;
    LinkControlToField7: TLinkControlToField;
    LinkControlToField8: TLinkControlToField;
    qEfetuaPgto: TUniQuery;
    btnResumoCompra: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnEfetuaPgtoClick(Sender: TObject);
    procedure btnResumoCompraClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPgtoExtratoVeiculo: TFormPgtoExtratoVeiculo;

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
  UFormDownloadNovaVersao, UFormExcelCompras, UFormExtratoPgtoVeiculos,
  UFormGestaoAvaliacoes, UFormGestaoVistoria, UFormHistFIPE,
  UFormHistoricoAvaliacoes, UFormHistoricoObsAtn, UFormImagem,
  UFormImportacoesEfetuadas, UFormInformacoes, UFormLiberaPermissao,
  UFormLoading, UFormLoadingCarregamento, UFormLoadingOpaco, UFormLoginSavauto,
  UFormLotesArval, UFormMenuFinanceiro, UFormNovaAvaliacao, UformNovaObs,
  UFormNovoProcessamento, UFormNovoVistoriador, UFormPadroesPlanilhas,
  UFormPagamentoVeiculo, UFormPerfis, UFormPermissoesCarga, UFormPesquisaFipe,
  UFormPrincipal, UFormProcPlanAcelero, UFormProcPlanFinal,
  UFormQuitacoesVeiculo, UFormRefFipes, UFormSegIPVALic,
  UFormUltimasAtualizacoes, UFormUsuarios, UFormVistoriadores,
  UFormVistoriasDetalhes, UFormWebBrowse, UforTestesDiversos, UnitLogin,
  UClasseVeiculoAvaliacao, UFormAguarde, UFormAjusteDadosFipeAvaliacao,
  UFormAlteracaoProposta, UFormAlteracaoVeiculo, UFormAlteraDadosCliente,
  UFormAlteraMidiaAnuncio, UFormAlteraPermissaoAppTransp, UFormAlteraPlaca,
  UFormAvariasItens, UFormCadastroTransportadora, UFormCadastroTransportadoras,
  UFormCidadesCustos, UFormCriacaoAvaria, UFormDadosPgtoTransporte,
  UFormDetalhesAtendimentoBeta, UFormDetalheTransportes, UFormDivergenciasDados,
  UFormDREDados, UFormFiltrosGestao, UFormFinanceiroTransportes,
  UFormFornecedoresFrotista, UFormFornecedorFrotistaAddEditar,
  UFormGestaoAvarias, UFormGestaoDadosSavauto, UFormGestaoTransporte,
  UFormListaBancos, UFormListaUsuarios, UFormNovaCidadeCusto,
  UFormNovoUsuarioTransporte, UFormPagamentoEmLoteTransportes,
  UFormPagamentoTransporte, UFormParametros,
  UFormPermissoesUsuarioAppTransporte, UFormRelacaoEstoque, UFormTabelaCompra,
  UFormVerCarrosClasse, UFormDetalhesResumoCompra;

procedure TFormPgtoExtratoVeiculo.btnEfetuaPgtoClick(Sender: TObject);
var
 query : TUniQuery;
begin

 query := TUniQuery.Create(self);
 query.Connection := DataModuleConexao.UniConnection1;

 if MessageDlg('Deseja mesmo efetuar o pagamento?', mtInformation, [mbno, mbyes] , 0) = mrYes then
Begin

 qEfetuaPgto.SQL.Clear;
 qEfetuaPgto.SQL.Add('update tbcompras_pagamento_detalhe set valor_pago = :vlr, concluido = 1, data_pgto=:dtpgto, usuario=:usuario where id=:id');
 qEfetuaPgto.ParamByName('vlr').AsCurrency := StrToCurr(EditValorPagar.Text);
 qEfetuaPgto.ParamByName('dtpgto').AsDateTime := DtPgto.Date + HrPgto.Time;
 qEfetuaPgto.ParamByName('usuario').Text := FormLoginSavauto.EditUsuario.Text;
 qEfetuaPgto.ParamByName('id').AsInteger := FormExtratoPgtoVeiculos.DBGrid1.DataSource.DataSet.FieldByName('id').AsInteger;
 qEfetuaPgto.Execute;

 query.SQL.Clear;
 query.SQL.Add('update tbcompras_pagamento set data_pgto = :Dt_pgto, valor_pgto=:vlr, usuario_pgto=:usu, obs=:obs where id_atendimento=:id');
 query.ParamByName('Dt_pgto').AsDateTime := NOW;
 query.ParamByName('vlr').AsCurrency := StrToCurr(EditValorPagar.Text);
 query.ParamByName('usu').Text := FormLoginSavauto.EditUsuario.Text;
 query.ParamByName('obs').Text := '';
 query.ParamByName('id').AsInteger := FormExtratoPgtoVeiculos.DBGrid1.DataSource.DataSet.FieldByName('id_atendimento').AsInteger;
 query.Execute;

 query.SQL.Clear;
 query.SQL.Add('update tbcompras_status_atendimento set status_nome = :status, valor = 100 where id_atendimento = :id');
 query.ParamByName('status').Text  := 'Concluido';
 query.ParamByName('id').AsInteger := FormExtratoPgtoVeiculos.DBGrid1.DataSource.DataSet.FieldByName('id_atendimento').AsInteger;
 query.Execute;

 query.sql.Clear;
 query.SQL.Add('update tbcompras_atendimento set situacao = :status where id = :ID');
 query.ParamByName('status').Text := 'Concluido';
 query.ParamByName('ID').AsInteger := FormExtratoPgtoVeiculos.DBGrid1.DataSource.DataSet.FieldByName('id_atendimento').AsInteger;
 query.Execute;

 query.sql.Clear;
 query.SQL.Add('update tbcompras_hist_status_atendimento set pagamento = 1 where id_atendimento = :ID');
 query.ParamByName('ID').AsInteger := FormExtratoPgtoVeiculos.DBGrid1.DataSource.DataSet.FieldByName('id_atendimento').AsInteger;
 query.Execute;

 MessageDlg('Pagamento efetuado com sucesso!', mtInformation, [mbok] , 0);

 FormExtratoPgtoVeiculos.qBuscaPgtosVeiculos.Refresh;

 Close;

End;

end;

procedure TFormPgtoExtratoVeiculo.btnResumoCompraClick(Sender: TObject);
begin

 if FormDetalhesResumoCompra = nil then
 FormDetalhesResumoCompra := TFormDetalhesResumoCompra.Create(self);

 FormDetalhesResumoCompra.Position := poScreenCenter;

 FormDetalhesResumoCompra.ShowModal;

end;

procedure TFormPgtoExtratoVeiculo.FormShow(Sender: TObject);
begin

 DtPgto.Date := NOW;
 HrPgto.DateTime := NOW;

end;

end.
