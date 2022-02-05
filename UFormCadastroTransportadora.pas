unit UFormCadastroTransportadora;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxGDIPlusClasses, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.ComCtrls, Data.DB, MemDS, DBAccess,
  Uni, ConsultaCEP, Vcl.Grids, Vcl.DBGrids;

type
  TFormCadastroTransportadora = class(TForm)
    PanelTop: TPanel;
    Image5: TImage;
    Label1: TLabel;
    PanelBootom: TPanel;
    imgSalvar: TImage;
    PageControl1: TPageControl;
    PageDadosGerais: TTabSheet;
    PageConfiguracoes: TTabSheet;
    Label2: TLabel;
    EditNomeTransp: TEdit;
    Label3: TLabel;
    EditCnpj: TEdit;
    Label4: TLabel;
    EditCEP: TEdit;
    Label5: TLabel;
    EditCidade: TEdit;
    Label6: TLabel;
    EditUF: TEdit;
    Label7: TLabel;
    EditBairro: TEdit;
    Label8: TLabel;
    EditRua: TEdit;
    qInsereTransp: TUniQuery;
    PageControl2: TPageControl;
    TabUsuarios: TTabSheet;
    TabConfiguracoes: TTabSheet;
    Panel1: TPanel;
    DBGridUsuarios: TDBGrid;
    qBuscaUsuarios: TUniQuery;
    DataSourceUsuarios: TDataSource;
    qBuscaUsuariosid: TIntegerField;
    qBuscaUsuariosid_transportadora: TIntegerField;
    qBuscaUsuariosusuario: TStringField;
    qBuscaUsuariossenha: TStringField;
    qBuscaUsuariosdt_login: TDateField;
    qBuscaUsuariosversao: TStringField;
    qBuscaUsuariossituacao: TIntegerField;
    Image1: TImage;
    TabSheet1: TTabSheet;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    EditPix: TEdit;
    EditBanco: TEdit;
    EditAgencia: TEdit;
    EditConta: TEdit;
    btnSalvarFinanceiro: TPanel;
    Label13: TLabel;
    EditFavorecido: TEdit;
    Label14: TLabel;
    DBGrid1: TDBGrid;
    btnNovo: TButton;
    Button1: TButton;
    Button2: TButton;
    DataSource1: TDataSource;
    qBuscaCidades: TUniQuery;
    qBuscaCidadesid: TIntegerField;
    qBuscaCidadesid_transportadora: TIntegerField;
    qBuscaCidadescidade: TStringField;
    qBuscaCidadesuf: TStringField;
    qBuscaCidadescusto: TFloatField;
    procedure imgSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EditCEPKeyPress(Sender: TObject; var Key: Char);
    procedure Image1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSalvarFinanceiroMouseEnter(Sender: TObject);
    procedure btnSalvarFinanceiroMouseLeave(Sender: TObject);
    procedure btnSalvarFinanceiroClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadastroTransportadora: TFormCadastroTransportadora;

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
  UFormAvariasItens, UFormCadaNovoUsuMobile, UFormCadastroTransportadoras,
  UFormCadaUsuario, UFormCadaUsuariosMobile, UFormCadVistoriadores,
  UFormColunasOcultas, UFormConcedePermissao, UFormConcFipeModelo,
  UFormConsutaPlacaAvaliacao, UFormCriacaoAvaria, UFormCruzamentoFipes,
  UFormDadosPagamento, UFormDadosPerfil, UFormDataPagamento,
  UFormDetalhesAtendimento, UFormDetalhesAvaliacao, UFormDownloadNovaVersao,
  UFormExcelCompras, UFormExtratoPgtoVeiculos, UFormFornecedoresFrotista,
  UFormFornecedorFrotistaAddEditar, UFormGestaoAvaliacoes, UFormGestaoAvarias,
  UFormGestaoVistoria, UFormHistFIPE, UFormHistoricoAvaliacoes,
  UFormHistoricoObsAtn, UFormImagem, UFormImportacoesEfetuadas,
  UFormInformacoes, UFormLiberaPermissao, UFormListaUsuarios, UFormLoading,
  UFormLoadingCarregamento, UFormLoadingOpaco, UFormLoginSavauto,
  UFormLotesArval, UFormMenuFinanceiro, UFormNovaAvaliacao, UformNovaObs,
  UFormNovoProcessamento, UFormNovoVistoriador, UFormPadroesPlanilhas,
  UFormPagamentoVeiculo, UFormParametros, UFormPerfis, UFormPermissoesCarga,
  UFormPesquisaFipe, UFormPgtoExtratoVeiculo, UFormPrincipal,
  UFormProcPlanAcelero, UFormProcPlanFinal, UFormQuitacoesVeiculo,
  UFormRefFipes, UFormSegIPVALic, UFormUltimasAtualizacoes, UFormUsuarios,
  UFormVistoriadores, UFormVistoriasDetalhes, UFormWebBrowse,
  UforTestesDiversos, UnitLogin, UFormNovoUsuarioTransporte,
  UFormPermissoesUsuarioAppTransporte, UFormAguarde,
  UFormAlteraPermissaoAppTransp, UFormCidadesCustos, UFormDadosPgtoTransporte,
  UFormDetalhesAtendimentoBeta, UFormDetalheTransportes,
  UFormFinanceiroTransportes, UFormGestaoTransporte, UFormListaBancos,
  UFormNovaCidadeCusto, UFormPagamentoEmLoteTransportes,
  UFormPagamentoTransporte;

