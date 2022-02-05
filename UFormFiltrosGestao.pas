unit UFormFiltrosGestao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, Uni,
  Data.DB, Vcl.Grids, Vcl.DBGrids, MemDS, DBAccess;

type
  TFormFiltrosGestao = class(TForm)
    PanelV: TPanel;
    CheckVendidosPrincipal: TCheckBox;
    CheckProprioVendidos: TCheckBox;
    CheckPrazoVendidos: TCheckBox;
    DtIniVendidos: TDateTimePicker;
    DtFimVendidos: TDateTimePicker;
    CheckArras: TCheckBox;
    CheckFinalizado: TCheckBox;
    CheckVendido: TCheckBox;
    CheckFechamento: TCheckBox;
    Panel2: TPanel;
    CheckEstoquePrincipal: TCheckBox;
    CheckProprioEstoque: TCheckBox;
    CheckPrazoEstoque: TCheckBox;
    CheckAgTransporte: TCheckBox;
    CheckPreparando: TCheckBox;
    CheckEmVenda: TCheckBox;
    CheckEstoque: TCheckBox;
    CheckAutoAvaliar: TCheckBox;
    btnAplicaFiltros: TButton;
    PanelVendidos: TPanel;
    GroupBox1: TGroupBox;
    chkUsoVendidos: TCheckBox;
    chkSerVendidos: TCheckBox;
    chkSelVendidos: TCheckBox;
    chkGraVendidos: TCheckBox;
    chkIpiVendidos: TCheckBox;
    chkNhVendidos: TCheckBox;
    chkTerVendidos: TCheckBox;
    chkPreVendidos: TCheckBox;
    chkRepVendidos: TCheckBox;
    GroupBox3: TGroupBox;
    chkUsoEstoque: TCheckBox;
    chkSerEstoque: TCheckBox;
    chkSelEstoque: TCheckBox;
    chkGraEstoque: TCheckBox;
    chkIpiEstoque: TCheckBox;
    chkNhEstoque: TCheckBox;
    chkTerEstoque: TCheckBox;
    chkPreEstoque: TCheckBox;
    chkRepEstoque: TCheckBox;
    DataSourceOrigem: TDataSource;
    qBuscaOrigem: TUniQuery;
    qBuscaOrigeminv_nome: TStringField;
    Button1: TButton;
    GroupBox2: TGroupBox;
    DbgridVendidosOrigem: TDBGrid;
    procedure CheckVendidosPrincipalClick(Sender: TObject);
    procedure CheckEstoquePrincipalClick(Sender: TObject);
    procedure btnAplicaFiltrosClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CheckProprioVendidosClick(Sender: TObject);
    procedure CheckPrazoVendidosClick(Sender: TObject);
    procedure CheckProprioEstoqueClick(Sender: TObject);
    procedure CheckPrazoEstoqueClick(Sender: TObject);
  private
    procedure AjustaChecks(check: TCheckBox);
    procedure CriaFiltros;
    //procedure BuscaLojas;
    procedure VerificaCheck(painel: tpanel);
    procedure FiltraOrigem;

    { Private declarations }
  public
    { Public declarations }

    inv_nome : string;

  end;

var
  FormFiltrosGestao: TFormFiltrosGestao;

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
  UFormExcelCompras, UFormExtratoPgtoVeiculos, UFormFinanceiroTransportes,
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
  UFormProcPlanFinal, UFormQuitacoesVeiculo, UFormRefFipes, UFormSegIPVALic,
  UFormUltimasAtualizacoes, UFormUsuarios, UFormVistoriadores,
  UFormVistoriasDetalhes, UFormWebBrowse, UforTestesDiversos, UnitLogin;

procedure TFormFiltrosGestao.FiltraOrigem;
var
 selecionado, a : integer;
 inv_nomes : string;
begin

   inv_nome := '';

   With DbgridVendidosOrigem do
    Begin
      for selecionado:= 0 to Pred(SelectedRows.Count) do
      Begin
         Datasource.Dataset.Bookmark:= SelectedRows[selecionado]; //O comando SelectedRows irá indicar qual o registro atual no DataSet
         inv_nome := inv_nome + '''' + DataSource.DataSet.FieldByName('inv_nome').Text +  '''' + ' , ';
      End;
    End;

