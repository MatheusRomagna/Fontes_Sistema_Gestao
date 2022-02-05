unit UFormFornecedorFrotistaAddEditar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxGDIPlusClasses, Vcl.ExtCtrls,
  Vcl.StdCtrls, Data.DB, MemDS, DBAccess, Uni, ConsultaCEP;

type
  TFormFornecedorFrotistaAddEditar = class(TForm)
    PanelBootom: TPanel;
    imgSalvar: TImage;
    Label1: TLabel;
    EditFornecedor: TEdit;
    Label2: TLabel;
    EditCnpj: TEdit;
    Label3: TLabel;
    EditCep: TEdit;
    Label4: TLabel;
    EditCidade: TEdit;
    Label5: TLabel;
    EditUF: TEdit;
    Label6: TLabel;
    EditBairro: TEdit;
    Label7: TLabel;
    EditLogradouro: TEdit;
    qAtualizaFornecedor: TUniQuery;
    procedure EditCepKeyPress(Sender: TObject; var Key: Char);
    procedure imgSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormFornecedorFrotistaAddEditar: TFormFornecedorFrotistaAddEditar;

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
  UFormAvariasItens, UFormCadaNovoUsuMobile, UFormCadaUsuario,
  UFormCadaUsuariosMobile, UFormCadVistoriadores, UFormColunasOcultas,
  UFormConcedePermissao, UFormConcFipeModelo, UFormConsutaPlacaAvaliacao,
  UFormCriacaoAvaria, UFormCruzamentoFipes, UFormDadosPagamento,
  UFormDadosPerfil, UFormDataPagamento, UFormDetalhesAtendimento,
  UFormDetalhesAvaliacao, UFormDownloadNovaVersao, UFormExcelCompras,
  UFormExtratoPgtoVeiculos, UFormFornecedoresFrotista, UFormGestaoAvaliacoes,
  UFormGestaoAvarias, UFormGestaoVistoria, UFormHistFIPE,
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
  UFormVistoriasDetalhes, UFormWebBrowse, UforTestesDiversos, UnitLogin;

procedure TFormFornecedorFrotistaAddEditar.EditCepKeyPress(Sender: TObject;
  var Key: Char);
var
  WS: AtendeCliente;
  Endereco: TEndereco;
Begin

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
    EditLogradouro.Text  := Endereco.logradouro + ' ' + Endereco.complemento + ' Nro:' ;
   except
    on E: SigepClienteException do
      ShowMessage('Ocorreu uma falha na consulta!' + e.Message);
  end;

 End;

end;

procedure TFormFornecedorFrotistaAddEditar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

 EditCnpj.Text := '';
 EditFornecedor.Text := '';
 EditCep.Text := '';
 EditCidade.Text := '';
 EditBairro.Text := '';
 EditUF.Text := '';
 EditLogradouro.Text := '';

end;

procedure TFormFornecedorFrotistaAddEditar.imgSalvarClick(Sender: TObject);
begin

 if Tag = 0 then
 Begin

  qAtualizaFornecedor.SQL.Clear;
  qAtualizaFornecedor.SQL.Add('insert into tbfornecedorveiculo (nome, cnpj, cep, cidade, bairro, uf, logradouro)');
  qAtualizaFornecedor.SQL.Add('values (:nome, :cnpj, :cep, :cidade, :bairro, :uf, :rua)');
  qAtualizaFornecedor.ParamByName('nome').Text := EditFornecedor.Text;
  qAtualizaFornecedor.ParamByName('cnpj').Text := EditCnpj.Text;
  qAtualizaFornecedor.ParamByName('cep').Text := EditCep.Text;
  qAtualizaFornecedor.ParamByName('cidade').Text := EditCidade.Text;
  qAtualizaFornecedor.ParamByName('bairro').Text := EditBairro.Text;
  qAtualizaFornecedor.ParamByName('uf').Text := EditUF.Text;
  qAtualizaFornecedor.ParamByName('rua').Text := EditLogradouro.Text;
  qAtualizaFornecedor.ExecSQL;

  FormFornecedoresFrotista.qBuscaFornecedores.Refresh;

  Close;

 End
 Else
 Begin

  qAtualizaFornecedor.SQL.Clear;
  qAtualizaFornecedor.SQL.Add('update tbfornecedorveiculo set nome=:nome, cnpj=:cnpj, cep=:cep, cidade=:cidade, bairro=:bairro, uf=:uf, logradouro=:rua');
  qAtualizaFornecedor.SQL.Add('where id = :cod');
  qAtualizaFornecedor.ParamByName('nome').Text := EditFornecedor.Text;
  qAtualizaFornecedor.ParamByName('cnpj').Text := EditCnpj.Text;
  qAtualizaFornecedor.ParamByName('cep').Text := EditCep.Text;
  qAtualizaFornecedor.ParamByName('cidade').Text := EditCidade.Text;
  qAtualizaFornecedor.ParamByName('bairro').Text := EditBairro.Text;
  qAtualizaFornecedor.ParamByName('uf').Text := EditUF.Text;
  qAtualizaFornecedor.ParamByName('rua').Text := EditLogradouro.Text;
  qAtualizaFornecedor.ParamByName('cod').AsInteger := Tag;
  qAtualizaFornecedor.Execute;

  FormFornecedoresFrotista.qBuscaFornecedores.Refresh;

  Close;

 End;

end;

end.
