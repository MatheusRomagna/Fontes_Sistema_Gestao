unit UFormNovoUsuarioTransporte;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, dxGDIPlusClasses, Data.DB, MemDS, DBAccess, Uni;

type
  TFormNovoUsuarioTransporte = class(TForm)
    PanelTop: TPanel;
    Image5: TImage;
    Label1: TLabel;
    PanelBootom: TPanel;
    imgSalvar: TImage;
    Label2: TLabel;
    EditNome: TEdit;
    Label3: TLabel;
    EditSenha: TEdit;
    btnPermissoes: TPanel;
    qInsereUsuarioTransp: TUniQuery;
    QPermissoes: TUniQuery;
    procedure btnPermissoesClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure imgSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    id_transportadora : integer;
  end;

var
  FormNovoUsuarioTransporte: TFormNovoUsuarioTransporte;

implementation

{$R *.dfm}

uses FMX.UFormGraficosAtendimento, Loading, UDataModuleBancoVistoria,
  UDataModuleConexao, UDMPermissoes, UFormAgendamento,
  UFormAjusteDadosFipeAvaliacao, UFormAlteracaoProposta, UFormAlteracaoVeiculo,
  UFormAlteraDadosCliente, UFormAlteraFipeDePaxa, UFormAlteraMidiaAnuncio,
  UFormAlteraPlaca, UFormAnaliseCompra, UFormAnaliseCompraQuery,
  UFormAnaliseComprasTabela, UFormAplicaMargem, UFormAtendimentoMultasVeiculo,
  UFormAtendimentoNovo, UFormAtendimentos, UFormAtualizaTabelaFipe,
  UFormAtuHistFIPE, UFormAtuTabFIpe, UFormAvaliarAvaliacao, UFormAvarias,
  UFormAvariasItens, UFormCadaNovoUsuMobile, UFormCadastroTransportadora,
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
  UformNovaObs, UFormNovoProcessamento, UFormNovoVistoriador,
  UFormPadroesPlanilhas, UFormPagamentoVeiculo, UFormParametros, UFormPerfis,
  UFormPermissoesCarga, UFormPesquisaFipe, UFormPgtoExtratoVeiculo,
  UFormPrincipal, UFormProcPlanAcelero, UFormProcPlanFinal,
  UFormQuitacoesVeiculo, UFormRefFipes, UFormSegIPVALic,
  UFormUltimasAtualizacoes, UFormUsuarios, UFormVistoriadores,
  UFormVistoriasDetalhes, UFormWebBrowse, UforTestesDiversos, UnitLogin,
  UFormPermissoesUsuarioAppTransporte;

procedure TFormNovoUsuarioTransporte.btnPermissoesClick(Sender: TObject);
begin

 if FormNovoUsuarioTransporte.Tag = 0 then
 Begin
   MessageDlg('Salve o usuário antes de acessar suas permissões', mtWarning, [mbok] , 0);
 End
 Else
 Begin
   FormPermissoesUsuarioAppTransporte.qBuscaPermissoes.SQL.Clear;
   FormPermissoesUsuarioAppTransporte.qBuscaPermissoes.SQL.Add(' select ');
   FormPermissoesUsuarioAppTransporte.qBuscaPermissoes.SQL.Add('     b.id_usuario, ');
   FormPermissoesUsuarioAppTransporte.qBuscaPermissoes.SQL.Add('  a.tela, ');
   FormPermissoesUsuarioAppTransporte.qBuscaPermissoes.SQL.Add('  case when b.visualiza = 0 then ''NAO'' else ''SIM'' end as Visualiza , ');
   FormPermissoesUsuarioAppTransporte.qBuscaPermissoes.SQL.Add('  case when b.altera = 0 then ''NAO'' else ''SIM'' end as Altera ');
   FormPermissoesUsuarioAppTransporte.qBuscaPermissoes.SQL.Add('  from tbapp_transportes a ');
   FormPermissoesUsuarioAppTransporte.qBuscaPermissoes.SQL.Add('  left join tbusuarios_app_transp_permissoes b on b.id_tela = a.id ');
   FormPermissoesUsuarioAppTransporte.qBuscaPermissoes.SQL.Add('  where b.id_usuario = :id ');
   FormPermissoesUsuarioAppTransporte.qBuscaPermissoes.ParamByName('id').AsInteger := FormNovoUsuarioTransporte.Tag;
   FormPermissoesUsuarioAppTransporte.qBuscaPermissoes.Open;

   FormPermissoesUsuarioAppTransporte.Position := poScreenCenter;
   FormPermissoesUsuarioAppTransporte.ShowModal;
 End;