procedure TFormCadastroTransportadora.btnNovoClick(Sender: TObject);
begin

 if FormNovaCidadeCusto = nil then
 Begin
   FormNovaCidadeCusto := TFormNovaCidadeCusto.Create(self);
 End;

 FormNovaCidadeCusto.Tag := 0;
 FormNovaCidadeCusto.Position := poScreenCenter;
 FormNovaCidadeCusto.Show;

end;

procedure TFormCadastroTransportadora.btnSalvarFinanceiroClick(Sender: TObject);
var
 query : TUniQuery;
Begin

  query := TUniQuery.Create(self);
  query.Connection := DataModuleBancoVistoria.UniConnection1;

  try

  query.SQL.Clear;
  query.SQL.Add('delete from tbtransportadoras_dadosbancarios where id_transportadora=:id');
  query.ParamByName('id').AsInteger := FormCadastroTransportadoras.DBGridListaTransp.DataSource.DataSet.FieldByName('id').AsInteger;
  query.Execute;

  query.SQL.Clear;
  query.SQL.Add('insert into tbtransportadoras_dadosbancarios(id_transportadora, banco, agencia, conta, pix, favorecido) values (:id, :banco, :agencia, :conta, :pix, :fav)');
  query.ParamByName('banco').Text := EditBanco.Text;
  query.ParamByName('agencia').Text := EditAgencia.Text;
  query.ParamByName('conta').Text := EditConta.Text;
  query.ParamByName('pix').Text := EditPix.Text;
  query.ParamByName('id').AsInteger := FormCadastroTransportadoras.DBGridListaTransp.DataSource.DataSet.FieldByName('id').AsInteger;
  query.ParamByName('fav').Text := EditFavorecido.Text;
  query.ExecSQL;

  query.DisposeOf;

  ShowMessage('Dados bancários salvos com sucesso!');

  Except On
  E:Exception do
  Begin
    ShowMessage('Falha ao salvar! ' + e.Message);
  End;
  end;



end;

procedure TFormCadastroTransportadora.btnSalvarFinanceiroMouseEnter(
  Sender: TObject);
begin

 btnSalvarFinanceiro.Color := clHighlight;

end;

procedure TFormCadastroTransportadora.btnSalvarFinanceiroMouseLeave(
  Sender: TObject);
begin

 btnSalvarFinanceiro.Color := clBlue;

end;

procedure TFormCadastroTransportadora.Button2Click(Sender: TObject);
begin

 if FormNovaCidadeCusto = nil then
 Begin
   FormNovaCidadeCusto := TFormNovaCidadeCusto.Create(self);
 End;

 FormNovaCidadeCusto.EditCidade.Text := DBGrid1.DataSource.DataSet.FieldByName('cidade').Text;
 FormNovaCidadeCusto.EditUF.Text     := DBGrid1.DataSource.DataSet.FieldByName('uf').Text;
 FormNovaCidadeCusto.EditCusto.Text  := DBGrid1.DataSource.DataSet.FieldByName('custo').Text;

 FormNovaCidadeCusto.Tag := 1;
 FormNovaCidadeCusto.Position := poScreenCenter;
 FormNovaCidadeCusto.Show;

end;