End;

procedure TFormFiltrosGestao.AjustaChecks(check: TCheckBox);
Begin

  if check = CheckVendidosPrincipal then
  Begin

     CheckEstoquePrincipal.Checked := false;
     CheckProprioEstoque.Checked := false;
     CheckPrazoEstoque.Checked := false;
     CheckAgTransporte.Checked := false;
     CheckEstoque.Checked := false;
     CheckPreparando.Checked := false;
     CheckAutoAvaliar.Checked := false;
     CheckEmVenda.Checked := false;


  End;

  if check = CheckEstoquePrincipal then
  Begin
     CheckVendidosPrincipal.Checked := false;
     CheckProprioVendidos.Checked := false;
     CheckPrazoVendidos.Checked := false;
     CheckArras.Checked := false;
     CheckVendido.Checked := false;
     CheckFinalizado.Checked := false;
     CheckFechamento.Checked := false;
  End;


End;

procedure TFormFiltrosGestao.VerificaCheck( painel : tpanel);
var
    x: integer;
    algumMarcado: boolean;
begin
algumMarcado:=False;
x:=0;
while x <= Self.ComponentCount - 1 do
    begin
    if Self.Components[x].ClassType = TCheckBox then
        if (Self.Components[x] as TCheckBox).Checked then
            if (Self.Components[x] as TCheckBox).Parent = painel then
                begin
                algumMarcado:=True;
                x:=Self.ComponentCount;
                end;
    x := x+1;
    end;
if algumMarcado then
    ShowMessage('Tem CheckBox marcado qtd:' + IntToStr(x))
else
    Application.MessageBox('Não tem CheckBox marcado','Verifica',MB_OK or MB_ICONINFORMATION)
end;

procedure TFormFiltrosGestao.CriaFiltros;
var
 status, where, ou: string;