end;

procedure TFormNovoUsuarioTransporte.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

 EditNome.Text := '';
 EditSenha.Text := '';

 EditNome.Enabled := true;
 EditSenha.Enabled := true;

 Tag := 0;

end;

procedure TFormNovoUsuarioTransporte.imgSalvarClick(Sender: TObject);
var
 adm : integer;
begin

 if FormNovoUsuarioTransporte.Tag = 0 then
 Begin

    if FormCadastroTransportadora.EditNomeTransp.Text = 'ADMINISTRAÇÃO TRANSPORTES'  then
    adm := 1
    Else
    adm := 0;


    qInsereUsuarioTransp.SQL.Clear;
    qInsereUsuarioTransp.SQL.Add('insert into tbusuarios_transporte (id_transportadora, usuario, senha, situacao, transportadora, adm)');
    qInsereUsuarioTransp.SQL.Add('values (:id, :usuario, :senha, 1, :transportadora, :adm)');
    qInsereUsuarioTransp.ParamByName('id').AsInteger := FormCadastroTransportadoras.DBGridListaTransp.DataSource.DataSet.FieldByName('id').AsInteger;
    qInsereUsuarioTransp.ParamByName('usuario').Text := EditNome.Text;
    qInsereUsuarioTransp.ParamByName('senha').Text := EditSenha.Text;
    qInsereUsuarioTransp.ParamByName('transportadora').Text := FormCadastroTransportadora.EditNomeTransp.Text;
    qInsereUsuarioTransp.ParamByName('adm').AsInteger := adm;
    qInsereUsuarioTransp.ExecSQL;

    ShowMessage('Usuário cadastrado com sucesso!');

    qInsereUsuarioTransp.SQL.Clear;
    qInsereUsuarioTransp.SQL.Add('select * from tbusuarios_transporte where usuario=:usuario and senha=:senha ');
    qInsereUsuarioTransp.ParamByName('usuario').Text := EditNome.Text;
    qInsereUsuarioTransp.ParamByName('senha').Text := EditSenha.Text;
    qInsereUsuarioTransp.Open;

    FormNovoUsuarioTransporte.Tag := qInsereUsuarioTransp.FieldByName('id').AsInteger;

    QPermissoes.SQL.Clear;
    QPermissoes.SQL.Add('select * from tbapp_transportes order by id');
    QPermissoes.Open;

    QPermissoes.First;

    while not QPermissoes.Eof do
    Begin
      qInsereUsuarioTransp.SQL.Clear;
      qInsereUsuarioTransp.SQL.Add('insert into tbusuarios_app_transp_permissoes (id_tela, id_usuario,  id_transportadora, visualiza, altera)');
      qInsereUsuarioTransp.SQL.Add('values (:id_tela, :id_usuario, :id_transp, 0 , 0 )');
      qInsereUsuarioTransp.ParamByName('id_tela').AsInteger    := QPermissoes.FieldByName('id').AsInteger;
      qInsereUsuarioTransp.ParamByName('id_usuario').AsInteger := FormNovoUsuarioTransporte.Tag;
      qInsereUsuarioTransp.ParamByName('id_transp').AsInteger  := FormCadastroTransportadoras.DBGridListaTransp.DataSource.DataSet.FieldByName('id').AsInteger;
      qInsereUsuarioTransp.ExecSQL;

      QPermissoes.Next;
    End;

    EditNome.Enabled := false;
    EditSenha.Enabled := false;

    FormCadastroTransportadora.qBuscaUsuarios.Refresh;

 End
 Else
 Begin
    ShowMessage('Já houve uma criação de um novo usuário nesta tela, para salvar novamente feche o cadastramento e abra novamente!');
 End;

end;

end.