procedure TFormCadastroTransportadora.EditCEPKeyPress(Sender: TObject;
  var Key: Char);
  var
  WS: AtendeCliente;
  Endereco: TEndereco;
  begin

 if key = #13 then
 Begin
  WS := GetAtendeCliente();
  try
    Endereco := WS.consultaCEP(EditCEP.Text); // <<< Informe o CEP aqui

    EditBairro.Text      := Endereco.bairro;
    EditCEP.Text         := Endereco.cep;
    EditCidade.Text      := Endereco.cidade;
    //Complemento := Endereco.complemento;
    EditUF.Text          := Endereco.uf;
    EditRua.Text  := Endereco.logradouro + ' ' + Endereco.complemento + ' Nro:' ;
  except
    on E: SigepClienteException do
      ShowMessage('Ocorreu uma falha na consulta!' + e.Message);
  end;
 End;

end;

procedure TFormCadastroTransportadora.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

 EditNomeTransp.Text := '';
 EditCnpj.Text := '';
 EditCEP.Text := '';
 EditRua.Text := '';
 EditUF.Text := '';
 EditCidade.Text := '';
 EditBairro.Text := '';

end;

procedure TFormCadastroTransportadora.FormShow(Sender: TObject);
begin

 qBuscaCidades.Filter := 'id_transportadora =' + QuotedStr( FormCadastroTransportadoras.DBGridListaTransp.DataSource.DataSet.FieldByName('id').Text );
 qBuscaCidades.Filtered := true;

 qBuscaCidades.Open;

 PageControl1.ActivePage := PageDadosGerais;

end;

procedure TFormCadastroTransportadora.Image1Click(Sender: TObject);
begin

   if FormCadastroTransportadora.Tag = 1 then
   Begin
     ShowMessage('Antes de acessar as configurações, salve a transportadora!');
     PageControl1.ActivePage := PageDadosGerais;
     Abort;
   End
   Else
   Begin
     FormNovoUsuarioTransporte.Position := poScreenCenter;
     FormNovoUsuarioTransporte.ShowModal;
   End;

end;

procedure TFormCadastroTransportadora.imgSalvarClick(Sender: TObject);
begin

 if Tag = 1 then
 // insert
 Begin

  qInsereTransp.SQL.Clear;
  qInsereTransp.SQL.Add('INSERT into tbtransportadoras (nome, cnpj, cep, rua, cidade, uf, bairro)');
  qInsereTransp.SQL.Add('values (:nome, :cnpj, :cep, :rua, :cidade, :uf, :bairro)');
  qInsereTransp.ParamByName('nome').Text := EditNomeTransp.Text;
  qInsereTransp.ParamByName('cnpj').Text := EditCnpj.Text;
  qInsereTransp.ParamByName('cep').Text  := EditCEP.Text;
  qInsereTransp.ParamByName('rua').Text  := EditRua.Text;
  qInsereTransp.ParamByName('cidade').Text := EditCidade.Text;
  qInsereTransp.ParamByName('uf').Text  := EditUF.Text;
  qInsereTransp.ParamByName('bairro').Text := EditBairro.Text;
  qInsereTransp.ExecSQL;

  FormCadastroTransportadoras.qBuscaTransportadoras.Refresh;

  Close;

 End
 Else
 Begin

  qInsereTransp.SQL.Clear;
  qInsereTransp.SQL.Add('update tbtransportadoras set nome=:nome, cnpj=:cnpj, cep=:cep, rua=:rua, cidade=:cidade, uf=:uf, bairro=:bairro where id=:id)');
  qInsereTransp.ParamByName('nome').Text := EditNomeTransp.Text;
  qInsereTransp.ParamByName('cnpj').Text := EditCnpj.Text;
  qInsereTransp.ParamByName('cep').Text  := EditCEP.Text;
  qInsereTransp.ParamByName('rua').Text  := EditRua.Text;
  qInsereTransp.ParamByName('cidade').Text := EditCidade.Text;
  qInsereTransp.ParamByName('uf').Text  := EditUF.Text;
  qInsereTransp.ParamByName('bairro').Text := EditBairro.Text;
  qInsereTransp.ParamByName('id').AsInteger := FormCadastroTransportadoras.DBGridListaTransp.DataSource.DataSet.FieldByName('id').AsInteger;
  qInsereTransp.ExecSQL;


  FormCadastroTransportadoras.qBuscaTransportadoras.Refresh;

  Close;

 End;

end;

end.
