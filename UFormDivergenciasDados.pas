unit UFormDivergenciasDados;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Uni, MemDS, DBAccess,
  ExcelExport, ComObj;

type
  TFormDivergenciasDados = class(TForm)
    Panel2: TPanel;
    labelRefFipes: TLabel;
    PanelExcel: TPanel;
    Panel10: TPanel;
    Panel3: TPanel;
    Image5: TImage;
    Panel1: TPanel;
    Label1: TLabel;
    panelSemPrecoVenda: TPanel;
    Panel5: TPanel;
    DBGrid1: TDBGrid;
    panelLojaPatio: TPanel;
    Panel7: TPanel;
    panelSemPrecoCompra: TPanel;
    Panel9: TPanel;
    DataSource1: TDataSource;
    ExcelExport1: TExcelExport;
    query: TUniQuery;
    Panel4: TPanel;
    Panel6: TPanel;
    procedure panelSemPrecoVendaClick(Sender: TObject);
    procedure panelSemPrecoCompraClick(Sender: TObject);
    procedure panelLojaPatioClick(Sender: TObject);
    procedure PanelExcelClick(Sender: TObject);
    procedure Panel4Click(Sender: TObject);
  private
    procedure BuscaAutoPrecoVenda;
    procedure BuscaAutoPrecoCompra;
    procedure AutoDiaLojaPatio;
    procedure BuscaAutoSemOrigem;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDivergenciasDados: TFormDivergenciasDados;

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
  UFormDetalhesAvaliacao, UFormDetalheTransportes, UFormDownloadNovaVersao,
  UFormExcelCompras, UFormExtratoPgtoVeiculos, UFormFiltrosGestao,
  UFormFinanceiroTransportes, UFormFornecedoresFrotista,
  UFormFornecedorFrotistaAddEditar, UFormGestaoAvaliacoes, UFormGestaoAvarias,
  UFormGestaoDadosSavauto, UFormGestaoTransporte, UFormGestaoVistoria,
  UFormHistFIPE, UFormHistoricoAvaliacoes, UFormHistoricoObsAtn, UFormImagem,
  UFormImportacoesEfetuadas, UFormInformacoes, UFormLiberaPermissao,
  UFormListaBancos, UFormListaUsuarios, UFormLoading, UFormLoadingCarregamento,
  UFormLoadingOpaco, UFormLoginSavauto, UFormLotesArval, UFormMenuFinanceiro,
  UFormNovaAvaliacao, UFormNovaCidadeCusto, UformNovaObs,
  UFormNovoProcessamento, UFormNovoUsuarioTransporte, UFormNovoVistoriador,
  UFormPadroesPlanilhas, UFormPagamentoEmLoteTransportes,
  UFormPagamentoTransporte, UFormPagamentoVeiculo, UFormParametros, UFormPerfis,
  UFormPermissoesCarga, UFormPermissoesUsuarioAppTransporte, UFormPesquisaFipe,
  UFormPgtoExtratoVeiculo, UFormPrincipal, UFormProcPlanAcelero,
  UFormProcPlanFinal, UFormQuitacoesVeiculo, UFormRefFipes, UFormSegIPVALic,
  UFormUltimasAtualizacoes, UFormUsuarios, UFormVistoriadores,
  UFormVistoriasDetalhes, UFormWebBrowse, UforTestesDiversos, UnitLogin;

