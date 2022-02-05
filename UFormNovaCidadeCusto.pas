unit UFormNovaCidadeCusto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.Buttons, Uni;

type
  TFormNovaCidadeCusto = class(TForm)
    PanelTop: TPanel;
    Image5: TImage;
    Label11: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EditCidade: TEdit;
    EditUF: TEdit;
    EditCusto: TEdit;
    btnSalvar: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure InsereCidade(cidade, uf: string; custo: currency; id: integer);

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormNovaCidadeCusto: TFormNovaCidadeCusto;

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
  UFormCadVistoriadores, UFormCidadesCustos, UFormColunasOcultas,
  UFormConcedePermissao, UFormConcFipeModelo, UFormConsutaPlacaAvaliacao,
  UFormCriacaoAvaria, UFormCruzamentoFipes, UFormDadosPagamento,
  UFormDadosPerfil, UFormDadosPgtoTransporte, UFormDataPagamento,
  UFormDetalhesAtendimento, UFormDetalhesAvaliacao, UFormDetalheTransportes,
  UFormDownloadNovaVersao, UFormExcelCompras, UFormExtratoPgtoVeiculos,
  UFormFinanceiroTransportes, UFormFornecedoresFrotista,
  UFormFornecedorFrotistaAddEditar, UFormGestaoAvaliacoes, UFormGestaoAvarias,
  UFormGestaoTransporte, UFormGestaoVistoria, UFormHistFIPE,
  UFormHistoricoAvaliacoes, UFormHistoricoObsAtn, UFormImagem,
  UFormImportacoesEfetuadas, UFormInformacoes, UFormLiberaPermissao,
  UFormListaBancos, UFormListaUsuarios, UFormLoading, UFormLoadingCarregamento,
  UFormLoadingOpaco, UFormLoginSavauto, UFormLotesArval, UFormMenuFinanceiro,
  UFormNovaAvaliacao, UformNovaObs, UFormNovoProcessamento,
  UFormNovoUsuarioTransporte, UFormNovoVistoriador, UFormPadroesPlanilhas,
  UFormPagamentoTransporte, UFormPagamentoVeiculo, UFormParametros, UFormPerfis,
  UFormPermissoesCarga, UFormPermissoesUsuarioAppTransporte, UFormPesquisaFipe,
  UFormPgtoExtratoVeiculo, UFormPrincipal, UFormProcPlanAcelero,
  UFormProcPlanFinal, UFormQuitacoesVeiculo, UFormRefFipes, UFormSegIPVALic,
  UFormUltimasAtualizacoes, UFormUsuarios, UFormVistoriadores,
  UFormVistoriasDetalhes, UFormWebBrowse, UforTestesDiversos, UnitLogin,
  UFormAguarde, UFormDetalhesAtendimentoBeta, UFormPagamentoEmLoteTransportes;

procedure TFormNovaCidadeCusto.InsereCidade(cidade: string; uf: string; custo: currency; id: integer);
Var
  queryS, queryI : TUniQuery;
Begin

 queryS := TUniQuery.Create(self);
 queryI := TUniQuery.Create(self);

 queryS.Connection := DataModuleBancoVistoria.UniConnection1;
 queryI.Connection := DataModuleBancoVistoria.UniConnection1;

 try

   queryS.SQL.Clear;
   queryS.SQL.Add('select * from tbtransporte_custo_cidade where cidade=:cidade and uf=:uf and id_transportadora=:id');
   queryS.ParamByName('cidade').Text := cidade;
   queryS.ParamByName('uf').Text     := uf;
   queryS.ParamByName('id').AsInteger := id;
   queryS.Open;

   if queryS.RecordCount > 0 then
   Begin
     MessageDlg('Já existe uma cidade cadastrada com este nome para a mesma uf informada' , mtError, [mbok] , 0);
     Abort;
   End
   Else
   Begin
     if Tag = 0 then
     Begin
       queryI.SQL.Clear;
       queryI.SQL.Add('insert into tbtransporte_custo_cidade (id_transportadora, cidade, uf, custo)');
       queryI.SQL.Add('values (:id, :cidade, :uf, :custo)');
       queryI.ParamByName('cidade').Text := cidade;
       queryI.ParamByName('uf').Text := uf;
       queryI.ParamByName('custo').AsCurrency := custo;
       queryI.ParamByName('id').AsInteger := id;
       queryI.ExecSQL;
     End
     Else
     Begin
       queryI.SQL.Clear;
       queryI.SQL.Add('update tbtransporte_custo_cidade set cidade=:cidade, uf=:uf, custo=:custo');
       queryI.SQL.Add('where id=:id');
       queryI.ParamByName('cidade').Text := cidade;
       queryI.ParamByName('uf').Text := uf;
       queryI.ParamByName('custo').AsCurrency := custo;
       queryI.ParamByName('id').AsInteger := id;
       queryI.Execute;
     End;
   End;

   queryS.DisposeOf;
   queryI.DisposeOf;

   FormCidadesCustos.QBuscaDados.Refresh;

   EditUF.Text := '';
   EditCidade.Text := '';
   EditCusto.Text := '0,00';

   FormCadastroTransportadora.qBuscaCidades.Refresh;

   MessageDlg('Cadastro de cidade efetuado com sucesso!', mtInformation, [mbok] , 0);

   Close;

   Except
   On E:Exception do
   Begin
     ShowMessage('Falha ao processar operação! ' + E.Message);
   End;

 end;

End;

procedure TFormNovaCidadeCusto.btnSalvarClick(Sender: TObject);
begin

  if EditCusto.Text = '' then
  EditCusto.Text := '0,00';

  if Tag = 0 then

  InsereCidade(EditCidade.Text, EditUF.Text, StrToCurr(EditCusto.Text), FormCadastroTransportadoras.DBGridListaTransp.DataSource.DataSet.FieldByName('ID').AsInteger )

  Else

  InsereCidade(EditCidade.Text, EditUF.Text, StrToCurr(EditCusto.Text), FormCadastroTransportadora.DBGrid1.DataSource.DataSet.FieldByName('id').AsInteger );

  Close;
end;

procedure TFormNovaCidadeCusto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

 tag := 0;

 EditUF.Text := '';
 EditCidade.Text := '';
 EditCusto.Text := '';

end;

procedure TFormNovaCidadeCusto.FormShow(Sender: TObject);
begin

 {EditUF.Text := '';
 EditCidade.Text :='';
 E-ditCusto.Text := '';}

end;

end.