Begin

  if CheckVendidosPrincipal.Checked = true then
  Begin

   where := '';
   ou := '';

   status := 'Filtro Principal: Vendidos + ';

   if CheckProprioVendidos.Checked = true then
   Begin
    status := status + 'Próprios + ';
   // Filtro Proprio será deduzido ainda por Raoni de como será alimentado na Cad_Car para pesquisa
   End;

   if CheckPrazoVendidos.Checked = true then
   Begin
     status := status + 'Prazo + ';
     // Filtro Prazo será deduzido ainda por Raoni de como será alimentado na Cad_Car para pesquisa
   End;

     status := status + 'De: '+DateToStr(DtIniVendidos.Date)+' Até: ' + DateToStr(DtFimVendidos.Date);
     where := where + ' and Car_DtVenda >= ' + '''' + DateToStr(DtIniVendidos.Date)+ '''' + ' and Car_DtVenda <= ' + ''''+ DateToStr(DtFimVendidos.Date)+ '''';

   // Verifica se check marcou
   var a : integer;
   a := 0;
   if CheckArras.Checked = true then
   a := a +1;
   if CheckFechamento.Checked = true then
   a := a +1;
   if CheckVendido.Checked = true then
   a := a +1;
   if CheckFinalizado.Checked = true then
   a := a +1;

   if a > 1 then
   Begin
     where := where + 'and Car_sit in (';

     if CheckArras.Checked = true then where := where +  QuotedStr('Arras') + ',';
     if CheckVendido.Checked=true then where := where +  QuotedStr('Vendido') + ',';
     if CheckFechamento.Checked=true then where := where + QuotedStr('Fechamento') + ',';
     if CheckFinalizado.Checked=true then where := where + QuotedStr('Finalizado') + ',';

     where := where + QuotedStr('') + ')';
   End
   Else
   Begin
     if CheckArras.Checked = true then where := where + 'and Car_sit = '+ QuotedStr('Arras');
     if CheckVendido.Checked=true then where := where + 'and Car_sit = '+  QuotedStr('Vendido');
     if CheckFechamento.Checked=true then where := where + 'and Car_sit = '+ QuotedStr('Fechamento');
     if CheckFinalizado.Checked=true then where := where + 'and Car_sit = '+ QuotedStr('Finalizado');
   End;

   a := 0;
   if chkUsoVendidos.Checked then
   a := 1;
   if chkSerVendidos.Checked then
   a := 1;
   if chkSelVendidos.Checked then
   a := 1;
   if chkGraVendidos.Checked then
   a := 1;
   if chkIpiVendidos.Checked then
   a := 1;
   if chkNhVendidos.Checked then
   a := 1;
   if chkTerVendidos.Checked then
   a := 1;
   if chkPreVendidos.Checked then
   a := 1;
   if chkRepVendidos.Checked then
   a := 1;

  if a > 0 then
  Begin
     where := where + 'and Car_Loja in (';

     if chkUsoVendidos.Checked = true then where := where +  QuotedStr('0-USO') + ',';
     if chkSerVendidos.Checked=true then where := where +  QuotedStr('1-SER') + ',';
     if chkSelVendidos.Checked=true then where := where + QuotedStr('2-SL') + ',';
     if chkGraVendidos.Checked=true then where := where + QuotedStr('3-GRA') + ',';
     if chkIpiVendidos.Checked=true then where := where + QuotedStr('4-IPI') + ',';
     if chkNhVendidos.Checked=true then where := where + QuotedStr('5-NH') + ',';
     if chkTerVendidos.Checked=true then where := where + QuotedStr('6-TER') + ',';
     if chkPreVendidos.Checked=true then where := where + QuotedStr('7-PRE') + ',';
     if chkRepVendidos.Checked=true then where := where + QuotedStr('8-REP') + ',';

     where := where + QuotedStr('') + ')';
  End;

  a := 0;
  if CheckProprioVendidos.Checked = true then
  a := 1;
  if CheckPrazoVendidos.Checked = true then
  a := 1;

  if a > 0 then
  Begin
     where := where + 'and Inv.Inv_Fone in (';

     if CheckPrazoVendidos.Checked = true then where := where + QuotedStr('Prazo') + ',';
     if CheckProprioVendidos.Checked = true then where := where + QuotedStr('Sem prazo') + ',';

     where := where + QuotedStr('') + ')';
  End;

   FiltraOrigem;

   if inv_nome <> '' then
   Begin
     where := where + ' and inv.inv_nome in (' + inv_nome ;
     where := where + QuotedStr('') + ')';
   End;

   FormGestaoDadosSavauto.LblStatusFiltro.Caption := status;
   FormGestaoDadosSavauto.LblStatusFiltro.Refresh;

   //ShowMessage(where);
   FormGestaoDadosSavauto.QueryWhere := where;
   //ShowMessage(FormGestaoDadosSavauto.QueryWhere);

  End;

  if CheckEstoquePrincipal.Checked = true then
  Begin

   where := '';
   ou := '';

   status := 'Filtro Principal: Estoque + ';

   if CheckProprioEstoque.Checked = true then
   status := status + 'Próprios + ';

   if CheckPrazoEstoque.Checked = true then
   status := status + 'Prazo + ';

   //status := status + 'De: '+DateToStr(DtIniVendidos.Date)+' Até: ' + DateToStr(DtFimVendidos.Date);

   var a : integer;
   a := 0;
   if CheckAgTransporte.Checked = true then
   a := a +1;
   if CheckPreparando.Checked = true then
   a := a +1;
   if CheckEmVenda.Checked = true then
   a := a +1;
   if CheckEstoque.Checked = true then
   a := a +1;
   if CheckAutoAvaliar.Checked = true then
   a := a +1;

   if a > 1 then
   Begin
     where := where + 'and Car_sit in (';

     if CheckAgTransporte.Checked = true then where := where +  QuotedStr('Ag Transporte') + ',';
     if CheckPreparando.Checked=true then where := where +  QuotedStr('Preparando') + ',';
     if CheckEmVenda.Checked=true then where := where + QuotedStr('Em Venda') + ',';
     if CheckEstoque.Checked=true then where := where + QuotedStr('Em Estoque') + ',';
     if CheckAutoAvaliar.Checked=true then where := where + QuotedStr('Auto Avaliar') + ',';

     where := where + QuotedStr('') + ')';
   End
   Else
   Begin
     if CheckAgTransporte.Checked = true then where := where + 'and Car_sit = '+ QuotedStr('Ag Transporte');
     if CheckPreparando.Checked=true then where := where + 'and Car_sit = '+  QuotedStr('Preparando');
     if CheckEmVenda.Checked=true then where := where + 'and Car_sit = '+ QuotedStr('Em Venda');
     if CheckEstoque.Checked=true then where := where + 'and Car_sit = '+ QuotedStr('Em Estoque');
     if CheckAutoAvaliar.Checked=true then where := where + 'and Car_sit = '+ QuotedStr('Auto Avaliar');
   End;

   a := 0;
   if chkUsoEstoque.Checked then
   a := 1;
   if chkSerEstoque.Checked then
   a := 1;
   if chkSelEstoque.Checked then
   a := 1;
   if chkGraEstoque.Checked then
   a := 1;
   if chkIpiEstoque.Checked then
   a := 1;
   if chkNhEstoque.Checked then
   a := 1;
   if chkTerEstoque.Checked then
   a := 1;
   if chkPreEstoque.Checked then
   a := 1;
   if chkRepEstoque.Checked then
   a := 1;

  if a > 0 then
  Begin
     where := where + 'and Car_Loja in (';

     if chkUsoEstoque.Checked = true then where := where +  QuotedStr('0-USO') + ',';
     if chkSerEstoque.Checked=true then where := where +  QuotedStr('1-SER') + ',';
     if chkSelEstoque.Checked=true then where := where + QuotedStr('2-SL') + ',';
     if chkGraEstoque.Checked=true then where := where + QuotedStr('3-GRA') + ',';
     if chkIpiEstoque.Checked=true then where := where + QuotedStr('4-IPI') + ',';
     if chkNhEstoque.Checked=true then where := where + QuotedStr('5-NH') + ',';
     if chkTerEstoque.Checked=true then where := where + QuotedStr('6-TER') + ',';
     if chkPreEstoque.Checked=true then where := where + QuotedStr('7-PRE') + ',';
     if chkRepEstoque.Checked=true then where := where + QuotedStr('8-REP') + ',';

     where := where + QuotedStr('') + ')';
  End;

  a := 0;
  if CheckPrazoEstoque.Checked = true then
  a := 1;
  if CheckProprioEstoque.Checked = true then
  a := 1;

  if a > 0 then
  Begin
     where := where + 'and Inv.Inv_Fone in (';

     if CheckPrazoEstoque.Checked = true then where := where + QuotedStr('Prazo') + ',';
     if CheckProprioEstoque.Checked = true then where := where + QuotedStr('Sem prazo') + ',';

     where := where + QuotedStr('') + ')';
  End;

   FiltraOrigem;

   if inv_nome <> '' then
   Begin
     where := where + ' and inv.inv_nome in (' + inv_nome;
     where := where + QuotedStr('') + ')';
   End;

   FormGestaoDadosSavauto.QueryWhere := where;
   FormGestaoDadosSavauto.LblStatusFiltro.Caption := status;
   FormGestaoDadosSavauto.LblStatusFiltro.Refresh;

   ShowMessage(where);
   ShowMessage(FormGestaoDadosSavauto.QueryWhere);

  End;