procedure TFormDivergenciasDados.BuscaAutoPrecoCompra;
Begin

 try

  if FormAguarde = nil then
  Begin
    FormAguarde := TFormAguarde.Create(self);
  End;

  FormAguarde.Label1.Caption := 'Aguarde...';
  FormAguarde.Position := poScreenCenter;
  FormAguarde.show;

  Application.ProcessMessages;

  sleep(1000);

  DataSource1.DataSet := query;

  if MessageDlg('Deseja filtrar as divergências pelo filtro efetuado na tela de gestão?', mtInformation, [mbno, mbyes] , 0) = mrYes then
  Begin


  query.SQL.Clear;
  query.SQL.Add('select car_vlrecibo, Car_DtEntrada, Car_DtPatio, car_sit, Cadastro.Cad_Nome,  * from CadCar');
  query.SQL.Add('left join Cadastro on Cadastro.Cad_Cod = CadCar.Car_Origem');
  query.SQL.Add('where');
  query.SQL.Add('CadCar.car_vlRecibo is null');
  query.SQL.Add('and CadCar.Car_DtEntrada >= ''2021-01-01''');
  //query.SQL.Add('and CadCar.car_sit not in (''Troca'', ''Devolvido'', ''Deposito'', ''Depósito'', ''Documentacao'', ''Documentação'')');
  query.SQL.Add( FormGestaoDadosSavauto.QueryWhere );
  query.SQL.Add('order by CadCar.Car_Cod desc');
  query.Open;

  End
  Else
  Begin

  query.SQL.Clear;
  query.SQL.Add('select car_vlrecibo, Car_DtEntrada, Car_DtPatio, car_sit, Cadastro.Cad_Nome,  * from CadCar');
  query.SQL.Add('left join Cadastro on Cadastro.Cad_Cod = CadCar.Car_Origem');
  query.SQL.Add('where');
  query.SQL.Add('CadCar.car_vlRecibo is null');
  query.SQL.Add('and CadCar.Car_DtEntrada >= ''2021-01-01''');
  query.SQL.Add('and CadCar.car_sit not in (''Troca'', ''Devolvido'', ''Deposito'', ''Depósito'', ''Documentacao'', ''Documentação'')');
  //query.SQL.Add( FormGestaoDadosSavauto.QueryWhere );
  query.SQL.Add('order by CadCar.Car_Cod desc');
  query.Open;

  End;

 { if query.RecordCount >0 then
  Begin
    FormAguarde.Close;
  End
  Else
  Begin
    FormAguarde.Close;
    ShowMessage('Nenhum veículo encontrado!');
  End; }

  FormAguarde.Close;

  except
  On E:Exception Do
  Begin

   ShowMessage('Falha ao buscar dados: ' + e.Message);

  End;

 end;

End;

procedure TFormDivergenciasDados.BuscaAutoSemOrigem;
Begin

 try

  if FormAguarde = nil then
  Begin
    FormAguarde := TFormAguarde.Create(self);
  End;

  FormAguarde.Label1.Caption := 'Aguarde...';
  FormAguarde.Position := poScreenCenter;
  FormAguarde.show;

  Application.ProcessMessages;

  sleep(1000);

  DataSource1.DataSet := query;

  if MessageDlg('Deseja filtrar as divergências pelo filtro efetuado na tela de gestão?', mtInformation, [mbno, mbyes] , 0) = mrYes then
  Begin

  query.SQL.Clear;
  query.SQL.Add('select car_placa, car_vlrecibo, Car_DtEntrada, Car_DtPatio, car_sit,  * from CadCar');
  query.SQL.Add('where');
  query.SQL.Add('Car_DtEntrada >= ''2021-01-01''');
  //query.SQL.Add('and car_sit not in (''Troca'', ''Devolvido'', ''Deposito'', ''Depósito'', ''Documentacao'', ''Documentação'')');
  query.SQL.Add( FormGestaoDadosSavauto.QueryWhere );
  query.SQL.Add('and CadCar.Car_Inv not in (select inv_cod from Inv)');
  query.SQL.Add('order by CadCar.Car_DtEntrada desc');
  query.Open;

  End
  Else
  Begin
    query.SQL.Clear;
    query.SQL.Add('select car_placa, car_vlrecibo, Car_DtEntrada, Car_DtPatio, car_sit,  * from CadCar');
    query.SQL.Add('where');
    query.SQL.Add('Car_DtEntrada >= ''2021-01-01''');
    query.SQL.Add('and car_sit not in (''Troca'', ''Devolvido'', ''Deposito'', ''Depósito'', ''Documentacao'', ''Documentação'')');
    query.SQL.Add('and CadCar.Car_Inv not in (select inv_cod from Inv)');
    //query.SQL.Add( FormGestaoDadosSavauto.QueryWhere );
    query.SQL.Add('order by CadCar.Car_DtEntrada desc');
    query.Open;
  End;

 { if query.RecordCount >0 then
  Begin
    FormAguarde.Close;
  End
  Else
  Begin
    FormAguarde.Close;
    ShowMessage('Nenhum veículo encontrado!');
  End; }

  FormAguarde.Close;

  except
  On E:Exception Do
  Begin

   ShowMessage('Falha ao buscar dados: ' + e.Message);

  End;

 end;

End;


