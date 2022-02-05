unit UClasseVeiculoAvaliacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, MemDS, DBAccess, Uni, Vcl.ExtCtrls;

type
  TClasseVeiculoAvaliacao = class(TForm)
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    EditFipe: TEdit;
    EditAvaria: TEdit;
    EditMercado: TEdit;
    EditKM: TEdit;
    DataSource1: TDataSource;
    QBuscaClasse: TUniQuery;
    lblStatusDias: TLabel;
    Label5: TLabel;
    EditEmEstoque: TEdit;
    Label6: TLabel;
    EditVendidos: TEdit;
    QBuscaClasseid: TIntegerField;
    QBuscaClasseid_veiculo: TIntegerField;
    QBuscaClasseplaca: TStringField;
    QBuscaClassedata: TDateTimeField;
    QBuscaClasseclasse_valor: TStringField;
    QBuscaClasseclasse_avaria: TStringField;
    QBuscaClasseclasse_mercado: TStringField;
    QBuscaClasseclasse_KM: TStringField;
    QBuscaClassevalor_margem: TFloatField;
    btnVerEmEstoque: TButton;
    panelStatusCompra: TPanel;
    editNomeModelo: TEdit;
    btnConsultaModelo: TButton;
    Button1: TButton;
    Button2: TButton;
    EditModeloVendidos: TEdit;
    Button3: TButton;
    Button4: TButton;
    procedure btnVerEmEstoqueClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnConsultaModeloClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    procedure ConsultaEmEstoque(modelo: string);
    procedure ConsultaVendidos(modelo: string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ClasseVeiculoAvaliacao: TClasseVeiculoAvaliacao;

implementation

{$R *.dfm}

uses FMX.UFormGraficosAtendimento, Loading, UDataModuleBancoVistoria,
  UDataModuleConexao, UDMPermissoes, UFormAgendamento, UFormAguarde,
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
  UFormDetalhesAtendimento, UFormDetalhesAtendimentoBeta,
  UFormDetalhesAvaliacao, UFormDetalheTransportes, UFormDivergenciasDados,
  UFormDownloadNovaVersao, UFormDREDados, UFormExcelCompras,
  UFormExtratoPgtoVeiculos, UFormFiltrosGestao, UFormFinanceiroTransportes,
  UFormFornecedoresFrotista, UFormFornecedorFrotistaAddEditar,
  UFormGestaoAvaliacoes, UFormGestaoAvarias, UFormGestaoDadosSavauto,
  UFormGestaoTransporte, UFormGestaoVistoria, UFormHistFIPE,
  UFormHistoricoAvaliacoes, UFormHistoricoObsAtn, UFormImagem,
  UFormImportacoesEfetuadas, UFormInformacoes, UFormLiberaPermissao,
  UFormListaBancos, UFormListaUsuarios, UFormLoading, UFormLoadingCarregamento,
  UFormLoadingOpaco, UFormLoginSavauto, UFormLotesArval, UFormMenuFinanceiro,
  UFormNovaAvaliacao, UFormNovaCidadeCusto, UformNovaObs,
  UFormNovoProcessamento, UFormNovoUsuarioTransporte, UFormNovoVistoriador,
  UFormPadroesPlanilhas, UFormPagamentoEmLoteTransportes,
  UFormPagamentoTransporte, UFormPagamentoVeiculo, UFormParametros, UFormPerfis,
  UFormPermissoesCarga, UFormPermissoesUsuarioAppTransporte, UFormPesquisaFipe,
  UFormPgtoExtratoVeiculo, UFormPrincipal, UFormProcPlanAcelero,
  UFormProcPlanFinal, UFormQuitacoesVeiculo, UFormRefFipes, UFormRelacaoEstoque,
  UFormSegIPVALic, UFormUltimasAtualizacoes, UFormUsuarios, UFormVistoriadores,
  UFormVistoriasDetalhes, UFormWebBrowse, UforTestesDiversos, UnitLogin,
  UFormTabelaCompra, UFormVerCarrosClasse;

procedure TClasseVeiculoAvaliacao.ConsultaVendidos( modelo : string );
var
 query : TUniQuery;
 dias : integer;
Begin

 query := TUniQuery.Create( Self );
 query.Connection := DataModuleConexao.UniConnection1;

 try

  query.SQL.Clear;
  query.SQL.Add('select qtd_d_vendida from tbParamMercadoCompra limit 1');
  query.Open;

  dias := query.FieldByName('qtd_d_vendida').AsInteger;

  query.Connection := DataModuleConexao.UniConnectionSavanna;

  query.SQL.Clear;
  query.SQL.Add('select count(*) as qtd from CadCar where ');
  query.SQL.Add('upper(car_modelo) like ' + QuotedStr('%'+ UpperCase(modelo) +'%')+'');
  query.SQL.Add('and substring(Car_Ano, 6, 4) = :ano ');
  query.SQL.Add('and Car_Sit in (''Vendido'', ''Finalizado'', ''Arras'') ');
  query.SQL.Add('and Car_DtVenda >= GETDATE()-:dias and Car_DtVenda <= GETDATE() ');
  query.ParamByName('ano').Text := FormDetalhesAvaliacao.EditAno.Text;
  query.ParamByName('dias').AsInteger := dias;
  query.Open;

  EditVendidos.Text := IntToStr( query.FieldByName('qtd').AsInteger );

 Except
 On E:Exception do
 Begin
    ShowMessage('Falha ao atualizar total do veículo por modelo! ' + e.Message);
 End;

 end;

End;

procedure TClasseVeiculoAvaliacao.ConsultaEmEstoque( modelo : string);
var
 query : TUniQuery;
Begin

 query := TUniQuery.Create( Self );
 query.Connection := DataModuleConexao.UniConnectionSavanna;

 try

  query.SQL.Clear;
  query.SQL.Add('select COUNT(*) as qtd from CadCar where ');
  query.SQL.Add('upper(car_modelo) like ' + QuotedStr('%'+ UpperCase(modelo) +'%')+'');
  query.SQL.Add('and substring(Car_Ano, 6, 4) = :ano ');
  query.SQL.Add('and Car_Sit in (''Ag Transporte'', ''Em venda'', ''Em Venda'', ''Preparando'') ');
  query.ParamByName('ano').Text := FormDetalhesAvaliacao.EditAno.Text;
  query.Open;

  EditEmEstoque.Text := IntToStr( query.FieldByName('qtd').AsInteger );

 Except
 On E:Exception do
 Begin
    ShowMessage('Falha ao atualizar total do veículo por modelo! ' + e.Message);
 End;

 end;


End;

procedure TClasseVeiculoAvaliacao.btnConsultaModeloClick(Sender: TObject);
begin

 ConsultaEmEstoque( editNomeModelo.Text );

end;

procedure TClasseVeiculoAvaliacao.btnVerEmEstoqueClick(Sender: TObject);
var
 query : TUniQuery;
 dias : integer;
begin

 query := TUniQuery.Create(self);
 query.Connection := DataModuleConexao.UniConnection1;

  query.SQL.Clear;
  query.SQL.Add('select qtd_d_vendida from tbParamMercadoCompra limit 1');
  query.Open;

  dias := query.FieldByName('qtd_d_vendida').AsInteger;

  FormVerCarrosClasse.qBuscaVeicSavanna.SQL.Clear;
  FormVerCarrosClasse.qBuscaVeicSavanna.SQL.Add('select * from CadCar where ');
  FormVerCarrosClasse.qBuscaVeicSavanna.SQL.Add('SUBSTRING( Car_CodFIPE, 1, 8 ) = :codfipe ');
  FormVerCarrosClasse.qBuscaVeicSavanna.SQL.Add('and substring(Car_Ano, 6, 4) = :ano ');
  FormVerCarrosClasse.qBuscaVeicSavanna.SQL.Add('and Car_Sit in (''Ag Transporte'', ''Em venda'', ''Em Venda'', ''Preparando'') ');
  FormVerCarrosClasse.qBuscaVeicSavanna.ParamByName('codfipe').Text := FormDetalhesAvaliacao.EditCodFipe.Text;
  FormVerCarrosClasse.qBuscaVeicSavanna.ParamByName('ano').Text := FormDetalhesAvaliacao.EditAno.Text;
  FormVerCarrosClasse.qBuscaVeicSavanna.Open;

  FormVerCarrosClasse.Position := poScreenCenter;
  FormVerCarrosClasse.ShowModal;

end;

procedure TClasseVeiculoAvaliacao.Button1Click(Sender: TObject);
var
 query : TUniQuery;
 dias : integer;
begin

  FormVerCarrosClasse.qBuscaVeicSavanna.SQL.Clear;
  FormVerCarrosClasse.qBuscaVeicSavanna.SQL.Add('select * from CadCar where ');
  FormVerCarrosClasse.qBuscaVeicSavanna.SQL.Add('upper(car_modelo) like ' + QuotedStr('%'+ UpperCase( editNomeModelo.Text ) +'%')+'');
  FormVerCarrosClasse.qBuscaVeicSavanna.SQL.Add('and substring(Car_Ano, 6, 4) = :ano ');
  FormVerCarrosClasse.qBuscaVeicSavanna.SQL.Add('and Car_Sit in (''Ag Transporte'', ''Em venda'', ''Em Venda'', ''Preparando'') ');
  FormVerCarrosClasse.qBuscaVeicSavanna.ParamByName('ano').Text := FormDetalhesAvaliacao.EditAno.Text;
  FormVerCarrosClasse.qBuscaVeicSavanna.Open;

  FormVerCarrosClasse.Position := poScreenCenter;
  FormVerCarrosClasse.ShowModal;

end;
procedure TClasseVeiculoAvaliacao.Button2Click(Sender: TObject);
var
 query : TUniQuery;
 dias : integer;
begin

   query := TUniQuery.Create(self);
   query.Connection := DataModuleConexao.UniConnection1;

  query.SQL.Clear;
  query.SQL.Add('select qtd_d_vendida from tbParamMercadoCompra limit 1');
  query.Open;

  dias := query.FieldByName('qtd_d_vendida').AsInteger;

   query.Connection := DataModuleConexao.UniConnectionSavanna;

  FormVerCarrosClasse.qBuscaVeicSavanna.SQL.Clear;
  FormVerCarrosClasse.qBuscaVeicSavanna.SQL.Add('select * from CadCar where ');
  FormVerCarrosClasse.qBuscaVeicSavanna.SQL.Add('SUBSTRING( Car_CodFIPE, 1, 8 ) = :codfipe ');
  FormVerCarrosClasse.qBuscaVeicSavanna.SQL.Add('and substring(Car_Ano, 6, 4) = :ano ');
  FormVerCarrosClasse.qBuscaVeicSavanna.SQL.Add('and Car_Sit in (''Vendido'', ''Finalizado'', ''Arras'') ');
  FormVerCarrosClasse.qBuscaVeicSavanna.SQL.Add('and Car_DtVenda >= GETDATE()-:dias and Car_DtVenda <= GETDATE() ');
  FormVerCarrosClasse.qBuscaVeicSavanna.ParamByName('codfipe').Text := FormDetalhesAvaliacao.EditCodFipe.Text;
  FormVerCarrosClasse.qBuscaVeicSavanna.ParamByName('ano').Text := FormDetalhesAvaliacao.EditAno.Text;
  FormVerCarrosClasse.qBuscaVeicSavanna.ParamByName('dias').AsInteger := dias;
  FormVerCarrosClasse.qBuscaVeicSavanna.Open;

  FormVerCarrosClasse.Position := poScreenCenter;
  FormVerCarrosClasse.ShowModal;

end;

procedure TClasseVeiculoAvaliacao.Button3Click(Sender: TObject);
begin

 ConsultaVendidos( EditModeloVendidos.Text );

end;

procedure TClasseVeiculoAvaliacao.Button4Click(Sender: TObject);
var
 query : TUniQuery;
 dias : integer;
begin

  query := TUniQuery.Create(self);
  query.Connection := DataModuleConexao.UniConnection1;

  query.SQL.Clear;
  query.SQL.Add('select qtd_d_vendida from tbParamMercadoCompra limit 1');
  query.Open;

  dias := query.FieldByName('qtd_d_vendida').AsInteger;

  query.Connection := DataModuleConexao.UniConnectionSavanna;

  FormVerCarrosClasse.qBuscaVeicSavanna.SQL.Clear;
  FormVerCarrosClasse.qBuscaVeicSavanna.SQL.Add('select * from CadCar where ');
  FormVerCarrosClasse.qBuscaVeicSavanna.SQL.Add('upper(car_modelo) like ' + QuotedStr('%'+ UpperCase(EditModeloVendidos.Text) +'%')+'');
  FormVerCarrosClasse.qBuscaVeicSavanna.SQL.Add('and substring(Car_Ano, 6, 4) = :ano ');
  FormVerCarrosClasse.qBuscaVeicSavanna.SQL.Add('and Car_Sit in (''Vendido'', ''Finalizado'', ''Arras'') ');
  FormVerCarrosClasse.qBuscaVeicSavanna.SQL.Add('and Car_DtVenda >= GETDATE()-:dias and Car_DtVenda <= GETDATE() ');
  FormVerCarrosClasse.qBuscaVeicSavanna.ParamByName('ano').Text := FormDetalhesAvaliacao.EditAno.Text;
  FormVerCarrosClasse.qBuscaVeicSavanna.ParamByName('dias').AsInteger := dias;
  FormVerCarrosClasse.qBuscaVeicSavanna.Open;

  FormVerCarrosClasse.Position := poScreenCenter;
  FormVerCarrosClasse.ShowModal;

end;

procedure TClasseVeiculoAvaliacao.FormShow(Sender: TObject);
begin

 if DBGrid1.DataSource.DataSet.FieldByName('valor_margem').AsCurrency > 0 then
 Begin
  panelStatusCompra.Color := clGreen;
  panelStatusCompra.Caption := 'APROVADO';
 End
 Else
 Begin
  panelStatusCompra.Color := clRed;
  panelStatusCompra.Caption := 'REPROVADO';
 End;


end;

end.