End;

{
procedure TFormFiltrosGestao.BuscaLojas;
var
 query : TUniQuery;
Begin

  query := TUniQuery.Create(self);
  query.Connection := DataModuleConexao.UniConnectionSavanna;

  ComboLojas.Items.Clear;

  try

   query.SQL.Clear;
   query.SQL.Add(' select distinct Car_Loja from cadcar order by car_loja ');
   query.Open;

   query.First;

   while not query.Eof do
   Begin
      ComboLojas.Items.Add(query.FieldByName('Car_Loja').Text);
      Query.Next;
   End;

  Except
   On E:Exception Do
   Begin
     ShowMessage('Falha ao buscar lojas! ' + E.Message);
   End;
  end;

End;
}

procedure TFormFiltrosGestao.FormShow(Sender: TObject);
begin

 //BuscaLojas;

 DtFimVendidos.Date := NOW;

 DtIniVendidos.Date := NOW -30;

end;

procedure TFormFiltrosGestao.btnAplicaFiltrosClick(Sender: TObject);
begin

 CriaFiltros;

 if MessageDlg('Deseja efetuar o processamento conforme filtros selecionados?' , mtInformation, [mbyes, mbno] , 0) = MrYes then
 Begin

  FormGestaoDadosSavauto.PanelAtualizar.OnClick(sender);

  Close;

 End;

 Close;