procedure TFormDivergenciasDados.AutoDiaLojaPatio;
Begin

 try

  if FormAguarde = nil then
  Begin
    FormAguarde := TFormAguarde.Create(self);
  End;

  FormAguarde.Label1.Caption := 'Aguarde...';
  FormAguarde.Position := poScreenCenter;
  FormAguarde.show;

  Application.ProcessMessages;

  sleep(1000);

  DataSource1.DataSet := query;

  query.SQL.Clear;
  query.SQL.Add('select Car_DtEntrada, Car_DtPatio, car_sit,  * from CadCar where ');
  query.SQL.Add('Car_DtEntrada is null and Car_DtVenda is not null');
  query.SQL.Add('and car_sit not in (''Troca'', ''Devolvido'', ''Deposito'', ''Depósito'', ''Documentacao'', ''Documentação'')');
  query.SQL.Add('order by Car_Cod desc');
  query.Open;

 { if query.RecordCount >0 then
  Begin
    FormAguarde.Close;
  End
  Else
  Begin
    FormAguarde.Close;
    ShowMessage('Nenhum veículo encontrado!');
  End; }

  FormAguarde.Close;

  except
  On E:Exception Do
  Begin

   ShowMessage('Falha ao buscar dados: ' + e.Message);

  End;

 end;

End;

procedure TFormDivergenciasDados.BuscaAutoPrecoVenda;
Begin

 try

  if FormAguarde = nil then
  Begin
    FormAguarde := TFormAguarde.Create(self);
  End;

  FormAguarde.Label1.Caption := 'Aguarde...';
  FormAguarde.Position := poScreenCenter;
  FormAguarde.show;

  Application.ProcessMessages;

  sleep(1000);

  DataSource1.DataSet := query;

  if MessageDlg('Deseja filtrar as divergências pelo filtro efetuado na tela de gestão?', mtInformation, [mbno, mbyes] , 0) = mrYes then
  Begin

  query.SQL.Clear;
  query.SQL.Add('select Car_DtEntrada, Car_DtPatio, car_sit, car_placa, car_vlvenda, CadCar.* from CadCar where');
  query.SQL.Add('car_vlvenda is null');
  //query.SQL.Add('and CadCar.car_sit not in (''Troca'', ''Devolvido'', ''Deposito'', ''Depósito'', ''Documentacao'', ''Documentação'')');
  query.SQL.Add( FormGestaoDadosSavauto.QueryWhere );
  query.SQL.Add('order by Car_Cod desc');
  query.Open;

  End
  Else
  Begin
    query.SQL.Clear;
    query.SQL.Add('select Car_DtEntrada, Car_DtPatio, car_sit, car_placa, car_vlvenda, CadCar.* from CadCar where');
    query.SQL.Add('car_vlvenda is null');
    query.SQL.Add('and CadCar.car_sit not in (''Troca'', ''Devolvido'', ''Deposito'', ''Depósito'', ''Documentacao'', ''Documentação'')');
    query.SQL.Add('order by Car_Cod desc');
    query.Open;
  End;

 { if query.RecordCount >0 then
  Begin
    FormAguarde.Close;
  End
  Else
  Begin
    FormAguarde.Close;
    ShowMessage('Nenhum veículo encontrado!');
  End; }

  FormAguarde.Close;

  except
  On E:Exception Do
  Begin

   ShowMessage('Falha ao buscar dados: ' + e.Message);

  End;

 end;

End;

procedure TFormDivergenciasDados.Panel4Click(Sender: TObject);
begin

 BuscaAutoSemOrigem;

end;

procedure TFormDivergenciasDados.PanelExcelClick(Sender: TObject);
var
  linha, coluna : integer;
  planilha : variant;
  valorcampo : string;
begin

  planilha:= CreateoleObject('Excel.Application');
  planilha.WorkBooks.add(1);
  planilha.caption := 'Exportando dados do dbGrid, dataset ou query para o Excel';
  planilha.visible := true;

  query.First;
  for linha := 0 to query.RecordCount - 1 do
  begin
    for coluna := 1 to query.FieldCount do
    begin
      valorcampo := query.Fields[coluna - 1].AsString;
      planilha.cells[linha + 2,coluna] := valorCampo;
    end;
    query.Next;
  end;
  for coluna := 1 to query.FieldCount do
  begin
    valorcampo := query.Fields[coluna - 1].DisplayLabel;
    planilha.cells[1,coluna] := valorcampo;
  end;
  planilha.columns.Autofit;

end;

procedure TFormDivergenciasDados.panelLojaPatioClick(Sender: TObject);
begin

 AutoDiaLojaPatio;

end;

procedure TFormDivergenciasDados.panelSemPrecoCompraClick(Sender: TObject);
begin

 BuscaAutoPrecoCompra;

end;

procedure TFormDivergenciasDados.panelSemPrecoVendaClick(Sender: TObject);
begin

 BuscaAutoPrecoVenda;

end;

end.