end;

procedure TFormFiltrosGestao.Button1Click(Sender: TObject);
var
 selecionado : integer;
begin

 With DbgridVendidosOrigem do
  Begin
    for selecionado:= 0 to Pred(SelectedRows.Count) do
    Begin
       Datasource.Dataset.Bookmark:= SelectedRows[selecionado]; //O comando SelectedRows irá indicar qual o registro atual no DataSet
       ShowMessage( DataSource.DataSet.FieldByName('inv_nome').Text );
    End;
  End;

end;

procedure TFormFiltrosGestao.CheckEstoquePrincipalClick(Sender: TObject);
begin

  AjustaChecks( CheckEstoquePrincipal );

end;

procedure TFormFiltrosGestao.CheckPrazoEstoqueClick(Sender: TObject);
begin
begin
   if CheckProprioEstoque.Checked = true then
   Begin
      if CheckPrazoEstoque.Checked = true then
      Begin
       qBuscaOrigem.Filter := 'inv_fone in ( ''Prazo'', ''Sem prazo'')';
       qBuscaOrigem.Filtered := true;
      End
      Else
      BEgin
       qBuscaOrigem.Filter := 'inv_fone = ''Sem prazo''';
       qBuscaOrigem.Filtered := true;
      End;
   End
   Else
   Begin
      if CheckPrazoEstoque.Checked = true then
      Begin
       qBuscaOrigem.Filter := 'inv_fone in (''Prazo'')';
       qBuscaOrigem.Filtered := true;
      End;
   End;
end;
end;

procedure TFormFiltrosGestao.CheckPrazoVendidosClick(Sender: TObject);
begin
   if CheckProprioVendidos.Checked = true then
   Begin
      if CheckPrazoVendidos.Checked = true then
      Begin
       qBuscaOrigem.Filter := 'inv_fone in ( ''Prazo'', ''Sem prazo'')';
       qBuscaOrigem.Filtered := true;
      End
      Else
      BEgin
       qBuscaOrigem.Filter := 'inv_fone = ''Sem prazo''';
       qBuscaOrigem.Filtered := true;
      End;
   End
   Else
   Begin
      if CheckPrazoVendidos.Checked = true then
      Begin
       qBuscaOrigem.Filter := 'inv_fone in (''Prazo'')';
       qBuscaOrigem.Filtered := true;
      End;
   End;
end;

procedure TFormFiltrosGestao.CheckProprioEstoqueClick(Sender: TObject);
begin
   if CheckProprioEstoque.Checked = true then
   Begin
      if CheckPrazoEstoque.Checked = true then
      Begin
       qBuscaOrigem.Filter := 'inv_fone in ( ''Prazo'', ''Sem prazo'')';
       qBuscaOrigem.Filtered := true;
      End
      Else
      BEgin
       qBuscaOrigem.Filter := 'inv_fone = ''Sem prazo''';
       qBuscaOrigem.Filtered := true;
      End;
   End
   Else
   Begin
      if CheckPrazoEstoque.Checked = true then
      Begin
       qBuscaOrigem.Filter := 'inv_fone in (''Prazo'')';
       qBuscaOrigem.Filtered := true;
      End;
   End;
end;
procedure TFormFiltrosGestao.CheckProprioVendidosClick(Sender: TObject);
begin
   if CheckProprioVendidos.Checked = true then
   Begin
      if CheckPrazoVendidos.Checked = true then
      Begin
       qBuscaOrigem.Filter := 'inv_fone in ( ''Prazo'', ''Sem prazo'')';
       qBuscaOrigem.Filtered := true;
      End
      Else
      BEgin
       qBuscaOrigem.Filter := 'inv_fone = ''Sem prazo''';
       qBuscaOrigem.Filtered := true;
      End;
   End
   Else
   Begin
      if CheckPrazoVendidos.Checked = true then
      Begin
       qBuscaOrigem.Filter := 'inv_fone in (''Prazo'')';
       qBuscaOrigem.Filtered := true;
      End;
   End;
end;

procedure TFormFiltrosGestao.CheckVendidosPrincipalClick(Sender: TObject);
begin

 AjustaChecks( CheckVendidosPrincipal );


end;

end.
