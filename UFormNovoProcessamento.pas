unit UFormNovoProcessamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.StdCtrls, Vcl.ComCtrls, System.ImageList, Vcl.ImgList,
  Vcl.Imaging.jpeg, uImportExcel, Data.DB, MemDS, DBAccess, Uni, ComObj,
  //Clipbrd,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFormNovoProcessamento = class(TForm)
    ScrollBar1: TScrollBar;
    ImportExcel1: TImportExcel;
    ImportExcel2: TImportExcel;
    OpenDialogBuscaPlan: TOpenDialog;
    Panel1: TPanel;
    btnCancelar: TButton;
    BtnGeraPlanFinal: TBitBtn;
    Panel2: TPanel;
    Panel5: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    DateTimeProcessamento: TDateTimePicker;
    EditIDPlanilha: TEdit;
    Panel3: TPanel;
    Label3: TLabel;
    Panel4: TPanel;
    PanelAcelero: TPanel;
    BtnProcessarAcelero: TSpeedButton;
    Image1: TImage;
    EditDiretorioAcelero: TEdit;
    Panel8: TPanel;
    btnProcessaALD: TSpeedButton;
    EditDiretorioALD: TEdit;
    Panel9: TPanel;
    btnProcessaArval: TSpeedButton;
    EditDiretorioArval: TEdit;
    Panel10: TPanel;
    btnProcessaJSL: TSpeedButton;
    EditDiretorioJSL: TEdit;
    Panel11: TPanel;
    btnProcessaLM: TSpeedButton;
    EditDiretorioLM: TEdit;
    Panel12: TPanel;
    btnProcessaLocaliza: TSpeedButton;
    EditDiretorioLOCALIZA: TEdit;
    Panel13: TPanel;
    btnProcessaOuroVerde: TSpeedButton;
    EditDiretorioOuroVerde: TEdit;
    Panel14: TPanel;
    btnProcessaUnidas: TSpeedButton;
    EditDiretorioUnidas: TEdit;
    Panel15: TPanel;
    btnProcessaMovida: TSpeedButton;
    EditDiretorioMOVIDA: TEdit;
    Panel6: TPanel;
    btnProcTodasPlan: TSpeedButton;
    Panel7: TPanel;
    btnProcNeutron: TSpeedButton;
    EditDiretorioNeutron: TEdit;
    QAtualizaDiretorios: TUniQuery;
    QAtuProcPlan: TUniQuery;
    QBuscaAvaria: TUniQuery;
    QBuscaDados: TUniQuery;
    QBuscaFIPE: TUniQuery;
    QBuscaMescla: TUniQuery;
    QBuscaSavanna: TUniQuery;
    QConcFIPE: TUniQuery;
    QExportaExcel: TUniQuery;
    QInsereDados: TUniQuery;
    QSavannaLocal: TUniQuery;
    Button2: TButton;
    QValidaPlacaJaImportada: TUniQuery;
    Image9: TImage;
    Image10: TImage;
    Image11: TImage;
    Image2: TImage;
    Image12: TImage;
    Image13: TImage;
    Image14: TImage;
    Image3: TImage;
    Image4: TImage;
    Panel16: TPanel;
    Image5: TImage;
    QConferePlaca: TUniQuery;
    Button1: TButton;
    Image6: TImage;
    QAtualizaG: TUniQuery;
    QGravaPlanilha: TUniQuery;
    LblNomeArquivo: TLabel;
    IdHTTP1: TIdHTTP;
    btnALDprecoFixo: TButton;
    procedure EditDiretorioAceleroClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnProcessarAceleroClick(Sender: TObject);
    procedure EditDiretorioALDClick(Sender: TObject);
    procedure EditDiretorioArvalClick(Sender: TObject);
    procedure EditDiretorioJSLClick(Sender: TObject);
    procedure EditDiretorioLMClick(Sender: TObject);
    procedure EditDiretorioLOCALIZAClick(Sender: TObject);
    procedure EditDiretorioMOVIDAClick(Sender: TObject);
    procedure EditDiretorioOuroVerdeClick(Sender: TObject);
    procedure btnProcessaALDClick(Sender: TObject);
    procedure btnProcessaArvalClick(Sender: TObject);
    procedure btnProcessaJSLClick(Sender: TObject);
    procedure btnProcessaLMClick(Sender: TObject);
    procedure btnProcessaLocalizaClick(Sender: TObject);
    procedure btnProcessaMovidaClick(Sender: TObject);
    procedure btnProcessaOuroVerdeClick(Sender: TObject);
    procedure btnProcessaUnidasClick(Sender: TObject);
    procedure btnProcTodasPlanClick(Sender: TObject);
    procedure EditDiretorioUnidasClick(Sender: TObject);
    procedure EditDiretorioNeutronClick(Sender: TObject);
    procedure btnProcNeutronClick(Sender: TObject);
    procedure BtnGeraPlanFinalClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image9Click(Sender: TObject);
    procedure Image10Click(Sender: TObject);
    procedure Image11Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image12Click(Sender: TObject);
    procedure Image13Click(Sender: TObject);
    procedure Image14Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure btnALDprecoFixoClick(Sender: TObject);
  private

 { procedure ImportaPlanACELERO();
  procedure CarregaExcelACELERO();

  procedure CarregaExcelALDprecoFixo();
  procedure ImportaPlanALDprecoFixo();

  procedure ImportaPlanALD();
  procedure CarregaExcelALD();

  procedure ImportaPlanARVAL();
  procedure CarregaExcelARVAL();

  procedure CarregaExcelNeutron();
  procedure ImportaPlanNeutron();

  procedure ImportaPlanJSL();
  procedure CarregaExcelJSL();

  procedure ImportaPlanLM();
  procedure CarregaExcelLM();

  procedure ImportaPlanLOCALIZA();
  procedure CarregaExcelLOCALIZA();

  procedure ImportaPlanMOVIDA();
  procedure CarregaExcelMOVIDA();

  procedure ImportaPlanOUROVERDE();
  procedure CarregaExcelOUROVERDE();

  procedure ImportaPlanUNIDAS();
  procedure CarregaExcelUNIDAS();

  procedure ProcPlanAcelero();
  procedure ProcPlanALD();
  procedure ProcPlanArval();
  procedure ProcPlanJSL();
  procedure ProcPlanLM();
  procedure ProcPlanLocaliza();
  procedure ProcPlanMovida();
  procedure ProcPlanOuroVerde();
  procedure ProcPlanUnidas();
  procedure ProcPlanNeutron();}

  public
    { Public declarations }

  ValorRef2, ValorRef3, Margem : Currency;
  Ref1 , Ref2, Ref3, Principal : String;

  procedure ImportaPlanACELERO();
  procedure CarregaExcelACELERO();

  procedure CarregaExcelALDprecoFixo();
  procedure ImportaPlanALDprecoFixo();

  procedure ImportaPlanALD();
  procedure CarregaExcelALD();

  procedure ImportaPlanARVAL();
  procedure CarregaExcelARVAL();

  procedure CarregaExcelNeutron();
  procedure ImportaPlanNeutron();

  procedure ImportaPlanJSL();
  procedure CarregaExcelJSL();

  procedure ImportaPlanLM();
  procedure CarregaExcelLM();

  procedure ImportaPlanLOCALIZA();
  procedure CarregaExcelLOCALIZA();

  procedure ImportaPlanMOVIDA();
  procedure CarregaExcelMOVIDA();

  procedure ImportaPlanOUROVERDE();
  procedure CarregaExcelOUROVERDE();

  procedure ImportaPlanUNIDAS();
  procedure CarregaExcelUNIDAS();

  procedure ProcPlanAcelero();
  procedure ProcPlanALD();
  procedure ProcPlanArval();
  procedure ProcPlanJSL();
  procedure ProcPlanLM();
  procedure ProcPlanLocaliza();
  procedure ProcPlanMovida();
  procedure ProcPlanOuroVerde();
  procedure ProcPlanUnidas();
  procedure ProcPlanNeutron();
  procedure ImportaPlanARVALLoteC;
  end;

var
  FormNovoProcessamento: TFormNovoProcessamento;

implementation



{$R *.dfm}

uses UDataModuleConexao, UFormAtualizaTabelaFipe, UFormLoading, UFormPrincipal,
  UFormProcPlanAcelero, UFormConcFipeModelo, UFormExcelCompras,
  UFormAtuHistFIPE, UFormHistFIPE, UFormProcPlanFinal,
  UFormAnaliseComprasTabela, UFormAnaliseCompraQuery, UFormAplicaMargem,
  UFormColunasOcultas, UFormDownloadNovaVersao, UFormPadroesPlanilhas,
  UFormImagem, UFormAnaliseCompra, UFormImportacoesEfetuadas,
  UFormUltimasAtualizacoes, UFormWebBrowse, Loading, UDataModuleRESTDWvistoria,
  UDMRestDataWareDB, UFormAtuTabFIpe, UFormAvarias, UFormCadVistoriadores,
  UFormGestaoVistoria, UFormLoadingOpaco, UFormLotesArval, UFormNovoVistoriador,
  UFormVistoriadores, UFormVistoriasDetalhes, UforTestesDiversos,
  FMX.UFormGraficosAtendimento, UDataModuleBancoVistoria, UDMPermissoes,
  UFormAgendamento, UFormAjusteDadosFipeAvaliacao, UFormAlteracaoProposta,
  UFormAlteracaoVeiculo, UFormAlteraDadosCliente, UFormAlteraFipeDePaxa,
  UFormAlteraMidiaAnuncio, UFormAlteraPlaca, UFormAtendimentoMultasVeiculo,
  UFormAtendimentoNovo, UFormAtendimentos, UFormAvaliarAvaliacao,
  UFormAvariasItens, UFormCadaNovoUsuMobile, UFormCadaUsuario,
  UFormCadaUsuariosMobile, UFormConcedePermissao, UFormConsutaPlacaAvaliacao,
  UFormCriacaoAvaria, UFormCruzamentoFipes, UFormDadosPagamento,
  UFormDadosPerfil, UFormDataPagamento, UFormDetalhesAtendimento,
  UFormDetalhesAvaliacao, UFormExtratoPgtoVeiculos, UFormGestaoAvaliacoes,
  UFormGestaoAvarias, UFormHistoricoAvaliacoes, UFormHistoricoObsAtn,
  UFormInformacoes, UFormLiberaPermissao, UFormListaUsuarios,
  UFormLoadingCarregamento, UFormLoginSavauto, UFormMenuFinanceiro,
  UFormNovaAvaliacao, UformNovaObs, UFormPagamentoVeiculo, UFormParametros,
  UFormPerfis, UFormPermissoesCarga, UFormPesquisaFipe, UFormPgtoExtratoVeiculo,
  UFormQuitacoesVeiculo, UFormRefFipes, UFormSegIPVALic, UFormUsuarios,
  UnitLogin;


Function Alltrim(const Search: string): string;
{Remove os espaços em branco de ambos os lados da string}
const
BlackSpace = [#33..#126];
var
Index: byte;
begin
Index:=1;
while (Index <= Length(Search)) and not (Search[Index] in BlackSpace) do
       begin
       Index:=Index + 1;
       end;
Result:=Copy(Search, Index, 255);
Index := Length(Result);
while (Index > 0) and not (Result[Index] in BlackSpace) do
       begin
       Index:=Index - 1;
       end;
Result := Copy(Result, 1, Index);
end;




procedure TFormNovoProcessamento.BtnProcessarAceleroClick(Sender: TObject);
Begin
 if EditDiretorioAcelero.Text <> ''  then
 Begin
   if not FileExists(EditDiretorioAcelero.Text) then
   Begin
     MessageDlg('Arquivo do diretório não encontrado. Recarregue o arquivo no diretório', mtWarning, [mbok], 0);
   End
   Else
   Begin

     if FormLoading = nil then
     Begin
       FormLoading := TFormLoading.Create(self);
     End;

     FormLoading.LabelStatus.Caption := 'Importando planilha acelero';
     FormLoading.Position := poScreenCenter;
     FormLoading.Show;
     Application.ProcessMessages;
     CarregaExcelACELERO;
     Application.ProcessMessages;
     ImportaPlanACELERO;
     FormLoading.Close;

     // REVISAR QTD da planilha importada
     QGravaPlanilha.SQL.Clear;
     QGravaPlanilha.SQL.Add('insert TBIMPORTACOES (PLANILHA, DATAIMPORT, FORNECEDOR, STATUS) values (:PLAN, :DT, :FOR, ''Em Analise'')');
     QGravaPlanilha.ParamByName('PLAN').Text := LblNomeArquivo.Caption;
     QGravaPlanilha.ParamByName('DT').AsDate := NOW;
     QGravaPlanilha.ParamByName('FOR').Text := 'ACELERO';
     QGravaPlanilha.Execute;

   End;
 End;
end;

procedure TFormNovoProcessamento.btnProcTodasPlanClick(Sender: TObject);
var
Excel:variant;
Linha, vendas30dias, EstoqueAtual, Qtd: integer;
cod_fipe, modelo, mod_ano : String;
vl_ultima_venda : Currency;
DT_VENDA : TDate;
Begin
 if MessageDlg('Deseja mesmo processar todas as planilhas carregadas?', mtInformation, [mbno, mbyes], 0) = mrYes then
 Begin

   FormProcPlanFinal.Position := poScreenCenter;
   FormProcPlanFinal.ShowModal;

   QAtuProcPlan.SQL.Clear;
   QAtuProcPlan.SQL.Add('select acelero from TBPLANILHAS where id = :id');
   QAtuProcPlan.ParamByName('id').AsInteger := StrToInt(EditIDPlanilha.Text);
   QAtuProcPlan.Open;

   if QAtuProcPlan.FieldByName('acelero').AsInteger = 0 then
   BtnProcessarAcelero.OnClick(Sender);

   QAtuProcPlan.SQL.Clear;
   QAtuProcPlan.SQL.Add('select ald from TBPLANILHAS where id = :id');
   QAtuProcPlan.ParamByName('id').AsInteger := StrToInt(EditIDPlanilha.Text);
   QAtuProcPlan.Open;

   if QAtuProcPlan.FieldByName('ald').AsInteger = 0 then
   btnProcessaALD.Click();

   QAtuProcPlan.SQL.Clear;
   QAtuProcPlan.SQL.Add('select arval from TBPLANILHAS where id = :id');
   QAtuProcPlan.ParamByName('id').AsInteger := StrToInt(EditIDPlanilha.Text);
   QAtuProcPlan.Open;

   if QAtuProcPlan.FieldByName('arval').AsInteger = 0 then
   btnProcessaArval.Click();

   QAtuProcPlan.SQL.Clear;
   QAtuProcPlan.SQL.Add('select jsl from TBPLANILHAS where id = :id');
   QAtuProcPlan.ParamByName('id').AsInteger := StrToInt(EditIDPlanilha.Text);
   QAtuProcPlan.Open;

   if QAtuProcPlan.FieldByName('jsl').AsInteger = 0 then
   btnProcessaJSL.Click();

   QAtuProcPlan.SQL.Clear;
   QAtuProcPlan.SQL.Add('select LM from TBPLANILHAS where id = :id');
   QAtuProcPlan.ParamByName('id').AsInteger := StrToInt(EditIDPlanilha.Text);
   QAtuProcPlan.Open;

   if QAtuProcPlan.FieldByName('LM').AsInteger = 0 then
   btnProcessaLMClick(Sender);

   QAtuProcPlan.SQL.Clear;
   QAtuProcPlan.SQL.Add('select localiza from TBPLANILHAS where id = :id');
   QAtuProcPlan.ParamByName('id').AsInteger := StrToInt(EditIDPlanilha.Text);
   QAtuProcPlan.Open;

   if QAtuProcPlan.FieldByName('localiza').AsInteger = 0 then
   btnProcessaLocalizaClick(Sender);

   QAtuProcPlan.SQL.Clear;
   QAtuProcPlan.SQL.Add('select movida from TBPLANILHAS where id = :id');
   QAtuProcPlan.ParamByName('id').AsInteger := StrToInt(EditIDPlanilha.Text);
   QAtuProcPlan.Open;

   if QAtuProcPlan.FieldByName('movida').AsInteger = 0 then
   btnProcessaMovidaClick(Sender);

   QAtuProcPlan.SQL.Clear;
   QAtuProcPlan.SQL.Add('select ouro_verde from TBPLANILHAS where id = :id');
   QAtuProcPlan.ParamByName('id').AsInteger := StrToInt(EditIDPlanilha.Text);
   QAtuProcPlan.Open;

   if QAtuProcPlan.FieldByName('ouro_verde').AsInteger = 0 then
   btnProcessaOuroVerdeClick(Sender);

   QAtuProcPlan.SQL.Clear;
   QAtuProcPlan.SQL.Add('select unidas from TBPLANILHAS where id = :id');
   QAtuProcPlan.ParamByName('id').AsInteger := StrToInt(EditIDPlanilha.Text);
   QAtuProcPlan.Open;

   if QAtuProcPlan.FieldByName('unidas').AsInteger = 0 then
   btnProcessaUnidasClick(Sender);

   QAtuProcPlan.SQL.Clear;
   QAtuProcPlan.SQL.Add('select neutron from TBPLANILHAS where id = :id');
   QAtuProcPlan.ParamByName('id').AsInteger := StrToInt(EditIDPlanilha.Text);
   QAtuProcPlan.Open;

   if QAtuProcPlan.FieldByName('neutron').AsInteger = 0 then
   btnProcNeutronClick(Sender);


   if MessageDlg('Planilhas importadas com sucesso!' +#13+
                 'Deseja exportar planilha de analise de compras agora?', mtInformation, [mbno, mbyes],0) = mrYes then
   Begin

   {QAtuProcPlan.SQL.Clear;
   QAtuProcPlan.SQL.Add('delete from TBPROCPLANS where id_plan_for = :id');
   QAtuProcPlan.ParamByName('id').AsInteger := StrToInt(EditIDPlanilha.Text);
   QAtuProcPlan.Execute;}

   // acelero
   QBuscaDados.SQL.Clear;
   QBuscaDados.SQL.Add('select placa, modelo, km, canal, fipe, vlr_minimo, tempo_estoque, onde, local from');
   QBuscaDados.SQL.Add('TBPLANACELERO where id = :id');
   QBuscaDados.ParamByName('id').AsInteger := StrToInt(EditIDPlanilha.Text);
   QBuscaDados.Open;

   if not QBuscaDados.IsEmpty then
   Begin

   FormLoading.Position := poScreenCenter;
   FormLoading.LabelStatus.Caption := 'Processando planilha final';
   FormLoading.Show;

   Application.ProcessMessages;

   QBuscaDados.First;

   while not QBuscaDados.Eof do
   Begin

           // Carrega cod_fipe da conciliação
     QBuscaMescla.SQL.Clear;
     QBuscaMescla.SQL.Add('select cod_fipe from TBCONCFIPEMODELO where modelo=:mod and fornecedor = ''ACELERO''');
     QBuscaMescla.SQL.Add('and ANO=:ano');
     QBuscaMescla.ParamByName('ano').Text := QBuscaDados.FieldByName('mod_fab').Text;
     QBuscaMescla.ParamByName('mod').Text := QBuscaDados.FieldByName('modelo').Text;
     QBuscaMescla.Open;

     //ShowMessage('FIPE '+QBuscaMescla.FieldByName('cod_fipe').Text);

     if not QBuscaMescla.IsEmpty then
     Begin

     cod_fipe := QBuscaMescla.FieldByName('cod_fipe').Text;


         // Carrega vendas dos ultimos 30 dias
         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select COUNT(*) as vnd from IMPORTASAVANNAVENDA30DIAS');
         QSavannaLocal.SQL.Add('where FIPE = :fipe and ano=:ANO');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := QBuscaDados.FieldByName('mod_fab').Text;
         QSavannaLocal.Open;

         Application.ProcessMessages;

         if not QSavannaLocal.FieldByName('vnd').IsNull then
         vendas30dias := QSavannaLocal.FieldByName('vnd').AsInteger
         Else
         vendas30dias := 0;

         // Carrega ultimo vlr de venda
         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select valor, data from IMPORTASAVANNAULTIMASVENDAS');
         QSavannaLocal.SQL.Add('where FIPE = :fipe and ano=:ano');
         QSavannaLocal.SQL.Add('order by data desc ');
         QSavannaLocal.SQL.Add('limit 1');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := QBuscaDados.FieldByName('mod_fab').Text;
         QSavannaLocal.Open;

       //ShowMessage('Buscou vlr venda');

         Application.ProcessMessages;

         if QSavannaLocal.FieldByName('valor').AsCurrency <> null then
         vl_ultima_venda := QSavannaLocal.FieldByName('valor').AsCurrency
         Else
         vl_ultima_venda := 0;

         if QSavannaLocal.FieldByName('data').AsDateTime <> null then
         DT_VENDA := QSavannaLocal.FieldByName('data').AsDateTime
         Else
         DT_VENDA := null;

         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select sum(qtd) as  Estoque from IMPORTASAVANNAESTOQUE where FIPE = :fipe and ano=:ano');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := QBuscaDados.FieldByName('mod_fab').Text;
         QSavannaLocal.Open;


          Application.ProcessMessages;

         if not QSavannaLocal.FieldByName('Estoque').IsNull then
         EstoqueAtual := QSavannaLocal.FieldByName('Estoque').AsInteger
         Else
         EstoqueAtual := 0;

         End;

        Application.ProcessMessages;


        Qtd := Length(QBuscaDados.FieldByName('modelo').Text);

     //ShowMessage('Formatou QTD');

     mod_ano := Copy(QBuscaDados.FieldByName('modelo').Text, qtd -3, qtd);

     //ShowMessage('Formatou QTD e ANO modelo');

     QInsereDados.SQL.Clear;
     QInsereDados.SQL.Add('insert into TBPROCPLANS');
     QInsereDados.SQL.Add('( licitacao, lote, placa, modelo, km, ano, ano_mod, cor, vlr_min,');
     QInsereDados.SQL.Add('  vlr_min_fipe, vlr_min_dois, compra_ja, vlr_fipe, vlr_merc_um, vlr_merc_dois,');
     QInsereDados.SQL.Add('  venda_trinta_dias, estoque, vlr_ult_venda, dt_ult_venda, atacado_varejo, categoria, g_zero,');
     QInsereDados.SQL.Add(' mg, avaria, resultado, min_resultado, lance, lance_fipe, compra, sn,');
     QInsereDados.SQL.Add('  dt_pgto, qtd, fornecedor, id_plan_for, cod_fipe)');
     QInsereDados.SQL.Add('values');
     QInsereDados.SQL.Add('(:licitacao, :lote, :placa, :modelo, :km, :ano, :anomod, :cor, :vlr_min,');
     QInsereDados.SQL.Add(':vlr_min_fipe, :vlr_min_dois, :compra_ja, :fipe, :vlr_m_um, :vlr_m_dois,');
     QInsereDados.SQL.Add(':venda_trinta_dias, :estoque, :vlr_ult_venda, :dt_venda, :ata_var, :cat, :gzero,');
     QInsereDados.SQL.Add(':mg, :avaria, :result, :min_result, :lance, :lance_fipe, :compra, :sn, :dt_pgto,');
     QInsereDados.SQL.Add(':qtd, :fornecedor, :id_plan, :c_fipe)');
     QInsereDados.ParamByName('licitacao').Text := '';
     QInsereDados.ParamByName('lote').Text := '';
     QInsereDados.ParamByName('placa').Text := QBuscaDados.FieldByName('placa').Text;
     QInsereDados.ParamByName('modelo').Text := QBuscaDados.FieldByName('modelo').Text;
     QInsereDados.ParamByName('km').AsCurrency := QBuscaDados.FieldByName('km').AsCurrency;
     QInsereDados.ParamByName('ano').Text := '';
     QInsereDados.ParamByName('dt_venda').AsDate := DT_VENDA;
     QInsereDados.ParamByName('anomod').Text := mod_ano;
     QInsereDados.ParamByName('cor').Text := '';
     QInsereDados.ParamByName('vlr_min').AsCurrency := QBuscaDados.FieldByName('vlr_minimo').AsCurrency;
     QInsereDados.ParamByName('vlr_min_fipe').AsCurrency := 0;
     QInsereDados.ParamByName('vlr_min_dois').AsCurrency := 0;
     QInsereDados.ParamByName('compra_ja').AsCurrency := 0;
     QInsereDados.ParamByName('fipe').AsCurrency := QBuscaDados.FieldByName('fipe').AsCurrency;
     QInsereDados.ParamByName('vlr_m_um').AsCurrency := 0;
     QInsereDados.ParamByName('vlr_m_dois').AsCurrency := 0;
     QInsereDados.ParamByName('venda_trinta_dias').AsInteger := vendas30dias;
     QInsereDados.ParamByName('estoque').AsInteger := EstoqueAtual;
     QInsereDados.ParamByName('vlr_ult_venda').AsCurrency := vl_ultima_venda;
     QInsereDados.ParamByName('ata_var').Text := '';
     QInsereDados.ParamByName('gzero').AsCurrency := 0;
     QInsereDados.ParamByName('mg').AsCurrency := 0;
     QInsereDados.ParamByName('c_fipe').Text := cod_fipe;

     QBuscaAvaria.SQL.Clear;
     QBuscaAvaria.SQL.Add('select coalesce(avaria,0) as avaria, coalesce(categoria,'' '') as cat  from TBPLANNEUTRON where fornecedor = ''ACELERO'' and placa=:pl');
     QBuscaAvaria.ParamByName('pl').Text := QBuscaDados.FieldByName('placa').Text;
     QBuscaAvaria.Open;

     if QBuscaAvaria.FieldByName('avaria').AsCurrency > 0 then
     QInsereDados.ParamByName('avaria').AsCurrency := QBuscaAvaria.FieldByName('avaria').AsCurrency
     Else
     QInsereDados.ParamByName('avaria').AsCurrency := 0;

     QInsereDados.ParamByName('cat').Text := QBuscaAvaria.FieldByName('cat').Text;
     QInsereDados.ParamByName('result').AsCurrency := 0;
     QInsereDados.ParamByName('min_result').AsCurrency := 0;
     QInsereDados.ParamByName('lance').AsCurrency := 0;
     QInsereDados.ParamByName('lance_fipe').AsCurrency := 0;
     QInsereDados.ParamByName('compra').AsCurrency := 0;
     QInsereDados.ParamByName('sn').Text := '';
     QInsereDados.ParamByName('dt_pgto').AsDate := StrToDate('01/01/1991');
     QInsereDados.ParamByName('qtd').AsInteger := 0;
     QInsereDados.ParamByName('fornecedor').Text := 'ACELERO';
     QInsereDados.ParamByName('id_plan').AsInteger := StrToInt(EditIDPlanilha.Text);
     QInsereDados.Execute;

     FormLoading.LabelStatus.Caption := 'Processou placa Acelero: '+QBuscaDados.FieldByName('placa').Text;
     Application.ProcessMessages;

     QBuscaDados.Next;

   End;

   FormLoading.Close;

   
   End;

      // ALD
   QBuscaDados.SQL.Clear;
   QBuscaDados.SQL.Add('select marca, modelo, versao, placa, ano_mod, km, cor_externo, preco_inicial from');
   QBuscaDados.SQL.Add('TBPLANALD where id = :id');
   QBuscaDados.ParamByName('id').AsInteger := StrToInt(EditIDPlanilha.Text);
   QBuscaDados.Open;

   if not QBuscaDados.IsEmpty then
   Begin

   FormLoading.Position := poScreenCenter;
   FormLoading.LabelStatus.Caption := 'Processando planilha final';
   FormLoading.Show;

   Application.ProcessMessages;

   QBuscaDados.First;

   while not QBuscaDados.Eof do
   Begin

           // Carrega cod_fipe da conciliação
     QBuscaMescla.SQL.Clear;
     QBuscaMescla.SQL.Add('select cod_fipe from TBCONCFIPEMODELO where modelo=:mod and fornecedor = ''ALD''');
     QBuscaMescla.SQL.Add('and ANO=:ano');
     QBuscaMescla.ParamByName('ano').Text := QBuscaDados.FieldByName('ano_mod').Text;
     QBuscaMescla.ParamByName('mod').Text := QBuscaDados.FieldByName('modelo').Text;
     QBuscaMescla.Open;

     //ShowMessage('FIPE '+QBuscaMescla.FieldByName('cod_fipe').Text);

     if not QBuscaMescla.IsEmpty then
     Begin

     cod_fipe := QBuscaMescla.FieldByName('cod_fipe').Text;


         // Carrega vendas dos ultimos 30 dias
         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select COUNT(*) as vnd from IMPORTASAVANNAVENDA30DIAS');
         QSavannaLocal.SQL.Add('where FIPE = :fipe and ano=:ANO');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := QBuscaDados.FieldByName('mod_mod').Text;
         QSavannaLocal.Open;

         Application.ProcessMessages;

         if not QSavannaLocal.FieldByName('vnd').IsNull then
         vendas30dias := QSavannaLocal.FieldByName('vnd').AsInteger
         Else
         vendas30dias := 0;

         // Carrega ultimo vlr de venda
         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select valor, data from IMPORTASAVANNAULTIMASVENDAS');
         QSavannaLocal.SQL.Add('where FIPE = :fipe and ano=:ano');
         QSavannaLocal.SQL.Add('order by data desc ');
         QSavannaLocal.SQL.Add('limit 1');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := QBuscaDados.FieldByName('mod_mod').Text;
         QSavannaLocal.Open;

       //ShowMessage('Buscou vlr venda');

         Application.ProcessMessages;

         if QSavannaLocal.FieldByName('valor').AsCurrency <> null then
         vl_ultima_venda := QSavannaLocal.FieldByName('valor').AsCurrency
         Else
         vl_ultima_venda := 0;

         if QSavannaLocal.FieldByName('data').AsDateTime <> null then
         DT_VENDA := QSavannaLocal.FieldByName('data').AsDateTime
         Else
         DT_VENDA := null;

         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select sum(qtd) as  Estoque from IMPORTASAVANNAESTOQUE where FIPE = :fipe and ano=:ano');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := QBuscaDados.FieldByName('mod_mod').Text;
         QSavannaLocal.Open;


          Application.ProcessMessages;

         if not QSavannaLocal.FieldByName('Estoque').IsNull then
         EstoqueAtual := QSavannaLocal.FieldByName('Estoque').AsInteger
         Else
         EstoqueAtual := 0;

         End;

     Application.ProcessMessages;


     QInsereDados.SQL.Clear;
     QInsereDados.SQL.Add('insert into TBPROCPLANS');
     QInsereDados.SQL.Add('( licitacao, lote, placa, modelo, km, ano, ano_mod, cor, vlr_min,');
     QInsereDados.SQL.Add('  vlr_min_fipe, vlr_min_dois, compra_ja, vlr_fipe, vlr_merc_um, vlr_merc_dois,');
     QInsereDados.SQL.Add('  venda_trinta_dias, estoque, vlr_ult_venda, dt_ult_venda, atacado_varejo, categoria, g_zero,');
     QInsereDados.SQL.Add(' mg, avaria, resultado, min_resultado, lance, lance_fipe, compra, sn,');
     QInsereDados.SQL.Add('  dt_pgto, qtd, fornecedor, id_plan_for, cod_fipe)');
     QInsereDados.SQL.Add('values');
     QInsereDados.SQL.Add('(:licitacao, :lote, :placa, :modelo, :km, :ano, :anomod, :cor, :vlr_min,');
     QInsereDados.SQL.Add(':vlr_min_fipe, :vlr_min_dois, :compra_ja, :fipe, :vlr_m_um, :vlr_m_dois,');
     QInsereDados.SQL.Add(':venda_trinta_dias, :estoque, :vlr_ult_venda, :dt_venda, :ata_var, :cat, :gzero,');
     QInsereDados.SQL.Add(':mg, :avaria, :result, :min_result, :lance, :lance_fipe, :compra, :sn, :dt_pgto,');
     QInsereDados.SQL.Add(':qtd, :fornecedor, :id_plan, :c_fipe)');
     QInsereDados.ParamByName('licitacao').Text := '';
     QInsereDados.ParamByName('lote').Text := '';
     QInsereDados.ParamByName('placa').Text := QBuscaDados.FieldByName('placa').Text;
     QInsereDados.ParamByName('modelo').Text := QBuscaDados.FieldByName('versao').Text;
     QInsereDados.ParamByName('km').AsCurrency := QBuscaDados.FieldByName('km').AsCurrency;
     QInsereDados.ParamByName('ano').Text := '';
     QInsereDados.ParamByName('anomod').Text := QBuscaDados.FieldByName('ano_mod').Text;
     QInsereDados.ParamByName('cor').Text := QBuscaDados.FieldByName('cor_externo').Text;
     QInsereDados.ParamByName('vlr_min').AsCurrency := QBuscaDados.FieldByName('preco_inicial').AsCurrency;
     QInsereDados.ParamByName('vlr_min_fipe').AsCurrency := 0;
     QInsereDados.ParamByName('vlr_min_dois').AsCurrency := 0;
     QInsereDados.ParamByName('compra_ja').AsCurrency := 0;
     QInsereDados.ParamByName('c_fipe').Text := cod_fipe;

     // Proc busca FIPE
     QBuscaFIPE.SQL.Clear;
     QBuscaFIPE.SQL.Add('select vlr_fipe from TBCONCFIPEMODELO where modelo = :mod and ano=:ano and fornecedor = ''ALD'' ');
     QBuscaFIPE.ParamByName('mod').Text := QBuscaDados.FieldByName('versao').Text;
     QBuscaFIPE.ParamByName('ano').Text := QBuscaDados.FieldByName('ano_mod').Text;
     QBuscaFIPE.Open;

     if QBuscaFIPE.FieldByName('vlr_fipe').AsCurrency > 0 then
     QInsereDados.ParamByName('fipe').AsCurrency := QBuscaFIPE.FieldByName('vlr_fipe').AsCurrency
     Else
     QInsereDados.ParamByName('fipe').AsCurrency := 0;

     QInsereDados.ParamByName('vlr_m_um').AsCurrency := 0;
     QInsereDados.ParamByName('vlr_m_dois').AsCurrency := 0;
     QInsereDados.ParamByName('venda_trinta_dias').AsCurrency := vendas30dias;
     QInsereDados.ParamByName('estoque').AsFloat := EstoqueAtual;
     QInsereDados.ParamByName('vlr_ult_venda').AsCurrency := vl_ultima_venda;
     QInsereDados.ParamByName('dt_venda').AsDate := DT_VENDA;
     QInsereDados.ParamByName('ata_var').Text := '';
     QInsereDados.ParamByName('gzero').AsCurrency := 0;
     QInsereDados.ParamByName('mg').AsCurrency := 0;

     QBuscaAvaria.SQL.Clear;
     QBuscaAvaria.SQL.Add('select avaria, coalesce(categoria,'' '') as cat from TBPLANNEUTRON where fornecedor = ''ALD'' and placa=:pl');
     QBuscaAvaria.ParamByName('pl').Text := QBuscaDados.FieldByName('placa').Text;
     QBuscaAvaria.Open;

     if QBuscaAvaria.FieldByName('avaria').AsCurrency > 0 then
     QInsereDados.ParamByName('avaria').AsCurrency := QBuscaAvaria.FieldByName('avaria').AsCurrency
     Else
     QInsereDados.ParamByName('avaria').AsCurrency := 0;

     QInsereDados.ParamByName('cat').Text := QBuscaAvaria.FieldByName('cat').Text;
     QInsereDados.ParamByName('result').AsCurrency := 0;
     QInsereDados.ParamByName('min_result').AsCurrency := 0;
     QInsereDados.ParamByName('lance').AsCurrency := 0;
     QInsereDados.ParamByName('lance_fipe').AsCurrency := 0;
     QInsereDados.ParamByName('compra').AsCurrency := 0;
     QInsereDados.ParamByName('sn').Text := '';
     QInsereDados.ParamByName('dt_pgto').AsDate := StrToDate('01/01/1991');
     QInsereDados.ParamByName('qtd').AsInteger := 0;
     QInsereDados.ParamByName('fornecedor').Text := 'ALD';
     QInsereDados.ParamByName('id_plan').AsInteger := StrToInt(EditIDPlanilha.Text);
     QInsereDados.Execute;

     FormLoading.LabelStatus.Caption := 'Processou placa ALD: '+QBuscaDados.FieldByName('placa').Text;
     Application.ProcessMessages;

     QBuscaDados.Next;

   End;

   FormLoading.Close;
   End;

   // arval
   QBuscaDados.SQL.Clear;
   QBuscaDados.SQL.Add('select licitacao, lote, placa, modelo, km, cor, ano_mod from');
   QBuscaDados.SQL.Add('TBPLANARVAL where id = :id');
   QBuscaDados.ParamByName('id').AsInteger := StrToInt(EditIDPlanilha.Text);
   QBuscaDados.Open;

   if not QBuscaDados.IsEmpty then
   Begin

   FormLoading.Position := poScreenCenter;
   FormLoading.LabelStatus.Caption := 'Processando planilha final';
   FormLoading.Show;

   Application.ProcessMessages;

   QBuscaDados.First;

   while not QBuscaDados.Eof do
   Begin

        // Carrega cod_fipe da conciliação
     QBuscaMescla.SQL.Clear;
     QBuscaMescla.SQL.Add('select cod_fipe from TBCONCFIPEMODELO where modelo=:mod and fornecedor = ''ARVAL''');
     QBuscaMescla.SQL.Add('and ANO=:ano');
     QBuscaMescla.ParamByName('ano').Text := QBuscaDados.FieldByName('ano_mod').Text;
     QBuscaMescla.ParamByName('mod').Text := QBuscaDados.FieldByName('modelo').Text;
     QBuscaMescla.Open;

     //ShowMessage('FIPE '+QBuscaMescla.FieldByName('cod_fipe').Text);

     if not QBuscaMescla.IsEmpty then
     Begin

     cod_fipe := QBuscaMescla.FieldByName('cod_fipe').Text;


         // Carrega vendas dos ultimos 30 dias
         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select COUNT(*) as vnd from IMPORTASAVANNAVENDA30DIAS');
         QSavannaLocal.SQL.Add('where FIPE = :fipe and ano=:ANO');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := QBuscaDados.FieldByName('ano_mod').Text;
         QSavannaLocal.Open;

         Application.ProcessMessages;

         if not QSavannaLocal.FieldByName('vnd').IsNull then
         vendas30dias := QSavannaLocal.FieldByName('vnd').AsInteger
         Else
         vendas30dias := 0;

         // Carrega ultimo vlr de venda
         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select valor, data from IMPORTASAVANNAULTIMASVENDAS');
         QSavannaLocal.SQL.Add('where FIPE = :fipe and ano=:ano');
         QSavannaLocal.SQL.Add('order by data desc ');
         QSavannaLocal.SQL.Add('limit 1');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := QBuscaDados.FieldByName('ano_mod').Text;
         QSavannaLocal.Open;

       //ShowMessage('Buscou vlr venda');

         Application.ProcessMessages;

         if QSavannaLocal.FieldByName('valor').AsCurrency <> null then
         vl_ultima_venda := QSavannaLocal.FieldByName('valor').AsCurrency
         Else
         vl_ultima_venda := 0;

         if QSavannaLocal.FieldByName('data').AsDateTime <> null then
         DT_VENDA := QSavannaLocal.FieldByName('data').AsDateTime
         Else
         DT_VENDA := null;

         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select sum(qtd) as  Estoque from IMPORTASAVANNAESTOQUE where FIPE = :fipe and ano=:ano');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := QBuscaDados.FieldByName('ano_mod').Text;
         QSavannaLocal.Open;


          Application.ProcessMessages;

         if not QSavannaLocal.FieldByName('Estoque').IsNull then
         EstoqueAtual := QSavannaLocal.FieldByName('Estoque').AsInteger
         Else
         EstoqueAtual := 0;

         end;

     Application.ProcessMessages;


     QInsereDados.SQL.Clear;
     QInsereDados.SQL.Add('insert into TBPROCPLANS');
     QInsereDados.SQL.Add('( licitacao, lote, placa, modelo, km, ano, ano_mod, cor, vlr_min,');
     QInsereDados.SQL.Add('  vlr_min_fipe, vlr_min_dois, compra_ja, vlr_fipe, vlr_merc_um, vlr_merc_dois,');
     QInsereDados.SQL.Add('  venda_trinta_dias, estoque, vlr_ult_venda, dt_ult_venda, atacado_varejo, categoria, g_zero,');
     QInsereDados.SQL.Add(' mg, avaria, resultado, min_resultado, lance, lance_fipe, compra, sn,');
     QInsereDados.SQL.Add('  dt_pgto, qtd, fornecedor, id_plan_for, cod_fipe)');
     QInsereDados.SQL.Add('values');
     QInsereDados.SQL.Add('(:licitacao, :lote, :placa, :modelo, :km, :ano, :anomod, :cor, :vlr_min,');
     QInsereDados.SQL.Add(':vlr_min_fipe, :vlr_min_dois, :compra_ja, :fipe, :vlr_m_um, :vlr_m_dois,');
     QInsereDados.SQL.Add(':venda_trinta_dias, :estoque, :vlr_ult_venda, :dt_venda, :ata_var, :cat, :gzero,');
     QInsereDados.SQL.Add(':mg, :avaria, :result, :min_result, :lance, :lance_fipe, :compra, :sn, :dt_pgto,');
     QInsereDados.SQL.Add(':qtd, :fornecedor, :id_plan, :C_FIPE)');
     QInsereDados.ParamByName('licitacao').Text := QBuscaDados.FieldByName('licitacao').Text;
     QInsereDados.ParamByName('lote').Text := QBuscaDados.FieldByName('lote').Text;
     QInsereDados.ParamByName('placa').Text := QBuscaDados.FieldByName('placa').Text;
     QInsereDados.ParamByName('modelo').Text := QBuscaDados.FieldByName('modelo').Text;
     QInsereDados.ParamByName('km').AsCurrency := QBuscaDados.FieldByName('km').AsCurrency;
     QInsereDados.ParamByName('ano').Text := '';
     QInsereDados.ParamByName('anomod').Text := QBuscaDados.FieldByName('ano_mod').Text;
     QInsereDados.ParamByName('cor').Text := QBuscaDados.FieldByName('cor').Text;
     QInsereDados.ParamByName('vlr_min').AsCurrency := 0;
     QInsereDados.ParamByName('vlr_min_fipe').AsCurrency := 0;
     QInsereDados.ParamByName('vlr_min_dois').AsCurrency := 0;
     QInsereDados.ParamByName('compra_ja').AsCurrency := 0;
     QInsereDados.ParamByName('C_FIPE').Text := QBuscaMescla.FieldByName('cod_fipe').Text;

     QBuscaFIPE.SQL.Clear;
     QBuscaFIPE.SQL.Add('select vlr_fipe from TBCONCFIPEMODELO where modelo=:mod and ano=:ano and fornecedor = ''ARVAL''');
     QBuscaFIPE.ParamByName('mod').Text := QBuscaDados.FieldByName('modelo').Text;
     QBuscaFIPE.FieldByName('ano').Text := QBuscaDados.FieldByName('ano_mod').Text;
     QBuscaFIPE.Open;

     if QBuscaFIPE.FieldByName('vlr_fipe').AsCurrency > 0 then
     QInsereDados.ParamByName('fipe').AsCurrency := QBuscaFIPE.FieldByName('vlr_fipe').AsCurrency
     Else
     QInsereDados.ParamByName('fipe').AsCurrency := 0;

     QInsereDados.ParamByName('vlr_m_um').AsCurrency := 0;
     QInsereDados.ParamByName('vlr_m_dois').AsCurrency := 0;
     QInsereDados.ParamByName('venda_trinta_dias').AsCurrency := vendas30dias;
     QInsereDados.ParamByName('estoque').AsFloat := EstoqueAtual;
     QInsereDados.ParamByName('vlr_ult_venda').AsCurrency := vl_ultima_venda;
     QInsereDados.ParamByName('dt_venda').AsDate := DT_VENDA;
     QInsereDados.ParamByName('ata_var').Text := '';
     QInsereDados.ParamByName('gzero').AsCurrency := 0;
     QInsereDados.ParamByName('mg').AsCurrency := 0;

     QBuscaAvaria.SQL.Clear;
     QBuscaAvaria.SQL.Add('select avaria, coalesce(categoria, '' '') as cat from TBPLANNEUTRON where fornecedor = ''ARVAL'' and placa=:pl');
     QBuscaAvaria.ParamByName('pl').Text := QBuscaDados.FieldByName('placa').Text;
     QBuscaAvaria.Open;

     if QBuscaAvaria.FieldByName('avaria').AsCurrency > 0 then
     QInsereDados.ParamByName('avaria').AsCurrency := QBuscaAvaria.FieldByName('avaria').AsCurrency
     Else
     QInsereDados.ParamByName('avaria').AsCurrency := 0;

     QInsereDados.ParamByName('cat').Text := QBuscaAvaria.FieldByName('cat').Text;
     QInsereDados.ParamByName('result').AsCurrency := 0;
     QInsereDados.ParamByName('min_result').AsCurrency := 0;
     QInsereDados.ParamByName('lance').AsCurrency := 0;
     QInsereDados.ParamByName('lance_fipe').AsCurrency := 0;
     QInsereDados.ParamByName('compra').AsCurrency := 0;
     QInsereDados.ParamByName('sn').Text := '';
     QInsereDados.ParamByName('dt_pgto').AsDate := StrToDate('01/01/1991');
     QInsereDados.ParamByName('qtd').AsInteger := 0;
     QInsereDados.ParamByName('fornecedor').Text := 'ARVAL';
     QInsereDados.ParamByName('id_plan').AsInteger := StrToInt(EditIDPlanilha.Text);
     QInsereDados.Execute;

     FormLoading.LabelStatus.Caption := 'Processou placa Arval: '+QBuscaDados.FieldByName('placa').Text;
     Application.ProcessMessages;

     QBuscaDados.Next;

   End;

   FormLoading.Close;
   End;

      // JSL
   QBuscaDados.SQL.Clear;
   QBuscaDados.SQL.Add('select placa, modelo, cor, ano_mod, km, valor from');
   QBuscaDados.SQL.Add('TBPLANJSL where id = :id');
   QBuscaDados.ParamByName('id').AsInteger := StrToInt(EditIDPlanilha.Text);
   QBuscaDados.Open;

      if not QBuscaDados.IsEmpty then
   Begin

   FormLoading.Position := poScreenCenter;
   FormLoading.LabelStatus.Caption := 'Processando planilha final';
   FormLoading.Show;

   Application.ProcessMessages;

   QBuscaDados.First;

   while not QBuscaDados.Eof do
   Begin

        // Carrega cod_fipe da conciliação
     QBuscaMescla.SQL.Clear;
     QBuscaMescla.SQL.Add('select cod_fipe from TBCONCFIPEMODELO where modelo=:mod and fornecedor = ''JSL''');
     QBuscaMescla.SQL.Add('and ANO=:ano');
     QBuscaMescla.ParamByName('ano').Text := QBuscaDados.FieldByName('ano_mod').Text;
     QBuscaMescla.ParamByName('mod').Text := QBuscaDados.FieldByName('modelo').Text;
     QBuscaMescla.Open;

     //ShowMessage('FIPE '+QBuscaMescla.FieldByName('cod_fipe').Text);

     if not QBuscaMescla.IsEmpty then
     Begin

     cod_fipe := QBuscaMescla.FieldByName('cod_fipe').Text;


         // Carrega vendas dos ultimos 30 dias
         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select COUNT(*) as vnd from IMPORTASAVANNAVENDA30DIAS');
         QSavannaLocal.SQL.Add('where FIPE = :fipe and ano=:ANO');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := QBuscaDados.FieldByName('ano_mod').Text;
         QSavannaLocal.Open;

         Application.ProcessMessages;

         if not QSavannaLocal.FieldByName('vnd').IsNull then
         vendas30dias := QSavannaLocal.FieldByName('vnd').AsInteger
         Else
         vendas30dias := 0;

         // Carrega ultimo vlr de venda
         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select valor, data from IMPORTASAVANNAULTIMASVENDAS');
         QSavannaLocal.SQL.Add('where FIPE = :fipe and ano=:ano');
         QSavannaLocal.SQL.Add('order by data desc ');
         QSavannaLocal.SQL.Add('limit 1');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := QBuscaDados.FieldByName('ano_mod').Text;
         QSavannaLocal.Open;

       //ShowMessage('Buscou vlr venda');

         Application.ProcessMessages;

         if QSavannaLocal.FieldByName('valor').AsCurrency <> null then
         vl_ultima_venda := QSavannaLocal.FieldByName('valor').AsCurrency
         Else
         vl_ultima_venda := 0;

         if QSavannaLocal.FieldByName('data').AsDateTime <> null then
         DT_VENDA := QSavannaLocal.FieldByName('data').AsDateTime
         Else
         DT_VENDA := null;

         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select sum(qtd) as  Estoque from IMPORTASAVANNAESTOQUE where FIPE = :fipe and ano=:ano');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := QBuscaDados.FieldByName('ano_mod').Text;
         QSavannaLocal.Open;


          Application.ProcessMessages;

         if not QSavannaLocal.FieldByName('Estoque').IsNull then
         EstoqueAtual := QSavannaLocal.FieldByName('Estoque').AsInteger
         Else
         EstoqueAtual := 0;

         end;

     Application.ProcessMessages;

     QInsereDados.SQL.Clear;
     QInsereDados.SQL.Add('insert into TBPROCPLANS');
     QInsereDados.SQL.Add('( licitacao, lote, placa, modelo, km, ano, ano_mod, cor, vlr_min,');
     QInsereDados.SQL.Add('  vlr_min_fipe, vlr_min_dois, compra_ja, vlr_fipe, vlr_merc_um, vlr_merc_dois,');
     QInsereDados.SQL.Add('  venda_trinta_dias, estoque, vlr_ult_venda, dt_ult_venda, atacado_varejo, categoria, g_zero,');
     QInsereDados.SQL.Add(' mg, avaria, resultado, min_resultado, lance, lance_fipe, compra, sn,');
     QInsereDados.SQL.Add('  dt_pgto, qtd, fornecedor, id_plan_for, cod_fipe)');
     QInsereDados.SQL.Add('values');
     QInsereDados.SQL.Add('(:licitacao, :lote, :placa, :modelo, :km, :ano, :anomod, :cor, :vlr_min,');
     QInsereDados.SQL.Add(':vlr_min_fipe, :vlr_min_dois, :compra_ja, :fipe, :vlr_m_um, :vlr_m_dois,');
     QInsereDados.SQL.Add(':venda_trinta_dias, :estoque, :vlr_ult_venda, :dt_venda, :ata_var, :cat, :gzero,');
     QInsereDados.SQL.Add(':mg, :avaria, :result, :min_result, :lance, :lance_fipe, :compra, :sn, :dt_pgto,');
     QInsereDados.SQL.Add(':qtd, :fornecedor, :id_plan, :c_fipe)');
     QInsereDados.ParamByName('licitacao').Text := '';
     QInsereDados.ParamByName('lote').Text := '';
     QInsereDados.ParamByName('placa').Text := QBuscaDados.FieldByName('placa').Text;
     QInsereDados.ParamByName('modelo').Text := QBuscaDados.FieldByName('modelo').Text;
     QInsereDados.ParamByName('km').AsCurrency := QBuscaDados.FieldByName('km').AsCurrency;
     QInsereDados.ParamByName('ano').Text := '';
     QInsereDados.ParamByName('anomod').Text := QBuscaDados.FieldByName('ano_mod').Text;
     QInsereDados.ParamByName('cor').Text := QBuscaDados.FieldByName('cor').Text;
     QInsereDados.ParamByName('vlr_min').AsCurrency := QBuscaDados.FieldByName('valor').AsCurrency;
     QInsereDados.ParamByName('vlr_min_fipe').AsCurrency := 0;
     QInsereDados.ParamByName('vlr_min_dois').AsCurrency := 0;
     QInsereDados.ParamByName('compra_ja').AsCurrency := 0;
     QInsereDados.ParamByName('c_fipe').Text := cod_fipe;

     QBuscaFIPE.SQL.Clear;
     QBuscaFIPE.SQL.Add('select vlr_fipe from TBCONCFIPEMODELO where modelo=:mod and ano=:ano and fornecedor = ''JSL''');
     QBuscaFIPE.ParamByName('mod').Text := QBuscaDados.FieldByName('modelo').Text;
     QBuscaFIPE.ParamByName('ano').Text := QBuscaDados.FieldByName('ano_mod').Text;
     QBuscaFIPE.Open;

     if QBuscaFIPE.FieldByName('vlr_fipe').AsCurrency > 0 then
     QInsereDados.ParamByName('fipe').AsCurrency := QBuscaFIPE.FieldByName('vlr_fipe').AsCurrency
     Else
     QInsereDados.ParamByName('fipe').AsCurrency := 0;

     QInsereDados.ParamByName('vlr_m_um').AsCurrency := 0;
     QInsereDados.ParamByName('vlr_m_dois').AsCurrency := 0;
     QInsereDados.ParamByName('venda_trinta_dias').AsCurrency := vendas30dias;
     QInsereDados.ParamByName('estoque').AsFloat := EstoqueAtual;
     QInsereDados.ParamByName('vlr_ult_venda').AsCurrency := vl_ultima_venda;
     QInsereDados.ParamByName('dt_venda').AsDate := DT_VENDA;
     QInsereDados.ParamByName('ata_var').Text := '';
     QInsereDados.ParamByName('gzero').AsCurrency := 0;
     QInsereDados.ParamByName('mg').AsCurrency := 0;

     QBuscaAvaria.SQL.Clear;
     QBuscaAvaria.SQL.Add('select avaria, coalesce(categoria, '' '') as cat from TBPLANNEUTRON where fornecedor = ''JSL'' and placa=:pl');
     QBuscaAvaria.ParamByName('pl').Text := QBuscaDados.FieldByName('placa').Text;
     QBuscaAvaria.Open;

     if QBuscaAvaria.FieldByName('avaria').AsCurrency > 0 then
     QInsereDados.ParamByName('avaria').AsCurrency := QBuscaAvaria.FieldByName('avaria').AsCurrency
     Else
     QInsereDados.ParamByName('avaria').AsCurrency := 0;

     QInsereDados.ParamByName('cat').Text := QBuscaAvaria.FieldByName('cat').Text;
     QInsereDados.ParamByName('result').AsCurrency := 0;
     QInsereDados.ParamByName('min_result').AsCurrency := 0;
     QInsereDados.ParamByName('lance').AsCurrency := 0;
     QInsereDados.ParamByName('lance_fipe').AsCurrency := 0;
     QInsereDados.ParamByName('compra').AsCurrency := 0;
     QInsereDados.ParamByName('sn').Text := '';
     QInsereDados.ParamByName('dt_pgto').AsDate := StrToDate('01/01/1991');
     QInsereDados.ParamByName('qtd').AsInteger := 0;
     QInsereDados.ParamByName('fornecedor').Text := 'JSL';
     QInsereDados.ParamByName('id_plan').AsInteger := StrToInt(EditIDPlanilha.Text);
     QInsereDados.Execute;

     FormLoading.LabelStatus.Caption := 'Processou placa JSL: '+QBuscaDados.FieldByName('placa').Text;
     Application.ProcessMessages;

     QBuscaDados.Next;

   End;

   FormLoading.Close;
   End;

         // LM
   QBuscaDados.SQL.Clear;
   QBuscaDados.SQL.Add('select km, placa, modelo, mod_fab, cor from');
   QBuscaDados.SQL.Add('TBPLANLM where id = :id');
   QBuscaDados.ParamByName('id').AsInteger := StrToInt(EditIDPlanilha.Text);
   QBuscaDados.Open;

   if not QBuscaDados.IsEmpty then
   Begin

   FormLoading.Position := poScreenCenter;
   FormLoading.LabelStatus.Caption := 'Processando planilha final';
   FormLoading.Show;

   Application.ProcessMessages;

   QBuscaDados.First;

   while not QBuscaDados.Eof do
   Begin

        // Carrega cod_fipe da conciliação
     QBuscaMescla.SQL.Clear;
     QBuscaMescla.SQL.Add('select cod_fipe from TBCONCFIPEMODELO where modelo=:mod and fornecedor = ''LM''');
     QBuscaMescla.SQL.Add('and ANO=:ano');
     QBuscaMescla.ParamByName('ano').Text := QBuscaDados.FieldByName('mod_fab').Text;
     QBuscaMescla.ParamByName('mod').Text := QBuscaDados.FieldByName('modelo').Text;
     QBuscaMescla.Open;

     //ShowMessage('FIPE '+QBuscaMescla.FieldByName('cod_fipe').Text);

     if not QBuscaMescla.IsEmpty then
     Begin

     cod_fipe := QBuscaMescla.FieldByName('cod_fipe').Text;


         // Carrega vendas dos ultimos 30 dias
         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select COUNT(*) as vnd from IMPORTASAVANNAVENDA30DIAS');
         QSavannaLocal.SQL.Add('where FIPE = :fipe and ano=:ANO');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := QBuscaDados.FieldByName('mod_fab').Text;
         QSavannaLocal.Open;

         Application.ProcessMessages;

         if not QSavannaLocal.FieldByName('vnd').IsNull then
         vendas30dias := QSavannaLocal.FieldByName('vnd').AsInteger
         Else
         vendas30dias := 0;

         // Carrega ultimo vlr de venda
         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select valor, data from IMPORTASAVANNAULTIMASVENDAS');
         QSavannaLocal.SQL.Add('where FIPE = :fipe and ano=:ano');
         QSavannaLocal.SQL.Add('order by data desc ');
         QSavannaLocal.SQL.Add('limit 1');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := QBuscaDados.FieldByName('mod_fab').Text;
         QSavannaLocal.Open;

       //ShowMessage('Buscou vlr venda');

         Application.ProcessMessages;

         if QSavannaLocal.FieldByName('valor').AsCurrency <> null then
         vl_ultima_venda := QSavannaLocal.FieldByName('valor').AsCurrency
         Else
         vl_ultima_venda := 0;

         if QSavannaLocal.FieldByName('data').AsDateTime <> null then
         DT_VENDA := QSavannaLocal.FieldByName('data').AsDateTime
         Else
         DT_VENDA := null;

         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select sum(qtd) as  Estoque from IMPORTASAVANNAESTOQUE where FIPE = :fipe and ano=:ano');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := QBuscaDados.FieldByName('mod_fab').Text;
         QSavannaLocal.Open;


          Application.ProcessMessages;

         if not QSavannaLocal.FieldByName('Estoque').IsNull then
         EstoqueAtual := QSavannaLocal.FieldByName('Estoque').AsInteger
         Else
         EstoqueAtual := 0;

         end;

     Application.ProcessMessages;


     QInsereDados.SQL.Clear;
     QInsereDados.SQL.Add('insert into TBPROCPLANS');
     QInsereDados.SQL.Add('( licitacao, lote, placa, modelo, km, ano, ano_mod, cor, vlr_min,');
     QInsereDados.SQL.Add('  vlr_min_fipe, vlr_min_dois, compra_ja, vlr_fipe, vlr_merc_um, vlr_merc_dois,');
     QInsereDados.SQL.Add('  venda_trinta_dias, estoque, vlr_ult_venda, dt_ult_venda, atacado_varejo, categoria, g_zero,');
     QInsereDados.SQL.Add(' mg, avaria, resultado, min_resultado, lance, lance_fipe, compra, sn,');
     QInsereDados.SQL.Add('  dt_pgto, qtd, fornecedor, id_plan_for, cod_fipe)');
     QInsereDados.SQL.Add('values');
     QInsereDados.SQL.Add('(:licitacao, :lote, :placa, :modelo, :km, :ano, :anomod, :cor, :vlr_min,');
     QInsereDados.SQL.Add(':vlr_min_fipe, :vlr_min_dois, :compra_ja, :fipe, :vlr_m_um, :vlr_m_dois,');
     QInsereDados.SQL.Add(':venda_trinta_dias, :estoque, :vlr_ult_venda, :dt_venda, :ata_var, :cat, :gzero,');
     QInsereDados.SQL.Add(':mg, :avaria, :result, :min_result, :lance, :lance_fipe, :compra, :sn, :dt_pgto,');
     QInsereDados.SQL.Add(':qtd, :fornecedor, :id_plan, :c_fipe)');
     QInsereDados.ParamByName('licitacao').Text := '';
     QInsereDados.ParamByName('lote').Text := '';
     QInsereDados.ParamByName('placa').Text := QBuscaDados.FieldByName('placa').Text;
     QInsereDados.ParamByName('modelo').Text := QBuscaDados.FieldByName('modelo').Text;
     QInsereDados.ParamByName('km').AsCurrency := QBuscaDados.FieldByName('km').AsCurrency;
     QInsereDados.ParamByName('ano').Text := '';
     QInsereDados.ParamByName('anomod').Text := QBuscaDados.FieldByName('mod_fab').Text;
     QInsereDados.ParamByName('cor').Text := QBuscaDados.FieldByName('cor').Text;
     QInsereDados.ParamByName('vlr_min').AsCurrency := 0;
     QInsereDados.ParamByName('vlr_min_fipe').AsCurrency := 0;
     QInsereDados.ParamByName('vlr_min_dois').AsCurrency := 0;
     QInsereDados.ParamByName('compra_ja').AsCurrency := 0;
     QInsereDados.ParamByName('c_fipe').Text := cod_fipe;

     QBuscaFIPE.SQL.Clear;
     QBuscaFIPE.SQL.Add('select vlr_fipe from TBCONCFIPEMODELO where modelo=:mod and ano=:ano and fornecedor = ''LM''');
     QBuscaFIPE.ParamByName('mod').Text := QBuscaDados.FieldByName('modelo').Text;
     QBuscaFIPE.ParamByName('ano').Text := QBuscaDados.FieldByName('mod_fab').Text;
     QBuscaFIPE.Open;

     if QBuscaFIPE.FieldByName('vlr_fipe').AsCurrency > 0 then
     QInsereDados.ParamByName('fipe').AsCurrency := QBuscaFIPE.FieldByName('vlr_fipe').AsCurrency
     Else
     QInsereDados.ParamByName('fipe').AsCurrency := 0;

     QInsereDados.ParamByName('vlr_m_um').AsCurrency := 0;
     QInsereDados.ParamByName('vlr_m_dois').AsCurrency := 0;
     QInsereDados.ParamByName('venda_trinta_dias').AsCurrency := vendas30dias;
     QInsereDados.ParamByName('estoque').AsFloat := EstoqueAtual;
     QInsereDados.ParamByName('vlr_ult_venda').AsCurrency := vl_ultima_venda;
     QInsereDados.ParamByName('dt_venda').AsDate := DT_VENDA;
     QInsereDados.ParamByName('ata_var').Text := '';
     QInsereDados.ParamByName('gzero').AsCurrency := 0;
     QInsereDados.ParamByName('mg').AsCurrency := 0;

     QBuscaAvaria.SQL.Clear;
     QBuscaAvaria.SQL.Add('select avaria, coalesce(categoria, '' '') as cat from TBPLANNEUTRON where fornecedor = ''LM'' and placa=:pl');
     QBuscaAvaria.ParamByName('pl').Text := QBuscaDados.FieldByName('placa').Text;
     QBuscaAvaria.Open;

     if QBuscaAvaria.FieldByName('avaria').AsCurrency > 0 then
     QInsereDados.ParamByName('avaria').AsCurrency := QBuscaAvaria.FieldByName('avaria').AsCurrency
     Else
     QInsereDados.ParamByName('avaria').AsCurrency := 0;
     QInsereDados.ParamByName('cat').Text := QBuscaAvaria.FieldByName('cat').Text;
     QInsereDados.ParamByName('result').AsCurrency := 0;
     QInsereDados.ParamByName('min_result').AsCurrency := 0;
     QInsereDados.ParamByName('lance').AsCurrency := 0;
     QInsereDados.ParamByName('lance_fipe').AsCurrency := 0;
     QInsereDados.ParamByName('compra').AsCurrency := 0;
     QInsereDados.ParamByName('sn').Text := '';
     QInsereDados.ParamByName('dt_pgto').AsDate := StrToDate('01/01/1991');
     QInsereDados.ParamByName('qtd').AsInteger := 0;
     QInsereDados.ParamByName('fornecedor').Text := 'LM';
     QInsereDados.ParamByName('id_plan').AsInteger := StrToInt(EditIDPlanilha.Text);
     QInsereDados.Execute;

     FormLoading.LabelStatus.Caption := 'Processou placa LM: '+QBuscaDados.FieldByName('placa').Text;
     Application.ProcessMessages;

     QBuscaDados.Next;

   End;

   FormLoading.Close;

   End;
         // localiza
   QBuscaDados.SQL.Clear;
   QBuscaDados.SQL.Add('select placa, modelo, ano_mod, km, cor, lojista from');
   QBuscaDados.SQL.Add('TBPLANLOCALIZA where id = :id');
   QBuscaDados.ParamByName('id').AsInteger := StrToInt(EditIDPlanilha.Text);
   QBuscaDados.Open;

   if not QBuscaDados.IsEmpty then
   Begin

   FormLoading.Position := poScreenCenter;
   FormLoading.LabelStatus.Caption := 'Processando planilha final';
   FormLoading.Show;

   Application.ProcessMessages;

   QBuscaDados.First;

   while not QBuscaDados.Eof do
   Begin

        // Carrega cod_fipe da conciliação
     QBuscaMescla.SQL.Clear;
     QBuscaMescla.SQL.Add('select cod_fipe, ano, vlr_fipe from TBCONCFIPEMODELO where modelo=:mod and ano=:ano and fornecedor = ''LOCALIZA''');
     QBuscaMescla.ParamByName('mod').Text := QBuscaDados.FieldByName('modelo').Text;
     QBuscaMescla.ParamByName('ano').Text := QBuscaDados.FieldByName('ano_mod').Text;
     QBuscaMescla.Open;

     //ShowMessage('FIPE '+QBuscaMescla.FieldByName('cod_fipe').Text);

     if not QBuscaMescla.IsEmpty then
     Begin

     cod_fipe := QBuscaMescla.FieldByName('cod_fipe').Text;


         // Carrega vendas dos ultimos 30 dias
         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select COUNT(*) as vnd from IMPORTASAVANNAVENDA30DIAS');
         QSavannaLocal.SQL.Add('where FIPE = :fipe and ano=:ano');
         {
         QSavannaLocal.sql.add('and ano = :ano');
         }
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text := QBuscaDados.FieldByName('ano_mod').Text;
         QSavannaLocal.Open;

         Application.ProcessMessages;

         if not QSavannaLocal.FieldByName('vnd').IsNull then
         vendas30dias := QSavannaLocal.FieldByName('vnd').AsInteger
         Else
         vendas30dias := 0;

         // Carrega ultimo vlr de venda
         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select valor, data from IMPORTASAVANNAULTIMASVENDAS');
         QSavannaLocal.SQL.Add('where FIPE =:fipe and ano =:ano');
         QSavannaLocal.SQL.Add('order by data desc ');
         QSavannaLocal.SQL.Add('limit 1');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text := QBuscaMescla.FieldByName('ano').Text;
         QSavannaLocal.Open;

         if cod_fipe = '003408-8' then
         Begin

          ShowMessage('Modelo: '+QBuscaMescla.FieldByName('ano').Text+#13+
                      'FIPE:  ' + cod_fipe +#13+
                      'VLR VENDA: '+CurrToStr(QSavannaLocal.FieldByName('valor').AsCurrency));
         End;

       //ShowMessage('Buscou vlr venda');

         Application.ProcessMessages;

         if QSavannaLocal.FieldByName('valor').AsCurrency > 0 then
         vl_ultima_venda := QSavannaLocal.FieldByName('valor').AsCurrency
         Else
         vl_ultima_venda := 0;

         if QSavannaLocal.FieldByName('data').AsDateTime <> null then
         DT_VENDA := QSavannaLocal.FieldByName('data').AsDateTime
         Else
         DT_VENDA := null;

         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select qtd as  Estoque from IMPORTASAVANNAESTOQUE where FIPE = :fipe and ano = :ano');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text := QBuscaMescla.FieldByName('ano').Text;
         QSavannaLocal.Open;


          Application.ProcessMessages;

         if not QSavannaLocal.FieldByName('Estoque').IsNull then
         EstoqueAtual := QSavannaLocal.FieldByName('Estoque').AsInteger
         Else
         EstoqueAtual := 0;

         end;

     Application.ProcessMessages;

     QInsereDados.SQL.Clear;
     QInsereDados.SQL.Add('insert into TBPROCPLANS');
     QInsereDados.SQL.Add('( licitacao, lote, placa, modelo, km, ano, ano_mod, cor, vlr_min,');
     QInsereDados.SQL.Add('  vlr_min_fipe, vlr_min_dois, compra_ja, vlr_fipe, vlr_merc_um, vlr_merc_dois,');
     QInsereDados.SQL.Add('  venda_trinta_dias, estoque, vlr_ult_venda, dt_ult_venda, atacado_varejo, categoria, g_zero,');
     QInsereDados.SQL.Add(' mg, avaria, resultado, min_resultado, lance, lance_fipe, compra, sn,');
     QInsereDados.SQL.Add('  dt_pgto, qtd, fornecedor, id_plan_for, cod_fipe)');
     QInsereDados.SQL.Add('values');
     QInsereDados.SQL.Add('(:licitacao, :lote, :placa, :modelo, :km, :ano, :anomod, :cor, :vlr_min,');
     QInsereDados.SQL.Add(':vlr_min_fipe, :vlr_min_dois, :compra_ja, :fipe, :vlr_m_um, :vlr_m_dois,');
     QInsereDados.SQL.Add(':venda_trinta_dias, :estoque, :vlr_ult_venda, :dt_venda, :ata_var, :cat, :gzero,');
     QInsereDados.SQL.Add(':mg, :avaria, :result, :min_result, :lance, :lance_fipe, :compra, :sn, :dt_pgto,');
     QInsereDados.SQL.Add(':qtd, :fornecedor, :id_plan, :cod_fipe)');
     QInsereDados.ParamByName('licitacao').Text := '';
     QInsereDados.ParamByName('lote').Text := '';
     QInsereDados.ParamByName('placa').Text := QBuscaDados.FieldByName('placa').Text;
     QInsereDados.ParamByName('modelo').Text := QBuscaDados.FieldByName('modelo').Text;
     QInsereDados.ParamByName('km').AsCurrency := QBuscaDados.FieldByName('km').AsCurrency;
     QInsereDados.ParamByName('ano').Text := '';
     QInsereDados.ParamByName('anomod').Text := QBuscaDados.FieldByName('ano_mod').Text;
     QInsereDados.ParamByName('cor').Text := QBuscaDados.FieldByName('cor').Text;
     QInsereDados.ParamByName('vlr_min').AsCurrency := QBuscaDados.FieldByName('lojista').AsCurrency;
     QInsereDados.ParamByName('vlr_min_fipe').AsCurrency := 0;
     QInsereDados.ParamByName('vlr_min_dois').AsCurrency := 0;
     QInsereDados.ParamByName('compra_ja').AsCurrency := 0;

     QBuscaFIPE.SQL.Clear;
     QBuscaFIPE.SQL.Add('select vlr_fipe from TBCONCFIPEMODELO where modelo=:mod and fornecedor = ''LOCALIZA''');
     QBuscaFIPE.SQL.Add('and ano = :ano');
     QBuscaFIPE.ParamByName('mod').Text := QBuscaDados.FieldByName('modelo').Text;
     QBuscaFIPE.ParamByName('ano').Text := QBuscaDados.FieldByName('ano_mod').Text;
     QBuscaFIPE.Open;

     if QBuscaFIPE.FieldByName('vlr_fipe').AsCurrency > 0 then
     QInsereDados.ParamByName('fipe').AsCurrency := QBuscaFIPE.FieldByName('vlr_fipe').AsCurrency
     Else
     QInsereDados.ParamByName('fipe').AsCurrency := 0;

     QInsereDados.ParamByName('vlr_m_um').AsCurrency := 0;
     QInsereDados.ParamByName('vlr_m_dois').AsCurrency := 0;
     QInsereDados.ParamByName('venda_trinta_dias').AsCurrency := vendas30dias;
     QInsereDados.ParamByName('estoque').AsFloat := EstoqueAtual;
     QInsereDados.ParamByName('vlr_ult_venda').AsCurrency := vl_ultima_venda;
     QInsereDados.ParamByName('dt_venda').AsDate := DT_VENDA;
     QInsereDados.ParamByName('ata_var').Text := '';
     QInsereDados.ParamByName('gzero').AsCurrency := 0;
     QInsereDados.ParamByName('mg').AsCurrency := 0;

     QBuscaAvaria.SQL.Clear;
     QBuscaAvaria.SQL.Add('select avaria, coalesce(categoria, '' '') as cat from TBPLANNEUTRON where fornecedor = ''LOCALIZA'' and placa=:pl');
     QBuscaAvaria.ParamByName('pl').Text := QBuscaDados.FieldByName('placa').Text;
     QBuscaAvaria.Open;

     if QBuscaAvaria.FieldByName('avaria').AsCurrency > 0 then
     QInsereDados.ParamByName('avaria').AsCurrency := QBuscaAvaria.FieldByName('avaria').AsCurrency
     Else
     QInsereDados.ParamByName('avaria').AsCurrency := 0;
     QInsereDados.ParamByName('cat').Text := QBuscaAvaria.FieldByName('cat').Text;
     QInsereDados.ParamByName('result').AsCurrency := 0;
     QInsereDados.ParamByName('min_result').AsCurrency := 0;
     QInsereDados.ParamByName('lance').AsCurrency := 0;
     QInsereDados.ParamByName('lance_fipe').AsCurrency := 0;
     QInsereDados.ParamByName('compra').AsCurrency := 0;
     QInsereDados.ParamByName('sn').Text := '';
     QInsereDados.ParamByName('dt_pgto').AsDate := StrToDate('01/01/1991');
     QInsereDados.ParamByName('qtd').AsInteger := 0;
     QInsereDados.ParamByName('fornecedor').Text := 'LOCALIZA';
     QInsereDados.ParamByName('id_plan').AsInteger := StrToInt(EditIDPlanilha.Text);
     QInsereDados.ParamByName('cod_fipe').Text := cod_fipe;
     QInsereDados.Execute;

     FormLoading.LabelStatus.Caption := 'Processou placa LOCALIZA: '+QBuscaDados.FieldByName('placa').Text;
     Application.ProcessMessages;

     QBuscaDados.Next;

   End;

   FormLoading.Close;
   End;

            // MOVIDA
   QBuscaDados.SQL.Clear;
   QBuscaDados.SQL.Add('select placa, modelo, ano_mod, cor, km, vlr_fipe, preco from');
   QBuscaDados.SQL.Add('TBPLANMOVIDA where id = :id');
   QBuscaDados.ParamByName('id').AsInteger := StrToInt(EditIDPlanilha.Text);
   QBuscaDados.Open;

      if not QBuscaDados.IsEmpty then
   Begin

   FormLoading.Position := poScreenCenter;
   FormLoading.LabelStatus.Caption := 'Processando planilha final';
   FormLoading.Show;

   Application.ProcessMessages;

   QBuscaDados.First;

   while not QBuscaDados.Eof do
   Begin

        // Carrega cod_fipe da conciliação
     QBuscaMescla.SQL.Clear;
     QBuscaMescla.SQL.Add('select cod_fipe from TBCONCFIPEMODELO where modelo=:mod and fornecedor = ''LM''');
     QBuscaMescla.SQL.Add('and ANO=:ano');
     QBuscaMescla.ParamByName('ano').Text := QBuscaDados.FieldByName('ano_mod').Text;
     QBuscaMescla.ParamByName('mod').Text := QBuscaDados.FieldByName('modelo').Text;
     QBuscaMescla.Open;

     //ShowMessage('FIPE '+QBuscaMescla.FieldByName('cod_fipe').Text);

     if not QBuscaMescla.IsEmpty then
     Begin

     cod_fipe := QBuscaMescla.FieldByName('cod_fipe').Text;


         // Carrega vendas dos ultimos 30 dias
         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select COUNT(*) as vnd from IMPORTASAVANNAVENDA30DIAS');
         QSavannaLocal.SQL.Add('where FIPE = :fipe and ano=:ANO');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := QBuscaDados.FieldByName('ano_mod').Text;
         QSavannaLocal.Open;

         Application.ProcessMessages;

         if not QSavannaLocal.FieldByName('vnd').IsNull then
         vendas30dias := QSavannaLocal.FieldByName('vnd').AsInteger
         Else
         vendas30dias := 0;

         // Carrega ultimo vlr de venda
         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select valor, data from IMPORTASAVANNAULTIMASVENDAS');
         QSavannaLocal.SQL.Add('where FIPE = :fipe and ano=:ano');
         QSavannaLocal.SQL.Add('order by data desc ');
         QSavannaLocal.SQL.Add('limit 1');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := QBuscaDados.FieldByName('ano_mod').Text;
         QSavannaLocal.Open;

       //ShowMessage('Buscou vlr venda');

         Application.ProcessMessages;

         if QSavannaLocal.FieldByName('valor').AsCurrency <> null then
         vl_ultima_venda := QSavannaLocal.FieldByName('valor').AsCurrency
         Else
         vl_ultima_venda := 0;

         if QSavannaLocal.FieldByName('data').AsDateTime <> null then
         DT_VENDA := QSavannaLocal.FieldByName('data').AsDateTime
         Else
         DT_VENDA := null;

         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select sum(qtd) as  Estoque from IMPORTASAVANNAESTOQUE where FIPE = :fipe and ano=:ano');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := QBuscaDados.FieldByName('ano_mod').Text;
         QSavannaLocal.Open;

          Application.ProcessMessages;

         if not QSavannaLocal.FieldByName('Estoque').IsNull then
         EstoqueAtual := QSavannaLocal.FieldByName('Estoque').AsInteger
         Else
         EstoqueAtual := 0;


         end;

     Application.ProcessMessages;

     QInsereDados.SQL.Clear;
     QInsereDados.SQL.Add('insert into TBPROCPLANS');
     QInsereDados.SQL.Add('( licitacao, lote, placa, modelo, km, ano, ano_mod, cor, vlr_min,');
     QInsereDados.SQL.Add('  vlr_min_fipe, vlr_min_dois, compra_ja, vlr_fipe, vlr_merc_um, vlr_merc_dois,');
     QInsereDados.SQL.Add('  venda_trinta_dias, estoque, vlr_ult_venda, dt_ult_venda, atacado_varejo, categoria, g_zero,');
     QInsereDados.SQL.Add(' mg, avaria, resultado, min_resultado, lance, lance_fipe, compra, sn,');
     QInsereDados.SQL.Add('  dt_pgto, qtd, fornecedor, id_plan_for, cod_fipe)');
     QInsereDados.SQL.Add('values');
     QInsereDados.SQL.Add('(:licitacao, :lote, :placa, :modelo, :km, :ano, :anomod, :cor, :vlr_min,');
     QInsereDados.SQL.Add(':vlr_min_fipe, :vlr_min_dois, :compra_ja, :fipe, :vlr_m_um, :vlr_m_dois,');
     QInsereDados.SQL.Add(':venda_trinta_dias, :estoque, :vlr_ult_venda, :dt_venda, :ata_var, :cat, :gzero,');
     QInsereDados.SQL.Add(':mg, :avaria, :result, :min_result, :lance, :lance_fipe, :compra, :sn, :dt_pgto,');
     QInsereDados.SQL.Add(':qtd, :fornecedor, :id_plan, :c_fipe)');
     QInsereDados.ParamByName('licitacao').Text := '';
     QInsereDados.ParamByName('lote').Text := '';
     QInsereDados.ParamByName('placa').Text := QBuscaDados.FieldByName('placa').Text;
     QInsereDados.ParamByName('modelo').Text := QBuscaDados.FieldByName('modelo').Text;
     QInsereDados.ParamByName('km').AsCurrency := QBuscaDados.FieldByName('km').AsCurrency;
     QInsereDados.ParamByName('ano').Text := '';
     QInsereDados.ParamByName('anomod').Text := QBuscaDados.FieldByName('ano_mod').Text;
     QInsereDados.ParamByName('cor').Text := QBuscaDados.FieldByName('cor').Text;
     QInsereDados.ParamByName('vlr_min').AsCurrency := QBuscaDados.FieldByName('preco').AsCurrency;
     QInsereDados.ParamByName('vlr_min_fipe').AsCurrency := 0;
     QInsereDados.ParamByName('vlr_min_dois').AsCurrency := 0;
     QInsereDados.ParamByName('compra_ja').AsCurrency := 0;
     QInsereDados.ParamByName('c_fipe').Text := cod_fipe;

     QInsereDados.ParamByName('fipe').AsCurrency := QBuscaDados.FieldByName('vlr_fipe').AsCurrency;

     QInsereDados.ParamByName('vlr_m_um').AsCurrency := 0;
     QInsereDados.ParamByName('vlr_m_dois').AsCurrency := 0;
     QInsereDados.ParamByName('venda_trinta_dias').AsCurrency := vendas30dias;
     QInsereDados.ParamByName('estoque').AsFloat := EstoqueAtual;
     QInsereDados.ParamByName('vlr_ult_venda').AsCurrency := vl_ultima_venda;
     QInsereDados.ParamByName('dt_venda').AsDate := DT_VENDA;
     QInsereDados.ParamByName('ata_var').Text := '';
     QInsereDados.ParamByName('gzero').AsCurrency := 0;
     QInsereDados.ParamByName('mg').AsCurrency := 0;

     QBuscaAvaria.SQL.Clear;
     QBuscaAvaria.SQL.Add('select avaria, coalesce(categoria, '' '') as cat from TBPLANNEUTRON where fornecedor = ''MOVIDA'' and placa=:pl');
     QBuscaAvaria.ParamByName('pl').Text := QBuscaDados.FieldByName('placa').Text;
     QBuscaAvaria.Open;

     if QBuscaAvaria.FieldByName('avaria').AsCurrency > 0 then
     QInsereDados.ParamByName('avaria').AsCurrency := QBuscaAvaria.FieldByName('avaria').AsCurrency
     Else
     QInsereDados.ParamByName('avaria').AsCurrency := 0;
     QInsereDados.ParamByName('cat').Text := QBuscaAvaria.FieldByName('cat').Text;
     QInsereDados.ParamByName('result').AsCurrency := 0;
     QInsereDados.ParamByName('min_result').AsCurrency := 0;
     QInsereDados.ParamByName('lance').AsCurrency := 0;
     QInsereDados.ParamByName('lance_fipe').AsCurrency := 0;
     QInsereDados.ParamByName('compra').AsCurrency := 0;
     QInsereDados.ParamByName('sn').Text := '';
     QInsereDados.ParamByName('dt_pgto').AsDate := StrToDate('01/01/1991');
     QInsereDados.ParamByName('qtd').AsInteger := 0;
     QInsereDados.ParamByName('fornecedor').Text := 'MOVIDA';
     QInsereDados.ParamByName('id_plan').AsInteger := StrToInt(EditIDPlanilha.Text);
     QInsereDados.Execute;

     FormLoading.LabelStatus.Caption := 'Processou placa MOVIDA: '+QBuscaDados.FieldByName('placa').Text;
     Application.ProcessMessages;

     QBuscaDados.Next;

   End;

   FormLoading.Close;
   End;

              // ouro verde
   QBuscaDados.SQL.Clear;
   QBuscaDados.SQL.Add('select modelo, ano_mod, cor, km, vlr_fipe, vlr_venda, placa from');
   QBuscaDados.SQL.Add('TBPLANOUROVERDE where id = :id');
   QBuscaDados.ParamByName('id').AsInteger := StrToInt(EditIDPlanilha.Text);
   QBuscaDados.Open;

      if not QBuscaDados.IsEmpty then
   Begin

   FormLoading.Position := poScreenCenter;
   FormLoading.LabelStatus.Caption := 'Processando planilha final';
   FormLoading.Show;

   Application.ProcessMessages;

   QBuscaDados.First;

   while not QBuscaDados.Eof do
   Begin

        // Carrega cod_fipe da conciliação
     QBuscaMescla.SQL.Clear;
     QBuscaMescla.SQL.Add('select cod_fipe from TBCONCFIPEMODELO where modelo=:mod and fornecedor = ''LM''');
     QBuscaMescla.SQL.Add('and ANO=:ano');
     QBuscaMescla.ParamByName('ano').Text := QBuscaDados.FieldByName('ano_mod').Text;
     QBuscaMescla.ParamByName('mod').Text := QBuscaDados.FieldByName('modelo').Text;
     QBuscaMescla.Open;

     //ShowMessage('FIPE '+QBuscaMescla.FieldByName('cod_fipe').Text);

     if not QBuscaMescla.IsEmpty then
     Begin

     cod_fipe := QBuscaMescla.FieldByName('cod_fipe').Text;


         // Carrega vendas dos ultimos 30 dias
         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select COUNT(*) as vnd from IMPORTASAVANNAVENDA30DIAS');
         QSavannaLocal.SQL.Add('where FIPE = :fipe and ano=:ANO');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := QBuscaDados.FieldByName('ano_mod').Text;
         QSavannaLocal.Open;

         Application.ProcessMessages;

         if not QSavannaLocal.FieldByName('vnd').IsNull then
         vendas30dias := QSavannaLocal.FieldByName('vnd').AsInteger
         Else
         vendas30dias := 0;

         // Carrega ultimo vlr de venda
         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select valor, data from IMPORTASAVANNAULTIMASVENDAS');
         QSavannaLocal.SQL.Add('where FIPE = :fipe and ano=:ano');
         QSavannaLocal.SQL.Add('order by data desc ');
         QSavannaLocal.SQL.Add('limit 1');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := QBuscaDados.FieldByName('ano_mod').Text;
         QSavannaLocal.Open;

       //ShowMessage('Buscou vlr venda');

         Application.ProcessMessages;

         if QSavannaLocal.FieldByName('valor').AsCurrency <> null then
         vl_ultima_venda := QSavannaLocal.FieldByName('valor').AsCurrency
         Else
         vl_ultima_venda := 0;

         if QSavannaLocal.FieldByName('data').AsDateTime <> null then
         DT_VENDA := QSavannaLocal.FieldByName('data').AsDateTime
         Else
         DT_VENDA := null;

         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select sum(qtd) as  Estoque from IMPORTASAVANNAESTOQUE where FIPE = :fipe and ano=:ano');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := QBuscaDados.FieldByName('ano_mod').Text;
         QSavannaLocal.Open;

          Application.ProcessMessages;

         if not QSavannaLocal.FieldByName('Estoque').IsNull then
         EstoqueAtual := QSavannaLocal.FieldByName('Estoque').AsInteger
         Else
         EstoqueAtual := 0;

         end;

     Application.ProcessMessages;

     QInsereDados.SQL.Clear;
     QInsereDados.SQL.Add('insert into TBPROCPLANS');
     QInsereDados.SQL.Add('( licitacao, lote, placa, modelo, km, ano, ano_mod, cor, vlr_min,');
     QInsereDados.SQL.Add('  vlr_min_fipe, vlr_min_dois, compra_ja, vlr_fipe, vlr_merc_um, vlr_merc_dois,');
     QInsereDados.SQL.Add('  venda_trinta_dias, estoque, vlr_ult_venda, dt_ult_venda, atacado_varejo, categoria, g_zero,');
     QInsereDados.SQL.Add(' mg, avaria, resultado, min_resultado, lance, lance_fipe, compra, sn,');
     QInsereDados.SQL.Add('  dt_pgto, qtd, fornecedor, id_plan_for, cod_fipe)');
     QInsereDados.SQL.Add('values');
     QInsereDados.SQL.Add('(:licitacao, :lote, :placa, :modelo, :km, :ano, :anomod, :cor, :vlr_min,');
     QInsereDados.SQL.Add(':vlr_min_fipe, :vlr_min_dois, :compra_ja, :fipe, :vlr_m_um, :vlr_m_dois,');
     QInsereDados.SQL.Add(':venda_trinta_dias, :estoque, :vlr_ult_venda, :dt_venda, :ata_var, :cat, :gzero,');
     QInsereDados.SQL.Add(':mg, :avaria, :result, :min_result, :lance, :lance_fipe, :compra, :sn, :dt_pgto,');
     QInsereDados.SQL.Add(':qtd, :fornecedor, :id_plan, :c_fipe)');
     QInsereDados.ParamByName('licitacao').Text := '';
     QInsereDados.ParamByName('lote').Text := '';
     QInsereDados.ParamByName('placa').Text := QBuscaDados.FieldByName('placa').Text;
     QInsereDados.ParamByName('modelo').Text := QBuscaDados.FieldByName('modelo').Text;
     QInsereDados.ParamByName('km').AsCurrency := QBuscaDados.FieldByName('km').AsCurrency;
     QInsereDados.ParamByName('ano').Text := '';
     QInsereDados.ParamByName('anomod').Text := QBuscaDados.FieldByName('ano_mod').Text;
     QInsereDados.ParamByName('cor').Text := QBuscaDados.FieldByName('cor').Text;
     QInsereDados.ParamByName('vlr_min').AsCurrency := QBuscaDados.FieldByName('vlr_venda').AsCurrency;
     QInsereDados.ParamByName('vlr_min_fipe').AsCurrency := 0;
     QInsereDados.ParamByName('vlr_min_dois').AsCurrency := 0;
     QInsereDados.ParamByName('compra_ja').AsCurrency := 0;
     QInsereDados.ParamByName('c_fipe').Text := cod_fipe;

     QInsereDados.ParamByName('fipe').AsCurrency := QBuscaDados.FieldByName('vlr_fipe').AsCurrency;

     QInsereDados.ParamByName('vlr_m_um').AsCurrency := 0;
     QInsereDados.ParamByName('vlr_m_dois').AsCurrency := 0;
     QInsereDados.ParamByName('venda_trinta_dias').AsCurrency := vendas30dias;
     QInsereDados.ParamByName('estoque').AsFloat := EstoqueAtual;
     QInsereDados.ParamByName('vlr_ult_venda').AsCurrency := vl_ultima_venda;
     QInsereDados.ParamByName('dt_venda').AsDate := DT_VENDA;
     QInsereDados.ParamByName('ata_var').Text := '';
     QInsereDados.ParamByName('gzero').AsCurrency := 0;
     QInsereDados.ParamByName('mg').AsCurrency := 0;

     QBuscaAvaria.SQL.Clear;
     QBuscaAvaria.SQL.Add('select avaria, coalesce(categoria, '' '') as cat from TBPLANNEUTRON where fornecedor = ''OURO VERDE'' and placa=:pl');
     QBuscaAvaria.ParamByName('pl').Text := QBuscaDados.FieldByName('placa').Text;
     QBuscaAvaria.Open;

     if QBuscaAvaria.FieldByName('avaria').AsCurrency > 0 then
     QInsereDados.ParamByName('avaria').AsCurrency := QBuscaAvaria.FieldByName('avaria').AsCurrency
     Else
     QInsereDados.ParamByName('avaria').AsCurrency := 0;
     QInsereDados.ParamByName('cat').Text := QBuscaAvaria.FieldByName('cat').Text;
     QInsereDados.ParamByName('result').AsCurrency := 0;
     QInsereDados.ParamByName('min_result').AsCurrency := 0;
     QInsereDados.ParamByName('lance').AsCurrency := 0;
     QInsereDados.ParamByName('lance_fipe').AsCurrency := 0;
     QInsereDados.ParamByName('compra').AsCurrency := 0;
     QInsereDados.ParamByName('sn').Text := '';
     QInsereDados.ParamByName('dt_pgto').AsDate := StrToDate('01/01/1991');
     QInsereDados.ParamByName('qtd').AsInteger := 0;
     QInsereDados.ParamByName('fornecedor').Text := 'OURO VERDE';
     QInsereDados.ParamByName('id_plan').AsInteger := StrToInt(EditIDPlanilha.Text);
     QInsereDados.Execute;

     FormLoading.LabelStatus.Caption := 'Processou placa OURO VERDE: '+QBuscaDados.FieldByName('placa').Text;
     Application.ProcessMessages;

     QBuscaDados.Next;

   End;

   FormLoading.Close;
   End;

                 // unidas
   QBuscaDados.SQL.Clear;
   QBuscaDados.SQL.Add('select placa, modelo, cor, km, vlr_fipe, preco from');
   QBuscaDados.SQL.Add('TBPLANUNIDAS where id = :id');
   QBuscaDados.ParamByName('id').AsInteger := StrToInt(EditIDPlanilha.Text);
   QBuscaDados.Open;

      if not QBuscaDados.IsEmpty then
   Begin

   FormLoading.Position := poScreenCenter;
   FormLoading.LabelStatus.Caption := 'Processando planilha final';
   FormLoading.Show;

   Application.ProcessMessages;

   QBuscaDados.First;

   while not QBuscaDados.Eof do
   Begin

        // Carrega cod_fipe da conciliação
     QBuscaMescla.SQL.Clear;
     QBuscaMescla.SQL.Add('select cod_fipe from TBCONCFIPEMODELO where modelo=:mod and fornecedor = ''UNIDAS''');
     QBuscaMescla.ParamByName('mod').Text := QBuscaDados.FieldByName('modelo').Text;
     QBuscaMescla.Open;

     //ShowMessage('FIPE '+QBuscaMescla.FieldByName('cod_fipe').Text);

     if not QBuscaMescla.IsEmpty then
     Begin

     cod_fipe := QBuscaMescla.FieldByName('cod_fipe').Text;

  
         // Carrega vendas dos ultimos 30 dias
         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select COUNT(*) as vnd from IMPORTASAVANNAVENDA30DIAS');
         QSavannaLocal.SQL.Add('where FIPE = :fipe');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.Open;

         Application.ProcessMessages;

         if not QSavannaLocal.FieldByName('vnd').IsNull then
         vendas30dias := QSavannaLocal.FieldByName('vnd').AsInteger
         Else
         vendas30dias := 0;

         // Carrega ultimo vlr de venda
         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select valor, data from IMPORTASAVANNAULTIMASVENDAS');
         QSavannaLocal.SQL.Add('where FIPE = :fipe');
         QSavannaLocal.SQL.Add('order by data desc ');
         QSavannaLocal.SQL.Add('limit 1');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.Open;

       //ShowMessage('Buscou vlr venda');

         Application.ProcessMessages;

         if QSavannaLocal.FieldByName('valor').AsCurrency <> null then
         vl_ultima_venda := QSavannaLocal.FieldByName('valor').AsCurrency
         Else
         vl_ultima_venda := 0;

         if QSavannaLocal.FieldByName('data').AsDateTime <> null then
         DT_VENDA := QSavannaLocal.FieldByName('data').AsDateTime
         Else
         DT_VENDA := null;

         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select qtd as  Estoque from IMPORTASAVANNAESTOQUE where FIPE = :fipe');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.Open;


          Application.ProcessMessages;

         if not QSavannaLocal.FieldByName('Estoque').IsNull then
         EstoqueAtual := QSavannaLocal.FieldByName('Estoque').AsInteger
         Else
         EstoqueAtual := 0;

         end;
    

     Application.ProcessMessages;

     QInsereDados.SQL.Clear;
     QInsereDados.SQL.Add('insert into TBPROCPLANS');
     QInsereDados.SQL.Add('( licitacao, lote, placa, modelo, km, ano, ano_mod, cor, vlr_min,');
     QInsereDados.SQL.Add('  vlr_min_fipe, vlr_min_dois, compra_ja, vlr_fipe, vlr_merc_um, vlr_merc_dois,');
     QInsereDados.SQL.Add('  venda_trinta_dias, estoque, vlr_ult_venda, dt_ult_venda, atacado_varejo, categoria, g_zero,');
     QInsereDados.SQL.Add(' mg, avaria, resultado, min_resultado, lance, lance_fipe, compra, sn,');
     QInsereDados.SQL.Add('  dt_pgto, qtd, fornecedor, id_plan_for)');
     QInsereDados.SQL.Add('values');
     QInsereDados.SQL.Add('(:licitacao, :lote, :placa, :modelo, :km, :ano, :anomod, :cor, :vlr_min,');
     QInsereDados.SQL.Add(':vlr_min_fipe, :vlr_min_dois, :compra_ja, :fipe, :vlr_m_um, :vlr_m_dois,');
     QInsereDados.SQL.Add(':venda_trinta_dias, :estoque, :vlr_ult_venda, :dt_venda, :ata_var, :cat, :gzero,');
     QInsereDados.SQL.Add(':mg, :avaria, :result, :min_result, :lance, :lance_fipe, :compra, :sn, :dt_pgto,');
     QInsereDados.SQL.Add(':qtd, :fornecedor, :id_plan)');
     QInsereDados.ParamByName('licitacao').Text := '';
     QInsereDados.ParamByName('lote').Text := '';
     QInsereDados.ParamByName('placa').Text := QBuscaDados.FieldByName('placa').Text;
     QInsereDados.ParamByName('modelo').Text := QBuscaDados.FieldByName('modelo').Text;
     QInsereDados.ParamByName('km').AsCurrency := QBuscaDados.FieldByName('km').AsCurrency;
     QInsereDados.ParamByName('ano').Text := '';
     QInsereDados.ParamByName('anomod').Text := '';
     QInsereDados.ParamByName('cor').Text := QBuscaDados.FieldByName('cor').Text;
     QInsereDados.ParamByName('vlr_min').AsCurrency := QBuscaDados.FieldByName('preco').AsCurrency;
     QInsereDados.ParamByName('vlr_min_fipe').AsCurrency := 0;
     QInsereDados.ParamByName('vlr_min_dois').AsCurrency := 0;
     QInsereDados.ParamByName('compra_ja').AsCurrency := 0;

     QInsereDados.ParamByName('fipe').AsCurrency := QBuscaDados.FieldByName('vlr_fipe').AsCurrency;

     QInsereDados.ParamByName('vlr_m_um').AsCurrency := 0;
     QInsereDados.ParamByName('vlr_m_dois').AsCurrency := 0;
     QInsereDados.ParamByName('venda_trinta_dias').AsCurrency := vendas30dias;
     QInsereDados.ParamByName('estoque').AsFloat := EstoqueAtual;
     QInsereDados.ParamByName('vlr_ult_venda').AsCurrency := vl_ultima_venda;
     QInsereDados.ParamByName('dt_venda').AsDate := DT_VENDA;
     QInsereDados.ParamByName('ata_var').Text := '';
     QInsereDados.ParamByName('gzero').AsCurrency := 0;
     QInsereDados.ParamByName('mg').AsCurrency := 0;

     QBuscaAvaria.SQL.Clear;
     QBuscaAvaria.SQL.Add('select avaria, coalesce(categoria, '' '') as cat from TBPLANNEUTRON where fornecedor = ''UNIDAS'' and placa=:pl');
     QBuscaAvaria.ParamByName('pl').Text := QBuscaDados.FieldByName('placa').Text;
     QBuscaAvaria.Open;

     if QBuscaAvaria.FieldByName('avaria').AsCurrency > 0 then
     QInsereDados.ParamByName('avaria').AsCurrency := QBuscaAvaria.FieldByName('avaria').AsCurrency
     Else
     QInsereDados.ParamByName('avaria').AsCurrency := 0;
     QInsereDados.ParamByName('cat').Text := QBuscaAvaria.FieldByName('cat').Text;
     QInsereDados.ParamByName('result').AsCurrency := 0;
     QInsereDados.ParamByName('min_result').AsCurrency := 0;
     QInsereDados.ParamByName('lance').AsCurrency := 0;
     QInsereDados.ParamByName('lance_fipe').AsCurrency := 0;
     QInsereDados.ParamByName('compra').AsCurrency := 0;
     QInsereDados.ParamByName('sn').Text := '';
     QInsereDados.ParamByName('dt_pgto').AsDate := StrToDate('01/01/1991');
     QInsereDados.ParamByName('qtd').AsInteger := 0;
     QInsereDados.ParamByName('fornecedor').Text := 'UNIDAS';
     QInsereDados.ParamByName('id_plan').AsInteger := StrToInt(EditIDPlanilha.Text);
     QInsereDados.Execute;

     FormLoading.LabelStatus.Caption := 'Processou placa UNIDAS: '+QBuscaDados.FieldByName('placa').Text;
     Application.ProcessMessages;

     QBuscaDados.Next;

   End;

   FormLoading.Close;
   End;

   End;

   // Exporta excel

   QExportaExcel.SQL.Clear;
   QExportaExcel.SQL.Add('select');
   QExportaExcel.SQL.Add('p.licitacao, p.lote, p.placa, p.modelo, p.km, p.ano, p.ano_mod, p.cor,');
   QExportaExcel.SQL.Add('p.vlr_min as "MIN",  case when p.vlr_fipe > p.vlr_min then (p.vlr_min / p.vlr_fipe * 100) else 0 end as "(MIN/FIPE)", p.vlr_min_dois as "MIN_2", p.compra_ja as "JA",');
   QExportaExcel.SQL.Add('p.vlr_fipe as "FIPE", p.vlr_merc_um as  "MERC1", p.vlr_merc_dois as "MERC2", p.venda_trinta_dias as "VENDA 30 DIAS",');
   QExportaExcel.SQL.Add('p.estoque, p.vlr_ult_venda, p.dt_ult_venda, p.atacado_varejo as "A/V", p.categoria, p.g_zero "G0",');
   QExportaExcel.SQL.Add('p.mg as "MG", p.avaria , p.resultado, p.min_resultado, p.lance, p.lance_fipe as "(LANC/FIPE)",');
   QExportaExcel.SQL.Add('p.compra, p.sn as "S/N", p.dt_pgto as "PGTO", p.qtd, p.Fornecedor');
   QExportaExcel.SQL.Add('from TBPROCPLANS p');
   QExportaExcel.SQL.Add(' where id_plan_for = :id');
   QExportaExcel.ParamByName('id').AsInteger := StrToInt(EditIDPlanilha.Text);
   QExportaExcel.Open;

   QExportaExcel.First;
   QExportaExcel.Last;

   if QExportaExcel.RecordCount > 0  then
   Begin

   BtnGeraPlanFinal.Click();

   End
   Else
   BEgin
     MessageDlg('Nenhum dado encontrado para exportação, revise a importação das planilhas dos fornecedores', mtError, [mbok], 0);
     Abort;
   End;
 End;

end;

procedure TFormNovoProcessamento.Button1Click(Sender: TObject);
begin

 if FormPadroesPlanilhas = nil then
 Begin
   FormPadroesPlanilhas := TFormPadroesPlanilhas.Create(self);
 End;

 FormPadroesPlanilhas.Position := poScreenCenter;
 FormPadroesPlanilhas.WindowState := wsMaximized;
 FormPadroesPlanilhas.ShowModal;

end;

procedure TFormNovoProcessamento.Button2Click(Sender: TObject);
begin

 FormAnaliseCompraQuery.WindowState := wsMaximized;
 FormAnaliseCompraQuery.ShowModal;

end;

procedure TFormNovoProcessamento.CarregaExcelACELERO;
begin
  if FormNovoProcessamento.EditDiretorioAcelero.Text <> '' then
  Begin
    FormNovoProcessamento.ImportExcel1.ExcelFile := FormNovoProcessamento.EditDiretorioAcelero.Text;
    Application.ProcessMessages;
    FormNovoProcessamento.ImportExcel1.ExcelParaStringGrid(FormProcPlanAcelero.StringGridAcelero , FormProcPlanAcelero.ProgressBar1);
    Application.ProcessMessages;
  End
end;


procedure TFormNovoProcessamento.CarregaExcelJSL;
begin
  if FormNovoProcessamento.EditDiretorioJSL.Text <> '' then
  Begin
    FormNovoProcessamento.ImportExcel1.ExcelFile := FormNovoProcessamento.EditDiretorioJSL.Text;
    Application.ProcessMessages;
    FormNovoProcessamento.ImportExcel1.ExcelParaStringGrid(FormProcPlanAcelero.StringGridAcelero , FormProcPlanAcelero.ProgressBar1);
    Application.ProcessMessages;
  End
end;

procedure TFormNovoProcessamento.CarregaExcelALD;
begin
  if FormNovoProcessamento.EditDiretorioALD.Text <> '' then
  Begin
    FormNovoProcessamento.ImportExcel1.ExcelFile := FormNovoProcessamento.EditDiretorioALD.Text;
    Application.ProcessMessages;
    FormNovoProcessamento.ImportExcel1.ExcelParaStringGrid(FormProcPlanAcelero.StringGridAcelero , FormProcPlanAcelero.ProgressBar1);
    Application.ProcessMessages;
  End
end;

procedure TFormNovoProcessamento.CarregaExcelALDprecoFixo;
begin
  if FormNovoProcessamento.EditDiretorioALD.Text <> '' then
  Begin
    FormNovoProcessamento.ImportExcel1.ExcelFile := FormNovoProcessamento.EditDiretorioALD.Text;
    Application.ProcessMessages;
    FormNovoProcessamento.ImportExcel1.ExcelParaStringGrid(FormProcPlanAcelero.StringGridAcelero , FormProcPlanAcelero.ProgressBar1);
    Application.ProcessMessages;
  End
end;

procedure TFormNovoProcessamento.CarregaExcelARVAL;
begin
  if FormNovoProcessamento.EditDiretorioArval.Text <> '' then
  Begin
    FormNovoProcessamento.ImportExcel1.ExcelFile := FormNovoProcessamento.EditDiretorioArval.Text;
    Application.ProcessMessages;
    FormNovoProcessamento.ImportExcel1.ExcelParaStringGrid(FormProcPlanAcelero.StringGridAcelero , FormProcPlanAcelero.ProgressBar1);
    Application.ProcessMessages;
  End
end;

procedure TFormNovoProcessamento.CarregaExcelLM;
begin
  if FormNovoProcessamento.EditDiretorioLM.Text <> '' then
  Begin
    FormNovoProcessamento.ImportExcel1.ExcelFile := FormNovoProcessamento.EditDiretorioLM.Text;
    Application.ProcessMessages;
    FormNovoProcessamento.ImportExcel1.ExcelParaStringGrid(FormProcPlanAcelero.StringGridAcelero , FormProcPlanAcelero.ProgressBar1);
    Application.ProcessMessages;
  End
end;

procedure TFormNovoProcessamento.CarregaExcelLOCALIZA;
begin
  if FormNovoProcessamento.EditDiretorioLOCALIZA.Text <> '' then
  Begin
    FormNovoProcessamento.ImportExcel1.ExcelFile := FormNovoProcessamento.EditDiretorioLOCALIZA.Text;
    //ShowMessage('Recebeu ImportExcel1 o diretorio');
    Application.ProcessMessages;
    //FormProcPlanAcelero.Show;
    FormNovoProcessamento.ImportExcel1.ExcelParaStringGrid(FormProcPlanAcelero.StringGridAcelero , FormProcPlanAcelero.ProgressBar1);

    //ShowMessage('Recebeu ExcelParaStringGrid');
    Application.ProcessMessages;
  End
end;

procedure TFormNovoProcessamento.CarregaExcelMOVIDA;
begin
  if FormNovoProcessamento.EditDiretorioMOVIDA.Text <> '' then
  Begin
    FormNovoProcessamento.ImportExcel1.ExcelFile := FormNovoProcessamento.EditDiretorioMOVIDA.Text;
    Application.ProcessMessages;
    FormNovoProcessamento.ImportExcel1.ExcelParaStringGrid(FormProcPlanAcelero.StringGridAcelero , FormProcPlanAcelero.ProgressBar1);
    Application.ProcessMessages;
    FormLoading.ProgressBar1.Position := 0;
  End
end;

procedure TFormNovoProcessamento.CarregaExcelOUROVERDE;
begin
  if FormNovoProcessamento.EditDiretorioOuroVerde.Text <> '' then
  Begin
    FormNovoProcessamento.ImportExcel1.ExcelFile := FormNovoProcessamento.EditDiretorioOuroVerde.Text;
    Application.ProcessMessages;
    FormNovoProcessamento.ImportExcel1.ExcelParaStringGrid(FormProcPlanAcelero.StringGridAcelero , FormProcPlanAcelero.ProgressBar1);
    Application.ProcessMessages;
  End
end;



procedure TFormNovoProcessamento.CarregaExcelUNIDAS;
begin
  if FormNovoProcessamento.EditDiretorioUnidas.Text <> '' then
  Begin
    FormNovoProcessamento.ImportExcel1.ExcelFile := FormNovoProcessamento.EditDiretorioUnidas.Text;
    Application.ProcessMessages;
    FormNovoProcessamento.ImportExcel1.ExcelParaStringGrid(FormProcPlanAcelero.StringGridAcelero , FormProcPlanAcelero.ProgressBar1);
    Application.ProcessMessages;
  End
end;

procedure TFormNovoProcessamento.CarregaExcelNeutron;
begin
  if FormNovoProcessamento.EditDiretorioNeutron.Text <> '' then
  Begin
    FormNovoProcessamento.ImportExcel1.ExcelFile := FormNovoProcessamento.EditDiretorioNeutron.Text;
    Application.ProcessMessages;
    FormNovoProcessamento.ImportExcel1.ExcelParaStringGrid(FormProcPlanAcelero.StringGridAcelero , FormProcPlanAcelero.ProgressBar1);
    Application.ProcessMessages;
  End
end;

procedure TFormNovoProcessamento.Image10Click(Sender: TObject);
begin
 if OpenDialogBuscaPlan.Execute() then
 Begin
   if OpenDialogBuscaPlan.FileName <> '' then
   Begin
     EditDiretorioArval.Text := OpenDialogBuscaPlan.FileName;

     LblNomeArquivo.Caption := ExtractFileName(OpenDialogBuscaPlan.FileName);

     QAtualizaDiretorios.SQL.Clear;
     QAtualizaDiretorios.SQL.Add('update TBPLANILHASEMPROCESSAMENTO set diretorio = :dir where fornecedor = ''ARVAL'' ');
     QAtualizaDiretorios.ParamByName('dir').Text := EditDiretorioARVAL.Text;
     QAtualizaDiretorios.Execute;

     if MessageDlg('Deseja importar planilha?', mtInformation, [mbno, mbyes], 0) = mrYes then
     Begin
       btnProcessaArval.Click();
     End;

   End;
 End;
end;

procedure TFormNovoProcessamento.Image11Click(Sender: TObject);
begin
 if OpenDialogBuscaPlan.Execute() then
 Begin
   if OpenDialogBuscaPlan.FileName <> '' then
   Begin
     EditDiretorioJSL.Text := OpenDialogBuscaPlan.FileName;

     LblNomeArquivo.Caption := ExtractFileName(OpenDialogBuscaPlan.FileName);

     QAtualizaDiretorios.SQL.Clear;
     QAtualizaDiretorios.SQL.Add('update TBPLANILHASEMPROCESSAMENTO set diretorio = :dir where fornecedor = ''JSL'' ');
     QAtualizaDiretorios.ParamByName('dir').Text := EditDiretorioJSL.Text;
     QAtualizaDiretorios.Execute;

     if MessageDlg('Deseja importar planilha?', mtInformation, [mbno, mbyes], 0) = mrYes then
     Begin
       btnProcessaJSL.Click();
     End;

   End;
 End;
end;

procedure TFormNovoProcessamento.Image12Click(Sender: TObject);
begin
 if OpenDialogBuscaPlan.Execute() then
 Begin
   if OpenDialogBuscaPlan.FileName <> '' then
   Begin
     EditDiretorioLOCALIZA.Text := OpenDialogBuscaPlan.FileName;

     LblNomeArquivo.Caption := ExtractFileName(OpenDialogBuscaPlan.FileName);

     QAtualizaDiretorios.SQL.Clear;
     QAtualizaDiretorios.SQL.Add('update TBPLANILHASEMPROCESSAMENTO set diretorio = :dir where fornecedor = ''LOCALIZA'' ');
     QAtualizaDiretorios.ParamByName('dir').Text := EditDiretorioLOCALIZA.Text;
     QAtualizaDiretorios.Execute;

     if MessageDlg('Deseja importar planilha?', mtInformation, [mbno, mbyes], 0) = mrYes then
     Begin
       btnProcessaLocaliza.Click();
     End;

   End;
 End;
end;

procedure TFormNovoProcessamento.Image13Click(Sender: TObject);
begin
 if OpenDialogBuscaPlan.Execute() then
 Begin
   if OpenDialogBuscaPlan.FileName <> '' then
   Begin
     EditDiretorioMOVIDA.Text := OpenDialogBuscaPlan.FileName;

     LblNomeArquivo.Caption := ExtractFileName(OpenDialogBuscaPlan.FileName);

     QAtualizaDiretorios.SQL.Clear;
     QAtualizaDiretorios.SQL.Add('update TBPLANILHASEMPROCESSAMENTO set diretorio = :dir where fornecedor = ''MOVIDA'' ');
     QAtualizaDiretorios.ParamByName('dir').Text := EditDiretorioMOVIDA.Text;
     QAtualizaDiretorios.Execute;

     if MessageDlg('Deseja importar planilha?', mtInformation, [mbno, mbyes], 0) = mrYes then
     Begin
       btnProcessaMovida.Click();
     End;

   End;
 End;
end;

procedure TFormNovoProcessamento.Image14Click(Sender: TObject);
begin
 if OpenDialogBuscaPlan.Execute() then
 Begin
   if OpenDialogBuscaPlan.FileName <> '' then
   Begin
     EditDiretorioOuroVerde.Text := OpenDialogBuscaPlan.FileName;

     LblNomeArquivo.Caption := ExtractFileName(OpenDialogBuscaPlan.FileName);

     QAtualizaDiretorios.SQL.Clear;
     QAtualizaDiretorios.SQL.Add('update TBPLANILHASEMPROCESSAMENTO set diretorio = :dir where fornecedor = ''OURO VERDE'' ');
     QAtualizaDiretorios.ParamByName('dir').Text := EditDiretorioOuroVerde.Text;
     QAtualizaDiretorios.Execute;

     if MessageDlg('Deseja importar planilha?', mtInformation, [mbno, mbyes], 0) = mrYes then
     Begin
       btnProcessaOuroVerde.Click();
     End;

   End;
 End;
end;

procedure TFormNovoProcessamento.Image1Click(Sender: TObject);
begin
 if OpenDialogBuscaPlan.Execute() then
 Begin
   if OpenDialogBuscaPlan.FileName <> '' then
   Begin
     EditDiretorioAcelero.Text := OpenDialogBuscaPlan.FileName;

     LblNomeArquivo.Caption := ExtractFileName(OpenDialogBuscaPlan.FileName);

     QAtualizaDiretorios.SQL.Clear;
     QAtualizaDiretorios.SQL.Add('update TBPLANILHASEMPROCESSAMENTO set diretorio = :dir where fornecedor = ''ACELERO'' ');
     QAtualizaDiretorios.ParamByName('dir').Text := EditDiretorioAcelero.Text;
     QAtualizaDiretorios.Execute;

     if MessageDlg('Deseja importar planilha?', mtInformation, [mbno, mbyes], 0) = mrYes then
     Begin
       BtnProcessarAcelero.Click();
     End;

   End;
 End;
end;

procedure TFormNovoProcessamento.Image2Click(Sender: TObject);
begin
 if OpenDialogBuscaPlan.Execute() then
 Begin
   if OpenDialogBuscaPlan.FileName <> '' then
   Begin
     EditDiretorioLM.Text := OpenDialogBuscaPlan.FileName;

     LblNomeArquivo.Caption := ExtractFileName(OpenDialogBuscaPlan.FileName);

     QAtualizaDiretorios.SQL.Clear;
     QAtualizaDiretorios.SQL.Add('update TBPLANILHASEMPROCESSAMENTO set diretorio = :dir where fornecedor = ''LM'' ');
     QAtualizaDiretorios.ParamByName('dir').Text := EditDiretorioLM.Text;
     QAtualizaDiretorios.Execute;

     if MessageDlg('Deseja importar planilha?', mtInformation, [mbno, mbyes], 0) = mrYes then
     Begin
       btnProcessaLM.Click();
     End;

   End;
 End;
end;

procedure TFormNovoProcessamento.Image3Click(Sender: TObject);
begin
 if OpenDialogBuscaPlan.Execute() then
 Begin
   if OpenDialogBuscaPlan.FileName <> '' then
   Begin
     EditDiretorioUnidas.Text := OpenDialogBuscaPlan.FileName;

     LblNomeArquivo.Caption := ExtractFileName(OpenDialogBuscaPlan.FileName);

     QAtualizaDiretorios.SQL.Clear;
     QAtualizaDiretorios.SQL.Add('update TBPLANILHASEMPROCESSAMENTO set diretorio = :dir where fornecedor = ''UNIDAS'' ');
     QAtualizaDiretorios.ParamByName('dir').Text := EditDiretorioUNIDAS.Text;
     QAtualizaDiretorios.Execute;

     if MessageDlg('Deseja importar planilha?', mtInformation, [mbno, mbyes], 0) = mrYes then
     Begin
       btnProcessaUnidas.Click();
     End;

   End;
 End;
end;

procedure TFormNovoProcessamento.Image4Click(Sender: TObject);
begin
 if OpenDialogBuscaPlan.Execute() then
 Begin
   if OpenDialogBuscaPlan.FileName <> '' then
   Begin
     EditDiretorioNeutron.Text := OpenDialogBuscaPlan.FileName;

     LblNomeArquivo.Caption := ExtractFileName(OpenDialogBuscaPlan.FileName);

     QAtualizaDiretorios.SQL.Clear;
     QAtualizaDiretorios.SQL.Add('update TBPLANILHASEMPROCESSAMENTO set diretorio = :dir where fornecedor = ''NEUTRON'' ');
     QAtualizaDiretorios.ParamByName('dir').Text := EditDiretorioNeutron.Text;
     QAtualizaDiretorios.Execute;

      if MessageDlg('Deseja importar planilha?', mtInformation, [mbno, mbyes], 0) = mrYes then
     Begin
       btnProcNeutron.Click();
     End;

   End;
 End;
end;

procedure TFormNovoProcessamento.Image6Click(Sender: TObject);
begin

 FormWebBrowse.WebBrowser1.Navigate('https://www.ilovepdf.com/pt/pdf_para_excel');

 FormWebBrowse.WindowState := wsMaximized;

 FormWebBrowse.ShowModal;

end;

procedure TFormNovoProcessamento.Image9Click(Sender: TObject);
begin

 if MessageDlg('Deseja processar planilha ALD com PREÇO FIXO?', mtInformation, [mbno, mbyes] , 0) = mrYes then
   Begin
      if OpenDialogBuscaPlan.Execute() then
      Begin
        if OpenDialogBuscaPlan.FileName <> '' then
       Begin
        EditDiretorioALD.Text := OpenDialogBuscaPlan.FileName;

        LblNomeArquivo.Caption := ExtractFileName(OpenDialogBuscaPlan.FileName);

        QAtualizaDiretorios.SQL.Clear;
        QAtualizaDiretorios.SQL.Add('update TBPLANILHASEMPROCESSAMENTO set diretorio = :dir where fornecedor = ''ALD PRECO FIXO'' ');
        QAtualizaDiretorios.ParamByName('dir').Text := EditDiretorioALD.Text;
        QAtualizaDiretorios.Execute;

        if MessageDlg('Deseja importar planilha?', mtInformation, [mbno, mbyes], 0) = mrYes then
        Begin
          btnALDprecoFixo.Click();
        End;
       End
      End
    End
    Else
    Begin

     if OpenDialogBuscaPlan.Execute() then
      Begin
        if OpenDialogBuscaPlan.FileName <> '' then
          Begin
            EditDiretorioALD.Text := OpenDialogBuscaPlan.FileName;

            LblNomeArquivo.Caption := ExtractFileName(OpenDialogBuscaPlan.FileName);

            QAtualizaDiretorios.SQL.Clear;
            QAtualizaDiretorios.SQL.Add('update TBPLANILHASEMPROCESSAMENTO set diretorio = :dir where fornecedor = ''ALD'' ');
            QAtualizaDiretorios.ParamByName('dir').Text := EditDiretorioALD.Text;
            QAtualizaDiretorios.Execute;

            if MessageDlg('Deseja importar planilha?', mtInformation, [mbno, mbyes], 0) = mrYes then
             Begin
              btnProcessaALD.Click();
             End;

          End;
      End;
    End;
end;

procedure TFormNovoProcessamento.ImportaPlanACELERO;
Var
  I, Qtd, vendas30dias, EstoqueAtual: integer;
  modelo, cod_fipe, Principal, Ref2, Ref3 : string;
  vl_ultima_venda, vlr_fipe : Currency;
  DT_VENDA : TDate;
 Begin

   vendas30dias := 0;
   EstoqueAtual := 0;
   vl_ultima_venda := 0;
   //DT_VENDA := null;

    DataModuleConexao.qBuscaRefFipe.SQL.Clear;
    DataModuleConexao.qBuscaRefFipe.SQL.Add('select ref1 , ref2, ref3, principal from tbfiperef');
    DataModuleConexao.qBuscaRefFipe.Open;

    Principal := DataModuleConexao.qBuscaRefFipe.FieldByName('principal').Text;
    Ref1      := DataModuleConexao.qBuscaRefFipe.FieldByName('ref1').Text;
    Ref2      := DataModuleConexao.qBuscaRefFipe.FieldByName('ref2').Text;
    Ref3      := DataModuleConexao.qBuscaRefFipe.FieldByName('ref3').Text;

    if ref1 <> Principal then
    Begin

      ref1 := DataModuleConexao.qBuscaRefFipe.FieldByName('principal').Text;
      Ref2 := DataModuleConexao.qBuscaRefFipe.FieldByName('ref1').Text;
      ref3 := DataModuleConexao.qBuscaRefFipe.FieldByName('ref2').Text;

    End;

 Try
  for I := 0 to Pred(FormProcPlanAcelero.StringGridAcelero.RowCount) do
  Begin

  if I = 0 then
  Continue;

  if Trim(FormProcPlanAcelero.StringGridAcelero.Cells[0,I]) = '' then
  Continue;

    // Analise qtd
    Qtd := Length(FormProcPlanAcelero.StringGridAcelero.Cells[3,I]);
    // Ano
    modelo := Copy(FormProcPlanAcelero.StringGridAcelero.Cells[3,I], qtd -3, qtd);

    //ShowMessage('Leu qtd e modelo para formatação');

    // Verifica modelo na conciliação de mod x fipe
    QConcFIPE.SQL.Clear;
    QConcFIPE.SQL.Add('select count(*) as existe from TBCONCFIPEMODELO where modelo = :mod AND ANO=:ANO and fornecedor = ''ACELERO''');
    QConcFIPE.SQL.Add('and ref_fipe=:ref');
    QConcFIPE.ParamByName('mod').Text := FormProcPlanAcelero.StringGridAcelero.Cells[1,I];
    QConcFIPE.ParamByName('ANO').Text := modelo;
    QConcFIPE.ParamByName('ref').Text := Principal;
    QConcFIPE.Open;

    //ShowMessage('Verificou FIPE Conciliada');

     if QConcFIPE.FieldByName('existe').AsInteger = 0 then
     Begin
      MessageDlg('Não foi encontrada vinculação de FIPE para o modelo, efetue-a.'+#13+
               'Modelo: '+FormProcPlanAcelero.StringGridAcelero.Cells[1,I], mtWarning, [mbok], 0);

      FormConciliacaoFipeModelo.EditModeloFIPE.Text := Copy(FormProcPlanAcelero.StringGridAcelero.Cells[1,I], 0, 10);
      FormConciliacaoFipeModelo.Position := poScreenCenter;
      FormConciliacaoFipeModelo.lblModeloPlan.Caption := FormProcPlanAcelero.StringGridAcelero.Cells[1,I];
      FormConciliacaoFipeModelo.EditAnoFIPE.Text := modelo;
      FormConciliacaoFipeModelo.lblFornecedor.Caption := 'ACELERO';

      FormConciliacaoFipeModelo.ShowModal;
     End;

       //Carrega cod_fipe da conciliação
     QBuscaMescla.SQL.Clear;
     QBuscaMescla.SQL.Add('select cod_fipe, VLR_FIPE from TBCONCFIPEMODELO where modelo=:mod and fornecedor = ''ACELERO''');
     QBuscaMescla.SQL.Add('and ANO=:ano and ref_fipe=:ref');
     QBuscaMescla.ParamByName('ano').Text := modelo;
     QBuscaMescla.ParamByName('mod').Text := FormProcPlanAcelero.StringGridAcelero.Cells[1,I];
     QBuscaMescla.ParamByName('ref').Text := Principal;
     QBuscaMescla.Open;

     cod_fipe := QBuscaMescla.FieldByName('cod_fipe').Text;
     vlr_fipe := QBuscaMescla.FieldByName('VLR_FIPE').AsCurrency;


        // Valida placa se ja importou
      QValidaPlacaJaImportada.SQL.Clear;
      QValidaPlacaJaImportada.SQL.Add('select count(*) as Existe from TBPROCPLANS where PLACA=:PLACA and FORNECEDOR=:FOR');
      QValidaPlacaJaImportada.ParamByName('PLACA').Text := FormProcPlanAcelero.StringGridAcelero.Cells[0,I];
      QValidaPlacaJaImportada.ParamByName('FOR').Text := 'ACELERO';
      QValidaPlacaJaImportada.Open;


     if Ref2 <> ' ' then
     Begin

       DataModuleConexao.qBuscaFipesRef.SQL.Clear;
       DataModuleConexao.qBuscaFipesRef.SQL.Add('select "'+'ANO'+modelo+'" as FIPE from TBFIPE where');
       DataModuleConexao.qBuscaFipesRef.SQL.Add(' "'+'ANO'+modelo+'" > 0 and cod_fipe = :codfipe and ref=:ref limit 1');
       DataModuleConexao.qBuscaFipesRef.ParamByName('codfipe').text := cod_fipe;
       DataModuleConexao.qBuscaFipesRef.ParamByName('ref').Text := Ref2;
       DataModuleConexao.qBuscaFipesRef.Open;

       ValorRef2 := DataModuleConexao.qBuscaFipesRef.FieldByName('FIPE').AsCurrency;

     End
     Else
     Begin
       ValorRef2 := 0;
     End;

     //ShowMessage('Vai ref 3');

     if Ref3 <> ' ' then
     Begin

       DataModuleConexao.qBuscaFipesRef.SQL.Clear;
       DataModuleConexao.qBuscaFipesRef.SQL.Add('select "'+'ANO'+modelo+'" as FIPE from TBFIPE where');
       DataModuleConexao.qBuscaFipesRef.SQL.Add(' "'+'ANO'+modelo+'" > 0 and cod_fipe = :codfipe and ref=:ref limit 1');
       DataModuleConexao.qBuscaFipesRef.ParamByName('codfipe').text := cod_fipe;
       DataModuleConexao.qBuscaFipesRef.ParamByName('ref').Text := Ref3;
       DataModuleConexao.qBuscaFipesRef.Open;

       ValorRef3 := DataModuleConexao.qBuscaFipesRef.FieldByName('FIPE').AsCurrency;

     End
     Else
     Begin
       ValorRef3 := 0;
     End;

     //ShowMessage('Fez ref 3');

  if QValidaPlacaJaImportada.FieldByName('Existe').AsInteger > 0 then
   Begin
          Application.ProcessMessages;

     QAtualizaG.SQL.Clear;
     QAtualizaG.SQL.Add('select');
     QAtualizaG.SQL.Add('G_ZERO, DT_G0');
     QAtualizaG.SQL.Add('from TBPROCPLANS');
     QAtualizaG.SQL.Add('where');
     QAtualizaG.SQL.Add('G_ZERO > 0');
     QAtualizaG.SQL.Add('and');
     QAtualizaG.SQL.Add('COD_FIPE = :c_fipe and ANO_MOD = :ano');
     QAtualizaG.SQL.Add('order by DT_G0 desc limit 1');
     QAtualizaG.ParamByName('c_fipe').Text := cod_fipe;
     QAtualizaG.ParamByName('ano').Text := modelo;
     QAtualizaG.Open;

     QValidaPlacaJaImportada.SQL.Clear;
     QValidaPlacaJaImportada.SQL.Add('update TBPROCPLANS set');
     QValidaPlacaJaImportada.SQL.Add('vlr_min=:vlr_min,');
     QValidaPlacaJaImportada.SQL.Add('km=:km,');
     QValidaPlacaJaImportada.SQL.Add('venda_trinta_dias=:venda_trinta_dias,');
     QValidaPlacaJaImportada.SQL.Add('estoque=:estoque,');
     QValidaPlacaJaImportada.SQL.Add('vlr_ult_venda=:vlr_ult_venda,');
     QValidaPlacaJaImportada.SQL.Add('dt_ult_venda=:dt_ult_venda,');
     QValidaPlacaJaImportada.SQL.Add('categoria=:cat,');
     QValidaPlacaJaImportada.SQL.Add('avaria=:avaria,');
     QValidaPlacaJaImportada.SQL.Add('DATA=:dt,');
     QValidaPlacaJaImportada.SQL.Add('onde=:onde,');
     QValidaPlacaJaImportada.SQL.Add('VLR_MIN_FIPE=:v_m_f,');
     QValidaPlacaJaImportada.SQL.Add('local=:local,');
     QValidaPlacaJaImportada.SQL.Add('vlr_fipe=:fipe,');
     QValidaPlacaJaImportada.SQL.Add('ULT_G0=:UG0,');
     QValidaPlacaJaImportada.SQL.Add('DT_G0=:DTG0,');
     QValidaPlacaJaImportada.SQL.Add('ref_fipe=:ref, fipe2:=:vlfipe2, ref_fipe2=:ref2, fipe3=:vlfipe3, ref_fipe3=:ref3,');
     QValidaPlacaJaImportada.SQL.Add('vlr_fipe=:fipe, vlr_min=:min, IMPORT_PLANILHA=:PLAN, IMPORT_DATA=:DT, situacao = 0 where PLACA=:PLACA');
     QValidaPlacaJaImportada.ParamByName('PLAN').Text := LblNomeArquivo.Caption;
     QValidaPlacaJaImportada.ParamByName('DT').AsDate := NOW;
     QValidaPlacaJaImportada.ParamByName('ref').Text := Principal;
     QValidaPlacaJaImportada.ParamByName('vlfipe2').AsCurrency := ValorRef2;
     QValidaPlacaJaImportada.ParamByName('ref2').Text := Ref2;
     QValidaPlacaJaImportada.ParamByName('vlfipe3').AsCurrency := ValorRef3;
     QValidaPlacaJaImportada.ParamByName('ref3').Text := Ref3;
     QValidaPlacaJaImportada.ParamByName('v_m_f').AsCurrency := vlr_fipe - StrToCurr(FormProcPlanAcelero.StringGridAcelero.Cells[5,I]);
     QValidaPlacaJaImportada.ParamByName('placa').Text := FormProcPlanAcelero.StringGridAcelero.Cells[0,I];
     QValidaPlacaJaImportada.ParamByName('km').AsCurrency := StrToCurr(FormProcPlanAcelero.StringGridAcelero.Cells[4,I]);
     QValidaPlacaJaImportada.ParamByName('dt_ult_venda').AsDate := DT_VENDA;
     QValidaPlacaJaImportada.ParamByName('vlr_min').AsCurrency := StrToCurr( FormProcPlanAcelero.StringGridAcelero.Cells[5,I] );
     QValidaPlacaJaImportada.ParamByName('fipe').AsCurrency := vlr_fipe;
     QValidaPlacaJaImportada.ParamByName('venda_trinta_dias').AsInteger := vendas30dias;
     QValidaPlacaJaImportada.ParamByName('estoque').AsInteger := EstoqueAtual;
     QValidaPlacaJaImportada.ParamByName('vlr_ult_venda').AsCurrency := vl_ultima_venda;
     QValidaPlacaJaImportada.ParamByName('dt').AsDate := NOW;
     QValidaPlacaJaImportada.ParamByName('onde').Text := ''; //FormProcPlanAcelero.StringGridAcelero.Cells[7,I];
     QValidaPlacaJaImportada.ParamByName('local').Text := ''; //FormProcPlanAcelero.StringGridAcelero.Cells[8,I];
     QValidaPlacaJaImportada.ParamByName('cat').Text := '';
     QValidaPlacaJaImportada.ParamByName('avaria').AsCurrency := 0;
     if QAtualizaG.FieldByName('G_ZERO').AsFloat > 0 then
     QValidaPlacaJaImportada.ParamByName('UG0').AsFloat := QAtualizaG.FieldByName('G_ZERO').AsFloat
     Else
     QValidaPlacaJaImportada.ParamByName('UG0').AsFloat := 0;
     if QAtualizaG.FieldByName('DT_G0').AsDateTime <> null then
     QValidaPlacaJaImportada.ParamByName('DTG0').AsDate := QAtualizaG.FieldByName('DT_G0').AsDateTime
     Else
     QValidaPlacaJaImportada.ParamByName('DTG0').AsDate := null;
     QValidaPlacaJaImportada.Execute;

     FormLoading.LabelStatus.Caption := 'Atualizando planilha ACELERO PLACA: '+FormProcPlanAcelero.StringGridAcelero.Cells[0,I];

     FormLoading.ProgressBar1.Position := FormLoading.ProgressBar1.Position + 1;
     Application.ProcessMessages;

   End
   Else
   Begin

     //ShowMessage('Vai Inserir');

     QAtualizaG.SQL.Clear;
     QAtualizaG.SQL.Add('select');
     QAtualizaG.SQL.Add('G_ZERO, DT_G0');
     QAtualizaG.SQL.Add('from TBPROCPLANS');
     QAtualizaG.SQL.Add('where');
     QAtualizaG.SQL.Add('G_ZERO > 0');
     QAtualizaG.SQL.Add('and');
     QAtualizaG.SQL.Add('COD_FIPE = :c_fipe and ANO_MOD = :ano');
     QAtualizaG.SQL.Add('order by DT_G0 desc limit 1');
     QAtualizaG.ParamByName('c_fipe').Text := cod_fipe;
     QAtualizaG.ParamByName('ano').Text := modelo;
     QAtualizaG.Open;

   QInsereDados.SQL.Clear;
   QInsereDados.SQL.Add('insert into TBPROCPLANS');
   QInsereDados.SQL.Add('( licitacao, lote, placa, modelo, km, ano, ano_mod, cor, vlr_min,');
   QInsereDados.SQL.Add('  vlr_min_fipe, vlr_min_dois, compra_ja, vlr_fipe, vlr_merc_um, vlr_merc_dois,');
   QInsereDados.SQL.Add('  venda_trinta_dias, estoque, vlr_ult_venda, dt_ult_venda, atacado_varejo, categoria, g_zero,');
   QInsereDados.SQL.Add(' mg, avaria, resultado, min_resultado, lance, lance_fipe, compra, sn,');
   QInsereDados.SQL.Add('  dt_pgto, qtd, fornecedor, id_plan_for, cod_fipe, situacao, data, onde, local, ULT_G0, DT_G0, IMPORT_PLANILHA, IMPORT_DATA, IMPORT_STATUS, ref_fipe, fipe2, ref_fipe2, fipe3, ref_fipe3)');
   QInsereDados.SQL.Add('values');
   QInsereDados.SQL.Add('(:licitacao, :lote, :placa, :modelo, :km, :ano, :anomod, :cor, :vlr_min,');
   QInsereDados.SQL.Add(':vlr_min_fipe, :vlr_min_dois, :compra_ja, :fipe, :vlr_m_um, :vlr_m_dois,');
   QInsereDados.SQL.Add(':venda_trinta_dias, :estoque, :vlr_ult_venda, :dt_venda, :ata_var, :cat, :gzero,');
   QInsereDados.SQL.Add(':mg, :avaria, :result, :min_result, :lance, :lance_fipe, :compra, :sn, :dt_pgto,');
   QInsereDados.SQL.Add(':qtd, :fornecedor, :id_plan, :c_fipe, :sit, :dt, :onde, :local, :UG0, :DTG0, :PLANILHA, :DT_PLANILHA, :STATUS_PLANILHA, :ref, :vlfipe2, :ref2, :vlfipe3, :ref3)');
   QInsereDados.ParamByName('licitacao').Text := '';
   QInsereDados.ParamByName('lote').Text := '';
   QInsereDados.ParamByName('PLANILHA').Text := LblNomeArquivo.Caption;
   QInsereDados.ParamByName('DT_PLANILHA').AsDateTime := NOW;
   QInsereDados.ParamByName('ref').Text := Principal;
   QInsereDados.ParamByName('vlfipe2').AsCurrency := ValorRef2;
   QInsereDados.ParamByName('ref2').Text := Ref2;
   QInsereDados.ParamByName('vlfipe3').AsCurrency := ValorRef3;
   QInsereDados.ParamByName('ref3').Text := Ref3;
   QInsereDados.ParamByName('placa').Text := FormProcPlanAcelero.StringGridAcelero.Cells[0,I];
   QInsereDados.ParamByName('modelo').Text := FormProcPlanAcelero.StringGridAcelero.Cells[1,I];
   QInsereDados.ParamByName('km').AsCurrency := StrToCurr(FormProcPlanAcelero.StringGridAcelero.Cells[4,I]);
   QInsereDados.ParamByName('ano').Text := modelo;
   QInsereDados.ParamByName('dt_venda').AsDate := DT_VENDA;
   QInsereDados.ParamByName('anomod').Text := Copy(FormProcPlanAcelero.StringGridAcelero.Cells[3,I], qtd -3, qtd);
   QInsereDados.ParamByName('cor').Text := '';
   QInsereDados.ParamByName('vlr_min').AsCurrency := StrTocurr(FormProcPlanAcelero.StringGridAcelero.Cells[5,I]);
   QInsereDados.ParamByName('vlr_min_fipe').AsCurrency := vlr_fipe - StrTocurr(FormProcPlanAcelero.StringGridAcelero.Cells[5,I]);
   QInsereDados.ParamByName('vlr_min_dois').AsCurrency := 0;
   QInsereDados.ParamByName('compra_ja').AsCurrency := 0;
   QInsereDados.ParamByName('fipe').AsCurrency := vlr_fipe;
   QInsereDados.ParamByName('vlr_m_um').AsCurrency := 0;
   QInsereDados.ParamByName('vlr_m_dois').AsCurrency := 0;
   QInsereDados.ParamByName('venda_trinta_dias').AsInteger := vendas30dias;
   QInsereDados.ParamByName('estoque').AsInteger := EstoqueAtual;
   QInsereDados.ParamByName('vlr_ult_venda').AsCurrency := vl_ultima_venda;
   QInsereDados.ParamByName('ata_var').Text := '';
   QInsereDados.ParamByName('gzero').AsCurrency := 0;
   QInsereDados.ParamByName('mg').AsCurrency :=  Margem;;
   QInsereDados.ParamByName('c_fipe').Text := cod_fipe;
   QInsereDados.ParamByName('sit').AsInteger := 0;
   QInsereDados.ParamByName('dt').AsDate := NOW;
   QInsereDados.ParamByName('onde').Text :=  ''; //FormProcPlanAcelero.StringGridAcelero.Cells[7,I];
   QInsereDados.ParamByName('local').Text := ''; //FormProcPlanAcelero.StringGridAcelero.Cells[8,I];
   QInsereDados.ParamByName('fornecedor').Text := 'ACELERO';
   QInsereDados.ParamByName('cat').Text := '';
   QInsereDados.ParamByName('avaria').AsCurrency := 0;
     if QAtualizaG.FieldByName('G_ZERO').AsFloat > 0 then
     QInsereDados.ParamByName('UG0').AsFloat := QAtualizaG.FieldByName('G_ZERO').AsFloat
     Else
     QInsereDados.ParamByName('UG0').AsFloat := 0;
     if QAtualizaG.FieldByName('DT_G0').AsDateTime <> null then
     QInsereDados.ParamByName('DTG0').AsDate := QAtualizaG.FieldByName('DT_G0').AsDateTime
     Else
     QInsereDados.ParamByName('DTG0').AsDate := null;
   QInsereDados.Execute;

   End;

    FormLoading.LabelStatus.Caption := 'Importando planilha ACELERO PLACA: '+FormProcPlanAcelero.StringGridAcelero.Cells[0,I];

     FormLoading.ProgressBar1.Position := FormLoading.ProgressBar1.Position + 1;
     Application.ProcessMessages;

  End;

 Finally

 End;
 MessageDlg('Importação finalizada', mtInformation, [mbok], 0);
end;

procedure TFormNovoProcessamento.ImportaPlanALD;
Var
  I, Qtd, vendas30dias, EstoqueAtual: integer;
  modelo, cod_fipe : string;
  vl_ultima_venda : Currency;
  DT_VENDA : TDate;
 Begin

   if FormConciliacaoFipeModelo = nil then
   Begin
     FormConciliacaoFipeModelo := TFormConciliacaoFipeModelo.Create(self);
   End;

   if FormProcPlanAcelero = nil then
   Begin
     FormProcPlanAcelero := TFormProcPlanAcelero.Create(self);
   End;

   if FormLoading = nil then
   Begin
     FormLoading := TFormLoading.Create(self);
   End;

   Vendas30dias := 0;
   EstoqueAtual := 0;
   vl_ultima_venda := 0;

 Try
  for I := 0 to Pred(FormProcPlanAcelero.StringGridAcelero.RowCount) do
  Begin

  if I = 0 then
  Continue;

  if Trim(FormProcPlanAcelero.StringGridAcelero.Cells[0,I]) = '' then
  Continue;

    DataModuleConexao.qBuscaRefFipe.SQL.Clear;
    DataModuleConexao.qBuscaRefFipe.SQL.Add('select ref1 , ref2, ref3, principal from tbfiperef');
    DataModuleConexao.qBuscaRefFipe.Open;

    Principal := DataModuleConexao.qBuscaRefFipe.FieldByName('principal').Text;
    Ref1      := DataModuleConexao.qBuscaRefFipe.FieldByName('ref1').Text;
    Ref2      := DataModuleConexao.qBuscaRefFipe.FieldByName('ref2').Text;
    Ref3      := DataModuleConexao.qBuscaRefFipe.FieldByName('ref3').Text;

    if ref1 <> Principal then
    Begin

      ref1 := DataModuleConexao.qBuscaRefFipe.FieldByName('principal').Text;
      Ref2 := DataModuleConexao.qBuscaRefFipe.FieldByName('ref1').Text;
      ref3 := DataModuleConexao.qBuscaRefFipe.FieldByName('ref2').Text;

    End;

    // Verifica modelo na conciliação de mod x fipe
    QConcFIPE.SQL.Clear;
    QConcFIPE.SQL.Add('select count(vlr_fipe) as existe from TBCONCFIPEMODELO where modelo = :mod AND ANO=:ANO and fornecedor = ''ALD''');
    QConcFIPE.SQL.Add('and REF_FIPE=:ref');
    QConcFIPE.ParamByName('mod').Text := FormProcPlanAcelero.StringGridAcelero.Cells[2,I];
    QConcFIPE.ParamByName('ANO').Text := FormProcPlanAcelero.StringGridAcelero.Cells[6,I];
    QConcFIPE.ParamByName('ref').Text := Principal;
    QConcFIPE.Open;

     if QConcFIPE.FieldByName('existe').AsInteger = 0 then
     Begin
      MessageDlg('Não foi encontrada vinculação de FIPE para o modelo, efetue-a.'+#13+
               'Modelo: '+FormProcPlanAcelero.StringGridAcelero.Cells[2,I], mtWarning, [mbok], 0);

      FormConciliacaoFipeModelo.EditModeloFIPE.Text := Copy(FormProcPlanAcelero.StringGridAcelero.Cells[2,I], 0, 10);
      FormConciliacaoFipeModelo.Position := poScreenCenter;
      FormConciliacaoFipeModelo.lblModeloPlan.Caption := FormProcPlanAcelero.StringGridAcelero.Cells[2,I];
      FormConciliacaoFipeModelo.EditAnoFIPE.Text := FormProcPlanAcelero.StringGridAcelero.Cells[6,I];
      FormConciliacaoFipeModelo.lblFornecedor.Caption := 'ALD';

      FormConciliacaoFipeModelo.ShowModal;
     End;

      // Carrega cod_fipe da conciliação
     QBuscaMescla.SQL.Clear;
     QBuscaMescla.SQL.Add('select cod_fipe, VLR_FIPE, REF_FIPE from TBCONCFIPEMODELO where modelo=:mod and fornecedor = ''ALD''');
     QBuscaMescla.SQL.Add('and ANO=:ano and REF_FIPE=:ref');
     QBuscaMescla.ParamByName('ano').Text := FormProcPlanAcelero.StringGridAcelero.Cells[6,I];
     QBuscaMescla.ParamByName('mod').Text := FormProcPlanAcelero.StringGridAcelero.Cells[2,I];
     QBuscaMescla.ParamByName('ref').Text := Principal;
     QBuscaMescla.Open;


     if not QBuscaMescla.IsEmpty then
     Begin
         //ShowMessage('Vai buscar venda 30d');
          cod_fipe := QBuscaMescla.FieldByName('cod_fipe').Text;

         // Carrega vendas dos ultimos 30 dias
         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select COUNT(*) as vnd from IMPORTASAVANNAVENDA30DIAS');
         QSavannaLocal.SQL.Add('where FIPE = :fipe and ano=:ANO');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := FormProcPlanAcelero.StringGridAcelero.Cells[6,I];
         QSavannaLocal.Open;

         //ShowMessage('Buscou venda 30d');

         Application.ProcessMessages;

         if not QSavannaLocal.FieldByName('vnd').IsNull then
         vendas30dias := QSavannaLocal.FieldByName('vnd').AsInteger
         Else
         vendas30dias := 0;

         // Carrega ultimo vlr de venda
         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select valor, data from IMPORTASAVANNAULTIMASVENDAS');
         QSavannaLocal.SQL.Add('where FIPE = :fipe and ano=:ano');
         QSavannaLocal.SQL.Add('order by data desc ');
         QSavannaLocal.SQL.Add('limit 1');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := FormProcPlanAcelero.StringGridAcelero.Cells[6,I];
         QSavannaLocal.Open;

       //ShowMessage('Buscou vlr venda');

         Application.ProcessMessages;

         if QSavannaLocal.FieldByName('valor').AsCurrency <> null then
         vl_ultima_venda := QSavannaLocal.FieldByName('valor').AsCurrency
         Else
         vl_ultima_venda := 0;

         if QSavannaLocal.FieldByName('data').AsDateTime <> null then
         DT_VENDA := QSavannaLocal.FieldByName('data').AsDateTime;

         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select sum(qtd) as  Estoque from IMPORTASAVANNAESTOQUE where FIPE = :fipe and ano=:ano');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := FormProcPlanAcelero.StringGridAcelero.Cells[6,I];
         QSavannaLocal.Open;

          Application.ProcessMessages;

         if not QSavannaLocal.FieldByName('Estoque').IsNull then
         EstoqueAtual := QSavannaLocal.FieldByName('Estoque').AsInteger
         Else
         EstoqueAtual := 0;

     End;

      // funcao de carga de categoria x avaria Neutron

     QBuscaAvaria.SQL.Clear;
     QBuscaAvaria.SQL.Add('select coalesce(avaria,0) as avaria, coalesce(categoria,'' '') as cat  from TBPLANNEUTRON where fornecedor = ''ALD'' and placa=:pl');
     QBuscaAvaria.ParamByName('pl').Text := FormProcPlanAcelero.StringGridAcelero.Cells[4,I];
     QBuscaAvaria.Open;

      // Valida placa se ja importou
  QValidaPlacaJaImportada.SQL.Clear;
  QValidaPlacaJaImportada.SQL.Add('select count(*) as Existe from TBPROCPLANS where PLACA=:PLACA and FORNECEDOR=:FOR');
  QValidaPlacaJaImportada.ParamByName('PLACA').Text := FormProcPlanAcelero.StringGridAcelero.Cells[4,I];
  QValidaPlacaJaImportada.ParamByName('FOR').Text := 'ALD';
  QValidaPlacaJaImportada.Open;

  if QValidaPlacaJaImportada.FieldByName('Existe').AsInteger > 0 then
   Begin

     // Avarias
     QBuscaAvaria.SQL.Clear;
     QBuscaAvaria.SQL.Add('select coalesce(avaria,0) as avaria, coalesce(categoria,'' '') as cat  from TBPLANNEUTRON where fornecedor = ''ALD'' and placa=:pl');
     QBuscaAvaria.ParamByName('pl').Text := FormProcPlanAcelero.StringGridAcelero.Cells[4,I];
     QBuscaAvaria.Open;

        // Carrega cod_fipe da conciliação
     QBuscaMescla.SQL.Clear;
     QBuscaMescla.SQL.Add('select cod_fipe, VLR_FIPE, REF_FIPE from TBCONCFIPEMODELO where modelo=:mod and fornecedor = ''ALD''');
     QBuscaMescla.SQL.Add('and ANO=:ano and REF_FIPE=:ref');
     QBuscaMescla.ParamByName('ano').Text := FormProcPlanAcelero.StringGridAcelero.Cells[6,I];
     QBuscaMescla.ParamByName('mod').Text := FormProcPlanAcelero.StringGridAcelero.Cells[2,I];
     QBuscaMescla.ParamByName('ref').Text := Principal;
     QBuscaMescla.Open;

     if not QBuscaMescla.IsEmpty then
     Begin
         //ShowMessage('Vai buscar venda 30d');
          cod_fipe := QBuscaMescla.FieldByName('cod_fipe').Text;
         // Carrega vendas dos ultimos 30 dias
         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select COUNT(*) as vnd from IMPORTASAVANNAVENDA30DIAS');
         QSavannaLocal.SQL.Add('where FIPE = :fipe and ano=:ANO');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := FormProcPlanAcelero.StringGridAcelero.Cells[6,I];
         QSavannaLocal.Open;

         //ShowMessage('Buscou venda 30d');

         Application.ProcessMessages;

         if not QSavannaLocal.FieldByName('vnd').IsNull then
         vendas30dias := QSavannaLocal.FieldByName('vnd').AsInteger
         Else
         vendas30dias := 0;

         // Carrega ultimo vlr de venda
         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select valor, data from IMPORTASAVANNAULTIMASVENDAS');
         QSavannaLocal.SQL.Add('where FIPE = :fipe and ano=:ano');
         QSavannaLocal.SQL.Add('order by data desc ');
         QSavannaLocal.SQL.Add('limit 1');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := FormProcPlanAcelero.StringGridAcelero.Cells[6,I];
         QSavannaLocal.Open;

       //ShowMessage('Buscou vlr venda');

         Application.ProcessMessages;

         if QSavannaLocal.FieldByName('valor').AsCurrency <> null then
         vl_ultima_venda := QSavannaLocal.FieldByName('valor').AsCurrency
         Else
         vl_ultima_venda := 0;

         if QSavannaLocal.FieldByName('data').AsDateTime <> null then
         DT_VENDA := QSavannaLocal.FieldByName('data').AsDateTime;

         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select sum(qtd) as  Estoque from IMPORTASAVANNAESTOQUE where FIPE = :fipe and ano=:ano');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := FormProcPlanAcelero.StringGridAcelero.Cells[6,I];
         QSavannaLocal.Open;

          Application.ProcessMessages;

         if not QSavannaLocal.FieldByName('Estoque').IsNull then
         EstoqueAtual := QSavannaLocal.FieldByName('Estoque').AsInteger
         Else
         EstoqueAtual := 0;

     End;


     if Ref2 <> ' ' then
     Begin

       DataModuleConexao.qBuscaFipesRef.SQL.Clear;
       DataModuleConexao.qBuscaFipesRef.SQL.Add('select "'+'ANO'+FormProcPlanAcelero.StringGridAcelero.Cells[6,I]+'" as FIPE from TBFIPE where');
       DataModuleConexao.qBuscaFipesRef.SQL.Add(' "'+'ANO'+FormProcPlanAcelero.StringGridAcelero.Cells[6,I]+'" > 0 and cod_fipe = :codfipe and ref=:ref');
       DataModuleConexao.qBuscaFipesRef.ParamByName('codfipe').text := cod_fipe;
       DataModuleConexao.qBuscaFipesRef.ParamByName('ref').Text := Ref2;
       DataModuleConexao.qBuscaFipesRef.Open;

       ValorRef2 := DataModuleConexao.qBuscaFipesRef.FieldByName('FIPE').AsCurrency;

     End
     Else
     Begin
       ValorRef2 := 0;
     End;

     if Ref3 <> ' ' then
     Begin

       DataModuleConexao.qBuscaFipesRef.SQL.Clear;
       DataModuleConexao.qBuscaFipesRef.SQL.Add('select "'+'ANO'+FormProcPlanAcelero.StringGridAcelero.Cells[6,I]+'" as FIPE from TBFIPE where');
       DataModuleConexao.qBuscaFipesRef.SQL.Add(' "'+'ANO'+FormProcPlanAcelero.StringGridAcelero.Cells[6,I]+'" > 0 and cod_fipe = :codfipe and ref=:ref');
       DataModuleConexao.qBuscaFipesRef.ParamByName('codfipe').text := cod_fipe;
       DataModuleConexao.qBuscaFipesRef.ParamByName('ref').Text := Ref3;
       DataModuleConexao.qBuscaFipesRef.Open;

       ValorRef3 := DataModuleConexao.qBuscaFipesRef.FieldByName('FIPE').AsCurrency;

     End
     Else
     Begin
       ValorRef3 := 0;
     End;

     //*********************

     QAtualizaG.SQL.Clear;
     QAtualizaG.SQL.Add('select');
     QAtualizaG.SQL.Add('coalesce(G_ZERO , 0) as G_ZERO, DT_G0');
     QAtualizaG.SQL.Add('from tbprocplans');
     QAtualizaG.SQL.Add('where COD_FIPE = :c_fipe');
     QAtualizaG.SQL.Add('and ANO_MOD = :ano');
     QAtualizaG.SQL.Add('and G_ZERO > 0');
     QAtualizaG.SQL.Add('order by id desc');
     QAtualizaG.SQL.Add('limit 1');
     QAtualizaG.ParamByName('c_fipe').Text := cod_fipe;
     QAtualizaG.ParamByName('ano').Text := FormProcPlanAcelero.StringGridAcelero.Cells[6,I];
     QAtualizaG.Open;

     QValidaPlacaJaImportada.SQL.Clear;
     QValidaPlacaJaImportada.SQL.Add('update TBPROCPLANS set');
     QValidaPlacaJaImportada.SQL.Add('vlr_min=:vlr_min, vlr_min_fipe=:MIN_FIPE,');
     QValidaPlacaJaImportada.SQL.Add('km=:km,');
     QValidaPlacaJaImportada.SQL.Add('venda_trinta_dias=:venda_trinta_dias,');
     QValidaPlacaJaImportada.SQL.Add('estoque=:estoque,');
     QValidaPlacaJaImportada.SQL.Add('vlr_ult_venda=:vlr_ult_venda,');
     QValidaPlacaJaImportada.SQL.Add('dt_ult_venda=:dt_ult_venda,');
     QValidaPlacaJaImportada.SQL.Add('categoria=:cat,');
     QValidaPlacaJaImportada.SQL.Add('avaria=:avaria,');
     QValidaPlacaJaImportada.SQL.Add('DATA=:dt,');
     QValidaPlacaJaImportada.SQL.Add('onde=:onde,');
     QValidaPlacaJaImportada.SQL.Add('local=:local,');
	   QValidaPlacaJaImportada.SQL.Add('ULT_G0=:UG0,');
     QValidaPlacaJaImportada.SQL.Add('DT_G0=:DTG0,');
     QValidaPlacaJaImportada.SQL.Add('FIPE2 = :vlfipe2,');
     QValidaPlacaJaImportada.SQL.Add('FIPE3 = :vlfipe3,');
     QValidaPlacaJaImportada.SQL.Add('REF_FIPE2=:ref2,');
     QValidaPlacaJaImportada.SQL.Add('REF_FIPE3=:ref3,');
     QValidaPlacaJaImportada.SQL.Add('REF_FIPE=:ref,');
     QValidaPlacaJaImportada.SQL.Add('vlr_fipe=:fipe, IMPORT_PLANILHA=:PLAN, IMPORT_DATA=:DT where PLACA=:PLACA');
     QValidaPlacaJaImportada.ParamByName('PLAN').Text := LblNomeArquivo.Caption;
     QValidaPlacaJaImportada.ParamByName('DT').AsDate := NOW;
     QValidaPlacaJaImportada.ParamByName('placa').Text := FormProcPlanAcelero.StringGridAcelero.Cells[4,I];
     QValidaPlacaJaImportada.ParamByName('km').AsCurrency := StrToCurr(FormProcPlanAcelero.StringGridAcelero.Cells[11,I]);
     QValidaPlacaJaImportada.ParamByName('dt_ult_venda').AsDate := DT_VENDA;
     QValidaPlacaJaImportada.ParamByName('vlr_min').AsCurrency := StrToCurr(FormProcPlanAcelero.StringGridAcelero.Cells[24,I]);
     QValidaPlacaJaImportada.ParamByName('MIN_FIPE').AsCurrency := QBuscaMescla.FieldByName('VLR_FIPE').AsCurrency - StrToCurr(FormProcPlanAcelero.StringGridAcelero.Cells[24,I]);
     QValidaPlacaJaImportada.ParamByName('fipe').AsCurrency := QBuscaMescla.FieldByName('VLR_FIPE').AsCurrency;
     QValidaPlacaJaImportada.ParamByName('vlfipe2').AsCurrency := ValorRef2;
     QValidaPlacaJaImportada.ParamByName('vlfipe3').AsCurrency := ValorRef3;
     QValidaPlacaJaImportada.ParamByName('ref2').Text := Ref2;
     QValidaPlacaJaImportada.ParamByName('ref3').Text := Ref3;
     QValidaPlacaJaImportada.ParamByName('ref').Text := Principal;
     QValidaPlacaJaImportada.ParamByName('venda_trinta_dias').AsInteger := vendas30dias;
     QValidaPlacaJaImportada.ParamByName('estoque').AsInteger := EstoqueAtual;
     QValidaPlacaJaImportada.ParamByName('vlr_ult_venda').AsCurrency := vl_ultima_venda;
     QValidaPlacaJaImportada.ParamByName('dt').AsDate := NOW;
     QValidaPlacaJaImportada.ParamByName('onde').Text :=  FormProcPlanAcelero.StringGridAcelero.Cells[28,I];
     QValidaPlacaJaImportada.ParamByName('local').Text := FormProcPlanAcelero.StringGridAcelero.Cells[28,I];
     QValidaPlacaJaImportada.ParamByName('cat').Text := QBuscaAvaria.FieldByName('cat').Text;
     if QBuscaAvaria.FieldByName('avaria').AsCurrency > 0 then
     QValidaPlacaJaImportada.ParamByName('avaria').AsCurrency := QBuscaAvaria.FieldByName('avaria').AsCurrency
     Else
     QValidaPlacaJaImportada.ParamByName('avaria').AsCurrency := 0;

    if QAtualizaG.FieldByName('G_ZERO').AsFloat > 0 then
     QValidaPlacaJaImportada.ParamByName('UG0').AsFloat := QAtualizaG.FieldByName('G_ZERO').AsFloat
     Else
     QValidaPlacaJaImportada.ParamByName('UG0').AsFloat := 0;
     if QAtualizaG.FieldByName('DT_G0').AsDateTime <> null then
     QValidaPlacaJaImportada.ParamByName('DTG0').AsDate := QAtualizaG.FieldByName('DT_G0').AsDateTime
     Else
     QValidaPlacaJaImportada.ParamByName('DTG0').AsDate := null;
     QValidaPlacaJaImportada.Execute;

     FormLoading.LabelStatus.Caption := 'Atualizando ALD PLACA: '+FormProcPlanAcelero.StringGridAcelero.Cells[4,I];
     Application.ProcessMessages;
   End
   Else
   Begin

     if Ref2 <> ' ' then
     Begin

       DataModuleConexao.qBuscaFipesRef.SQL.Clear;
       DataModuleConexao.qBuscaFipesRef.SQL.Add('select "'+'ANO'+FormProcPlanAcelero.StringGridAcelero.Cells[6,I]+'" as FIPE from TBFIPE where');
       DataModuleConexao.qBuscaFipesRef.SQL.Add(' "'+'ANO'+FormProcPlanAcelero.StringGridAcelero.Cells[6,I]+'" > 0 and cod_fipe = :codfipe and ref=:ref');
       DataModuleConexao.qBuscaFipesRef.ParamByName('codfipe').text := cod_fipe;
       DataModuleConexao.qBuscaFipesRef.ParamByName('ref').Text := Ref2;
       DataModuleConexao.qBuscaFipesRef.Open;

       ValorRef2 := DataModuleConexao.qBuscaFipesRef.FieldByName('FIPE').AsCurrency;

     End
     Else
     Begin
       ValorRef2 := 0;
     End;

     if Ref3 <> ' ' then
     Begin

       DataModuleConexao.qBuscaFipesRef.SQL.Clear;
       DataModuleConexao.qBuscaFipesRef.SQL.Add('select "'+'ANO'+FormProcPlanAcelero.StringGridAcelero.Cells[6,I]+'" as FIPE from TBFIPE where');
       DataModuleConexao.qBuscaFipesRef.SQL.Add(' "'+'ANO'+FormProcPlanAcelero.StringGridAcelero.Cells[6,I]+'" > 0 and cod_fipe = :codfipe and ref=:ref');
       DataModuleConexao.qBuscaFipesRef.ParamByName('codfipe').text := cod_fipe;
       DataModuleConexao.qBuscaFipesRef.ParamByName('ref').Text := Ref3;
       DataModuleConexao.qBuscaFipesRef.Open;

       ValorRef3 := DataModuleConexao.qBuscaFipesRef.FieldByName('FIPE').AsCurrency;

     End
     Else
     Begin
       ValorRef3 := 0;
     End;

     QAtualizaG.SQL.Clear;
     QAtualizaG.SQL.Add('select');
     QAtualizaG.SQL.Add('coalesce(G_ZERO , 0) as G_ZERO, DT_G0');
     QAtualizaG.SQL.Add('from tbprocplans');
     QAtualizaG.SQL.Add('where COD_FIPE = :c_fipe');
     QAtualizaG.SQL.Add('and ANO_MOD = :ano');
     QAtualizaG.SQL.Add('and G_ZERO > 0');
     QAtualizaG.SQL.Add('order by id desc');
     QAtualizaG.SQL.Add('limit 1');
     QAtualizaG.ParamByName('c_fipe').Text := cod_fipe;
     QAtualizaG.ParamByName('ano').Text := FormProcPlanAcelero.StringGridAcelero.Cells[6,I];
     QAtualizaG.Open;


   QInsereDados.SQL.Clear;
   QInsereDados.SQL.Add('insert into TBPROCPLANS');
   QInsereDados.SQL.Add('( licitacao, lote, placa, modelo, km, ano, ano_mod, cor, vlr_min,');
   QInsereDados.SQL.Add('  vlr_min_fipe, vlr_min_dois, compra_ja, vlr_fipe, ref_fipe, fipe2, fipe3, vlr_merc_um, vlr_merc_dois,');
   QInsereDados.SQL.Add('  venda_trinta_dias, estoque, vlr_ult_venda, dt_ult_venda, atacado_varejo, categoria, g_zero,');
   QInsereDados.SQL.Add(' mg, avaria, resultado, min_resultado, lance, lance_fipe, compra, sn,');
   QInsereDados.SQL.Add('  dt_pgto, qtd, fornecedor, id_plan_for, cod_fipe, situacao, data, onde, local, ULT_G0, DT_G0, IMPORT_PLANILHA, IMPORT_DATA, IMPORT_STATUS, REF_FIPE2, REF_FIPE3)');
   QInsereDados.SQL.Add('values');
   QInsereDados.SQL.Add('(:licitacao, :lote, :placa, :modelo, :km, :ano, :anomod, :cor, :vlr_min,');
   QInsereDados.SQL.Add(':vlr_min_fipe, :vlr_min_dois, :compra_ja, :fipe, :ref, :vlfipe2, :vlfipe3, :vlr_m_um, :vlr_m_dois,');
   QInsereDados.SQL.Add(':venda_trinta_dias, :estoque, :vlr_ult_venda, :dt_venda, :ata_var, :cat, :gzero,');
   QInsereDados.SQL.Add(':mg, :avaria, :result, :min_result, :lance, :lance_fipe, :compra, :sn, :dt_pgto,');
   QInsereDados.SQL.Add(':qtd, :fornecedor, :id_plan, :c_fipe, :sit, :dt, :onde, :local, :UG0, :DTG0, :PLANILHA, :DT_PLANILHA, :STATUS_PLANILHA, :ref2 , :ref3)');
   QInsereDados.ParamByName('PLANILHA').Text := LblNomeArquivo.Caption;
   QInsereDados.ParamByName('DT_PLANILHA').AsDate := NOW;
   QInsereDados.ParamByName('STATUS_PLANILHA').Text := 'Em Analise';
   QInsereDados.ParamByName('licitacao').Text := '';
   QInsereDados.ParamByName('lote').Text := '';
   QInsereDados.ParamByName('placa').Text := FormProcPlanAcelero.StringGridAcelero.Cells[4,I];
   QInsereDados.ParamByName('modelo').Text := FormProcPlanAcelero.StringGridAcelero.Cells[2,I];
   QInsereDados.ParamByName('km').AsCurrency := StrToCurr(FormProcPlanAcelero.StringGridAcelero.Cells[11,I]);
   QInsereDados.ParamByName('ano').Text := FormProcPlanAcelero.StringGridAcelero.Cells[6,I];
   QInsereDados.ParamByName('dt_venda').AsDate := DT_VENDA;
   QInsereDados.ParamByName('anomod').Text := FormProcPlanAcelero.StringGridAcelero.Cells[6,I];
   QInsereDados.ParamByName('cor').Text := FormProcPlanAcelero.StringGridAcelero.Cells[18,I];
   QInsereDados.ParamByName('vlr_min').AsCurrency := StrToCurr(FormProcPlanAcelero.StringGridAcelero.Cells[24,I]);
   QInsereDados.ParamByName('vlr_min_fipe').AsCurrency := QBuscaMescla.FieldByName('VLR_FIPE').AsCurrency -  StrToCurr(FormProcPlanAcelero.StringGridAcelero.Cells[24,I]);
   QInsereDados.ParamByName('vlr_min_dois').AsCurrency := 0;
   QInsereDados.ParamByName('compra_ja').AsCurrency := 0;
   QInsereDados.ParamByName('fipe').AsCurrency := QBuscaMescla.FieldByName('VLR_FIPE').AsCurrency;
   QInsereDados.ParamByName('vlfipe2').AsCurrency := ValorRef2;
   QInsereDados.ParamByName('vlfipe3').AsCurrency := ValorRef3;
   QInsereDados.ParamByName('ref2').Text := Ref2;
   QInsereDados.ParamByName('ref3').Text := Ref3;
   QInsereDados.ParamByName('ref').Text := Principal;
   QInsereDados.ParamByName('vlr_m_um').AsCurrency := 0;
   QInsereDados.ParamByName('vlr_m_dois').AsCurrency := 0;
   QInsereDados.ParamByName('venda_trinta_dias').AsInteger := vendas30dias;
   QInsereDados.ParamByName('estoque').AsInteger := EstoqueAtual;
   QInsereDados.ParamByName('vlr_ult_venda').AsCurrency := vl_ultima_venda;
   QInsereDados.ParamByName('ata_var').Text := '';
   QInsereDados.ParamByName('gzero').AsCurrency := 0;
   QInsereDados.ParamByName('mg').AsCurrency :=  Margem;;
   QInsereDados.ParamByName('c_fipe').Text := cod_fipe;
   QInsereDados.ParamByName('sit').AsInteger := 0;
   QInsereDados.ParamByName('dt').AsDate := NOW;
   QInsereDados.ParamByName('onde').Text :=  FormProcPlanAcelero.StringGridAcelero.Cells[28,I];
   QInsereDados.ParamByName('local').Text := FormProcPlanAcelero.StringGridAcelero.Cells[28,I];
   QInsereDados.ParamByName('fornecedor').Text := 'ALD';
   QInsereDados.ParamByName('cat').Text := QBuscaAvaria.FieldByName('cat').Text;
   if QBuscaAvaria.FieldByName('avaria').AsCurrency > 0 then
   QInsereDados.ParamByName('avaria').AsCurrency := QBuscaAvaria.FieldByName('avaria').AsCurrency
   Else
   QInsereDados.ParamByName('avaria').AsCurrency := 0;
     if QAtualizaG.FieldByName('G_ZERO').AsFloat > 0 then
     QInsereDados.ParamByName('UG0').AsFloat := QAtualizaG.FieldByName('G_ZERO').AsFloat
     Else
     QInsereDados.ParamByName('UG0').AsFloat := 0;
     if QAtualizaG.FieldByName('DT_G0').AsDateTime <> null then
     QInsereDados.ParamByName('DTG0').AsDate := QAtualizaG.FieldByName('DT_G0').AsDateTime
     Else
     QInsereDados.ParamByName('DTG0').AsDate := null;
   QInsereDados.Execute;

    FormLoading.LabelStatus.Caption := 'Importando planilha ALD PLACA: '+FormProcPlanAcelero.StringGridAcelero.Cells[4,I];

    Application.ProcessMessages;
   End;

  End;
 Finally

 End;
  MessageDlg('Importação finalizada', mtInformation, [mbok], 0);
end;

procedure TFormNovoProcessamento.ImportaPlanALDprecoFixo;
Var
  I, Qtd, vendas30dias, EstoqueAtual: integer;
  modelo, cod_fipe : string;
  vl_ultima_venda : Currency;
  DT_VENDA : TDate;
 Begin

   vendas30dias := 0;
   EstoqueAtual := 0;
   vl_ultima_venda := 0;

 Try
  for I := 0 to Pred(FormProcPlanAcelero.StringGridAcelero.RowCount) do
  Begin

  if I = 0 then
  Continue;

  if Trim(FormProcPlanAcelero.StringGridAcelero.Cells[0,I]) = '' then
  Continue;

    // Verifica modelo na conciliação de mod x fipe
    QConcFIPE.SQL.Clear;
    QConcFIPE.SQL.Add('select count(vlr_fipe) as existe from TBCONCFIPEMODELO where modelo = :mod AND ANO=:ANO and fornecedor = ''ALD''');
    QConcFIPE.ParamByName('mod').Text := FormProcPlanAcelero.StringGridAcelero.Cells[1,I]+' '+FormProcPlanAcelero.StringGridAcelero.Cells[2,I];
    QConcFIPE.ParamByName('ANO').Text := FormProcPlanAcelero.StringGridAcelero.Cells[3,I];
    QConcFIPE.Open;

     if QConcFIPE.FieldByName('existe').AsInteger = 0 then
     Begin
      MessageDlg('Não foi encontrada vinculação de FIPE para o modelo, efetue-a.'+#13+
               'Modelo: '+FormProcPlanAcelero.StringGridAcelero.Cells[1,I]+' '+FormProcPlanAcelero.StringGridAcelero.Cells[2,I], mtWarning, [mbok], 0);

      FormConciliacaoFipeModelo.EditModeloFIPE.Text := Copy(FormProcPlanAcelero.StringGridAcelero.Cells[1,I]+' '+FormProcPlanAcelero.StringGridAcelero.Cells[2,I], 0, 10);
      FormConciliacaoFipeModelo.Position := poScreenCenter;
      FormConciliacaoFipeModelo.lblModeloPlan.Caption := FormProcPlanAcelero.StringGridAcelero.Cells[1,I]+' '+FormProcPlanAcelero.StringGridAcelero.Cells[2,I];
      FormConciliacaoFipeModelo.EditAnoFIPE.Text := FormProcPlanAcelero.StringGridAcelero.Cells[3,I];
      FormConciliacaoFipeModelo.lblFornecedor.Caption := 'ALD';

      FormConciliacaoFipeModelo.ShowModal;
     End;

      // Carrega cod_fipe da conciliação
     QBuscaMescla.SQL.Clear;
     QBuscaMescla.SQL.Add('select cod_fipe, VLR_FIPE from TBCONCFIPEMODELO where modelo=:mod and fornecedor = ''ALD''');
     QBuscaMescla.SQL.Add('and ANO=:ano');
     QBuscaMescla.ParamByName('ano').Text := FormProcPlanAcelero.StringGridAcelero.Cells[3,I];
     QBuscaMescla.ParamByName('mod').Text := FormProcPlanAcelero.StringGridAcelero.Cells[1,I]+' '+FormProcPlanAcelero.StringGridAcelero.Cells[2,I];
     QBuscaMescla.Open;


     if not QBuscaMescla.IsEmpty then
     Begin
         //ShowMessage('Vai buscar venda 30d');
          cod_fipe := QBuscaMescla.FieldByName('cod_fipe').Text;

         // Carrega vendas dos ultimos 30 dias
         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select COUNT(*) as vnd from IMPORTASAVANNAVENDA30DIAS');
         QSavannaLocal.SQL.Add('where FIPE = :fipe and ano=:ANO');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := FormProcPlanAcelero.StringGridAcelero.Cells[3,I];
         QSavannaLocal.Open;

         //ShowMessage('Buscou venda 30d');

         Application.ProcessMessages;

         if not QSavannaLocal.FieldByName('vnd').IsNull then
         vendas30dias := QSavannaLocal.FieldByName('vnd').AsInteger
         Else
         vendas30dias := 0;

         // Carrega ultimo vlr de venda
         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select valor, data from IMPORTASAVANNAULTIMASVENDAS');
         QSavannaLocal.SQL.Add('where FIPE = :fipe and ano=:ano');
         QSavannaLocal.SQL.Add('order by data desc ');
         QSavannaLocal.SQL.Add('limit 1');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := FormProcPlanAcelero.StringGridAcelero.Cells[3,I];
         QSavannaLocal.Open;

       //ShowMessage('Buscou vlr venda');

         Application.ProcessMessages;

         if QSavannaLocal.FieldByName('valor').AsCurrency <> null then
         vl_ultima_venda := QSavannaLocal.FieldByName('valor').AsCurrency
         Else
         vl_ultima_venda := 0;

         if QSavannaLocal.FieldByName('data').AsDateTime <> null then
         DT_VENDA := QSavannaLocal.FieldByName('data').AsDateTime;

         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select sum(qtd) as  Estoque from IMPORTASAVANNAESTOQUE where FIPE = :fipe and ano=:ano');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := FormProcPlanAcelero.StringGridAcelero.Cells[3,I];
         QSavannaLocal.Open;

          Application.ProcessMessages;

         if not QSavannaLocal.FieldByName('Estoque').IsNull then
         EstoqueAtual := QSavannaLocal.FieldByName('Estoque').AsInteger
         Else
         EstoqueAtual := 0;

     End;

      // funcao de carga de categoria x avaria Neutron

     QBuscaAvaria.SQL.Clear;
     QBuscaAvaria.SQL.Add('select coalesce(avaria,0) as avaria, coalesce(categoria,'' '') as cat  from TBPLANNEUTRON where fornecedor = ''ALD'' and placa=:pl');
     QBuscaAvaria.ParamByName('pl').Text := FormProcPlanAcelero.StringGridAcelero.Cells[0,I];
     QBuscaAvaria.Open;

      // Valida placa se ja importou
  QValidaPlacaJaImportada.SQL.Clear;
  QValidaPlacaJaImportada.SQL.Add('select count(*) as Existe from TBPROCPLANS where PLACA=:PLACA and FORNECEDOR=:FOR');
  QValidaPlacaJaImportada.ParamByName('PLACA').Text := FormProcPlanAcelero.StringGridAcelero.Cells[0,I];
  QValidaPlacaJaImportada.ParamByName('FOR').Text := 'ALD';
  QValidaPlacaJaImportada.Open;

  if QValidaPlacaJaImportada.FieldByName('Existe').AsInteger > 0 then
   Begin

     // Avarias
     QBuscaAvaria.SQL.Clear;
     QBuscaAvaria.SQL.Add('select coalesce(avaria,0) as avaria, coalesce(categoria,'' '') as cat  from TBPLANNEUTRON where fornecedor = ''ALD'' and placa=:pl');
     QBuscaAvaria.ParamByName('pl').Text := FormProcPlanAcelero.StringGridAcelero.Cells[0,I];
     QBuscaAvaria.Open;

        // Carrega cod_fipe da conciliação
     QBuscaMescla.SQL.Clear;
     QBuscaMescla.SQL.Add('select cod_fipe, VLR_FIPE from TBCONCFIPEMODELO where modelo=:mod and fornecedor = ''ALD''');
     QBuscaMescla.SQL.Add('and ANO=:ano');
     QBuscaMescla.ParamByName('ano').Text := FormProcPlanAcelero.StringGridAcelero.Cells[3,I];
     QBuscaMescla.ParamByName('mod').Text := FormProcPlanAcelero.StringGridAcelero.Cells[1,I]+' '+FormProcPlanAcelero.StringGridAcelero.Cells[2,I];
     QBuscaMescla.Open;

     if not QBuscaMescla.IsEmpty then
     Begin
         //ShowMessage('Vai buscar venda 30d');
          cod_fipe := QBuscaMescla.FieldByName('cod_fipe').Text;
         // Carrega vendas dos ultimos 30 dias
         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select COUNT(*) as vnd from IMPORTASAVANNAVENDA30DIAS');
         QSavannaLocal.SQL.Add('where FIPE = :fipe and ano=:ANO');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := FormProcPlanAcelero.StringGridAcelero.Cells[3,I];
         QSavannaLocal.Open;

         //ShowMessage('Buscou venda 30d');

         Application.ProcessMessages;

         if not QSavannaLocal.FieldByName('vnd').IsNull then
         vendas30dias := QSavannaLocal.FieldByName('vnd').AsInteger
         Else
         vendas30dias := 0;

         // Carrega ultimo vlr de venda
         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select valor, data from IMPORTASAVANNAULTIMASVENDAS');
         QSavannaLocal.SQL.Add('where FIPE = :fipe and ano=:ano');
         QSavannaLocal.SQL.Add('order by data desc ');
         QSavannaLocal.SQL.Add('limit 1');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := FormProcPlanAcelero.StringGridAcelero.Cells[3,I];
         QSavannaLocal.Open;

       //ShowMessage('Buscou vlr venda');

         Application.ProcessMessages;

         if QSavannaLocal.FieldByName('valor').AsCurrency <> null then
         vl_ultima_venda := QSavannaLocal.FieldByName('valor').AsCurrency
         Else
         vl_ultima_venda := 0;

         if QSavannaLocal.FieldByName('data').AsDateTime <> null then
         DT_VENDA := QSavannaLocal.FieldByName('data').AsDateTime;

         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select sum(qtd) as  Estoque from IMPORTASAVANNAESTOQUE where FIPE = :fipe and ano=:ano');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := FormProcPlanAcelero.StringGridAcelero.Cells[3,I];
         QSavannaLocal.Open;

          Application.ProcessMessages;

         if not QSavannaLocal.FieldByName('Estoque').IsNull then
         EstoqueAtual := QSavannaLocal.FieldByName('Estoque').AsInteger
         Else
         EstoqueAtual := 0;

     End;

     QAtualizaG.SQL.Clear;
     QAtualizaG.SQL.Add('select');
     QAtualizaG.SQL.Add('min(G_ZERO) as G_ZERO, DT_G0');
     QAtualizaG.SQL.Add('from TBPROCPLANS');
     QAtualizaG.SQL.Add('where');
     QAtualizaG.SQL.Add('G_ZERO > 0');
     QAtualizaG.SQL.Add('and');
     QAtualizaG.SQL.Add('COD_FIPE = :c_fipe and ANO_MOD = :ano');
     QAtualizaG.SQL.Add('order by DT_G0 desc limit 1');
     QAtualizaG.ParamByName('c_fipe').Text := cod_fipe;
     QAtualizaG.ParamByName('ano').Text := FormProcPlanAcelero.StringGridAcelero.Cells[3,I];
     QAtualizaG.Open;


     QValidaPlacaJaImportada.SQL.Clear;
     QValidaPlacaJaImportada.SQL.Add('update TBPROCPLANS set');
     QValidaPlacaJaImportada.SQL.Add('vlr_min=:vlr_min,');
     QValidaPlacaJaImportada.SQL.Add('km=:km,');
     QValidaPlacaJaImportada.SQL.Add('venda_trinta_dias=:venda_trinta_dias,');
     QValidaPlacaJaImportada.SQL.Add('estoque=:estoque,');
     QValidaPlacaJaImportada.SQL.Add('vlr_ult_venda=:vlr_ult_venda,');
     QValidaPlacaJaImportada.SQL.Add('dt_ult_venda=:dt_ult_venda,');
     QValidaPlacaJaImportada.SQL.Add('categoria=:cat,');
     QValidaPlacaJaImportada.SQL.Add('avaria=:avaria,');
     QValidaPlacaJaImportada.SQL.Add('DATA=:dt,');
     QValidaPlacaJaImportada.SQL.Add('onde=:onde,');
     QValidaPlacaJaImportada.SQL.Add('local=:local,');
	   QValidaPlacaJaImportada.SQL.Add('ULT_G0=:UG0,');
     QValidaPlacaJaImportada.SQL.Add('DT_G0=:DTG0,');
     QValidaPlacaJaImportada.SQL.Add('vlr_fipe=:fipe, IMPORT_PLANILHA=:PLAN, IMPORT_DATA=:DT where PLACA=:PLACA');
     QValidaPlacaJaImportada.ParamByName('PLAN').Text := LblNomeArquivo.Caption;
     QValidaPlacaJaImportada.ParamByName('DT').AsDate := NOW;
     QValidaPlacaJaImportada.ParamByName('placa').Text := FormProcPlanAcelero.StringGridAcelero.Cells[0,I];
     QValidaPlacaJaImportada.ParamByName('km').AsCurrency := StrToCurr(FormProcPlanAcelero.StringGridAcelero.Cells[4,I]);
     QValidaPlacaJaImportada.ParamByName('dt_ult_venda').AsDate := DT_VENDA;
     QValidaPlacaJaImportada.ParamByName('vlr_min').AsCurrency := StrToCurr(FormProcPlanAcelero.StringGridAcelero.Cells[6,I]);
     QValidaPlacaJaImportada.ParamByName('fipe').AsCurrency := QBuscaMescla.FieldByName('VLR_FIPE').AsCurrency;
     QValidaPlacaJaImportada.ParamByName('venda_trinta_dias').AsInteger := vendas30dias;
     QValidaPlacaJaImportada.ParamByName('estoque').AsInteger := EstoqueAtual;
     QValidaPlacaJaImportada.ParamByName('vlr_ult_venda').AsCurrency := vl_ultima_venda;
     QValidaPlacaJaImportada.ParamByName('dt').AsDate := NOW;
     QValidaPlacaJaImportada.ParamByName('onde').Text :=  '';
     QValidaPlacaJaImportada.ParamByName('local').Text := '';
     QValidaPlacaJaImportada.ParamByName('cat').Text := QBuscaAvaria.FieldByName('cat').Text;
     if QBuscaAvaria.FieldByName('avaria').AsCurrency > 0 then
     QValidaPlacaJaImportada.ParamByName('avaria').AsCurrency := QBuscaAvaria.FieldByName('avaria').AsCurrency
     Else
     QValidaPlacaJaImportada.ParamByName('avaria').AsCurrency := 0;

    if QAtualizaG.FieldByName('G_ZERO').AsFloat > 0 then
     QValidaPlacaJaImportada.ParamByName('UG0').AsFloat := QAtualizaG.FieldByName('G_ZERO').AsFloat
     Else
     QValidaPlacaJaImportada.ParamByName('UG0').AsFloat := 0;
     if QAtualizaG.FieldByName('DT_G0').AsDateTime <> null then
     QValidaPlacaJaImportada.ParamByName('DTG0').AsDate := QAtualizaG.FieldByName('DT_G0').AsDateTime
     Else
     QValidaPlacaJaImportada.ParamByName('DTG0').AsDate := null;
     QValidaPlacaJaImportada.Execute;

     FormLoading.LabelStatus.Caption := 'Importando planilha ALD PREÇO FIXO PLACA: '+FormProcPlanAcelero.StringGridAcelero.Cells[0,I];
     Application.ProcessMessages;
   End
   Else
   Begin

     QAtualizaG.SQL.Clear;
     QAtualizaG.SQL.Add('select');
     QAtualizaG.SQL.Add('min(G_ZERO) as G_ZERO, DT_G0');
     QAtualizaG.SQL.Add('from TBPROCPLANS');
     QAtualizaG.SQL.Add('where');
     QAtualizaG.SQL.Add('G_ZERO > 0');
     QAtualizaG.SQL.Add('and');
     QAtualizaG.SQL.Add('COD_FIPE = :c_fipe and ANO_MOD = :ano');
     QAtualizaG.SQL.Add('order by DT_G0 desc limit 1');
     QAtualizaG.ParamByName('c_fipe').Text := cod_fipe;
     QAtualizaG.ParamByName('ano').Text := FormProcPlanAcelero.StringGridAcelero.Cells[3,I];
     QAtualizaG.Open;


   QInsereDados.SQL.Clear;
   QInsereDados.SQL.Add('insert into TBPROCPLANS');
   QInsereDados.SQL.Add('( licitacao, lote, placa, modelo, km, ano, ano_mod, cor, vlr_min,');
   QInsereDados.SQL.Add('  vlr_min_fipe, vlr_min_dois, compra_ja, vlr_fipe, vlr_merc_um, vlr_merc_dois,');
   QInsereDados.SQL.Add('  venda_trinta_dias, estoque, vlr_ult_venda, dt_ult_venda, atacado_varejo, categoria, g_zero,');
   QInsereDados.SQL.Add(' mg, avaria, resultado, min_resultado, lance, lance_fipe, compra, sn,');
   QInsereDados.SQL.Add('  dt_pgto, qtd, fornecedor, id_plan_for, cod_fipe, situacao, data, onde, local, ULT_G0, DT_G0, IMPORT_PLANILHA, IMPORT_DATA, IMPORT_STATUS)');
   QInsereDados.SQL.Add('values');
   QInsereDados.SQL.Add('(:licitacao, :lote, :placa, :modelo, :km, :ano, :anomod, :cor, :vlr_min,');
   QInsereDados.SQL.Add(':vlr_min_fipe, :vlr_min_dois, :compra_ja, :fipe, :vlr_m_um, :vlr_m_dois,');
   QInsereDados.SQL.Add(':venda_trinta_dias, :estoque, :vlr_ult_venda, :dt_venda, :ata_var, :cat, :gzero,');
   QInsereDados.SQL.Add(':mg, :avaria, :result, :min_result, :lance, :lance_fipe, :compra, :sn, :dt_pgto,');
   QInsereDados.SQL.Add(':qtd, :fornecedor, :id_plan, :c_fipe, :sit, :dt, :onde, :local, :UG0, :DTG0, :PLANILHA, :DT_PLANILHA, :STATUS_PLANILHA)');
   QInsereDados.ParamByName('PLANILHA').Text := LblNomeArquivo.Caption;
   QInsereDados.ParamByName('DT_PLANILHA').AsDate := NOW;
   QInsereDados.ParamByName('STATUS_PLANILHA').Text := 'Em Analise';
   QInsereDados.ParamByName('licitacao').Text := '';
   QInsereDados.ParamByName('lote').Text := '';
   QInsereDados.ParamByName('placa').Text := FormProcPlanAcelero.StringGridAcelero.Cells[0,I];
   QInsereDados.ParamByName('modelo').Text := FormProcPlanAcelero.StringGridAcelero.Cells[1,I]+' '+FormProcPlanAcelero.StringGridAcelero.Cells[2,I];
   QInsereDados.ParamByName('km').AsCurrency := StrToCurr(FormProcPlanAcelero.StringGridAcelero.Cells[4,I]);
   QInsereDados.ParamByName('ano').Text := FormProcPlanAcelero.StringGridAcelero.Cells[3,I];
   QInsereDados.ParamByName('dt_venda').AsDate := DT_VENDA;
   QInsereDados.ParamByName('anomod').Text := FormProcPlanAcelero.StringGridAcelero.Cells[3,I];
   QInsereDados.ParamByName('cor').Text := FormProcPlanAcelero.StringGridAcelero.Cells[5,I];
   QInsereDados.ParamByName('vlr_min').AsCurrency := StrToCurr(FormProcPlanAcelero.StringGridAcelero.Cells[6,I]);
   QInsereDados.ParamByName('vlr_min_fipe').AsCurrency := QBuscaMescla.FieldByName('VLR_FIPE').AsCurrency -  StrToCurr(FormProcPlanAcelero.StringGridAcelero.Cells[6,I]);
   QInsereDados.ParamByName('vlr_min_dois').AsCurrency := 0;
   QInsereDados.ParamByName('compra_ja').AsCurrency := 0;
   QInsereDados.ParamByName('fipe').AsCurrency := QBuscaMescla.FieldByName('VLR_FIPE').AsCurrency;
   QInsereDados.ParamByName('vlr_m_um').AsCurrency := 0;
   QInsereDados.ParamByName('vlr_m_dois').AsCurrency := 0;
   QInsereDados.ParamByName('venda_trinta_dias').AsInteger := vendas30dias;
   QInsereDados.ParamByName('estoque').AsInteger := EstoqueAtual;
   QInsereDados.ParamByName('vlr_ult_venda').AsCurrency := vl_ultima_venda;
   QInsereDados.ParamByName('ata_var').Text := '';
   QInsereDados.ParamByName('gzero').AsCurrency := 0;
   QInsereDados.ParamByName('mg').AsCurrency :=  Margem;;
   QInsereDados.ParamByName('c_fipe').Text := cod_fipe;
   QInsereDados.ParamByName('sit').AsInteger := 0;
   QInsereDados.ParamByName('dt').AsDate := NOW;
   QInsereDados.ParamByName('onde').Text :=  '';
   QInsereDados.ParamByName('local').Text := '';
   QInsereDados.ParamByName('fornecedor').Text := 'ALD';
   QInsereDados.ParamByName('cat').Text := QBuscaAvaria.FieldByName('cat').Text;
   if QBuscaAvaria.FieldByName('avaria').AsCurrency > 0 then
   QInsereDados.ParamByName('avaria').AsCurrency := QBuscaAvaria.FieldByName('avaria').AsCurrency
   Else
   QInsereDados.ParamByName('avaria').AsCurrency := 0;
     if QAtualizaG.FieldByName('G_ZERO').AsFloat > 0 then
     QInsereDados.ParamByName('UG0').AsFloat := QAtualizaG.FieldByName('G_ZERO').AsFloat
     Else
     QInsereDados.ParamByName('UG0').AsFloat := 0;
     if QAtualizaG.FieldByName('DT_G0').AsDateTime <> null then
     QInsereDados.ParamByName('DTG0').AsDate := QAtualizaG.FieldByName('DT_G0').AsDateTime
     Else
     QInsereDados.ParamByName('DTG0').AsDate := null;
   QInsereDados.Execute;

    FormLoading.LabelStatus.Caption := 'Importando planilha ALD PEÇO FIXO PLACA: '+FormProcPlanAcelero.StringGridAcelero.Cells[0,I];

    Application.ProcessMessages;
   End;

  End;
 Finally

 End;
  MessageDlg('Importação finalizada', mtInformation, [mbok], 0);
end;

procedure TFormNovoProcessamento.ImportaPlanARVAL;
Var
  I, Qtd, vendas30dias, EstoqueAtual, L : integer;
  Lote, Licitacao, modelo, cod_fipe : string;
  KM, vl_ultima_venda : Currency;
  DT_VENDA : TDate;
 Begin

 FormLotesArval.Close;

 Lote := FormLotesArval.Lote;  //FormProcPlanAcelero.StringGridAcelero.Cells[14,1];

 {L := Length(lote);

 Lote:= copy(Lote, L, L);}

 Licitacao := Copy(Lote, 11, 6);

   vendas30dias := 0;
   EstoqueAtual := 0;
   vl_ultima_venda := 0;

 Try
  for I := 3 to Pred(FormProcPlanAcelero.StringGridAcelero.RowCount) do
  Begin

  if I = 0 then
  Continue;

  if Trim(FormProcPlanAcelero.StringGridAcelero.Cells[0,I]) = '' then
  Continue;
   {
    ShowMessage('CARGO:'+FormProcPlanAcelero.StringGridAcelero.Cells[1,I]+#13+
                'PLACA:'+FormProcPlanAcelero.StringGridAcelero.Cells[2,I]+#13+
                'CUSTO:'+FormProcPlanAcelero.StringGridAcelero.Cells[3,I]+#13+
                'MODELO:'+FormProcPlanAcelero.StringGridAcelero.Cells[4,I]+#13+
                'CATEGORIA:'+FormProcPlanAcelero.StringGridAcelero.Cells[5,I]+#13+
                'KM:'+FormProcPlanAcelero.StringGridAcelero.Cells[7,I]+#13+
                'DT-EMPLA:'+FormProcPlanAcelero.StringGridAcelero.Cells[8,I]+#13+
                'ANO FAB:'+FormProcPlanAcelero.StringGridAcelero.Cells[10,I]+#13+
                'COR:'+FormProcPlanAcelero.StringGridAcelero.Cells[11,I]+#13+
                'ANO MOD:'+FormProcPlanAcelero.StringGridAcelero.Cells[13,I]+#13+
                'MARCA:'+FormProcPlanAcelero.StringGridAcelero.Cells[14,I]+#13+
                'GERACAO:'+FormProcPlanAcelero.StringGridAcelero.Cells[15,I]+#13);
     }
    // Verifica modelo na conciliação de mod x fipe

    DataModuleConexao.qBuscaRefFipe.SQL.Clear;
    DataModuleConexao.qBuscaRefFipe.SQL.Add('select ref1 , ref2, ref3, principal from tbfiperef');
    DataModuleConexao.qBuscaRefFipe.Open;

    Principal := DataModuleConexao.qBuscaRefFipe.FieldByName('principal').Text;
    Ref1      := DataModuleConexao.qBuscaRefFipe.FieldByName('ref1').Text;
    Ref2      := DataModuleConexao.qBuscaRefFipe.FieldByName('ref2').Text;
    Ref3      := DataModuleConexao.qBuscaRefFipe.FieldByName('ref3').Text;

    if ref1 <> Principal then
    Begin

      ref1 := DataModuleConexao.qBuscaRefFipe.FieldByName('principal').Text;
      Ref2 := DataModuleConexao.qBuscaRefFipe.FieldByName('ref1').Text;
      ref3 := DataModuleConexao.qBuscaRefFipe.FieldByName('ref2').Text;
    End;

    QConcFIPE.SQL.Clear;
    QConcFIPE.SQL.Add('select count(vlr_fipe) as existe from TBCONCFIPEMODELO where modelo = :mod AND ANO=:ANO and fornecedor = ''ARVAL''');
    QConcFIPE.SQL.Add('and ref_fipe=:ref');
    QConcFIPE.ParamByName('mod').Text := FormProcPlanAcelero.StringGridAcelero.Cells[4,I];
    QConcFIPE.ParamByName('ANO').Text := FormProcPlanAcelero.StringGridAcelero.Cells[12,I];
    QConcFIPE.ParamByName('ref').Text := Principal;
    QConcFIPE.Open;

     if QConcFIPE.FieldByName('existe').AsInteger = 0 then
     Begin
      MessageDlg('Não foi encontrada vinculação de FIPE para o modelo, efetue-a.'+#13+
               'Modelo: '+FormProcPlanAcelero.StringGridAcelero.Cells[4,I], mtWarning, [mbok], 0);

      FormConciliacaoFipeModelo.EditModeloFIPE.Text := Copy(FormProcPlanAcelero.StringGridAcelero.Cells[4,I], 0, 10);
      FormConciliacaoFipeModelo.Position := poScreenCenter;
      FormConciliacaoFipeModelo.lblModeloPlan.Caption := FormProcPlanAcelero.StringGridAcelero.Cells[4,I];
      FormConciliacaoFipeModelo.EditAnoFIPE.Text := FormProcPlanAcelero.StringGridAcelero.Cells[12,I];
      FormConciliacaoFipeModelo.lblFornecedor.Caption := 'ARVAL';

      FormConciliacaoFipeModelo.ShowModal;
     End;

      // Carrega cod_fipe da conciliação
     QBuscaMescla.SQL.Clear;
     QBuscaMescla.SQL.Add('select cod_fipe, VLR_FIPE from TBCONCFIPEMODELO where modelo=:mod and fornecedor = ''ARVAL''');
     QBuscaMescla.SQL.Add('and ANO=:ano');
     QBuscaMescla.SQL.Add('and ref_fipe=:ref');
     QBuscaMescla.ParamByName('mod').Text := FormProcPlanAcelero.StringGridAcelero.Cells[4,I];
     QBuscaMescla.ParamByName('ANO').Text := FormProcPlanAcelero.StringGridAcelero.Cells[12,I];
     QBuscaMescla.ParamByName('ref').Text := Principal;
     QBuscaMescla.Open;

     if not QBuscaMescla.IsEmpty then
     Begin
         //ShowMessage('Vai buscar venda 30d');
          cod_fipe := QBuscaMescla.FieldByName('cod_fipe').Text;
         // Carrega vendas dos ultimos 30 dias
         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select COUNT(*) as vnd from IMPORTASAVANNAVENDA30DIAS');
         QSavannaLocal.SQL.Add('where FIPE = :fipe and ano=:ANO');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := FormProcPlanAcelero.StringGridAcelero.Cells[12,I];
         QSavannaLocal.Open;

         //ShowMessage('Buscou venda 30d');

         Application.ProcessMessages;

         if not QSavannaLocal.FieldByName('vnd').IsNull then
         vendas30dias := QSavannaLocal.FieldByName('vnd').AsInteger
         Else
         vendas30dias := 0;

         // Carrega ultimo vlr de venda
         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select valor, data from IMPORTASAVANNAULTIMASVENDAS');
         QSavannaLocal.SQL.Add('where FIPE = :fipe and ano=:ano');
         QSavannaLocal.SQL.Add('order by data desc ');
         QSavannaLocal.SQL.Add('limit 1');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := FormProcPlanAcelero.StringGridAcelero.Cells[12,I];
         QSavannaLocal.Open;

       //ShowMessage('Buscou vlr venda');

         Application.ProcessMessages;

         if QSavannaLocal.FieldByName('valor').AsCurrency <> null then
         vl_ultima_venda := QSavannaLocal.FieldByName('valor').AsCurrency
         Else
         vl_ultima_venda := 0;

         if QSavannaLocal.FieldByName('data').AsDateTime <> null then
         DT_VENDA := QSavannaLocal.FieldByName('data').AsDateTime;

         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select sum(qtd) as  Estoque from IMPORTASAVANNAESTOQUE where FIPE = :fipe and ano=:ano');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := FormProcPlanAcelero.StringGridAcelero.Cells[12,I];
         QSavannaLocal.Open;

          Application.ProcessMessages;

         if not QSavannaLocal.FieldByName('Estoque').IsNull then
         EstoqueAtual := QSavannaLocal.FieldByName('Estoque').AsInteger
         Else
         EstoqueAtual := 0;

     End;

      // funcao de carga de categoria x avaria Neutron

     QBuscaAvaria.SQL.Clear;
     QBuscaAvaria.SQL.Add('select coalesce(avaria,0) as avaria, coalesce(categoria,'' '') as cat  from TBPLANNEUTRON where fornecedor = ''ARVAL'' and placa=:pl');
     QBuscaAvaria.ParamByName('pl').Text := FormProcPlanAcelero.StringGridAcelero.Cells[1,I];
     QBuscaAvaria.Open;

     if Ref2 <> ' ' then
     Begin

       DataModuleConexao.qBuscaFipesRef.SQL.Clear;
       DataModuleConexao.qBuscaFipesRef.SQL.Add('select valor as FIPE from tbnewfipe where');
       DataModuleConexao.qBuscaFipesRef.SQL.Add(' ano=:ano and cod_fipe = :codfipe and ref=:ref');
       DataModuleConexao.qBuscaFipesRef.ParamByName('codfipe').text := cod_fipe;
       DataModuleConexao.qBuscaFipesRef.ParamByName('ref').Text := Ref2;
       DataModuleConexao.qBuscaFipesRef.ParamByName('ano').Text := FormProcPlanAcelero.StringGridAcelero.Cells[12,I];
       DataModuleConexao.qBuscaFipesRef.Open;

       ValorRef2 := DataModuleConexao.qBuscaFipesRef.FieldByName('FIPE').AsCurrency;

     End
     Else
     Begin
       ValorRef2 := 0;
     End;

     if Ref3 <> ' ' then
     Begin

       DataModuleConexao.qBuscaFipesRef.SQL.Clear;
       DataModuleConexao.qBuscaFipesRef.SQL.Add('select valor as FIPE from tbnewfipe where');
       DataModuleConexao.qBuscaFipesRef.SQL.Add(' ano=:ano and cod_fipe = :codfipe and ref=:ref');
       DataModuleConexao.qBuscaFipesRef.ParamByName('codfipe').text := cod_fipe;
       DataModuleConexao.qBuscaFipesRef.ParamByName('ref').Text := Ref3;
       DataModuleConexao.qBuscaFipesRef.ParamByName('ano').Text := FormProcPlanAcelero.StringGridAcelero.Cells[12,I];
       DataModuleConexao.qBuscaFipesRef.Open;

       ValorRef3 := DataModuleConexao.qBuscaFipesRef.FieldByName('FIPE').AsCurrency;

     End
     Else
     Begin
       ValorRef3 := 0;
     End;

      // Valida placa se ja importou
  QValidaPlacaJaImportada.SQL.Clear;
  QValidaPlacaJaImportada.SQL.Add('select count(*) as Existe from TBPROCPLANS where PLACA=:PLACA and FORNECEDOR=:FOR');
  QValidaPlacaJaImportada.ParamByName('PLACA').Text := FormProcPlanAcelero.StringGridAcelero.Cells[1,I];
  QValidaPlacaJaImportada.ParamByName('FOR').Text := 'ARVAL';
  QValidaPlacaJaImportada.Open;

  if QValidaPlacaJaImportada.FieldByName('Existe').AsInteger > 0 then
   Begin

     // Avarias
     QBuscaAvaria.SQL.Clear;
     QBuscaAvaria.SQL.Add('select coalesce(avaria,0) as avaria, coalesce(categoria,'' '') as cat  from TBPLANNEUTRON where fornecedor = ''ARVAL'' and placa=:pl');
     QBuscaAvaria.ParamByName('pl').Text := FormProcPlanAcelero.StringGridAcelero.Cells[1,I];
     QBuscaAvaria.Open;

        // Carrega cod_fipe da conciliação
     QBuscaMescla.SQL.Clear;
     QBuscaMescla.SQL.Add('select cod_fipe, VLR_FIPE from TBCONCFIPEMODELO where modelo=:mod and fornecedor = ''ARVAL''');
     QBuscaMescla.SQL.Add('and ANO=:ano');
     QBuscaMescla.SQL.Add('and ref_fipe=:ref');
     QBuscaMescla.ParamByName('ano').Text := FormProcPlanAcelero.StringGridAcelero.Cells[12,I];
     QBuscaMescla.ParamByName('mod').Text := FormProcPlanAcelero.StringGridAcelero.Cells[4,I];
     QBuscaMescla.ParamByName('ref').Text := Principal;
     QBuscaMescla.Open;

     if not QBuscaMescla.IsEmpty then
     Begin
         //ShowMessage('Vai buscar venda 30d');
          cod_fipe := QBuscaMescla.FieldByName('cod_fipe').Text;
         // Carrega vendas dos ultimos 30 dias
         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select COUNT(*) as vnd from IMPORTASAVANNAVENDA30DIAS');
         QSavannaLocal.SQL.Add('where FIPE = :fipe and ano=:ANO');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := FormProcPlanAcelero.StringGridAcelero.Cells[12,I];
         QSavannaLocal.Open;

         //ShowMessage('Buscou venda 30d');

         Application.ProcessMessages;

         if not QSavannaLocal.FieldByName('vnd').IsNull then
         vendas30dias := QSavannaLocal.FieldByName('vnd').AsInteger
         Else
         vendas30dias := 0;

         // Carrega ultimo vlr de venda
         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select valor, data from IMPORTASAVANNAULTIMASVENDAS');
         QSavannaLocal.SQL.Add('where FIPE = :fipe and ano=:ano');
         QSavannaLocal.SQL.Add('order by data desc ');
         QSavannaLocal.SQL.Add('limit 1');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := FormProcPlanAcelero.StringGridAcelero.Cells[12,I];
         QSavannaLocal.Open;

       //ShowMessage('Buscou vlr venda');

         Application.ProcessMessages;

         if QSavannaLocal.FieldByName('valor').AsCurrency <> null then
         vl_ultima_venda := QSavannaLocal.FieldByName('valor').AsCurrency
         Else
         vl_ultima_venda := 0;

         if QSavannaLocal.FieldByName('data').AsDateTime <> null then
         DT_VENDA := QSavannaLocal.FieldByName('data').AsDateTime;

         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select sum(qtd) as  Estoque from IMPORTASAVANNAESTOQUE where FIPE = :fipe and ano=:ano');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := FormProcPlanAcelero.StringGridAcelero.Cells[12,I];
         QSavannaLocal.Open;

          Application.ProcessMessages;

         if not QSavannaLocal.FieldByName('Estoque').IsNull then
         EstoqueAtual := QSavannaLocal.FieldByName('Estoque').AsInteger
         Else
         EstoqueAtual := 0;

     End;


     QAtualizaG.SQL.Clear;
     QAtualizaG.SQL.Add('select');
     QAtualizaG.SQL.Add('coalesce(G_ZERO , 0) as G_ZERO, DT_G0');
     QAtualizaG.SQL.Add('from tbprocplans');
     QAtualizaG.SQL.Add('where COD_FIPE = :c_fipe');
     QAtualizaG.SQL.Add('and ANO_MOD = :ano');
     QAtualizaG.SQL.Add('and G_ZERO > 0');
     QAtualizaG.SQL.Add('order by id desc');
     QAtualizaG.SQL.Add('limit 1');
     QAtualizaG.ParamByName('c_fipe').Text := cod_fipe;
     QAtualizaG.ParamByName('ano').Text := FormProcPlanAcelero.StringGridAcelero.Cells[12,I];
     QAtualizaG.Open;



     QValidaPlacaJaImportada.SQL.Clear;
     QValidaPlacaJaImportada.SQL.Add('update TBPROCPLANS set');
     QValidaPlacaJaImportada.SQL.Add('km=:km,');
     QValidaPlacaJaImportada.SQL.Add('venda_trinta_dias=:venda_trinta_dias,');
     QValidaPlacaJaImportada.SQL.Add('estoque=:estoque,');
     QValidaPlacaJaImportada.SQL.Add('vlr_ult_venda=:vlr_ult_venda,');
     QValidaPlacaJaImportada.SQL.Add('dt_ult_venda=:dt_ult_venda,');
     QValidaPlacaJaImportada.SQL.Add('categoria=:cat,');
     QValidaPlacaJaImportada.SQL.Add('avaria=:avaria,');
     QValidaPlacaJaImportada.SQL.Add('DATA=:dt,');
	   QValidaPlacaJaImportada.SQL.Add('ULT_G0=:UG0,');
     QValidaPlacaJaImportada.SQL.Add('DT_G0=:DTG0,');
     QValidaPlacaJaImportada.SQL.Add('ref_fipe=:ref,');
     QValidaPlacaJaImportada.SQL.Add('fipe2=:vlfipe2,');
     QValidaPlacaJaImportada.SQL.Add('ref_fipe2=:reffipe2,');
     QValidaPlacaJaImportada.SQL.Add('fipe3=:vlfipe3,');
     QValidaPlacaJaImportada.SQL.Add('ref_fipe3=:reffipe3,');
     QValidaPlacaJaImportada.SQL.Add('vlr_fipe=:fipe, IMPORT_PLANILHA=:PLAN, IMPORT_DATA=:DT, situacao = 0, Lote=:lote where PLACA=:PLACA');
     QValidaPlacaJaImportada.ParamByName('PLAN').Text := LblNomeArquivo.Caption;
     QValidaPlacaJaImportada.ParamByName('ref').Text := Principal;
     QValidaPlacaJaImportada.ParamByName('vlfipe2').AsCurrency := ValorRef2;
     QValidaPlacaJaImportada.ParamByName('vlfipe3').AsCurrency := ValorRef3;
     QValidaPlacaJaImportada.ParamByName('reffipe2').Text := Ref2;
     QValidaPlacaJaImportada.ParamByName('reffipe3').Text := Ref3;
     QValidaPlacaJaImportada.ParamByName('DT').AsDate := NOW;
     QValidaPlacaJaImportada.ParamByName('Lote').Text := Lote;
     QValidaPlacaJaImportada.ParamByName('placa').Text := FormProcPlanAcelero.StringGridAcelero.Cells[1,I];
      KM := StrToCurr(StringReplace(FormProcPlanAcelero.StringGridAcelero.Cells[6,I], '.', '', []));
     QValidaPlacaJaImportada.ParamByName('km').AsCurrency := KM;
     QValidaPlacaJaImportada.ParamByName('dt_ult_venda').AsDate := DT_VENDA;
     QValidaPlacaJaImportada.ParamByName('fipe').AsCurrency := QBuscaMescla.FieldByName('VLR_FIPE').AsCurrency;
     QValidaPlacaJaImportada.ParamByName('venda_trinta_dias').AsInteger := vendas30dias;
     QValidaPlacaJaImportada.ParamByName('estoque').AsInteger := EstoqueAtual;
     QValidaPlacaJaImportada.ParamByName('vlr_ult_venda').AsCurrency := vl_ultima_venda;
     QValidaPlacaJaImportada.ParamByName('dt').AsDate := NOW;
     QValidaPlacaJaImportada.ParamByName('cat').Text := QBuscaAvaria.FieldByName('cat').Text;
     if QBuscaAvaria.FieldByName('avaria').AsCurrency > 0 then
     QValidaPlacaJaImportada.ParamByName('avaria').AsCurrency := QBuscaAvaria.FieldByName('avaria').AsCurrency
     Else
     QValidaPlacaJaImportada.ParamByName('avaria').AsCurrency := 0;
     if QAtualizaG.FieldByName('G_ZERO').AsFloat > 0 then
     QValidaPlacaJaImportada.ParamByName('UG0').AsFloat := QAtualizaG.FieldByName('G_ZERO').AsFloat
     Else
     QValidaPlacaJaImportada.ParamByName('UG0').AsFloat := 0;
     if QAtualizaG.FieldByName('DT_G0').AsDateTime <> null then
     QValidaPlacaJaImportada.ParamByName('DTG0').AsDate := QAtualizaG.FieldByName('DT_G0').AsDateTime
     Else
     QValidaPlacaJaImportada.ParamByName('DTG0').AsDate := null;
     QValidaPlacaJaImportada.Execute;


    FormLoading.LabelStatus.Caption := 'Importando planilha ARVAL PLACA: '+FormProcPlanAcelero.StringGridAcelero.Cells[4,I];
   End
   Else
   Begin

     QAtualizaG.SQL.Clear;
     QAtualizaG.SQL.Add('select');
     QAtualizaG.SQL.Add('coalesce(G_ZERO , 0) as G_ZERO, DT_G0');
     QAtualizaG.SQL.Add('from tbprocplans');
     QAtualizaG.SQL.Add('where COD_FIPE = :c_fipe');
     QAtualizaG.SQL.Add('and ANO_MOD = :ano');
     QAtualizaG.SQL.Add('and G_ZERO > 0');
     QAtualizaG.SQL.Add('order by id desc');
     QAtualizaG.SQL.Add('limit 1');
     QAtualizaG.ParamByName('c_fipe').Text := cod_fipe;
     QAtualizaG.ParamByName('ano').Text := FormProcPlanAcelero.StringGridAcelero.Cells[12,I];
     QAtualizaG.Open;


   QInsereDados.SQL.Clear;
   QInsereDados.SQL.Add('insert into TBPROCPLANS');
   QInsereDados.SQL.Add('( licitacao, lote, placa, modelo, km, ano, ano_mod, cor, vlr_min,');
   QInsereDados.SQL.Add('  vlr_min_fipe, vlr_min_dois, compra_ja, vlr_fipe, vlr_merc_um, vlr_merc_dois,');
   QInsereDados.SQL.Add('  venda_trinta_dias, estoque, vlr_ult_venda, dt_ult_venda, atacado_varejo, categoria, g_zero,');
   QInsereDados.SQL.Add(' mg, avaria, resultado, min_resultado, lance, lance_fipe, compra, sn,');
   QInsereDados.SQL.Add('  dt_pgto, qtd, fornecedor, id_plan_for, cod_fipe, situacao, data, onde, local, ULT_G0, DT_G0, IMPORT_PLANILHA, IMPORT_DATA, IMPORT_STATUS, ref_fipe, fipe2, ref_fipe2, fipe3, ref_fipe3)');
   QInsereDados.SQL.Add('values');
   QInsereDados.SQL.Add('(:licitacao, :lote, :placa, :modelo, :km, :ano, :anomod, :cor, :vlr_min,');
   QInsereDados.SQL.Add(':vlr_min_fipe, :vlr_min_dois, :compra_ja, :fipe, :vlr_m_um, :vlr_m_dois,');
   QInsereDados.SQL.Add(':venda_trinta_dias, :estoque, :vlr_ult_venda, :dt_venda, :ata_var, :cat, :gzero,');
   QInsereDados.SQL.Add(':mg, :avaria, :result, :min_result, :lance, :lance_fipe, :compra, :sn, :dt_pgto,');
   QInsereDados.SQL.Add(':qtd, :fornecedor, :id_plan, :c_fipe, :sit, :dt, :onde, :local, :UG0, :DTG0, :PLANILHA, :DT_PLANILHA, :STATUS_PLANILHA, :ref, :vlfipe2, :ref2, :vlfipe3, :ref3)');
   QInsereDados.ParamByName('PLANILHA').Text := LblNomeArquivo.Caption;
   QInsereDados.ParamByName('DT_PLANILHA').AsDate := NOW;
   QInsereDados.ParamByName('ref').Text := Principal;
   QInsereDados.ParamByName('vlfipe2').AsCurrency := ValorRef2;
   QInsereDados.ParamByName('vlfipe3').AsCurrency := ValorRef3;
   QInsereDados.ParamByName('ref2').Text := Ref2;
   QInsereDados.ParamByName('ref3').Text := Ref3;
   QInsereDados.ParamByName('STATUS_PLANILHA').Text := 'Em Analise';
   QInsereDados.ParamByName('licitacao').Text := '';
   QInsereDados.ParamByName('lote').Text := Lote;
   QInsereDados.ParamByName('placa').Text := FormProcPlanAcelero.StringGridAcelero.Cells[1,I];
   QInsereDados.ParamByName('modelo').Text := FormProcPlanAcelero.StringGridAcelero.Cells[4,I];
      KM := StrToCurr(StringReplace(FormProcPlanAcelero.StringGridAcelero.Cells[6,I], '.', '', []));
     QInsereDados.ParamByName('km').AsCurrency := KM;
   QInsereDados.ParamByName('ano').Text := FormProcPlanAcelero.StringGridAcelero.Cells[12,I];
   QInsereDados.ParamByName('dt_venda').AsDate := DT_VENDA;
   QInsereDados.ParamByName('anomod').Text := FormProcPlanAcelero.StringGridAcelero.Cells[12,I];
   QInsereDados.ParamByName('cor').Text := FormProcPlanAcelero.StringGridAcelero.Cells[11,I];
   QInsereDados.ParamByName('vlr_min').AsCurrency := 0;
   QInsereDados.ParamByName('vlr_min_fipe').AsCurrency := QBuscaMescla.FieldByName('VLR_FIPE').AsCurrency -  0;
   QInsereDados.ParamByName('vlr_min_dois').AsCurrency := 0;
   QInsereDados.ParamByName('compra_ja').AsCurrency := 0;
   QInsereDados.ParamByName('fipe').AsCurrency := QBuscaMescla.FieldByName('VLR_FIPE').AsCurrency;
   QInsereDados.ParamByName('vlr_m_um').AsCurrency := 0;
   QInsereDados.ParamByName('vlr_m_dois').AsCurrency := 0;
   QInsereDados.ParamByName('venda_trinta_dias').AsInteger := vendas30dias;
   QInsereDados.ParamByName('estoque').AsInteger := EstoqueAtual;
   QInsereDados.ParamByName('vlr_ult_venda').AsCurrency := vl_ultima_venda;
   QInsereDados.ParamByName('ata_var').Text := '';
   QInsereDados.ParamByName('gzero').AsCurrency := 0;
   QInsereDados.ParamByName('mg').AsCurrency :=  Margem;;
   QInsereDados.ParamByName('c_fipe').Text := cod_fipe;
   QInsereDados.ParamByName('sit').AsInteger := 0;
   QInsereDados.ParamByName('dt').AsDate := NOW;
   QInsereDados.ParamByName('fornecedor').Text := 'ARVAL';
   QInsereDados.ParamByName('cat').Text := QBuscaAvaria.FieldByName('cat').Text;
   if QBuscaAvaria.FieldByName('avaria').AsCurrency > 0 then
   QInsereDados.ParamByName('avaria').AsCurrency := QBuscaAvaria.FieldByName('avaria').AsCurrency
   Else
   QInsereDados.ParamByName('avaria').AsCurrency := 0;
     if QAtualizaG.FieldByName('G_ZERO').AsFloat > 0 then
     QInsereDados.ParamByName('UG0').AsFloat := QAtualizaG.FieldByName('G_ZERO').AsFloat
     Else
     QInsereDados.ParamByName('UG0').AsFloat := 0;
     if QAtualizaG.FieldByName('DT_G0').AsDateTime <> null then
     QInsereDados.ParamByName('DTG0').AsDate := QAtualizaG.FieldByName('DT_G0').AsDateTime
     Else
     QInsereDados.ParamByName('DTG0').AsDate := null;
   QInsereDados.Execute;

    FormLoading.LabelStatus.Caption := 'Importando planilha ARVAL PLACA: '+FormProcPlanAcelero.StringGridAcelero.Cells[1,I];

    Application.ProcessMessages;
   End;

  End;
 Finally

 End;
   MessageDlg('Importação finalizada', mtInformation, [mbok], 0);
end;

procedure TFormNovoProcessamento.ImportaPlanARVALLoteC;
Var
  I, Qtd, vendas30dias, EstoqueAtual, L : integer;
  Lote, Licitacao, modelo, cod_fipe : string;
  KM, vl_ultima_venda : Currency;
  DT_VENDA : TDate;
 Begin

 FormLotesArval.Close;

 Lote :=  FormLotesArval.Lote; //FormProcPlanAcelero.StringGridAcelero.Cells[14,1];

 {L := Length(lote);

 Lote:= copy(Lote, L, L); }

 Licitacao := Copy(Lote, 11, 6);

   vendas30dias := 0;
   EstoqueAtual := 0;
   vl_ultima_venda := 0;

 Try
  for I := 3 to Pred(FormProcPlanAcelero.StringGridAcelero.RowCount) do
  Begin

  if I = 0 then
  Continue;

  if Trim(FormProcPlanAcelero.StringGridAcelero.Cells[0,I]) = '' then
  Continue;

   { ShowMessage(
    'Campo 0:'+FormProcPlanAcelero.StringGridAcelero.Cells[0,I] + #13 +
    'Campo 1:'+FormProcPlanAcelero.StringGridAcelero.Cells[1,I] + #13 +
    'Campo 2:'+FormProcPlanAcelero.StringGridAcelero.Cells[2,I] + #13 +
    'Campo 3:'+FormProcPlanAcelero.StringGridAcelero.Cells[3,I] + #13 +
    'Campo 4:'+FormProcPlanAcelero.StringGridAcelero.Cells[4,I] + #13 +
    'Campo 5:'+FormProcPlanAcelero.StringGridAcelero.Cells[5,I] + #13 +
    'Campo 6:'+FormProcPlanAcelero.StringGridAcelero.Cells[6,I] + #13 +
    'Campo 7:'+FormProcPlanAcelero.StringGridAcelero.Cells[7,I] + #13 +
    'Campo 8:'+FormProcPlanAcelero.StringGridAcelero.Cells[8,I] + #13 +
    'Campo 9:'+FormProcPlanAcelero.StringGridAcelero.Cells[9,I] + #13 +
    'Campo 10:'+FormProcPlanAcelero.StringGridAcelero.Cells[10,I] + #13 +
    'Campo 11:'+FormProcPlanAcelero.StringGridAcelero.Cells[11,I] + #13 +
    'Campo 12:'+FormProcPlanAcelero.StringGridAcelero.Cells[12,I] + #13 +
    'Campo 13:'+FormProcPlanAcelero.StringGridAcelero.Cells[13,I] + #13 +
    'Campo 14:'+FormProcPlanAcelero.StringGridAcelero.Cells[14,I] + #13
    ); }

   // Abort;

    // Verifica modelo na conciliação de mod x fipe
    QConcFIPE.SQL.Clear;
    QConcFIPE.SQL.Add('select count(vlr_fipe) as existe from TBCONCFIPEMODELO where modelo = :mod AND ANO=:ANO and fornecedor = ''ARVAL''');
    QConcFIPE.ParamByName('mod').Text := FormProcPlanAcelero.StringGridAcelero.Cells[4,I];
    QConcFIPE.ParamByName('ANO').Text := FormProcPlanAcelero.StringGridAcelero.Cells[13,I];
    QConcFIPE.Open;

     if QConcFIPE.FieldByName('existe').AsInteger = 0 then
     Begin
      MessageDlg('Não foi encontrada vinculação de FIPE para o modelo, efetue-a.'+#13+
               'Modelo: '+FormProcPlanAcelero.StringGridAcelero.Cells[4,I], mtWarning, [mbok], 0);

      FormConciliacaoFipeModelo.EditModeloFIPE.Text := Copy(FormProcPlanAcelero.StringGridAcelero.Cells[4,I], 0, 10);
      FormConciliacaoFipeModelo.Position := poScreenCenter;
      FormConciliacaoFipeModelo.lblModeloPlan.Caption := FormProcPlanAcelero.StringGridAcelero.Cells[4,I];
      FormConciliacaoFipeModelo.EditAnoFIPE.Text := FormProcPlanAcelero.StringGridAcelero.Cells[13,I];
      FormConciliacaoFipeModelo.lblFornecedor.Caption := 'ARVAL';

      FormConciliacaoFipeModelo.ShowModal;
     End;

      // Carrega cod_fipe da conciliação
     QBuscaMescla.SQL.Clear;
     QBuscaMescla.SQL.Add('select cod_fipe, VLR_FIPE from TBCONCFIPEMODELO where modelo=:mod and fornecedor = ''ARVAL''');
     QBuscaMescla.SQL.Add('and ANO=:ano');
     QBuscaMescla.ParamByName('ano').Text := FormProcPlanAcelero.StringGridAcelero.Cells[13,I];
     QBuscaMescla.ParamByName('mod').Text := FormProcPlanAcelero.StringGridAcelero.Cells[4,I];
     QBuscaMescla.Open;

     if not QBuscaMescla.IsEmpty then
     Begin
         //ShowMessage('Vai buscar venda 30d');
          cod_fipe := QBuscaMescla.FieldByName('cod_fipe').Text;
         // Carrega vendas dos ultimos 30 dias
         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select COUNT(*) as vnd from IMPORTASAVANNAVENDA30DIAS');
         QSavannaLocal.SQL.Add('where FIPE = :fipe and ano=:ANO');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := FormProcPlanAcelero.StringGridAcelero.Cells[13,I];
         QSavannaLocal.Open;

         //ShowMessage('Buscou venda 30d');

         Application.ProcessMessages;

         if not QSavannaLocal.FieldByName('vnd').IsNull then
         vendas30dias := QSavannaLocal.FieldByName('vnd').AsInteger
         Else
         vendas30dias := 0;

         // Carrega ultimo vlr de venda
         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select valor, data from IMPORTASAVANNAULTIMASVENDAS');
         QSavannaLocal.SQL.Add('where FIPE = :fipe and ano=:ano');
         QSavannaLocal.SQL.Add('order by data desc ');
         QSavannaLocal.SQL.Add('limit 1');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := FormProcPlanAcelero.StringGridAcelero.Cells[13,I];
         QSavannaLocal.Open;

       //ShowMessage('Buscou vlr venda');

         Application.ProcessMessages;

         if QSavannaLocal.FieldByName('valor').AsCurrency <> null then
         vl_ultima_venda := QSavannaLocal.FieldByName('valor').AsCurrency
         Else
         vl_ultima_venda := 0;

         if QSavannaLocal.FieldByName('data').AsDateTime <> null then
         DT_VENDA := QSavannaLocal.FieldByName('data').AsDateTime;

         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select sum(qtd) as  Estoque from IMPORTASAVANNAESTOQUE where FIPE = :fipe and ano=:ano');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := FormProcPlanAcelero.StringGridAcelero.Cells[13,I];
         QSavannaLocal.Open;

          Application.ProcessMessages;

         if not QSavannaLocal.FieldByName('Estoque').IsNull then
         EstoqueAtual := QSavannaLocal.FieldByName('Estoque').AsInteger
         Else
         EstoqueAtual := 0;

     End;

      // funcao de carga de categoria x avaria Neutron

     QBuscaAvaria.SQL.Clear;
     QBuscaAvaria.SQL.Add('select coalesce(avaria,0) as avaria, coalesce(categoria,'' '') as cat  from TBPLANNEUTRON where fornecedor = ''ARVAL'' and placa=:pl');
     QBuscaAvaria.ParamByName('pl').Text := FormProcPlanAcelero.StringGridAcelero.Cells[2,I];
     QBuscaAvaria.Open;

      // Valida placa se ja importou
  QValidaPlacaJaImportada.SQL.Clear;
  QValidaPlacaJaImportada.SQL.Add('select count(*) as Existe from TBPROCPLANS where PLACA=:PLACA and FORNECEDOR=:FOR');
  QValidaPlacaJaImportada.ParamByName('PLACA').Text := FormProcPlanAcelero.StringGridAcelero.Cells[2,I];
  QValidaPlacaJaImportada.ParamByName('FOR').Text := 'ARVAL';
  QValidaPlacaJaImportada.Open;

  if QValidaPlacaJaImportada.FieldByName('Existe').AsInteger > 0 then
   Begin

     // Avarias
     QBuscaAvaria.SQL.Clear;
     QBuscaAvaria.SQL.Add('select coalesce(avaria,0) as avaria, coalesce(categoria,'' '') as cat  from TBPLANNEUTRON where fornecedor = ''ARVAL'' and placa=:pl');
     QBuscaAvaria.ParamByName('pl').Text := FormProcPlanAcelero.StringGridAcelero.Cells[2,I];
     QBuscaAvaria.Open;

        // Carrega cod_fipe da conciliação
     QBuscaMescla.SQL.Clear;
     QBuscaMescla.SQL.Add('select cod_fipe, VLR_FIPE from TBCONCFIPEMODELO where modelo=:mod and fornecedor = ''ARVAL''');
     QBuscaMescla.SQL.Add('and ANO=:ano');
     QBuscaMescla.ParamByName('ano').Text := FormProcPlanAcelero.StringGridAcelero.Cells[13,I];
     QBuscaMescla.ParamByName('mod').Text := FormProcPlanAcelero.StringGridAcelero.Cells[4,I];
     QBuscaMescla.Open;

     if not QBuscaMescla.IsEmpty then
     Begin
         //ShowMessage('Vai buscar venda 30d');
          cod_fipe := QBuscaMescla.FieldByName('cod_fipe').Text;
         // Carrega vendas dos ultimos 30 dias
         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select COUNT(*) as vnd from IMPORTASAVANNAVENDA30DIAS');
         QSavannaLocal.SQL.Add('where FIPE = :fipe and ano=:ANO');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := FormProcPlanAcelero.StringGridAcelero.Cells[13,I];
         QSavannaLocal.Open;

         //ShowMessage('Buscou venda 30d');

         Application.ProcessMessages;

         if not QSavannaLocal.FieldByName('vnd').IsNull then
         vendas30dias := QSavannaLocal.FieldByName('vnd').AsInteger
         Else
         vendas30dias := 0;

         // Carrega ultimo vlr de venda
         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select valor, data from IMPORTASAVANNAULTIMASVENDAS');
         QSavannaLocal.SQL.Add('where FIPE = :fipe and ano=:ano');
         QSavannaLocal.SQL.Add('order by data desc ');
         QSavannaLocal.SQL.Add('limit 1');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := FormProcPlanAcelero.StringGridAcelero.Cells[13,I];
         QSavannaLocal.Open;

       //ShowMessage('Buscou vlr venda');

         Application.ProcessMessages;

         if QSavannaLocal.FieldByName('valor').AsCurrency <> null then
         vl_ultima_venda := QSavannaLocal.FieldByName('valor').AsCurrency
         Else
         vl_ultima_venda := 0;

         if QSavannaLocal.FieldByName('data').AsDateTime <> null then
         DT_VENDA := QSavannaLocal.FieldByName('data').AsDateTime;

         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select sum(qtd) as  Estoque from IMPORTASAVANNAESTOQUE where FIPE = :fipe and ano=:ano');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := FormProcPlanAcelero.StringGridAcelero.Cells[13,I];
         QSavannaLocal.Open;

          Application.ProcessMessages;

         if not QSavannaLocal.FieldByName('Estoque').IsNull then
         EstoqueAtual := QSavannaLocal.FieldByName('Estoque').AsInteger
         Else
         EstoqueAtual := 0;

     End;


     QAtualizaG.SQL.Clear;
     QAtualizaG.SQL.Add('select');
     QAtualizaG.SQL.Add('coalesce(G_ZERO , 0) as G_ZERO, DT_G0');
     QAtualizaG.SQL.Add('from tbprocplans');
     QAtualizaG.SQL.Add('where COD_FIPE = :c_fipe');
     QAtualizaG.SQL.Add('and ANO_MOD = :ano');
     QAtualizaG.SQL.Add('and G_ZERO > 0');
     QAtualizaG.SQL.Add('order by id desc');
     QAtualizaG.SQL.Add('limit 1');
     QAtualizaG.ParamByName('c_fipe').Text := cod_fipe;
     QAtualizaG.ParamByName('ano').Text := FormProcPlanAcelero.StringGridAcelero.Cells[13,I];
     QAtualizaG.Open;



     QValidaPlacaJaImportada.SQL.Clear;
     QValidaPlacaJaImportada.SQL.Add('update TBPROCPLANS set');
     QValidaPlacaJaImportada.SQL.Add('km=:km,');
     QValidaPlacaJaImportada.SQL.Add('venda_trinta_dias=:venda_trinta_dias,');
     QValidaPlacaJaImportada.SQL.Add('estoque=:estoque,');
     QValidaPlacaJaImportada.SQL.Add('vlr_ult_venda=:vlr_ult_venda,');
     QValidaPlacaJaImportada.SQL.Add('dt_ult_venda=:dt_ult_venda,');
     QValidaPlacaJaImportada.SQL.Add('categoria=:cat,');
     QValidaPlacaJaImportada.SQL.Add('avaria=:avaria,');
     QValidaPlacaJaImportada.SQL.Add('DATA=:dt,');
	   QValidaPlacaJaImportada.SQL.Add('ULT_G0=:UG0,');
     QValidaPlacaJaImportada.SQL.Add('DT_G0=:DTG0,');
     QValidaPlacaJaImportada.SQL.Add('vlr_fipe=:fipe, IMPORT_PLANILHA=:PLAN, IMPORT_DATA=:DT, situacao = 0, Lote=:lote where PLACA=:PLACA');
     QValidaPlacaJaImportada.ParamByName('PLAN').Text := LblNomeArquivo.Caption;
     QValidaPlacaJaImportada.ParamByName('DT').AsDate := NOW;
     QValidaPlacaJaImportada.ParamByName('Lote').Text := Lote;
     QValidaPlacaJaImportada.ParamByName('placa').Text := FormProcPlanAcelero.StringGridAcelero.Cells[2,I];
      KM := StrToCurr(StringReplace(FormProcPlanAcelero.StringGridAcelero.Cells[7,I], '.', '', []));
     QValidaPlacaJaImportada.ParamByName('km').AsCurrency := KM;
     QValidaPlacaJaImportada.ParamByName('dt_ult_venda').AsDate := DT_VENDA;
     QValidaPlacaJaImportada.ParamByName('fipe').AsCurrency := QBuscaMescla.FieldByName('VLR_FIPE').AsCurrency;
     QValidaPlacaJaImportada.ParamByName('venda_trinta_dias').AsInteger := vendas30dias;
     QValidaPlacaJaImportada.ParamByName('estoque').AsInteger := EstoqueAtual;
     QValidaPlacaJaImportada.ParamByName('vlr_ult_venda').AsCurrency := vl_ultima_venda;
     QValidaPlacaJaImportada.ParamByName('dt').AsDate := NOW;
     QValidaPlacaJaImportada.ParamByName('cat').Text := QBuscaAvaria.FieldByName('cat').Text;
     if QBuscaAvaria.FieldByName('avaria').AsCurrency > 0 then
     QValidaPlacaJaImportada.ParamByName('avaria').AsCurrency := QBuscaAvaria.FieldByName('avaria').AsCurrency
     Else
     QValidaPlacaJaImportada.ParamByName('avaria').AsCurrency := 0;
     if QAtualizaG.FieldByName('G_ZERO').AsFloat > 0 then
     QValidaPlacaJaImportada.ParamByName('UG0').AsFloat := QAtualizaG.FieldByName('G_ZERO').AsFloat
     Else
     QValidaPlacaJaImportada.ParamByName('UG0').AsFloat := 0;
     if QAtualizaG.FieldByName('DT_G0').AsDateTime <> null then
     QValidaPlacaJaImportada.ParamByName('DTG0').AsDate := QAtualizaG.FieldByName('DT_G0').AsDateTime
     Else
     QValidaPlacaJaImportada.ParamByName('DTG0').AsDate := null;
     QValidaPlacaJaImportada.Execute;


    FormLoading.LabelStatus.Caption := 'Importando planilha ARVAL PLACA: '+FormProcPlanAcelero.StringGridAcelero.Cells[2,I];
   End
   Else
   Begin

     QAtualizaG.SQL.Clear;
     QAtualizaG.SQL.Add('select');
     QAtualizaG.SQL.Add('coalesce(G_ZERO , 0) as G_ZERO, DT_G0');
     QAtualizaG.SQL.Add('from tbprocplans');
     QAtualizaG.SQL.Add('where COD_FIPE = :c_fipe');
     QAtualizaG.SQL.Add('and ANO_MOD = :ano');
     QAtualizaG.SQL.Add('and G_ZERO > 0');
     QAtualizaG.SQL.Add('order by id desc');
     QAtualizaG.SQL.Add('limit 1');
     QAtualizaG.ParamByName('c_fipe').Text := cod_fipe;
     QAtualizaG.ParamByName('ano').Text := FormProcPlanAcelero.StringGridAcelero.Cells[13,I];
     QAtualizaG.Open;


   QInsereDados.SQL.Clear;
   QInsereDados.SQL.Add('insert into TBPROCPLANS');
   QInsereDados.SQL.Add('( licitacao, lote, placa, modelo, km, ano, ano_mod, cor, vlr_min,');
   QInsereDados.SQL.Add('  vlr_min_fipe, vlr_min_dois, compra_ja, vlr_fipe, vlr_merc_um, vlr_merc_dois,');
   QInsereDados.SQL.Add('  venda_trinta_dias, estoque, vlr_ult_venda, dt_ult_venda, atacado_varejo, categoria, g_zero,');
   QInsereDados.SQL.Add(' mg, avaria, resultado, min_resultado, lance, lance_fipe, compra, sn,');
   QInsereDados.SQL.Add('  dt_pgto, qtd, fornecedor, id_plan_for, cod_fipe, situacao, data, onde, local, ULT_G0, DT_G0, IMPORT_PLANILHA, IMPORT_DATA, IMPORT_STATUS)');
   QInsereDados.SQL.Add('values');
   QInsereDados.SQL.Add('(:licitacao, :lote, :placa, :modelo, :km, :ano, :anomod, :cor, :vlr_min,');
   QInsereDados.SQL.Add(':vlr_min_fipe, :vlr_min_dois, :compra_ja, :fipe, :vlr_m_um, :vlr_m_dois,');
   QInsereDados.SQL.Add(':venda_trinta_dias, :estoque, :vlr_ult_venda, :dt_venda, :ata_var, :cat, :gzero,');
   QInsereDados.SQL.Add(':mg, :avaria, :result, :min_result, :lance, :lance_fipe, :compra, :sn, :dt_pgto,');
   QInsereDados.SQL.Add(':qtd, :fornecedor, :id_plan, :c_fipe, :sit, :dt, :onde, :local, :UG0, :DTG0, :PLANILHA, :DT_PLANILHA, :STATUS_PLANILHA)');
   QInsereDados.ParamByName('PLANILHA').Text := LblNomeArquivo.Caption;
   QInsereDados.ParamByName('DT_PLANILHA').AsDate := NOW;
   QInsereDados.ParamByName('STATUS_PLANILHA').Text := 'Em Analise';
   QInsereDados.ParamByName('licitacao').Text := '';
   QInsereDados.ParamByName('lote').Text := Lote;
   QInsereDados.ParamByName('placa').Text := FormProcPlanAcelero.StringGridAcelero.Cells[2,I];
   QInsereDados.ParamByName('modelo').Text := FormProcPlanAcelero.StringGridAcelero.Cells[4,I];
      KM := StrToCurr(StringReplace(FormProcPlanAcelero.StringGridAcelero.Cells[7,I], '.', '', []));
     QInsereDados.ParamByName('km').AsCurrency := KM;
   QInsereDados.ParamByName('ano').Text := FormProcPlanAcelero.StringGridAcelero.Cells[13,I];
   QInsereDados.ParamByName('dt_venda').AsDate := DT_VENDA;
   QInsereDados.ParamByName('anomod').Text := FormProcPlanAcelero.StringGridAcelero.Cells[13,I];
   QInsereDados.ParamByName('cor').Text := FormProcPlanAcelero.StringGridAcelero.Cells[11,I];
   QInsereDados.ParamByName('vlr_min').AsCurrency := 0;
   QInsereDados.ParamByName('vlr_min_fipe').AsCurrency := QBuscaMescla.FieldByName('VLR_FIPE').AsCurrency -  0;
   QInsereDados.ParamByName('vlr_min_dois').AsCurrency := 0;
   QInsereDados.ParamByName('compra_ja').AsCurrency := 0;
   QInsereDados.ParamByName('fipe').AsCurrency := QBuscaMescla.FieldByName('VLR_FIPE').AsCurrency;
   QInsereDados.ParamByName('vlr_m_um').AsCurrency := 0;
   QInsereDados.ParamByName('vlr_m_dois').AsCurrency := 0;
   QInsereDados.ParamByName('venda_trinta_dias').AsInteger := vendas30dias;
   QInsereDados.ParamByName('estoque').AsInteger := EstoqueAtual;
   QInsereDados.ParamByName('vlr_ult_venda').AsCurrency := vl_ultima_venda;
   QInsereDados.ParamByName('ata_var').Text := '';
   QInsereDados.ParamByName('gzero').AsCurrency := 0;
   QInsereDados.ParamByName('mg').AsCurrency :=  Margem;;
   QInsereDados.ParamByName('c_fipe').Text := cod_fipe;
   QInsereDados.ParamByName('sit').AsInteger := 0;
   QInsereDados.ParamByName('dt').AsDate := NOW;
   QInsereDados.ParamByName('fornecedor').Text := 'ARVAL';
   QInsereDados.ParamByName('cat').Text := QBuscaAvaria.FieldByName('cat').Text;
   if QBuscaAvaria.FieldByName('avaria').AsCurrency > 0 then
   QInsereDados.ParamByName('avaria').AsCurrency := QBuscaAvaria.FieldByName('avaria').AsCurrency
   Else
   QInsereDados.ParamByName('avaria').AsCurrency := 0;
     if QAtualizaG.FieldByName('G_ZERO').AsFloat > 0 then
     QInsereDados.ParamByName('UG0').AsFloat := QAtualizaG.FieldByName('G_ZERO').AsFloat
     Else
     QInsereDados.ParamByName('UG0').AsFloat := 0;
     if QAtualizaG.FieldByName('DT_G0').AsDateTime <> null then
     QInsereDados.ParamByName('DTG0').AsDate := QAtualizaG.FieldByName('DT_G0').AsDateTime
     Else
     QInsereDados.ParamByName('DTG0').AsDate := null;
   QInsereDados.Execute;

    FormLoading.LabelStatus.Caption := 'Importando planilha ARVAL PLACA: '+FormProcPlanAcelero.StringGridAcelero.Cells[2,I];

    Application.ProcessMessages;
   End;

  End;
 Finally

 End;
   MessageDlg('Importação finalizada', mtInformation, [mbok], 0);
end;

procedure TFormNovoProcessamento.ImportaPlanJSL;
Var
  I : integer;
  Cidade, Endereco : String;
  KM : Double;
  Qtd, vendas30dias, EstoqueAtual: integer;
  modelo, cod_fipe : string;
  vl_ultima_venda : Currency;
  DT_VENDA : TDate;
 Begin

   vendas30dias := 0;
   EstoqueAtual := 0;
   vl_ultima_venda := 0;

 Try
  for I := 0 to Pred(FormProcPlanAcelero.StringGridAcelero.RowCount) do
  Begin

  if I = 0 then
  Continue;

  if Trim(FormProcPlanAcelero.StringGridAcelero.Cells[0,I]) = '' then
  Continue;

    DataModuleConexao.qBuscaRefFipe.SQL.Clear;
    DataModuleConexao.qBuscaRefFipe.SQL.Add('select ref1 , ref2, ref3, principal from tbfiperef');
    DataModuleConexao.qBuscaRefFipe.Open;

    Principal := DataModuleConexao.qBuscaRefFipe.FieldByName('principal').Text;
    Ref1      := DataModuleConexao.qBuscaRefFipe.FieldByName('ref1').Text;
    Ref2      := DataModuleConexao.qBuscaRefFipe.FieldByName('ref2').Text;
    Ref3      := DataModuleConexao.qBuscaRefFipe.FieldByName('ref3').Text;

    if ref1 <> Principal then
    Begin

      ref1 := DataModuleConexao.qBuscaRefFipe.FieldByName('principal').Text;
      Ref2 := DataModuleConexao.qBuscaRefFipe.FieldByName('ref1').Text;
      ref3 := DataModuleConexao.qBuscaRefFipe.FieldByName('ref2').Text;

    End;
    // Verifica modelo na conciliação de mod x fipe
    QConcFIPE.SQL.Clear;
    QConcFIPE.SQL.Add('select count(vlr_fipe) as existe from TBCONCFIPEMODELO where modelo = :mod AND ANO=:ANO and fornecedor = ''JSL''');
    QConcFIPE.SQL.Add('and ref_fipe=:ref');
    QConcFIPE.ParamByName('mod').Text := FormProcPlanAcelero.StringGridAcelero.Cells[2,I];
    QConcFIPE.ParamByName('ANO').Text := FormProcPlanAcelero.StringGridAcelero.Cells[6,I];
    QConcFIPE.ParamByName('ref').Text := Principal;
    QConcFIPE.Open;

     if QConcFIPE.FieldByName('existe').AsInteger = 0 then
     Begin
      MessageDlg('Não foi encontrada vinculação de FIPE para o modelo, efetue-a.'+#13+
               'Modelo: '+FormProcPlanAcelero.StringGridAcelero.Cells[2,I], mtWarning, [mbok], 0);

      FormConciliacaoFipeModelo.EditModeloFIPE.Text := Copy(FormProcPlanAcelero.StringGridAcelero.Cells[2,I], 0, 10);
      FormConciliacaoFipeModelo.Position := poScreenCenter;
      FormConciliacaoFipeModelo.lblModeloPlan.Caption := FormProcPlanAcelero.StringGridAcelero.Cells[2,I];
      FormConciliacaoFipeModelo.EditAnoFIPE.Text := FormProcPlanAcelero.StringGridAcelero.Cells[6,I];
      FormConciliacaoFipeModelo.lblFornecedor.Caption := 'JSL';

      FormConciliacaoFipeModelo.ShowModal;
     End;

      // Carrega cod_fipe da conciliação
     QBuscaMescla.SQL.Clear;
     QBuscaMescla.SQL.Add('select cod_fipe, VLR_FIPE from TBCONCFIPEMODELO where modelo=:mod and fornecedor = ''JSL''');
     QBuscaMescla.SQL.Add('and ANO=:ano');
     QBuscaMescla.SQL.Add('and ref_fipe=:ref');
     QBuscaMescla.ParamByName('ano').Text := FormProcPlanAcelero.StringGridAcelero.Cells[6,I];
     QBuscaMescla.ParamByName('mod').Text := FormProcPlanAcelero.StringGridAcelero.Cells[2,I];
     QBuscaMescla.ParamByName('ref').Text := Principal;
     QBuscaMescla.Open;

     if not QBuscaMescla.IsEmpty then
     Begin
         //ShowMessage('Vai buscar venda 30d');
          cod_fipe := QBuscaMescla.FieldByName('cod_fipe').Text;
         // Carrega vendas dos ultimos 30 dias
         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select COUNT(*) as vnd from IMPORTASAVANNAVENDA30DIAS');
         QSavannaLocal.SQL.Add('where FIPE = :fipe and ano=:ANO');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := FormProcPlanAcelero.StringGridAcelero.Cells[6,I];
         QSavannaLocal.Open;

         //ShowMessage('Buscou venda 30d');

         Application.ProcessMessages;

         if not QSavannaLocal.FieldByName('vnd').IsNull then
         vendas30dias := QSavannaLocal.FieldByName('vnd').AsInteger
         Else
         vendas30dias := 0;

         // Carrega ultimo vlr de venda
         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select valor, data from IMPORTASAVANNAULTIMASVENDAS');
         QSavannaLocal.SQL.Add('where FIPE = :fipe and ano=:ano');
         QSavannaLocal.SQL.Add('order by data desc ');
         QSavannaLocal.SQL.Add('limit 1');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := FormProcPlanAcelero.StringGridAcelero.Cells[6,I];
         QSavannaLocal.Open;

       //ShowMessage('Buscou vlr venda');

         Application.ProcessMessages;

         if QSavannaLocal.FieldByName('valor').AsCurrency <> null then
         vl_ultima_venda := QSavannaLocal.FieldByName('valor').AsCurrency
         Else
         vl_ultima_venda := 0;

         if QSavannaLocal.FieldByName('data').AsDateTime <> null then
         DT_VENDA := QSavannaLocal.FieldByName('data').AsDateTime;

         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select sum(qtd) as  Estoque from IMPORTASAVANNAESTOQUE where FIPE = :fipe and ano=:ano');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := FormProcPlanAcelero.StringGridAcelero.Cells[6,I];
         QSavannaLocal.Open;

          Application.ProcessMessages;

         if not QSavannaLocal.FieldByName('Estoque').IsNull then
         EstoqueAtual := QSavannaLocal.FieldByName('Estoque').AsInteger
         Else
         EstoqueAtual := 0;

     End;

      // funcao de carga de categoria x avaria Neutron

     QBuscaAvaria.SQL.Clear;
     QBuscaAvaria.SQL.Add('select coalesce(avaria,0) as avaria, coalesce(categoria,'' '') as cat  from TBPLANNEUTRON where fornecedor = ''ACELERO'' and placa=:pl');
     QBuscaAvaria.ParamByName('pl').Text := FormProcPlanAcelero.StringGridAcelero.Cells[1,I];
     QBuscaAvaria.Open;

      // Valida placa se ja importou
    QValidaPlacaJaImportada.SQL.Clear;
    QValidaPlacaJaImportada.SQL.Add('select count(*) as Existe from TBPROCPLANS where PLACA=:PLACA and FORNECEDOR=:FOR');
    QValidaPlacaJaImportada.ParamByName('PLACA').Text := FormProcPlanAcelero.StringGridAcelero.Cells[1,I];
    QValidaPlacaJaImportada.ParamByName('FOR').Text := 'JSL';
    QValidaPlacaJaImportada.Open;

     if Ref2 <> ' ' then
     Begin

       DataModuleConexao.qBuscaFipesRef.SQL.Clear;
       DataModuleConexao.qBuscaFipesRef.SQL.Add('select "'+'ANO'+FormProcPlanAcelero.StringGridAcelero.Cells[6,I]+'" as FIPE from TBFIPE where');
       DataModuleConexao.qBuscaFipesRef.SQL.Add(' "'+'ANO'+FormProcPlanAcelero.StringGridAcelero.Cells[6,I]+'" > 0 and cod_fipe = :codfipe and ref=:ref');
       DataModuleConexao.qBuscaFipesRef.ParamByName('codfipe').text := cod_fipe;
       DataModuleConexao.qBuscaFipesRef.ParamByName('ref').Text := Ref2;
       DataModuleConexao.qBuscaFipesRef.Open;

       ValorRef2 := DataModuleConexao.qBuscaFipesRef.FieldByName('FIPE').AsCurrency;

     End
     Else
     Begin
       ValorRef2 := 0;
     End;

     if Ref3 <> ' ' then
     Begin

       DataModuleConexao.qBuscaFipesRef.SQL.Clear;
       DataModuleConexao.qBuscaFipesRef.SQL.Add('select "'+'ANO'+FormProcPlanAcelero.StringGridAcelero.Cells[6,I]+'" as FIPE from TBFIPE where');
       DataModuleConexao.qBuscaFipesRef.SQL.Add(' "'+'ANO'+FormProcPlanAcelero.StringGridAcelero.Cells[6,I]+'" > 0 and cod_fipe = :codfipe and ref=:ref');
       DataModuleConexao.qBuscaFipesRef.ParamByName('codfipe').text := cod_fipe;
       DataModuleConexao.qBuscaFipesRef.ParamByName('ref').Text := Ref3;
       DataModuleConexao.qBuscaFipesRef.Open;

       ValorRef3 := DataModuleConexao.qBuscaFipesRef.FieldByName('FIPE').AsCurrency;

     End
     Else
     Begin
       ValorRef3 := 0;
     End;

  if QValidaPlacaJaImportada.FieldByName('Existe').AsInteger > 0 then
   Begin

     // Avarias
     QBuscaAvaria.SQL.Clear;
     QBuscaAvaria.SQL.Add('select coalesce(avaria,0) as avaria, coalesce(categoria,'' '') as cat  from TBPLANNEUTRON where fornecedor = ''JSL'' and placa=:pl');
     QBuscaAvaria.ParamByName('pl').Text := FormProcPlanAcelero.StringGridAcelero.Cells[1,I];
     QBuscaAvaria.Open;
        // Carrega cod_fipe da conciliação
     QBuscaMescla.SQL.Clear;
     QBuscaMescla.SQL.Add('select cod_fipe, VLR_FIPE from TBCONCFIPEMODELO where modelo=:mod and fornecedor = ''JSL''');
     QBuscaMescla.SQL.Add('and ANO=:ano');
     QBuscaMescla.SQL.Add('and ref_fipe=:ref');
     QBuscaMescla.ParamByName('ano').Text := FormProcPlanAcelero.StringGridAcelero.Cells[2,I];
     QBuscaMescla.ParamByName('mod').Text := FormProcPlanAcelero.StringGridAcelero.Cells[6,I];
     QBuscaMescla.ParamByName('ref').Text := Principal;
     QBuscaMescla.Open;

    if not QBuscaMescla.IsEmpty then
     Begin
         //ShowMessage('Vai buscar venda 30d');
          cod_fipe := QBuscaMescla.FieldByName('cod_fipe').Text;
         // Carrega vendas dos ultimos 30 dias
         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select COUNT(*) as vnd from IMPORTASAVANNAVENDA30DIAS');
         QSavannaLocal.SQL.Add('where FIPE = :fipe and ano=:ANO');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := FormProcPlanAcelero.StringGridAcelero.Cells[6,I];
         QSavannaLocal.Open;

         //ShowMessage('Buscou venda 30d');

         Application.ProcessMessages;

         if not QSavannaLocal.FieldByName('vnd').IsNull then
         vendas30dias := QSavannaLocal.FieldByName('vnd').AsInteger
         Else
         vendas30dias := 0;

         // Carrega ultimo vlr de venda
         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select valor, data from IMPORTASAVANNAULTIMASVENDAS');
         QSavannaLocal.SQL.Add('where FIPE = :fipe and ano=:ano');
         QSavannaLocal.SQL.Add('order by data desc ');
         QSavannaLocal.SQL.Add('limit 1');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := FormProcPlanAcelero.StringGridAcelero.Cells[6,I];
         QSavannaLocal.Open;

       //ShowMessage('Buscou vlr venda');

         Application.ProcessMessages;

         if QSavannaLocal.FieldByName('valor').AsCurrency <> null then
         vl_ultima_venda := QSavannaLocal.FieldByName('valor').AsCurrency
         Else
         vl_ultima_venda := 0;

         if QSavannaLocal.FieldByName('data').AsDateTime <> null then
         DT_VENDA := QSavannaLocal.FieldByName('data').AsDateTime;

         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select sum(qtd) as  Estoque from IMPORTASAVANNAESTOQUE where FIPE = :fipe and ano=:ano');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := FormProcPlanAcelero.StringGridAcelero.Cells[6,I];
         QSavannaLocal.Open;

          Application.ProcessMessages;

         if not QSavannaLocal.FieldByName('Estoque').IsNull then
         EstoqueAtual := QSavannaLocal.FieldByName('Estoque').AsInteger
         Else
         EstoqueAtual := 0;

     End;

     QAtualizaG.SQL.Clear;
     QAtualizaG.SQL.Add('select');
     QAtualizaG.SQL.Add('min(G_ZERO) as G_ZERO, DT_G0');
     QAtualizaG.SQL.Add('from TBPROCPLANS');
     QAtualizaG.SQL.Add('where');
     QAtualizaG.SQL.Add('G_ZERO > 0');
     QAtualizaG.SQL.Add('and');
     QAtualizaG.SQL.Add('COD_FIPE = :c_fipe and ANO_MOD = :ano');
     QAtualizaG.SQL.Add('order by DT_G0 desc limit 1');
     QAtualizaG.ParamByName('c_fipe').Text := cod_fipe;
     QAtualizaG.ParamByName('ano').Text := modelo;
     QAtualizaG.Open;

     QValidaPlacaJaImportada.SQL.Clear;
     QValidaPlacaJaImportada.SQL.Add('update TBPROCPLANS set');
     QValidaPlacaJaImportada.SQL.Add('vlr_min=:vlr_min,');
     QValidaPlacaJaImportada.SQL.Add('km=:km,');
     QValidaPlacaJaImportada.SQL.Add('venda_trinta_dias=:venda_trinta_dias,');
     QValidaPlacaJaImportada.SQL.Add('estoque=:estoque,');
     QValidaPlacaJaImportada.SQL.Add('vlr_ult_venda=:vlr_ult_venda,');
     QValidaPlacaJaImportada.SQL.Add('dt_ult_venda=:dt_ult_venda,');
     QValidaPlacaJaImportada.SQL.Add('categoria=:cat,');
     QValidaPlacaJaImportada.SQL.Add('avaria=:avaria,');
     QValidaPlacaJaImportada.SQL.Add('DATA=:dt,');
     QValidaPlacaJaImportada.SQL.Add('onde=:onde,');
     QValidaPlacaJaImportada.SQL.Add('local=:local,');
	   QValidaPlacaJaImportada.SQL.Add('ULT_G0=:UG0,');
     QValidaPlacaJaImportada.SQL.Add('DT_G0=:DTG0,');
     QValidaPlacaJaImportada.SQL.Add('ref_fipe=:ref, fipe2:=:vlfipe2, ref_fipe2=:ref2, fipe3=:vlfipe3, ref_fipe3-:ref3,');
     QValidaPlacaJaImportada.SQL.Add('vlr_fipe=:fipe, IMPORT_PLANILHA=:PLAN, IMPORT_DATA=:DT, situacao = 0 where PLACA=:PLACA');
     QValidaPlacaJaImportada.ParamByName('PLAN').Text := LblNomeArquivo.Caption;
     QValidaPlacaJaImportada.ParamByName('DT').AsDate := NOW;
     QValidaPlacaJaImportada.ParamByName('ref').Text := Principal;
     QValidaPlacaJaImportada.ParamByName('vlfipe2').AsCurrency := ValorRef2;
     QValidaPlacaJaImportada.ParamByName('ref2').Text := Ref2;
     QValidaPlacaJaImportada.ParamByName('vlfipe3').AsCurrency := ValorRef3;
     QValidaPlacaJaImportada.ParamByName('ref3').Text := Ref3;
     QValidaPlacaJaImportada.ParamByName('placa').Text := FormProcPlanAcelero.StringGridAcelero.Cells[1,I];
     QValidaPlacaJaImportada.ParamByName('km').AsCurrency := StrToCurr(Alltrim(StringReplace(StringReplace(StringReplace(StringReplace(StringReplace(StringReplace(FormProcPlanAcelero.StringGridAcelero.Cells[7,I], 'S/INFO', '0', [rfReplaceAll, rfIgnoreCase]), '.', '', [rfReplaceAll]),'P. QUEBRADO', '0',[rfReplaceAll]), 'P  QUEBRADO', '0', [rfReplaceAll]),'P QUEBRADO', '0', [rfReplaceAll]), 'PAINEL APAGADO', '0', [rfReplaceAll]) ));
     QValidaPlacaJaImportada.ParamByName('dt_ult_venda').AsDate := DT_VENDA;
     QValidaPlacaJaImportada.ParamByName('vlr_min').AsCurrency := StrToCurr(FormProcPlanAcelero.StringGridAcelero.Cells[10,I]);
     QValidaPlacaJaImportada.ParamByName('fipe').AsCurrency := QBuscaMescla.FieldByName('VLR_FIPE').AsCurrency;
     QValidaPlacaJaImportada.ParamByName('venda_trinta_dias').AsInteger := vendas30dias;
     QValidaPlacaJaImportada.ParamByName('estoque').AsInteger := EstoqueAtual;
     QValidaPlacaJaImportada.ParamByName('vlr_ult_venda').AsCurrency := vl_ultima_venda;
     QValidaPlacaJaImportada.ParamByName('dt').AsDate := NOW;
     QValidaPlacaJaImportada.ParamByName('onde').Text :=  FormProcPlanAcelero.StringGridAcelero.Cells[8,I];
     QValidaPlacaJaImportada.ParamByName('local').Text := FormProcPlanAcelero.StringGridAcelero.Cells[9,I];
     QValidaPlacaJaImportada.ParamByName('cat').Text := QBuscaAvaria.FieldByName('cat').Text;
     if QBuscaAvaria.FieldByName('avaria').AsCurrency > 0 then
     QValidaPlacaJaImportada.ParamByName('avaria').AsCurrency := QBuscaAvaria.FieldByName('avaria').AsCurrency
     Else
     QValidaPlacaJaImportada.ParamByName('avaria').AsCurrency := 0;
     if QAtualizaG.FieldByName('G_ZERO').AsFloat > 0 then
     QValidaPlacaJaImportada.ParamByName('UG0').AsFloat := QAtualizaG.FieldByName('G_ZERO').AsFloat
     Else
     QValidaPlacaJaImportada.ParamByName('UG0').AsFloat := 0;
     if QAtualizaG.FieldByName('DT_G0').AsDateTime <> null then
     QValidaPlacaJaImportada.ParamByName('DTG0').AsDate := QAtualizaG.FieldByName('DT_G0').AsDateTime
     Else
     QValidaPlacaJaImportada.ParamByName('DTG0').AsDate := null;
     QValidaPlacaJaImportada.Execute;

     FormLoading.LabelStatus.Caption := 'Atualizando planilha JSL PLACA: '+FormProcPlanAcelero.StringGridAcelero.Cells[1,I];

   End
   Else
   Begin

     QAtualizaG.SQL.Clear;
     QAtualizaG.SQL.Add('select');
     QAtualizaG.SQL.Add('min(G_ZERO) as G_ZERO, DT_G0');
     QAtualizaG.SQL.Add('from TBPROCPLANS');
     QAtualizaG.SQL.Add('where');
     QAtualizaG.SQL.Add('G_ZERO > 0');
     QAtualizaG.SQL.Add('and');
     QAtualizaG.SQL.Add('COD_FIPE = :c_fipe and ANO_MOD = :ano');
     QAtualizaG.SQL.Add('order by DT_G0 desc limit 1');
     QAtualizaG.ParamByName('c_fipe').Text := cod_fipe;
     QAtualizaG.ParamByName('ano').Text := modelo;
     QAtualizaG.Open;


   QInsereDados.SQL.Clear;
   QInsereDados.SQL.Add('insert into TBPROCPLANS');
   QInsereDados.SQL.Add('( licitacao, lote, placa, modelo, km, ano, ano_mod, cor, vlr_min,');
   QInsereDados.SQL.Add('  vlr_min_fipe, vlr_min_dois, compra_ja, vlr_fipe, vlr_merc_um, vlr_merc_dois,');
   QInsereDados.SQL.Add('  venda_trinta_dias, estoque, vlr_ult_venda, dt_ult_venda, atacado_varejo, categoria, g_zero,');
   QInsereDados.SQL.Add(' mg, avaria, resultado, min_resultado, lance, lance_fipe, compra, sn,');
   QInsereDados.SQL.Add('  dt_pgto, qtd, fornecedor, id_plan_for, cod_fipe, situacao, data, onde, local, ULT_G0, DT_G0, IMPORT_PLANILHA, IMPORT_DATA, IMPORT_STATUS, ref_fipe, fipe2, ref_fipe2, fipe3, ref_fipe3)');
   QInsereDados.SQL.Add('values');
   QInsereDados.SQL.Add('(:licitacao, :lote, :placa, :modelo, :km, :ano, :anomod, :cor, :vlr_min,');
   QInsereDados.SQL.Add(':vlr_min_fipe, :vlr_min_dois, :compra_ja, :fipe, :vlr_m_um, :vlr_m_dois,');
   QInsereDados.SQL.Add(':venda_trinta_dias, :estoque, :vlr_ult_venda, :dt_venda, :ata_var, :cat, :gzero,');
   QInsereDados.SQL.Add(':mg, :avaria, :result, :min_result, :lance, :lance_fipe, :compra, :sn, :dt_pgto,');
   QInsereDados.SQL.Add(':qtd, :fornecedor, :id_plan, :c_fipe, :sit, :dt, :onde, :local, :UG0, :DTG0, :PLANILHA, :DT_PLANILHA, :STATUS_PLANILHA, :ref, :vlfipe2, :ref2, :vlfipe3, :ref3)');
   QInsereDados.ParamByName('PLANILHA').Text := LblNomeArquivo.Caption;
   QInsereDados.ParamByName('DT_PLANILHA').AsDate := NOW;
   QInsereDados.ParamByName('STATUS_PLANILHA').Text := 'Em Analise';
   QInsereDados.ParamByName('licitacao').Text := '';
   QInsereDados.ParamByName('lote').Text := '';
   QInsereDados.ParamByName('ref').Text := Principal;
   QInsereDados.ParamByName('vlfipe2').AsCurrency := ValorRef2;
   QInsereDados.ParamByName('ref2').Text := Ref2;
   QInsereDados.ParamByName('vlfipe3').AsCurrency := ValorRef3;
   QInsereDados.ParamByName('ref3').Text := Ref3;
   QInsereDados.ParamByName('placa').Text := FormProcPlanAcelero.StringGridAcelero.Cells[1,I];
   QInsereDados.ParamByName('modelo').Text := FormProcPlanAcelero.StringGridAcelero.Cells[2,I];
   QInsereDados.ParamByName('km').AsCurrency := StrToCurr(Alltrim(StringReplace(StringReplace(StringReplace(StringReplace(StringReplace(StringReplace(FormProcPlanAcelero.StringGridAcelero.Cells[7,I], 'S/INFO', '0', [rfReplaceAll, rfIgnoreCase]), '.', '', [rfReplaceAll]),'P. QUEBRADO', '0',[rfReplaceAll]), 'P  QUEBRADO', '0', [rfReplaceAll]),'P QUEBRADO', '0', [rfReplaceAll]), 'PAINEL APAGADO', '0', [rfReplaceAll]) ));
   QInsereDados.ParamByName('ano').Text := FormProcPlanAcelero.StringGridAcelero.Cells[5,I];
   QInsereDados.ParamByName('dt_venda').AsDate := DT_VENDA;
   QInsereDados.ParamByName('anomod').Text := FormProcPlanAcelero.StringGridAcelero.Cells[6,I];
   QInsereDados.ParamByName('cor').Text := FormProcPlanAcelero.StringGridAcelero.Cells[4,I];
   QInsereDados.ParamByName('vlr_min').AsCurrency := StrToCurr(FormProcPlanAcelero.StringGridAcelero.Cells[10,I]);
   QInsereDados.ParamByName('vlr_min_fipe').AsCurrency := QBuscaMescla.FieldByName('VLR_FIPE').AsCurrency -  StrToCurr(FormProcPlanAcelero.StringGridAcelero.Cells[10,I]);
   QInsereDados.ParamByName('vlr_min_dois').AsCurrency := 0;
   QInsereDados.ParamByName('compra_ja').AsCurrency := 0;
   QInsereDados.ParamByName('fipe').AsCurrency := QBuscaMescla.FieldByName('VLR_FIPE').AsCurrency;
   QInsereDados.ParamByName('vlr_m_um').AsCurrency := 0;
   QInsereDados.ParamByName('vlr_m_dois').AsCurrency := 0;
   QInsereDados.ParamByName('venda_trinta_dias').AsInteger := vendas30dias;
   QInsereDados.ParamByName('estoque').AsInteger := EstoqueAtual;
   QInsereDados.ParamByName('vlr_ult_venda').AsCurrency := vl_ultima_venda;
   QInsereDados.ParamByName('ata_var').Text := '';
   QInsereDados.ParamByName('gzero').AsCurrency := 0;
   QInsereDados.ParamByName('mg').AsCurrency :=  Margem;;
   QInsereDados.ParamByName('c_fipe').Text := cod_fipe;
   QInsereDados.ParamByName('sit').AsInteger := 0;
   QInsereDados.ParamByName('dt').AsDate := NOW;
   QInsereDados.ParamByName('onde').Text :=  FormProcPlanAcelero.StringGridAcelero.Cells[8,I];
   QInsereDados.ParamByName('local').Text := FormProcPlanAcelero.StringGridAcelero.Cells[9,I];
   QInsereDados.ParamByName('fornecedor').Text := 'JSL';
   QInsereDados.ParamByName('cat').Text := QBuscaAvaria.FieldByName('cat').Text;
   if QBuscaAvaria.FieldByName('avaria').AsCurrency > 0 then
   QInsereDados.ParamByName('avaria').AsCurrency := QBuscaAvaria.FieldByName('avaria').AsCurrency
   Else
   QInsereDados.ParamByName('avaria').AsCurrency := 0;
     if QAtualizaG.FieldByName('G_ZERO').AsFloat > 0 then
     QInsereDados.ParamByName('UG0').AsFloat := QAtualizaG.FieldByName('G_ZERO').AsFloat
     Else
     QInsereDados.ParamByName('UG0').AsFloat := 0;
     if QAtualizaG.FieldByName('DT_G0').AsDateTime <> null then
     QInsereDados.ParamByName('DTG0').AsDate := QAtualizaG.FieldByName('DT_G0').AsDateTime
     Else
     QInsereDados.ParamByName('DTG0').AsDate := null;
   QInsereDados.Execute;

    FormLoading.LabelStatus.Caption := 'Importando planilha JSL PLACA: '+FormProcPlanAcelero.StringGridAcelero.Cells[1,I];

    Application.ProcessMessages;
   End;

  End;
 Finally

 End;
   MessageDlg('Importação finalizada', mtInformation, [mbok], 0);
end;

procedure TFormNovoProcessamento.ImportaPlanLM;
Var
  I, Qtd, vendas30dias, EstoqueAtual: integer;
  modelo, cod_fipe : string;
  vl_ultima_venda : Currency;
  DT_VENDA : TDate;
  Cidade, Endereco : String;
  KM : Double;
 Begin

   vendas30dias := 0;
   EstoqueAtual := 0;
   vl_ultima_venda := 0;

 Try
  for I := 3 to Pred(FormProcPlanAcelero.StringGridAcelero.RowCount) do
  Begin

  if I = 0 then
  Continue;

  if Trim(FormProcPlanAcelero.StringGridAcelero.Cells[0,I]) = '' then
  Continue;

    DataModuleConexao.qBuscaRefFipe.SQL.Clear;
    DataModuleConexao.qBuscaRefFipe.SQL.Add('select ref1 , ref2, ref3, principal from tbfiperef');
    DataModuleConexao.qBuscaRefFipe.Open;

    Principal := DataModuleConexao.qBuscaRefFipe.FieldByName('principal').Text;
    Ref1      := DataModuleConexao.qBuscaRefFipe.FieldByName('ref1').Text;
    Ref2      := DataModuleConexao.qBuscaRefFipe.FieldByName('ref2').Text;
    Ref3      := DataModuleConexao.qBuscaRefFipe.FieldByName('ref3').Text;

    if ref1 <> Principal then
    Begin

      ref1 := DataModuleConexao.qBuscaRefFipe.FieldByName('principal').Text;
      Ref2 := DataModuleConexao.qBuscaRefFipe.FieldByName('ref1').Text;
      ref3 := DataModuleConexao.qBuscaRefFipe.FieldByName('ref2').Text;

    End;

    // Verifica modelo na conciliação de mod x fipe
    QConcFIPE.SQL.Clear;
    QConcFIPE.SQL.Add('select count(vlr_fipe) as existe from TBCONCFIPEMODELO where modelo = :mod AND ANO=:ANO and fornecedor = ''LM''');
    QConcFIPE.SQL.Add('and ref_fipe=:ref');
    QConcFIPE.ParamByName('mod').Text := FormProcPlanAcelero.StringGridAcelero.Cells[2,I];
    QConcFIPE.ParamByName('ANO').Text := FormProcPlanAcelero.StringGridAcelero.Cells[4,I];
    QConcFIPE.ParamByName('ref').Text := principal;
    QConcFIPE.Open;

     if QConcFIPE.FieldByName('existe').AsInteger = 0 then
     Begin
      MessageDlg('Não foi encontrada vinculação de FIPE para o modelo, efetue-a.'+#13+
               'Modelo: '+FormProcPlanAcelero.StringGridAcelero.Cells[2,I], mtWarning, [mbok], 0);

      FormConciliacaoFipeModelo.EditModeloFIPE.Text := Copy(FormProcPlanAcelero.StringGridAcelero.Cells[2,I], 0, 10);
      FormConciliacaoFipeModelo.Position := poScreenCenter;
      FormConciliacaoFipeModelo.lblModeloPlan.Caption := FormProcPlanAcelero.StringGridAcelero.Cells[2,I];
      FormConciliacaoFipeModelo.EditAnoFIPE.Text := FormProcPlanAcelero.StringGridAcelero.Cells[4,I];
      FormConciliacaoFipeModelo.lblFornecedor.Caption := 'LM';

      FormConciliacaoFipeModelo.ShowModal;
     End;

      // Carrega cod_fipe da conciliação
     QBuscaMescla.SQL.Clear;
     QBuscaMescla.SQL.Add('select cod_fipe, VLR_FIPE from TBCONCFIPEMODELO where modelo=:mod and fornecedor = ''LM''');
     QBuscaMescla.SQL.Add('and ANO=:ano');
     QBuscaMescla.SQL.Add('and ref_fipe=:ref');
     QBuscaMescla.ParamByName('ano').Text := FormProcPlanAcelero.StringGridAcelero.Cells[4,I];
     QBuscaMescla.ParamByName('mod').Text := FormProcPlanAcelero.StringGridAcelero.Cells[2,I];
     QBuscaMescla.ParamByName('ref').Text := Principal;
     QBuscaMescla.Open;

     if not QBuscaMescla.IsEmpty then
     Begin
         //ShowMessage('Vai buscar venda 30d');
          cod_fipe := QBuscaMescla.FieldByName('cod_fipe').Text;
         // Carrega vendas dos ultimos 30 dias
         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select COUNT(*) as vnd from IMPORTASAVANNAVENDA30DIAS');
         QSavannaLocal.SQL.Add('where FIPE = :fipe and ano=:ANO');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := FormProcPlanAcelero.StringGridAcelero.Cells[4,I];
         QSavannaLocal.Open;

         //ShowMessage('Buscou venda 30d');

         Application.ProcessMessages;

         if not QSavannaLocal.FieldByName('vnd').IsNull then
         vendas30dias := QSavannaLocal.FieldByName('vnd').AsInteger
         Else
         vendas30dias := 0;

         // Carrega ultimo vlr de venda
         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select valor, data from IMPORTASAVANNAULTIMASVENDAS');
         QSavannaLocal.SQL.Add('where FIPE = :fipe and ano=:ano');
         QSavannaLocal.SQL.Add('order by data desc ');
         QSavannaLocal.SQL.Add('limit 1');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := FormProcPlanAcelero.StringGridAcelero.Cells[4,I];
         QSavannaLocal.Open;

       //ShowMessage('Buscou vlr venda');

         Application.ProcessMessages;

         if QSavannaLocal.FieldByName('valor').AsCurrency <> null then
         vl_ultima_venda := QSavannaLocal.FieldByName('valor').AsCurrency
         Else
         vl_ultima_venda := 0;

         if QSavannaLocal.FieldByName('data').AsDateTime <> null then
         DT_VENDA := QSavannaLocal.FieldByName('data').AsDateTime;

         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select sum(qtd) as  Estoque from IMPORTASAVANNAESTOQUE where FIPE = :fipe and ano=:ano');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := FormProcPlanAcelero.StringGridAcelero.Cells[4,I];
         QSavannaLocal.Open;

          Application.ProcessMessages;

         if not QSavannaLocal.FieldByName('Estoque').IsNull then
         EstoqueAtual := QSavannaLocal.FieldByName('Estoque').AsInteger
         Else
         EstoqueAtual := 0;

     End;

     if Ref2 <> ' ' then
     Begin

       DataModuleConexao.qBuscaFipesRef.SQL.Clear;
       DataModuleConexao.qBuscaFipesRef.SQL.Add('select "'+'ANO'+FormProcPlanAcelero.StringGridAcelero.Cells[4,I]+'" as FIPE from TBFIPE where');
       DataModuleConexao.qBuscaFipesRef.SQL.Add(' "'+'ANO'+FormProcPlanAcelero.StringGridAcelero.Cells[4,I]+'" > 0 and cod_fipe = :codfipe and ref=:ref');
       DataModuleConexao.qBuscaFipesRef.ParamByName('codfipe').text := cod_fipe;
       DataModuleConexao.qBuscaFipesRef.ParamByName('ref').Text := Ref2;
       DataModuleConexao.qBuscaFipesRef.Open;

       ValorRef2 := DataModuleConexao.qBuscaFipesRef.FieldByName('FIPE').AsCurrency;

     End
     Else
     Begin
       ValorRef2 := 0;
     End;

     if Ref3 <> ' ' then
     Begin

       DataModuleConexao.qBuscaFipesRef.SQL.Clear;
       DataModuleConexao.qBuscaFipesRef.SQL.Add('select "'+'ANO'+FormProcPlanAcelero.StringGridAcelero.Cells[4,I]+'" as FIPE from TBFIPE where');
       DataModuleConexao.qBuscaFipesRef.SQL.Add(' "'+'ANO'+FormProcPlanAcelero.StringGridAcelero.Cells[4,I]+'" > 0 and cod_fipe = :codfipe and ref=:ref');
       DataModuleConexao.qBuscaFipesRef.ParamByName('codfipe').text := cod_fipe;
       DataModuleConexao.qBuscaFipesRef.ParamByName('ref').Text := Ref3;
       DataModuleConexao.qBuscaFipesRef.Open;

       ValorRef3 := DataModuleConexao.qBuscaFipesRef.FieldByName('FIPE').AsCurrency;

     End
     Else
     Begin
       ValorRef3 := 0;
     End;


      // funcao de carga de categoria x avaria Neutron

     QBuscaAvaria.SQL.Clear;
     QBuscaAvaria.SQL.Add('select coalesce(avaria,0) as avaria, coalesce(categoria,'' '') as cat  from TBPLANNEUTRON where fornecedor = ''LM'' and placa=:pl');
     QBuscaAvaria.ParamByName('pl').Text := FormProcPlanAcelero.StringGridAcelero.Cells[1,I];
     QBuscaAvaria.Open;

      // Valida placa se ja importou
  QValidaPlacaJaImportada.SQL.Clear;
  QValidaPlacaJaImportada.SQL.Add('select count(*) as Existe from TBPROCPLANS where PLACA=:PLACA and FORNECEDOR=:FOR');
  QValidaPlacaJaImportada.ParamByName('PLACA').Text := FormProcPlanAcelero.StringGridAcelero.Cells[1,I];
  QValidaPlacaJaImportada.ParamByName('FOR').Text := 'LM';
  QValidaPlacaJaImportada.Open;

  if QValidaPlacaJaImportada.FieldByName('Existe').AsInteger > 0 then
   Begin

     // Avarias
     QBuscaAvaria.SQL.Clear;
     QBuscaAvaria.SQL.Add('select coalesce(avaria,0) as avaria, coalesce(categoria,'' '') as cat  from TBPLANNEUTRON where fornecedor = ''LM'' and placa=:pl');
     QBuscaAvaria.ParamByName('pl').Text := FormProcPlanAcelero.StringGridAcelero.Cells[1,I];
     QBuscaAvaria.Open;


       // Carrega cod_fipe da conciliação
     QBuscaMescla.SQL.Clear;
     QBuscaMescla.SQL.Add('select cod_fipe, VLR_FIPE from TBCONCFIPEMODELO where modelo=:mod and fornecedor = ''LM''');
     QBuscaMescla.SQL.Add('and ANO=:ano');
     QBuscaMescla.SQL.Add('and ref_fipe=:ref');
     QBuscaMescla.ParamByName('ano').Text := FormProcPlanAcelero.StringGridAcelero.Cells[4,I];
     QBuscaMescla.ParamByName('mod').Text := FormProcPlanAcelero.StringGridAcelero.Cells[2,I];
     QBuscaMescla.ParamByName('ref').Text := Principal;
     QBuscaMescla.Open;

     if not QBuscaMescla.IsEmpty then
     Begin
         //ShowMessage('Vai buscar venda 30d');
          cod_fipe := QBuscaMescla.FieldByName('cod_fipe').Text;
         // Carrega vendas dos ultimos 30 dias
         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select COUNT(*) as vnd from IMPORTASAVANNAVENDA30DIAS');
         QSavannaLocal.SQL.Add('where FIPE = :fipe and ano=:ANO');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := FormProcPlanAcelero.StringGridAcelero.Cells[4,I];
         QSavannaLocal.Open;

         //ShowMessage('Buscou venda 30d');

         Application.ProcessMessages;

         if not QSavannaLocal.FieldByName('vnd').IsNull then
         vendas30dias := QSavannaLocal.FieldByName('vnd').AsInteger
         Else
         vendas30dias := 0;

         // Carrega ultimo vlr de venda
         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select valor, data from IMPORTASAVANNAULTIMASVENDAS');
         QSavannaLocal.SQL.Add('where FIPE = :fipe and ano=:ano');
         QSavannaLocal.SQL.Add('order by data desc ');
         QSavannaLocal.SQL.Add('limit 1');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := FormProcPlanAcelero.StringGridAcelero.Cells[4,I];
         QSavannaLocal.Open;

       //ShowMessage('Buscou vlr venda');

         Application.ProcessMessages;

         if QSavannaLocal.FieldByName('valor').AsCurrency <> null then
         vl_ultima_venda := QSavannaLocal.FieldByName('valor').AsCurrency
         Else
         vl_ultima_venda := 0;

         if QSavannaLocal.FieldByName('data').AsDateTime <> null then
         DT_VENDA := QSavannaLocal.FieldByName('data').AsDateTime;

         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select sum(qtd) as  Estoque from IMPORTASAVANNAESTOQUE where FIPE = :fipe and ano=:ano');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := FormProcPlanAcelero.StringGridAcelero.Cells[4,I];
         QSavannaLocal.Open;

          Application.ProcessMessages;

         if not QSavannaLocal.FieldByName('Estoque').IsNull then
         EstoqueAtual := QSavannaLocal.FieldByName('Estoque').AsInteger
         Else
         EstoqueAtual := 0;

     End;

     QAtualizaG.SQL.Clear;
     QAtualizaG.SQL.Add('select');
     QAtualizaG.SQL.Add('coalesce(G_ZERO , 0) as G_ZERO, DT_G0');
     QAtualizaG.SQL.Add('from tbprocplans');
     QAtualizaG.SQL.Add('where COD_FIPE = :c_fipe');
     QAtualizaG.SQL.Add('and ANO_MOD = :ano');
     QAtualizaG.SQL.Add('and G_ZERO > 0');
     QAtualizaG.SQL.Add('order by id desc');
     QAtualizaG.SQL.Add('limit 1');
     QAtualizaG.ParamByName('c_fipe').Text := cod_fipe;
     QAtualizaG.ParamByName('ano').Text := modelo;
     QAtualizaG.Open;


     QValidaPlacaJaImportada.SQL.Clear;
     QValidaPlacaJaImportada.SQL.Add('update TBPROCPLANS set');
     QValidaPlacaJaImportada.SQL.Add('km=:km,');
     QValidaPlacaJaImportada.SQL.Add('venda_trinta_dias=:venda_trinta_dias,');
     QValidaPlacaJaImportada.SQL.Add('estoque=:estoque,');
     QValidaPlacaJaImportada.SQL.Add('vlr_ult_venda=:vlr_ult_venda,');
     QValidaPlacaJaImportada.SQL.Add('dt_ult_venda=:dt_ult_venda,');
     QValidaPlacaJaImportada.SQL.Add('categoria=:cat,');
     QValidaPlacaJaImportada.SQL.Add('avaria=:avaria,');
     QValidaPlacaJaImportada.SQL.Add('VLR_MIN_FIPE=:v_m_f,');
     QValidaPlacaJaImportada.SQL.Add('MIN_RESULTADO = RESULTADO - :m,');
     QValidaPlacaJaImportada.SQL.Add('DATA=:dt,');
     QValidaPlacaJaImportada.SQL.Add('onde=:onde,');
     QValidaPlacaJaImportada.SQL.Add('local=:local,');
  	 QValidaPlacaJaImportada.SQL.Add('ULT_G0=:UG0,');
     QValidaPlacaJaImportada.SQL.Add('DT_G0=:DTG0,');
     QValidaPlacaJaImportada.SQL.Add('ref_fipe=:ref, fipe2:=:vlfipe2, ref_fipe2=:ref2, fipe3=:vlfipe3, ref_fipe3=:ref3,');
     QValidaPlacaJaImportada.SQL.Add('vlr_fipe=:fipe, vlr_min=:min, IMPORT_PLANILHA=:PLAN, IMPORT_DATA=:DT, situacao = 0 where PLACA=:PLACA');
     QValidaPlacaJaImportada.ParamByName('PLAN').Text := LblNomeArquivo.Caption;
     QValidaPlacaJaImportada.ParamByName('DT').AsDate := NOW;
     QValidaPlacaJaImportada.ParamByName('ref').Text := Principal;
     QValidaPlacaJaImportada.ParamByName('vlfipe2').AsCurrency := ValorRef2;
     QValidaPlacaJaImportada.ParamByName('ref2').Text := Ref2;
     QValidaPlacaJaImportada.ParamByName('vlfipe3').AsCurrency := ValorRef3;
     QValidaPlacaJaImportada.ParamByName('ref3').Text := Ref3;
     QValidaPlacaJaImportada.ParamByName('placa').Text := FormProcPlanAcelero.StringGridAcelero.Cells[1,I];
     QValidaPlacaJaImportada.ParamByName('km').AsCurrency := StrToCurr(Alltrim(StringReplace(StringReplace(StringReplace(StringReplace(StringReplace(StringReplace(StringReplace(StringReplace(StringReplace(FormProcPlanAcelero.StringGridAcelero.Cells[0,I], 'S/INFO', '0', [rfReplaceAll, rfIgnoreCase]), '.', '', [rfReplaceAll]),'P. QUEBRADO', '0',[rfReplaceAll]), 'P  QUEBRADO', '0', [rfReplaceAll]),'P QUEBRADO', '0', [rfReplaceAll]), 'PAINEL APAGADO', '0', [rfReplaceAll]),' ','0', [rfReplaceAll]), ',', '', [rfReplaceAll]),'#N/D', '0', [rfReplaceAll]) ));
     QValidaPlacaJaImportada.ParamByName('dt_ult_venda').AsDate := DT_VENDA;
     QValidaPlacaJaImportada.ParamByName('fipe').AsCurrency := QBuscaMescla.FieldByName('VLR_FIPE').AsCurrency;
     QValidaPlacaJaImportada.ParamByName('venda_trinta_dias').AsInteger := vendas30dias;
     QValidaPlacaJaImportada.ParamByName('estoque').AsInteger := EstoqueAtual;
     QValidaPlacaJaImportada.ParamByName('vlr_ult_venda').AsCurrency := vl_ultima_venda;
     QValidaPlacaJaImportada.ParamByName('dt').AsDate := NOW;
     QValidaPlacaJaImportada.ParamByName('min').AsCurrency := StrToCurr(FormProcPlanAcelero.StringGridAcelero.Cells[6,I]);
     QValidaPlacaJaImportada.ParamByName('m').AsCurrency := StrToCurr(FormProcPlanAcelero.StringGridAcelero.Cells[6,I]);
     QValidaPlacaJaImportada.ParamByName('v_m_f').AsCurrency := QBuscaMescla.FieldByName('VLR_FIPE').AsCurrency - StrToCurr(FormProcPlanAcelero.StringGridAcelero.Cells[6,I]);
     QValidaPlacaJaImportada.ParamByName('onde').Text :=  StringReplace(FormProcPlanAcelero.StringGridAcelero.Cells[7,I],'#N/D','NADA INFORMADO', [rfReplaceAll]);
     QValidaPlacaJaImportada.ParamByName('local').Text := StringReplace(FormProcPlanAcelero.StringGridAcelero.Cells[8  ,I], '#N/D', ' ', [rfReplaceAll]);
     QValidaPlacaJaImportada.ParamByName('cat').Text := QBuscaAvaria.FieldByName('cat').Text;
     if QBuscaAvaria.FieldByName('avaria').AsCurrency > 0 then
     QValidaPlacaJaImportada.ParamByName('avaria').AsCurrency := QBuscaAvaria.FieldByName('avaria').AsCurrency
     Else
     QValidaPlacaJaImportada.ParamByName('avaria').AsCurrency := 0;
     if QAtualizaG.FieldByName('G_ZERO').AsFloat > 0 then
     QValidaPlacaJaImportada.ParamByName('UG0').AsFloat := QAtualizaG.FieldByName('G_ZERO').AsFloat
     Else
     QValidaPlacaJaImportada.ParamByName('UG0').AsFloat := 0;
     if QAtualizaG.FieldByName('DT_G0').AsDateTime <> null then
     QValidaPlacaJaImportada.ParamByName('DTG0').AsDate := QAtualizaG.FieldByName('DT_G0').AsDateTime
     Else
     QValidaPlacaJaImportada.ParamByName('DTG0').AsDate := null;
     QValidaPlacaJaImportada.Execute;

     FormLoading.LabelStatus.Caption := 'Atualizando planilha LM PLACA: '+FormProcPlanAcelero.StringGridAcelero.Cells[1,I];
   End
   Else
   Begin

     QAtualizaG.SQL.Clear;
     QAtualizaG.SQL.Add('select');
     QAtualizaG.SQL.Add('coalesce(G_ZERO , 0) as G_ZERO, DT_G0');
     QAtualizaG.SQL.Add('from tbprocplans');
     QAtualizaG.SQL.Add('where COD_FIPE = :c_fipe');
     QAtualizaG.SQL.Add('and ANO_MOD = :ano');
     QAtualizaG.SQL.Add('and G_ZERO > 0');
     QAtualizaG.SQL.Add('order by id desc');
     QAtualizaG.SQL.Add('limit 1');
     QAtualizaG.ParamByName('c_fipe').Text := cod_fipe;
     QAtualizaG.ParamByName('ano').Text := modelo;
     QAtualizaG.Open;

   QInsereDados.SQL.Clear;
   QInsereDados.SQL.Add('insert into TBPROCPLANS');
   QInsereDados.SQL.Add('( licitacao, lote, placa, modelo, km, ano, ano_mod, cor, vlr_min,');
   QInsereDados.SQL.Add('  vlr_min_fipe, vlr_min_dois, compra_ja, vlr_fipe, vlr_merc_um, vlr_merc_dois,');
   QInsereDados.SQL.Add('  venda_trinta_dias, estoque, vlr_ult_venda, dt_ult_venda, atacado_varejo, categoria, g_zero,');
   QInsereDados.SQL.Add(' mg, avaria, resultado, min_resultado, lance, lance_fipe, compra, sn,');
   QInsereDados.SQL.Add('  dt_pgto, qtd, fornecedor, id_plan_for, cod_fipe, situacao, data, onde, local, ULT_G0, DT_G0, IMPORT_PLANILHA, IMPORT_DATA, IMPORT_STATUS, ref_fipe, fipe2, ref_fipe2, fipe3, ref_fipe3)');
   QInsereDados.SQL.Add('values');
   QInsereDados.SQL.Add('(:licitacao, :lote, :placa, :modelo, :km, :ano, :anomod, :cor, :vlr_min,');
   QInsereDados.SQL.Add(':vlr_min_fipe, :vlr_min_dois, :compra_ja, :fipe, :vlr_m_um, :vlr_m_dois,');
   QInsereDados.SQL.Add(':venda_trinta_dias, :estoque, :vlr_ult_venda, :dt_venda, :ata_var, :cat, :gzero,');
   QInsereDados.SQL.Add(':mg, :avaria, :result, :min_result, :lance, :lance_fipe, :compra, :sn, :dt_pgto,');
   QInsereDados.SQL.Add(':qtd, :fornecedor, :id_plan, :c_fipe, :sit, :dt, :onde, :local, :UG0, :DTG0, :PLANILHA, :DT_PLANILHA, :STATUS_PLANILHA, :ref, :vlfipe2, :ref2, :vlfipe3, :ref3)');
   QInsereDados.ParamByName('PLANILHA').Text := LblNomeArquivo.Caption;
   QInsereDados.ParamByName('DT_PLANILHA').AsDate := NOW;
   QInsereDados.ParamByName('STATUS_PLANILHA').Text := 'Em Analise';
   QInsereDados.ParamByName('licitacao').Text := '';
   QInsereDados.ParamByName('lote').Text := '';
   QInsereDados.ParamByName('ref').Text := Principal;
   QInsereDados.ParamByName('vlfipe2').AsCurrency := ValorRef2;
   QInsereDados.ParamByName('ref2').Text := Ref2;
   QInsereDados.ParamByName('vlfipe3').AsCurrency := ValorRef3;
   QInsereDados.ParamByName('ref3').Text := Ref3;
   QInsereDados.ParamByName('placa').Text := FormProcPlanAcelero.StringGridAcelero.Cells[1,I];
   QInsereDados.ParamByName('modelo').Text := FormProcPlanAcelero.StringGridAcelero.Cells[2,I];
   QInsereDados.ParamByName('km').AsCurrency := StrToCurr(Alltrim(StringReplace(StringReplace(StringReplace(StringReplace(StringReplace(StringReplace(StringReplace(StringReplace(StringReplace(FormProcPlanAcelero.StringGridAcelero.Cells[0,I], 'S/INFO', '0', [rfReplaceAll, rfIgnoreCase]), '.', '', [rfReplaceAll]),'P. QUEBRADO', '0',[rfReplaceAll]), 'P  QUEBRADO', '0', [rfReplaceAll]),'P QUEBRADO', '0', [rfReplaceAll]), 'PAINEL APAGADO', '0', [rfReplaceAll]),' ','0', [rfReplaceAll]), ',', '', [rfReplaceAll]),'#N/D', '0', [rfReplaceAll]) ));
   QInsereDados.ParamByName('ano').Text := FormProcPlanAcelero.StringGridAcelero.Cells[3,I];
   QInsereDados.ParamByName('dt_venda').AsDate := DT_VENDA;
   QInsereDados.ParamByName('anomod').Text := FormProcPlanAcelero.StringGridAcelero.Cells[4,I];
   QInsereDados.ParamByName('cor').Text := FormProcPlanAcelero.StringGridAcelero.Cells[5,I];
   QInsereDados.ParamByName('vlr_min').AsCurrency := StrToCurr(FormProcPlanAcelero.StringGridAcelero.Cells[6,I]);
   QInsereDados.ParamByName('vlr_min_fipe').AsCurrency := QBuscaMescla.FieldByName('VLR_FIPE').AsCurrency - StrToCurr(FormProcPlanAcelero.StringGridAcelero.Cells[6,I]);
   QInsereDados.ParamByName('vlr_min_dois').AsCurrency := 0;
   QInsereDados.ParamByName('compra_ja').AsCurrency := 0;
   QInsereDados.ParamByName('fipe').AsCurrency := QBuscaMescla.FieldByName('VLR_FIPE').AsCurrency;
   QInsereDados.ParamByName('vlr_m_um').AsCurrency := 0;
   QInsereDados.ParamByName('vlr_m_dois').AsCurrency := 0;
   QInsereDados.ParamByName('venda_trinta_dias').AsInteger := vendas30dias;
   QInsereDados.ParamByName('estoque').AsInteger := EstoqueAtual;
   QInsereDados.ParamByName('vlr_ult_venda').AsCurrency := vl_ultima_venda;
   QInsereDados.ParamByName('ata_var').Text := '';
   QInsereDados.ParamByName('gzero').AsCurrency := 0;
   QInsereDados.ParamByName('mg').AsCurrency :=  Margem;;
   QInsereDados.ParamByName('c_fipe').Text := cod_fipe;
   QInsereDados.ParamByName('sit').AsInteger := 0;
   QInsereDados.ParamByName('dt').AsDate := NOW;
   QInsereDados.ParamByName('onde').Text :=  StringReplace(FormProcPlanAcelero.StringGridAcelero.Cells[7,I], '#N/D', ' ', [rfReplaceAll]);
   QInsereDados.ParamByName('local').Text := StringReplace(FormProcPlanAcelero.StringGridAcelero.Cells[8,I],'#N/D','NADA INFORMADO', [rfReplaceAll]);
   QInsereDados.ParamByName('fornecedor').Text := 'LM';
   QInsereDados.ParamByName('cat').Text := QBuscaAvaria.FieldByName('cat').Text;
   if QBuscaAvaria.FieldByName('avaria').AsCurrency > 0 then
   QInsereDados.ParamByName('avaria').AsCurrency := QBuscaAvaria.FieldByName('avaria').AsCurrency
   Else
   QInsereDados.ParamByName('avaria').AsCurrency := 0;
     if QAtualizaG.FieldByName('G_ZERO').AsFloat > 0 then
     QInsereDados.ParamByName('UG0').AsFloat := QAtualizaG.FieldByName('G_ZERO').AsFloat
     Else
     QInsereDados.ParamByName('UG0').AsFloat := 0;
     if QAtualizaG.FieldByName('DT_G0').AsDateTime <> null then
     QInsereDados.ParamByName('DTG0').AsDate := QAtualizaG.FieldByName('DT_G0').AsDateTime
     Else
     QInsereDados.ParamByName('DTG0').AsDate := null;
   QInsereDados.Execute;

    FormLoading.LabelStatus.Caption := 'Importando planilha LM PLACA: '+FormProcPlanAcelero.StringGridAcelero.Cells[1,I];

    Application.ProcessMessages;
   End;


  End;
 Finally

 End;
   MessageDlg('Importação finalizada', mtInformation, [mbok], 0);
end;

procedure TFormNovoProcessamento.ImportaPlanLOCALIZA;
Var
  I, Qtd, vendas30dias, EstoqueAtual, QtdLinhas: integer;
  modelo, cod_fipe : string;
  vl_ultima_venda : Currency;
  DT_VENDA : TDate;
  Cidade, Endereco : String;
  KM : Double;
 Begin

 Try
  for I := 0 to Pred(FormProcPlanAcelero.StringGridAcelero.RowCount) do
  Begin

  if I = 0 then
  Continue;

  if Trim(FormProcPlanAcelero.StringGridAcelero.Cells[0,I]) = '' then
  Continue;

   ValorRef2 := 0;
   ValorRef3 := 0;

   //ShowMessage('Vai verificar fipe');

    DataModuleConexao.qBuscaRefFipe.SQL.Clear;
    DataModuleConexao.qBuscaRefFipe.SQL.Add('select ref1 , ref2, ref3, principal from tbfiperef');
    DataModuleConexao.qBuscaRefFipe.Open;

    Principal := DataModuleConexao.qBuscaRefFipe.FieldByName('principal').Text;
    Ref1      := DataModuleConexao.qBuscaRefFipe.FieldByName('ref1').Text;
    Ref2      := DataModuleConexao.qBuscaRefFipe.FieldByName('ref2').Text;
    Ref3      := DataModuleConexao.qBuscaRefFipe.FieldByName('ref3').Text;


    if ref1 <> Principal then
    Begin

      ref1 := DataModuleConexao.qBuscaRefFipe.FieldByName('principal').Text;
      Ref2 := DataModuleConexao.qBuscaRefFipe.FieldByName('ref1').Text;
      ref3 := DataModuleConexao.qBuscaRefFipe.FieldByName('ref2').Text;

    End;

    Application.ProcessMessages;

    // Verifica modelo na conciliação de mod x fipe
    QConcFIPE.SQL.Clear;
    QConcFIPE.SQL.Add('select count(*) as Existe from TBCONCFIPEMODELO where modelo = :mod and ANO=:ANO and fornecedor = ''LOCALIZA'' ');
    QConcFIPE.SQL.Add('and ref_fipe=:ref');
    QConcFIPE.ParamByName('mod').Text := FormProcPlanAcelero.StringGridAcelero.Cells[1,I];
    QConcFIPE.ParamByName('ANO').Text := FormProcPlanAcelero.StringGridAcelero.Cells[2,I];
    QConcFIPE.ParamByName('ref').Text := Principal;
    QConcFIPE.Open;

     if QConcFIPE.FieldByName('Existe').AsInteger <= 0 then
     Begin
      MessageDlg('Não foi encontrada vinculação de FIPE para o modelo, efetue-a.'+#13+
               'Modelo: '+FormProcPlanAcelero.StringGridAcelero.Cells[1,I], mtWarning, [mbok], 0);

      FormConciliacaoFipeModelo.EditModeloFIPE.Text := Copy(FormProcPlanAcelero.StringGridAcelero.Cells[1,I], 0, 10);
      FormConciliacaoFipeModelo.Position := poScreenCenter;
      FormConciliacaoFipeModelo.lblModeloPlan.Caption := FormProcPlanAcelero.StringGridAcelero.Cells[1,I];
      FormConciliacaoFipeModelo.EditAnoFIPE.Text := FormProcPlanAcelero.StringGridAcelero.Cells[2,I];
      FormConciliacaoFipeModelo.lblFornecedor.Caption := 'LOCALIZA';

      FormConciliacaoFipeModelo.ShowModal;
     End;

     Application.ProcessMessages;

      // Carrega cod_fipe da conciliação
     QBuscaMescla.SQL.Clear;
     QBuscaMescla.SQL.Add('select cod_fipe, VLR_FIPE from TBCONCFIPEMODELO where modelo=:mod and fornecedor = ''LOCALIZA''');
     QBuscaMescla.SQL.Add('and ANO=:ano');
     QBuscaMescla.SQL.Add('and ref_fipe=:ref');
     QBuscaMescla.ParamByName('ano').Text := FormProcPlanAcelero.StringGridAcelero.Cells[2,I];
     QBuscaMescla.ParamByName('mod').Text := FormProcPlanAcelero.StringGridAcelero.Cells[1,I];
     QBuscaMescla.ParamByName('ref').Text := principal;
     QBuscaMescla.Open;

     DataModuleConexao.qBuscaFipesRef.SQL.Clear;
     DataModuleConexao.qBuscaFipesRef.SQL.Add('select "'+'ANO'+FormProcPlanAcelero.StringGridAcelero.Cells[2,I]+'" as FIPE from TBFIPE where');
     DataModuleConexao.qBuscaFipesRef.SQL.Add(' "'+'ANO'+FormProcPlanAcelero.StringGridAcelero.Cells[2,I]+'" > 0 and cod_fipe = :codfipe and ref=:ref');
     DataModuleConexao.qBuscaFipesRef.ParamByName('codfipe').text := QBuscaMescla.FieldByName('cod_fipe').Text;
     DataModuleConexao.qBuscaFipesRef.ParamByName('ref').Text := Ref2;
     DataModuleConexao.qBuscaFipesRef.Open;

     ValorRef2 := DataModuleConexao.qBuscaFipesRef.FieldByName('FIPE').AsCurrency;

     DataModuleConexao.qBuscaFipesRef.SQL.Clear;
     DataModuleConexao.qBuscaFipesRef.SQL.Add('select "'+'ANO'+FormProcPlanAcelero.StringGridAcelero.Cells[2,I]+'" as FIPE from TBFIPE where');
     DataModuleConexao.qBuscaFipesRef.SQL.Add(' "'+'ANO'+FormProcPlanAcelero.StringGridAcelero.Cells[2,I]+'" > 0 and cod_fipe = :codfipe and ref=:ref');
     DataModuleConexao.qBuscaFipesRef.ParamByName('codfipe').text := QBuscaMescla.FieldByName('cod_fipe').Text;
     DataModuleConexao.qBuscaFipesRef.ParamByName('ref').Text := Ref3;
     DataModuleConexao.qBuscaFipesRef.Open;

     ValorRef3 := DataModuleConexao.qBuscaFipesRef.FieldByName('FIPE').AsCurrency;

          // Valida placa se ja importou
      QValidaPlacaJaImportada.SQL.Clear;
      QValidaPlacaJaImportada.SQL.Add('select count(*) as Existe from TBPROCPLANS where PLACA=:PLACA and FORNECEDOR=:FOR');
      QValidaPlacaJaImportada.ParamByName('PLACA').Text := FormProcPlanAcelero.StringGridAcelero.Cells[0,I];
      QValidaPlacaJaImportada.ParamByName('FOR').Text := 'LOCALIZA';
      QValidaPlacaJaImportada.Open;

   {   ShowMessage(Principal + ' - ' + CurrToStr(QBuscaMescla.FieldByName('VLR_FIPE').AsCurrency ) + #13 +
                  Ref2 + ' - ' + CurrToStr(ValorRef2) + #13 +
                  Ref3 + ' - ' + CurrToStr(ValorRef3));  }

      Application.ProcessMessages;

  if QValidaPlacaJaImportada.FieldByName('Existe').AsInteger > 0 then
   Begin

     QAtualizaG.SQL.Clear;
     QAtualizaG.SQL.Add('select');
     QAtualizaG.SQL.Add('coalesce(G_ZERO , 0) as G_ZERO, DT_G0');
     QAtualizaG.SQL.Add('from tbprocplans');
     QAtualizaG.SQL.Add('where COD_FIPE = :c_fipe');
     QAtualizaG.SQL.Add('and ANO_MOD = :ano');
     QAtualizaG.SQL.Add('and G_ZERO > 0');
     QAtualizaG.SQL.Add('order by id desc');
     QAtualizaG.SQL.Add('limit 1');
     QAtualizaG.ParamByName('c_fipe').Text := cod_fipe;
     QAtualizaG.ParamByName('ano').Text := modelo;
     QAtualizaG.Open;


     QValidaPlacaJaImportada.SQL.Clear;
     QValidaPlacaJaImportada.SQL.Add('update TBPROCPLANS set');
     QValidaPlacaJaImportada.SQL.Add('vlr_min=:vlr_min,');
     QValidaPlacaJaImportada.SQL.Add('km=:km,');
     QValidaPlacaJaImportada.SQL.Add('venda_trinta_dias=:venda_trinta_dias,');
     QValidaPlacaJaImportada.SQL.Add('estoque=:estoque,');
     QValidaPlacaJaImportada.SQL.Add('vlr_ult_venda=:vlr_ult_venda,');
     QValidaPlacaJaImportada.SQL.Add('dt_ult_venda=:dt_ult_venda,');
     QValidaPlacaJaImportada.SQL.Add('categoria=:cat,');
     QValidaPlacaJaImportada.SQL.Add('avaria=:avaria,');
     QValidaPlacaJaImportada.SQL.Add('DATA=:dt,');
     QValidaPlacaJaImportada.SQL.Add('ref_fipe=:ref, fipe2:=:vlfipe2, ref_fipe2=:ref2, fipe3=:vlfipe3, ref_fipe3=:ref3,');
     QValidaPlacaJaImportada.SQL.Add('onde=:onde,');
     QValidaPlacaJaImportada.SQL.Add('local=:local,');
     QValidaPlacaJaImportada.SQL.Add('VLR_MIN_FIPE=:v_m_f,');
     QValidaPlacaJaImportada.SQL.Add('MIN_RESULTADO = RESULTADO - :m,');
   	 QValidaPlacaJaImportada.SQL.Add('ULT_G0=:UG0,');
     QValidaPlacaJaImportada.SQL.Add('DT_G0=:DTG0,');
     QValidaPlacaJaImportada.SQL.Add('vlr_fipe=:fipe, cod_fipe=:codfipe, IMPORT_PLANILHA=:PLAN, IMPORT_DATA=:DT, situacao = 0 where PLACA=:PLACA');
     QValidaPlacaJaImportada.ParamByName('PLAN').Text := LblNomeArquivo.Caption;
     QValidaPlacaJaImportada.ParamByName('DT').AsDate := NOW;
     if FormProcPlanAcelero.StringGridAcelero.Cells[8,I] = null  then
      QValidaPlacaJaImportada.ParamByName('m').AsCurrency := 0
     Else
     if FormProcPlanAcelero.StringGridAcelero.Cells[7,I] = '' then
      QValidaPlacaJaImportada.ParamByName('m').AsCurrency := 0
     Else
     QValidaPlacaJaImportada.ParamByName('m').AsCurrency := StrToCurr(StringReplace(StringReplace(FormProcPlanAcelero.StringGridAcelero.Cells[7,I], '#N/D', ' ', [rfReplaceAll]),'', '0,00',[rfReplaceAll]));
     if FormProcPlanAcelero.StringGridAcelero.Cells[7,I] = null  then
      QValidaPlacaJaImportada.ParamByName('v_m_f').AsCurrency := QBuscaMescla.FieldByName('VLR_FIPE').AsCurrency - 0
     Else
      if FormProcPlanAcelero.StringGridAcelero.Cells[7,I] = '' then
     QValidaPlacaJaImportada.ParamByName('v_m_f').AsCurrency := QBuscaMescla.FieldByName('VLR_FIPE').AsCurrency - 0
     Else
     QValidaPlacaJaImportada.ParamByName('v_m_f').AsCurrency := QBuscaMescla.FieldByName('VLR_FIPE').AsCurrency - StrToCurr(StringReplace(StringReplace(FormProcPlanAcelero.StringGridAcelero.Cells[7,I], '#N/D', ' ', [rfReplaceAll]),'', '0,00',[rfReplaceAll]));
     QValidaPlacaJaImportada.ParamByName('placa').Text := FormProcPlanAcelero.StringGridAcelero.Cells[0,I];
     QValidaPlacaJaImportada.ParamByName('km').AsCurrency := StrToCurr(Alltrim(StringReplace(StringReplace(StringReplace(StringReplace(StringReplace(StringReplace(StringReplace(StringReplace(StringReplace(FormProcPlanAcelero.StringGridAcelero.Cells[4,I], 'S/INFO', '0', [rfReplaceAll, rfIgnoreCase]), '.', '', [rfReplaceAll]),'P. QUEBRADO', '0',[rfReplaceAll]), 'P  QUEBRADO', '0', [rfReplaceAll]),'P QUEBRADO', '0', [rfReplaceAll]), 'PAINEL APAGADO', '0', [rfReplaceAll]),' ','0', [rfReplaceAll]), ',', '', [rfReplaceAll]),'#N/D', '0', [rfReplaceAll]) ));
     QValidaPlacaJaImportada.ParamByName('dt_ult_venda').AsDate := DT_VENDA;
     if FormProcPlanAcelero.StringGridAcelero.Cells[7,I] = null  then
      QValidaPlacaJaImportada.ParamByName('vlr_min').AsCurrency :=0
     Else
     if FormProcPlanAcelero.StringGridAcelero.Cells[7,I] = '' then
      QValidaPlacaJaImportada.ParamByName('vlr_min').AsCurrency :=0
     Else
     QValidaPlacaJaImportada.ParamByName('vlr_min').AsCurrency := StrToCurr(StringReplace(StringReplace(FormProcPlanAcelero.StringGridAcelero.Cells[7,I], '#N/D', ' ', [rfReplaceAll]),'', '0,00',[rfReplaceAll]));
     QValidaPlacaJaImportada.ParamByName('fipe').AsCurrency := QBuscaMescla.FieldByName('VLR_FIPE').AsCurrency;
     QValidaPlacaJaImportada.ParamByName('codfipe').Text := QBuscaMescla.FieldByName('cod_fipe').Text;
     QValidaPlacaJaImportada.ParamByName('venda_trinta_dias').AsInteger := vendas30dias;
     QValidaPlacaJaImportada.ParamByName('estoque').AsInteger := EstoqueAtual;
     QValidaPlacaJaImportada.ParamByName('vlr_ult_venda').AsCurrency := vl_ultima_venda;
     QValidaPlacaJaImportada.ParamByName('dt').AsDate := NOW;
     QValidaPlacaJaImportada.ParamByName('ref').Text := Principal;
     QValidaPlacaJaImportada.ParamByName('vlfipe2').AsCurrency := ValorRef2;
     QValidaPlacaJaImportada.ParamByName('ref2').Text := Ref2;
     QValidaPlacaJaImportada.ParamByName('vlfipe3').AsCurrency := ValorRef3;
     QValidaPlacaJaImportada.ParamByName('ref3').Text := Ref3;
     QValidaPlacaJaImportada.ParamByName('onde').Text :=  StringReplace(FormProcPlanAcelero.StringGridAcelero.Cells[8,I], '#N/D', ' ', [rfReplaceAll]);
     QValidaPlacaJaImportada.ParamByName('local').Text := StringReplace(FormProcPlanAcelero.StringGridAcelero.Cells[8,I], '#N/D', ' ', [rfReplaceAll]);
     QValidaPlacaJaImportada.ParamByName('cat').Text := '';
     QValidaPlacaJaImportada.ParamByName('avaria').AsCurrency := 0;
     if QAtualizaG.FieldByName('G_ZERO').AsFloat > 0 then
     QValidaPlacaJaImportada.ParamByName('UG0').AsFloat := QAtualizaG.FieldByName('G_ZERO').AsFloat
     Else
     QValidaPlacaJaImportada.ParamByName('UG0').AsFloat := 0;
     if QAtualizaG.FieldByName('DT_G0').AsDateTime <> null then
     QValidaPlacaJaImportada.ParamByName('DTG0').AsDate := QAtualizaG.FieldByName('DT_G0').AsDateTime
     Else
     QValidaPlacaJaImportada.ParamByName('DTG0').AsDate := null;
     QValidaPlacaJaImportada.Execute;

     Application.ProcessMessages;

     FormLoading.LabelStatus.Caption := 'Atualizando planilha LOCALIZA PLACA: '+FormProcPlanAcelero.StringGridAcelero.Cells[0,I];

   End
   Else
   Begin

     QAtualizaG.SQL.Clear;
     QAtualizaG.SQL.Add('select');
     QAtualizaG.SQL.Add('coalesce(G_ZERO , 0) as G_ZERO, DT_G0');
     QAtualizaG.SQL.Add('from tbprocplans');
     QAtualizaG.SQL.Add('where COD_FIPE = :c_fipe');
     QAtualizaG.SQL.Add('and ANO_MOD = :ano');
     QAtualizaG.SQL.Add('and G_ZERO > 0');
     QAtualizaG.SQL.Add('order by id desc');
     QAtualizaG.SQL.Add('limit 1');
     QAtualizaG.ParamByName('c_fipe').Text := cod_fipe;
     QAtualizaG.ParamByName('ano').Text := modelo;
     QAtualizaG.Open;



   QInsereDados.SQL.Clear;
   QInsereDados.SQL.Add('insert into TBPROCPLANS');
   QInsereDados.SQL.Add('( licitacao, lote, placa, modelo, km, ano, ano_mod, cor, vlr_min,');
   QInsereDados.SQL.Add('  vlr_min_fipe, vlr_min_dois, compra_ja, vlr_fipe, vlr_merc_um, vlr_merc_dois,');
   QInsereDados.SQL.Add('  venda_trinta_dias, estoque, vlr_ult_venda, dt_ult_venda, atacado_varejo, categoria, g_zero,');
   QInsereDados.SQL.Add(' mg, avaria, resultado, min_resultado, lance, lance_fipe, compra, sn,');
   QInsereDados.SQL.Add('  dt_pgto, qtd, fornecedor, id_plan_for, cod_fipe, situacao, data, onde, local, ULT_G0, DT_G0, IMPORT_PLANILHA, IMPORT_DATA, IMPORT_STATUS, ref_fipe, fipe2, ref_fipe2, fipe3, ref_fipe3)');
   QInsereDados.SQL.Add('values');
   QInsereDados.SQL.Add('(:licitacao, :lote, :placa, :modelo, :km, :ano, :anomod, :cor, :vlr_min,');
   QInsereDados.SQL.Add(':vlr_min_fipe, :vlr_min_dois, :compra_ja, :fipe, :vlr_m_um, :vlr_m_dois,');
   QInsereDados.SQL.Add(':venda_trinta_dias, :estoque, :vlr_ult_venda, :dt_venda, :ata_var, :cat, :gzero,');
   QInsereDados.SQL.Add(':mg, :avaria, :result, :min_result, :lance, :lance_fipe, :compra, :sn, :dt_pgto,');
   QInsereDados.SQL.Add(':qtd, :fornecedor, :id_plan, :c_fipe, :sit, :dt, :onde, :local, :UG0, :DTG0, :PLANILHA, :DT_PLANILHA, :STATUS_PLANILHA, :ref, :vlfipe2, :ref2, :vlfipe3, :ref3)');
   QInsereDados.ParamByName('PLANILHA').Text := LblNomeArquivo.Caption;
   QInsereDados.ParamByName('DT_PLANILHA').AsDate := NOW;
   QInsereDados.ParamByName('STATUS_PLANILHA').Text := 'Em Analise';
   QInsereDados.ParamByName('licitacao').Text := '';
   QInsereDados.ParamByName('lote').Text := '';
   QInsereDados.ParamByName('ref').Text := Principal;
   QInsereDados.ParamByName('vlfipe2').AsCurrency := ValorRef2;
   QInsereDados.ParamByName('ref2').Text := Ref2;
   QInsereDados.ParamByName('vlfipe3').AsCurrency := ValorRef3;
   QInsereDados.ParamByName('ref3').Text := Ref3;
   QInsereDados.ParamByName('placa').Text := FormProcPlanAcelero.StringGridAcelero.Cells[0,I];
   QInsereDados.ParamByName('modelo').Text := FormProcPlanAcelero.StringGridAcelero.Cells[1,I];
   QInsereDados.ParamByName('km').AsCurrency := StrToCurr(Alltrim(StringReplace(StringReplace(StringReplace(StringReplace(StringReplace(StringReplace(StringReplace(StringReplace(StringReplace(FormProcPlanAcelero.StringGridAcelero.Cells[4,I], 'S/INFO', '0', [rfReplaceAll, rfIgnoreCase]), '.', '', [rfReplaceAll]),'P. QUEBRADO', '0',[rfReplaceAll]), 'P  QUEBRADO', '0', [rfReplaceAll]),'P QUEBRADO', '0', [rfReplaceAll]), 'PAINEL APAGADO', '0', [rfReplaceAll]),' ','0', [rfReplaceAll]), ',', '', [rfReplaceAll]),'#N/D', '0', [rfReplaceAll]) ));
   QInsereDados.ParamByName('ano').Text := FormProcPlanAcelero.StringGridAcelero.Cells[3,I];
   QInsereDados.ParamByName('dt_venda').AsDate := DT_VENDA;
   QInsereDados.ParamByName('anomod').Text := FormProcPlanAcelero.StringGridAcelero.Cells[2,I];
   QInsereDados.ParamByName('cor').Text := FormProcPlanAcelero.StringGridAcelero.Cells[5,I];
   if FormProcPlanAcelero.StringGridAcelero.Cells[7,I] = null then
   QInsereDados.ParamByName('vlr_min').AsCurrency := 0
   Else
   if FormProcPlanAcelero.StringGridAcelero.Cells[7,I] = '' then
   QInsereDados.ParamByName('vlr_min').AsCurrency := 0
   Else
   QInsereDados.ParamByName('vlr_min').AsCurrency := StrToCurr(StringReplace(StringReplace(FormProcPlanAcelero.StringGridAcelero.Cells[7,I], '#N/D', ' ', [rfReplaceAll]),'', '0,00',[rfReplaceAll]));
   if FormProcPlanAcelero.StringGridAcelero.Cells[7,I] = null then
   QInsereDados.ParamByName('vlr_min_fipe').AsCurrency := QBuscaMescla.FieldByName('VLR_FIPE').AsCurrency -  0
   Else
   if FormProcPlanAcelero.StringGridAcelero.Cells[8,I] = '' then
   QInsereDados.ParamByName('vlr_min_fipe').AsCurrency := QBuscaMescla.FieldByName('VLR_FIPE').AsCurrency -  0
   Else
   QInsereDados.ParamByName('vlr_min_fipe').AsCurrency := QBuscaMescla.FieldByName('VLR_FIPE').AsCurrency -  StrToCurr(StringReplace(StringReplace(FormProcPlanAcelero.StringGridAcelero.Cells[7,I], '#N/D', ' ', [rfReplaceAll]),'', '0,00',[rfReplaceAll]));
   QInsereDados.ParamByName('vlr_min_dois').AsCurrency := 0;
   QInsereDados.ParamByName('compra_ja').AsCurrency := 0;
   QInsereDados.ParamByName('fipe').AsCurrency := QBuscaMescla.FieldByName('VLR_FIPE').AsCurrency;
   QInsereDados.ParamByName('vlr_m_um').AsCurrency := 0;
   QInsereDados.ParamByName('vlr_m_dois').AsCurrency := 0;
   QInsereDados.ParamByName('venda_trinta_dias').AsInteger := vendas30dias;
   QInsereDados.ParamByName('estoque').AsInteger := EstoqueAtual;
   QInsereDados.ParamByName('vlr_ult_venda').AsCurrency := vl_ultima_venda;
   QInsereDados.ParamByName('ata_var').Text := '';
   QInsereDados.ParamByName('gzero').AsCurrency := 0;
   QInsereDados.ParamByName('mg').AsCurrency :=  Margem;;
   QInsereDados.ParamByName('c_fipe').Text := QBuscaMescla.FieldByName('cod_fipe').Text;
   QInsereDados.ParamByName('sit').AsInteger := 0;
   QInsereDados.ParamByName('dt').AsDate := NOW;
   QInsereDados.ParamByName('onde').Text :=  StringReplace(FormProcPlanAcelero.StringGridAcelero.Cells[8,I], '#N/D', ' ', [rfReplaceAll]);
   QInsereDados.ParamByName('local').Text := StringReplace(FormProcPlanAcelero.StringGridAcelero.Cells[8,I], '#N/D', ' ', [rfReplaceAll]);
   QInsereDados.ParamByName('fornecedor').Text := 'LOCALIZA';
   QInsereDados.ParamByName('cat').Text := '';
   QInsereDados.ParamByName('avaria').AsCurrency := 0;
     if QAtualizaG.FieldByName('G_ZERO').AsFloat > 0 then
     QInsereDados.ParamByName('UG0').AsFloat := QAtualizaG.FieldByName('G_ZERO').AsFloat
     Else
     QInsereDados.ParamByName('UG0').AsFloat := 0;
     if QAtualizaG.FieldByName('DT_G0').AsDateTime <> null then
     QInsereDados.ParamByName('DTG0').AsDate := QAtualizaG.FieldByName('DT_G0').AsDateTime
     Else
     QInsereDados.ParamByName('DTG0').AsDate := null;
   QInsereDados.Execute;

   Application.ProcessMessages;

    FormLoading.LabelStatus.Caption := 'Importando planilha LOCALIZA PLACA: '+FormProcPlanAcelero.StringGridAcelero.Cells[0,I];

    Application.ProcessMessages;
   End;


  End;
 Finally

 End;
  MessageDlg('Importação finalizada', mtInformation, [mbok], 0);
end;

procedure TFormNovoProcessamento.ImportaPlanMOVIDA;
Var
  I, Qtd, vendas30dias, EstoqueAtual: integer;
  modelo, cod_fipe : string;
  vl_ultima_venda : Currency;
  DT_VENDA : TDate;
  Cidade, Endereco : String;
  KM : Currency;
Begin

 Try
  for I := 4 to Pred(FormProcPlanAcelero.StringGridAcelero.RowCount) do
  Begin

  if I = 0 then
  Continue;

    if Trim(FormProcPlanAcelero.StringGridAcelero.Cells[0,I]) = '' then
    Continue;

    DataModuleConexao.qBuscaRefFipe.SQL.Clear;
    DataModuleConexao.qBuscaRefFipe.SQL.Add('select ref1 , ref2, ref3, principal from tbfiperef');
    DataModuleConexao.qBuscaRefFipe.Open;

    Principal := DataModuleConexao.qBuscaRefFipe.FieldByName('principal').Text;
    Ref1      := DataModuleConexao.qBuscaRefFipe.FieldByName('ref1').Text;
    Ref2      := DataModuleConexao.qBuscaRefFipe.FieldByName('ref2').Text;
    Ref3      := DataModuleConexao.qBuscaRefFipe.FieldByName('ref3').Text;

    //ShowMessage('Carregou Fipes');
    Application.ProcessMessages;

    if ref1 <> Principal then
    Begin

      ref1 := DataModuleConexao.qBuscaRefFipe.FieldByName('principal').Text;
      Ref2 := DataModuleConexao.qBuscaRefFipe.FieldByName('ref1').Text;
      ref3 := DataModuleConexao.qBuscaRefFipe.FieldByName('ref2').Text;

    End;
    Application.ProcessMessages;

    // Verifica modelo na conciliação de mod x fipe
    QConcFIPE.SQL.Clear;
    QConcFIPE.SQL.Add('select count(vlr_fipe) as existe from TBCONCFIPEMODELO where modelo = :mod AND ANO=:ANO and fornecedor = ''MOVIDA''');
    QConcFIPE.SQL.Add('and ref_fipe=:ref');
    QConcFIPE.ParamByName('mod').Text := FormProcPlanAcelero.StringGridAcelero.Cells[1,I];
    QConcFIPE.ParamByName('ANO').Text := CopY(FormProcPlanAcelero.StringGridAcelero.Cells[2,I], 6, 4);
    QConcFIPE.ParamByName('ref').Text := Principal;
    QConcFIPE.Open;
    Application.ProcessMessages;

    //ShowMessage('Verificou Conc Fipe');

     if QConcFIPE.FieldByName('existe').AsInteger <= 0 then
     Begin
      MessageDlg('Não foi encontrada vinculação de FIPE para o modelo, efetue-a.'+#13+
               'Modelo: '+FormProcPlanAcelero.StringGridAcelero.Cells[1,I], mtWarning, [mbok], 0);

      FormConciliacaoFipeModelo.EditModeloFIPE.Text := Copy(FormProcPlanAcelero.StringGridAcelero.Cells[1,I], 0, 10);
      FormConciliacaoFipeModelo.Position := poScreenCenter;
      FormConciliacaoFipeModelo.lblModeloPlan.Caption := FormProcPlanAcelero.StringGridAcelero.Cells[1,I];
      FormConciliacaoFipeModelo.EditAnoFIPE.Text := CopY(FormProcPlanAcelero.StringGridAcelero.Cells[2,I], 6, 4);
      FormConciliacaoFipeModelo.lblFornecedor.Caption := 'MOVIDA';

      FormConciliacaoFipeModelo.ShowModal;
     End;
     Application.ProcessMessages;

     //ShowMessage('Passou de x para fipe');

      // Carrega cod_fipe da conciliação
     QBuscaMescla.SQL.Clear;
     QBuscaMescla.SQL.Add('select cod_fipe, VLR_FIPE from TBCONCFIPEMODELO where modelo=:mod and fornecedor = ''MOVIDA''');
     QBuscaMescla.SQL.Add('and ANO=:ano');
     QBuscaMescla.SQL.Add('and ref_fipe=:ref');
     QBuscaMescla.ParamByName('ano').Text := CopY(FormProcPlanAcelero.StringGridAcelero.Cells[2,I], 6, 4);
     QBuscaMescla.ParamByName('mod').Text := FormProcPlanAcelero.StringGridAcelero.Cells[1,I];
     QBuscaMescla.ParamByName('ref').Text := Principal;
     QBuscaMescla.Open;
     Application.ProcessMessages;

     //ShowMessage('Buscou de x para fipe');

     if Ref2 <> ' ' then
     Begin

       DataModuleConexao.qBuscaFipesRef.SQL.Clear;
       DataModuleConexao.qBuscaFipesRef.SQL.Add('select valor as FIPE from TBNEWFIPE where');
       DataModuleConexao.qBuscaFipesRef.SQL.Add('ano=:ano and cod_fipe = :codfipe and ref=:ref');
       DataModuleConexao.qBuscaFipesRef.ParamByName('codfipe').text := cod_fipe;
       DataModuleConexao.qBuscaFipesRef.ParamByName('ref').Text := Ref2;
       DataModuleConexao.qBuscaFipesRef.ParamByName('ano').Text := CopY(FormProcPlanAcelero.StringGridAcelero.Cells[2,I], 6, 4);
       DataModuleConexao.qBuscaFipesRef.Open;

       ValorRef2 := DataModuleConexao.qBuscaFipesRef.FieldByName('FIPE').AsCurrency;

     End
     Else
     Begin
       ValorRef2 := 0;
     End;

     if Ref3 <> ' ' then
     Begin

       DataModuleConexao.qBuscaFipesRef.SQL.Clear;
       DataModuleConexao.qBuscaFipesRef.SQL.Add('select valor as FIPE from TBNEWFIPE where');
       DataModuleConexao.qBuscaFipesRef.SQL.Add('ano=:ano and cod_fipe = :codfipe and ref=:ref');
       DataModuleConexao.qBuscaFipesRef.ParamByName('codfipe').text := cod_fipe;
       DataModuleConexao.qBuscaFipesRef.ParamByName('ref').Text := Ref3;
       DataModuleConexao.qBuscaFipesRef.ParamByName('ano').Text := CopY(FormProcPlanAcelero.StringGridAcelero.Cells[2,I], 6, 4);
       DataModuleConexao.qBuscaFipesRef.Open;


       ValorRef3 := DataModuleConexao.qBuscaFipesRef.FieldByName('FIPE').AsCurrency;

     End
     Else
     Begin
       ValorRef3 := 0;
     End;
     Application.ProcessMessages;

     //ShowMessage('Passou checagem de ref fipe');

          // Valida placa se ja importou
      QValidaPlacaJaImportada.SQL.Clear;
      QValidaPlacaJaImportada.SQL.Add('select count(*) as Existe from TBPROCPLANS where PLACA=:PLACA and FORNECEDOR=:FOR');
      QValidaPlacaJaImportada.ParamByName('PLACA').Text := FormProcPlanAcelero.StringGridAcelero.Cells[0,I];
      QValidaPlacaJaImportada.ParamByName('FOR').Text := 'MOVIDA';
      QValidaPlacaJaImportada.Open;
      Application.ProcessMessages;

      //ShowMessage('Validou existencia de placa');

  if QValidaPlacaJaImportada.FieldByName('Existe').AsInteger > 0 then
   Begin

     //ShowMessage('UPD placa');

        // Carrega cod_fipe da conciliação
     QBuscaMescla.SQL.Clear;
     QBuscaMescla.SQL.Add('select cod_fipe, VLR_FIPE from TBCONCFIPEMODELO where modelo=:mod and fornecedor = ''MOVIDA''');
     QBuscaMescla.SQL.Add('and ANO=:ano');
     QBuscaMescla.SQL.Add('and ref_fipe=:ref');
     QBuscaMescla.ParamByName('ano').Text := CopY(FormProcPlanAcelero.StringGridAcelero.Cells[2,I], 6, 4);
     QBuscaMescla.ParamByName('mod').Text := FormProcPlanAcelero.StringGridAcelero.Cells[1,I];
     QBuscaMescla.ParamByName('ref').Text := Principal;
     QBuscaMescla.Open;
     Application.ProcessMessages;

     QAtualizaG.SQL.Clear;
     QAtualizaG.SQL.Add('select');
     QAtualizaG.SQL.Add('coalesce(G_ZERO , 0) as G_ZERO, DT_G0');
     QAtualizaG.SQL.Add('from tbprocplans');
     QAtualizaG.SQL.Add('where COD_FIPE = :c_fipe');
     QAtualizaG.SQL.Add('and ANO_MOD = :ano');
     QAtualizaG.SQL.Add('and G_ZERO > 0');
     QAtualizaG.SQL.Add('order by id desc');
     QAtualizaG.SQL.Add('limit 1');
     QAtualizaG.ParamByName('c_fipe').Text := cod_fipe;
     QAtualizaG.ParamByName('ano').Text := modelo;
     QAtualizaG.Open;
     Application.ProcessMessages;

     //ShowMessage('Passou G0');

     QValidaPlacaJaImportada.SQL.Clear;
     QValidaPlacaJaImportada.SQL.Add('update TBPROCPLANS set');
     QValidaPlacaJaImportada.SQL.Add('vlr_min=:vlr_min,');
     QValidaPlacaJaImportada.SQL.Add('km=:km,');
     QValidaPlacaJaImportada.SQL.Add('venda_trinta_dias=:venda_trinta_dias,');
     QValidaPlacaJaImportada.SQL.Add('estoque=:estoque,');
     QValidaPlacaJaImportada.SQL.Add('vlr_ult_venda=:vlr_ult_venda,');
     QValidaPlacaJaImportada.SQL.Add('dt_ult_venda=:dt_ult_venda,');
     QValidaPlacaJaImportada.SQL.Add('categoria=:cat,');
     QValidaPlacaJaImportada.SQL.Add('avaria=:avaria,');
     QValidaPlacaJaImportada.SQL.Add('DATA=:dt,');
     QValidaPlacaJaImportada.SQL.Add('onde=:onde,');
     QValidaPlacaJaImportada.SQL.Add('local=:local,');
  	 QValidaPlacaJaImportada.SQL.Add('ULT_G0=:UG0,');
     QValidaPlacaJaImportada.SQL.Add('DT_G0=:DTG0,');
     QValidaPlacaJaImportada.SQL.Add('ref_fipe=:ref, fipe2:=:vlfipe2, ref_fipe2=:ref2, fipe3=:vlfipe3, ref_fipe3=:ref3,');
     QValidaPlacaJaImportada.SQL.Add('vlr_fipe=:fipe, IMPORT_PLANILHA=:PLAN, IMPORT_DATA=:DT, situacao = 0 where PLACA=:PLACA');
     QValidaPlacaJaImportada.ParamByName('PLAN').Text := LblNomeArquivo.Caption;
     QValidaPlacaJaImportada.ParamByName('DT').AsDate := NOW;
     QValidaPlacaJaImportada.ParamByName('ref').Text := Principal;
     QValidaPlacaJaImportada.ParamByName('vlfipe2').AsCurrency := ValorRef2;
     QValidaPlacaJaImportada.ParamByName('ref2').Text := Ref2;
     QValidaPlacaJaImportada.ParamByName('vlfipe3').AsCurrency := ValorRef3;
     QValidaPlacaJaImportada.ParamByName('ref3').Text := Ref3;
     QValidaPlacaJaImportada.ParamByName('placa').Text := FormProcPlanAcelero.StringGridAcelero.Cells[0,I];
     QValidaPlacaJaImportada.ParamByName('km').AsCurrency := StrToCurr(Alltrim(StringReplace(StringReplace(StringReplace(StringReplace(StringReplace(StringReplace(StringReplace(StringReplace(StringReplace(StringReplace(StringReplace(FormProcPlanAcelero.StringGridAcelero.Cells[4,I], 'S/INFO', '0', [rfReplaceAll, rfIgnoreCase]), '.', '', [rfReplaceAll]),'P. QUEBRADO', '0',[rfReplaceAll]), 'P  QUEBRADO', '0', [rfReplaceAll]),'P QUEBRADO', '0', [rfReplaceAll]), 'PAINEL APAGADO', '0', [rfReplaceAll]),' ','0', [rfReplaceAll]), ',', '', [rfReplaceAll]),'#N/D', '0', [rfReplaceAll]), 'PAINEL0QUEBRADO', '0', [rfReplaceAll]), 'PQUEBRADO', '0', [rfReplaceAll]) ));
     QValidaPlacaJaImportada.ParamByName('dt_ult_venda').AsDate := DT_VENDA;
     QValidaPlacaJaImportada.ParamByName('vlr_min').AsCurrency := StrToCurr(StringReplace(FormProcPlanAcelero.StringGridAcelero.Cells[13,I], '.', '  ', [rfReplaceAll]));
     QValidaPlacaJaImportada.ParamByName('fipe').AsCurrency := QBuscaMescla.FieldByName('VLR_FIPE').AsCurrency;
     QValidaPlacaJaImportada.ParamByName('venda_trinta_dias').AsInteger := vendas30dias;
     QValidaPlacaJaImportada.ParamByName('estoque').AsInteger := EstoqueAtual;
     QValidaPlacaJaImportada.ParamByName('vlr_ult_venda').AsCurrency := vl_ultima_venda;
     QValidaPlacaJaImportada.ParamByName('dt').AsDate := NOW;
     QValidaPlacaJaImportada.ParamByName('onde').Text :=  StringReplace(FormProcPlanAcelero.StringGridAcelero.Cells[7,I],'#N/D','NADA INFORMADO', [rfReplaceAll]);
     QValidaPlacaJaImportada.ParamByName('local').Text := StringReplace(FormProcPlanAcelero.StringGridAcelero.Cells[8,I],'#N/D','NADA INFORMADO', [rfReplaceAll]);
     QValidaPlacaJaImportada.ParamByName('cat').Text := '';
     QValidaPlacaJaImportada.ParamByName('avaria').AsCurrency := 0;
     if QAtualizaG.FieldByName('G_ZERO').AsFloat > 0 then
     QValidaPlacaJaImportada.ParamByName('UG0').AsFloat := QAtualizaG.FieldByName('G_ZERO').AsFloat
     Else
     QValidaPlacaJaImportada.ParamByName('UG0').AsFloat := 0;
     if QAtualizaG.FieldByName('DT_G0').AsDateTime <> null then
     QValidaPlacaJaImportada.ParamByName('DTG0').AsDate := QAtualizaG.FieldByName('DT_G0').AsDateTime
     Else
     QValidaPlacaJaImportada.ParamByName('DTG0').AsDate := null;
     QValidaPlacaJaImportada.Execute;

     FormProcPlanAcelero.StringGridAcelero.Refresh;
     Application.ProcessMessages;

     //ShowMessage('Fim UPD PLACA');

     FormLoading.LabelStatus.Caption := 'Atualizando planilha MOVIDA PLACA: '+FormProcPlanAcelero.StringGridAcelero.Cells[0,I];
     FormLoading.ProgressBar1.Position := FormLoading.ProgressBar1.Position +1;
     Application.ProcessMessages;

   End
   Else
   Begin

    //ShowMessage('Vai inserir');

     QAtualizaG.SQL.Clear;
     QAtualizaG.SQL.Add('select');
     QAtualizaG.SQL.Add('coalesce(G_ZERO , 0) as G_ZERO, DT_G0');
     QAtualizaG.SQL.Add('from tbprocplans');
     QAtualizaG.SQL.Add('where COD_FIPE = :c_fipe');
     QAtualizaG.SQL.Add('and ANO_MOD = :ano');
     QAtualizaG.SQL.Add('and G_ZERO > 0');
     QAtualizaG.SQL.Add('order by id desc');
     QAtualizaG.SQL.Add('limit 1');
     QAtualizaG.ParamByName('c_fipe').Text := cod_fipe;
     QAtualizaG.ParamByName('ano').Text := modelo;
     QAtualizaG.Open;
     Application.ProcessMessages;

     //ShowMessage('Passou G0');


   QInsereDados.SQL.Clear;
   QInsereDados.SQL.Add('insert into TBPROCPLANS');
   QInsereDados.SQL.Add('( licitacao, lote, placa, modelo, km, ano, ano_mod, cor, vlr_min,');
   QInsereDados.SQL.Add('  vlr_min_fipe, vlr_min_dois, compra_ja, vlr_fipe, vlr_merc_um, vlr_merc_dois,');
   QInsereDados.SQL.Add('  venda_trinta_dias, estoque, vlr_ult_venda, dt_ult_venda, atacado_varejo, categoria, g_zero,');
   QInsereDados.SQL.Add(' mg, avaria, resultado, min_resultado, lance, lance_fipe, compra, sn,');
   QInsereDados.SQL.Add('  dt_pgto, qtd, fornecedor, id_plan_for, cod_fipe, situacao, data, onde, local, ULT_G0, DT_G0, IMPORT_PLANILHA, IMPORT_DATA, IMPORT_STATUS, ref_fipe, fipe2, ref_fipe2, fipe3, ref_fipe3)');
   QInsereDados.SQL.Add('values');
   QInsereDados.SQL.Add('(:licitacao, :lote, :placa, :modelo, :km, :ano, :anomod, :cor, :vlr_min,');
   QInsereDados.SQL.Add(':vlr_min_fipe, :vlr_min_dois, :compra_ja, :fipe, :vlr_m_um, :vlr_m_dois,');
   QInsereDados.SQL.Add(':venda_trinta_dias, :estoque, :vlr_ult_venda, :dt_venda, :ata_var, :cat, :gzero,');
   QInsereDados.SQL.Add(':mg, :avaria, :result, :min_result, :lance, :lance_fipe, :compra, :sn, :dt_pgto,');
   QInsereDados.SQL.Add(':qtd, :fornecedor, :id_plan, :c_fipe, :sit, :dt, :onde, :local, :UG0, :DTG0, :PLANILHA, :DT_PLANILHA, :STATUS_PLANILHA, :ref, :vlfipe2, :ref2, :vlfipe3, :ref3)');
   QInsereDados.ParamByName('PLANILHA').Text := LblNomeArquivo.Caption;
   QInsereDados.ParamByName('DT_PLANILHA').AsDate := NOW;
   QInsereDados.ParamByName('STATUS_PLANILHA').Text := 'Em Analise';
   QInsereDados.ParamByName('licitacao').Text := '';
   QInsereDados.ParamByName('lote').Text := '';
   QInsereDados.ParamByName('ref').Text := Principal;
   QInsereDados.ParamByName('vlfipe2').AsCurrency := ValorRef2;
   QInsereDados.ParamByName('ref2').Text := Ref2;
   QInsereDados.ParamByName('vlfipe3').AsCurrency := ValorRef3;
   QInsereDados.ParamByName('ref3').Text := Ref3;
   QInsereDados.ParamByName('placa').Text := FormProcPlanAcelero.StringGridAcelero.Cells[0,I];
   QInsereDados.ParamByName('modelo').Text := FormProcPlanAcelero.StringGridAcelero.Cells[1,I];
   QInsereDados.ParamByName('km').AsCurrency := StrToCurr(Alltrim(StringReplace(StringReplace(StringReplace(StringReplace(StringReplace(StringReplace(StringReplace(StringReplace(StringReplace(StringReplace(StringReplace(FormProcPlanAcelero.StringGridAcelero.Cells[4,I], 'S/INFO', '0', [rfReplaceAll, rfIgnoreCase]), '.', '', [rfReplaceAll]),'P. QUEBRADO', '0',[rfReplaceAll]), 'P  QUEBRADO', '0', [rfReplaceAll]),'P QUEBRADO', '0', [rfReplaceAll]), 'PAINEL APAGADO', '0', [rfReplaceAll]),' ','0', [rfReplaceAll]), ',', '', [rfReplaceAll]),'#N/D', '0', [rfReplaceAll]), 'PAINEL0QUEBRADO', '0', [rfReplaceAll]), 'PQUEBRADO', '0', [rfReplaceAll]) ));
   QInsereDados.ParamByName('ano').Text := CopY(FormProcPlanAcelero.StringGridAcelero.Cells[2,I], 6, 4);
   QInsereDados.ParamByName('dt_venda').AsDate := DT_VENDA;
   QInsereDados.ParamByName('anomod').Text := CopY(FormProcPlanAcelero.StringGridAcelero.Cells[2,I], 6, 4);
   QInsereDados.ParamByName('cor').Text := FormProcPlanAcelero.StringGridAcelero.Cells[3,I];
   QInsereDados.ParamByName('vlr_min').AsCurrency := StrToCurr(StringReplace(FormProcPlanAcelero.StringGridAcelero.Cells[13,I], '.', '  ', [rfReplaceAll]));
   QInsereDados.ParamByName('vlr_min_fipe').AsCurrency := QBuscaMescla.FieldByName('VLR_FIPE').AsCurrency - StrToCurr(StringReplace(FormProcPlanAcelero.StringGridAcelero.Cells[13,I], '.', '  ', [rfReplaceAll]));
   QInsereDados.ParamByName('vlr_min_dois').AsCurrency := 0;
   QInsereDados.ParamByName('compra_ja').AsCurrency := 0;
   QInsereDados.ParamByName('fipe').AsCurrency := QBuscaMescla.FieldByName('VLR_FIPE').AsCurrency;
   QInsereDados.ParamByName('vlr_m_um').AsCurrency := 0;
   QInsereDados.ParamByName('vlr_m_dois').AsCurrency := 0;
   QInsereDados.ParamByName('venda_trinta_dias').AsInteger := vendas30dias;
   QInsereDados.ParamByName('estoque').AsInteger := EstoqueAtual;
   QInsereDados.ParamByName('vlr_ult_venda').AsCurrency := vl_ultima_venda;
   QInsereDados.ParamByName('ata_var').Text := '';
   QInsereDados.ParamByName('gzero').AsCurrency := 0;
   QInsereDados.ParamByName('mg').AsCurrency :=  Margem;;
   QInsereDados.ParamByName('c_fipe').Text := cod_fipe;
   QInsereDados.ParamByName('sit').AsInteger := 0;
   QInsereDados.ParamByName('dt').AsDate := NOW;
   QInsereDados.ParamByName('onde').Text :=  StringReplace(FormProcPlanAcelero.StringGridAcelero.Cells[7,I],'#N/D','NADA INFORMADO', [rfReplaceAll]);
   QInsereDados.ParamByName('local').Text := StringReplace(FormProcPlanAcelero.StringGridAcelero.Cells[8,I],'#N/D','NADA INFORMADO', [rfReplaceAll]);
   QInsereDados.ParamByName('fornecedor').Text := 'MOVIDA';
   QInsereDados.ParamByName('cat').Text := '';
   QInsereDados.ParamByName('avaria').AsCurrency := 0;

     if QAtualizaG.FieldByName('G_ZERO').AsFloat > 0 then
     QInsereDados.ParamByName('UG0').AsFloat := QAtualizaG.FieldByName('G_ZERO').AsFloat
     Else
     QInsereDados.ParamByName('UG0').AsFloat := 0;
     if QAtualizaG.FieldByName('DT_G0').AsDateTime <> null then
     QInsereDados.ParamByName('DTG0').AsDate := QAtualizaG.FieldByName('DT_G0').AsDateTime
     Else
     QInsereDados.ParamByName('DTG0').AsDate := null;
   QInsereDados.ExecSQL;
   Application.ProcessMessages;

   //ShowMessage('INseriu');

    FormProcPlanAcelero.StringGridAcelero.Refresh;

    FormLoading.LabelStatus.Caption := 'Importando planilha MOVIDA PLACA: '+FormProcPlanAcelero.StringGridAcelero.Cells[0,I];
     FormLoading.ProgressBar1.Position := FormLoading.ProgressBar1.Position +1;
     Application.ProcessMessages;

    Application.ProcessMessages;
   End;

  End;
 Except
 On E:Exception
 Do Begin
    ShowMessage('Falha ao processar! ' + E.Message);
 End;

 End;
   MessageDlg('Importação finalizada', mtInformation, [mbok], 0);
end;

function PrimeiraPalavra (Nome : String) : String;
var

PNome : String;
begin
PNome := '';
if pos (' ', Nome) <> 0 then
PNome := copy (Nome, 1, pos (' ', Nome) - 1);
Result := PNome;
end;

procedure TFormNovoProcessamento.ImportaPlanNeutron;
Var
  I, Qtd, vendas30dias, EstoqueAtual: integer;
  modelo, cod_fipe : string;
  vl_ultima_venda : Currency;
  DT_VENDA : TDate;
  Cidade, Endereco : String;
  KM : Double;
 Begin


 Try
  for I := 0 to Pred(FormProcPlanAcelero.StringGridAcelero.RowCount) do
  Begin

  if I = 0 then
  Continue;

  if Trim(FormProcPlanAcelero.StringGridAcelero.Cells[0,I]) = '' then
  Continue;

  PrimeiraPalavra(FormProcPlanAcelero.StringGridAcelero.Cells[0,I]);

  QConferePlaca.SQL.Clear;
  QConferePlaca.SQL.Add('select count(*) as existe from TBPROCPLANS where PLACA = :PL');
  QConferePlaca.ParamByName('PL').Text := UpperCase(FormProcPlanAcelero.StringGridAcelero.Cells[5,I]);
  QConferePlaca.Open;

  if QConferePlaca.FieldByName('existe').AsInteger >0 then
  Begin

  QConferePlaca.SQL.Clear;
  QConferePlaca.SQL.Add('SELECT COUNT(*) EXISTE FROM TBPLANNEUTRON WHERE PLACA=:PL');
  QConferePlaca.ParamByName('PL').Text := UpperCase(FormProcPlanAcelero.StringGridAcelero.Cells[5,I]);
  QConferePlaca.Open;

  if QConferePlaca.FieldByName('EXISTE').AsInteger <= 0 then
  Begin
  DataModuleConexao.QInsereAcelero.sql.clear;
  DataModuleConexao.QInsereAcelero.sql.Add('insert into TBPLANNEUTRON (');
  DataModuleConexao.QInsereAcelero.sql.Add('id, Fornecedor, Marca, modelo, ano, data,');
  DataModuleConexao.QInsereAcelero.sql.Add('placa, KM, Portas, Avaria, observacao, categoria, opcionais)');
  DataModuleConexao.QInsereAcelero.sql.Add('values (');
  DataModuleConexao.QInsereAcelero.sql.Add(':id, :forn, :Marca, :modelo,');
  DataModuleConexao.QInsereAcelero.sql.Add(':ano, :data, :placa, :km, :Portas, :Avaria, :obs, :cat, :op) ');
  DataModuleConexao.QInsereAcelero.ParamByName('id').AsInteger := 1;
  DataModuleConexao.QInsereAcelero.ParamByName('forn').Text := PrimeiraPalavra(FormProcPlanAcelero.StringGridAcelero.Cells[0,I]);
  DataModuleConexao.QInsereAcelero.ParamByName('Marca').Text := FormProcPlanAcelero.StringGridAcelero.Cells[1,I];
  DataModuleConexao.QInsereAcelero.ParamByName('modelo').Text := FormProcPlanAcelero.StringGridAcelero.Cells[2,I];
  DataModuleConexao.QInsereAcelero.ParamByName('ano').text := FormProcPlanAcelero.StringGridAcelero.Cells[3,I];
  if FormProcPlanAcelero.StringGridAcelero.Cells[4,I].IsEmpty then
  DataModuleConexao.QInsereAcelero.ParamByName('data').AsDate := StrToDate('01/01/1989')
  Else
  DataModuleConexao.QInsereAcelero.ParamByName('data').AsDate := StrToDate(FormProcPlanAcelero.StringGridAcelero.Cells[4,I]);
  DataModuleConexao.QInsereAcelero.ParamByName('placa').text := FormProcPlanAcelero.StringGridAcelero.Cells[5,I];
  DataModuleConexao.QInsereAcelero.ParamByName('km').AsFloat := StrToCurr(Alltrim(StringReplace(StringReplace(StringReplace(StringReplace(StringReplace(StringReplace(StringReplace(StringReplace(StringReplace(FormProcPlanAcelero.StringGridAcelero.Cells[6,I], '.', '', [rfReplaceAll]),'P. QUEBRADO', '0',[rfReplaceAll]), 'P  QUEBRADO', '0', [rfReplaceAll]),'P QUEBRADO', '0', [rfReplaceAll]), 'PAINEL APAGADO', '0', [rfReplaceAll]), ',', '', [rfReplaceAll]),'#N/D', '0', [rfReplaceAll]), 'PAINEL0QUEBRADO', '0', [rfReplaceAll]), 'PQUEBRADO', '0', [rfReplaceAll]) ));
  DataModuleConexao.QInsereAcelero.ParamByName('Portas').AsInteger := StrToInt(FormProcPlanAcelero.StringGridAcelero.Cells[7,I]);
  if FormProcPlanAcelero.StringGridAcelero.Cells[8,I] = '' then
  DataModuleConexao.QInsereAcelero.ParamByName('Avaria').AsCurrency := 0
  Else
  DataModuleConexao.QInsereAcelero.ParamByName('Avaria').AsCurrency := StrToCurr(FormProcPlanAcelero.StringGridAcelero.Cells[8,I]);
  DataModuleConexao.QInsereAcelero.ParamByName('obs').text := FormProcPlanAcelero.StringGridAcelero.Cells[10,I];
  DataModuleConexao.QInsereAcelero.ParamByName('cat').text := FormProcPlanAcelero.StringGridAcelero.Cells[11,I];
  DataModuleConexao.QInsereAcelero.ParamByName('op').text := FormProcPlanAcelero.StringGridAcelero.Cells[12,I];
  DataModuleConexao.QInsereAcelero.Execute;

  QInsereDados.SQL.Clear;
  QInsereDados.SQL.Add('update TBPROCPLANS set');
  QInsereDados.SQL.Add('CATEGORIA=:CAT,');
  QInsereDados.SQL.Add('AVARIA = :AVA');
  QInsereDados.SQL.Add('where PLACA=:PL');
  QInsereDados.ParamByName('PL').Text := FormProcPlanAcelero.StringGridAcelero.Cells[5,I];
  QInsereDados.ParamByName('CAT').Text := FormProcPlanAcelero.StringGridAcelero.Cells[11,I];
  if FormProcPlanAcelero.StringGridAcelero.Cells[8,I] = ''
   then
  QInsereDados.ParamByName('AVA').AsCurrency := 0
  Else
  QInsereDados.ParamByName('AVA').AsCurrency := StrToCurr(FormProcPlanAcelero.StringGridAcelero.Cells[8,I]);
  QInsereDados.Execute;

  FormLoading.LabelStatus.Caption := 'Importou planilha Neutron PLACA: '+UpperCase(FormProcPlanAcelero.StringGridAcelero.Cells[5,I]);

  Application.ProcessMessages;
  End
  Else
  Begin

   QInsereDados.SQL.Clear;
   QInsereDados.SQL.Add('update TBPLANNEUTRON set');
   QInsereDados.SQL.Add('fornecedor=:fornecedor, data=:dt, km=:km, avaria=:avaria, categoria=:cat where placa=:PL');
   QInsereDados.ParamByName('PL').Text :=  FormProcPlanAcelero.StringGridAcelero.Cells[5,I];
   QInsereDados.ParamByName('fornecedor').Text := FormProcPlanAcelero.StringGridAcelero.Cells[0,I];
   QInsereDados.ParamByName('dt').AsDate :=       StrToDate(FormProcPlanAcelero.StringGridAcelero.Cells[4,I]);
   QInsereDados.ParamByName('km').AsFloat :=     StrToCurr(Alltrim(StringReplace(StringReplace(StringReplace(StringReplace(StringReplace(StringReplace(StringReplace(StringReplace(StringReplace(FormProcPlanAcelero.StringGridAcelero.Cells[6,I], '.', '', [rfReplaceAll]),'P. QUEBRADO', '0',[rfReplaceAll]), 'P  QUEBRADO', '0', [rfReplaceAll]),'P QUEBRADO', '0', [rfReplaceAll]), 'PAINEL APAGADO', '0', [rfReplaceAll]), ',', '', [rfReplaceAll]),'#N/D', '0', [rfReplaceAll]), 'PAINEL0QUEBRADO', '0', [rfReplaceAll]), 'PQUEBRADO', '0', [rfReplaceAll]) ));
   if FormProcPlanAcelero.StringGridAcelero.Cells[8,I] = '' then
   QInsereDados.ParamByName('avaria').AsCurrency := 0
   Else
   QInsereDados.ParamByName('avaria').AsCurrency :=  StrToCurr(FormProcPlanAcelero.StringGridAcelero.Cells[8,I]);
   QInsereDados.ParamByName('cat').Text :=   FormProcPlanAcelero.StringGridAcelero.Cells[11,I];
   QInsereDados.Execute;

  QInsereDados.SQL.Clear;
  QInsereDados.SQL.Add('update TBPROCPLANS set');
  QInsereDados.SQL.Add('CATEGORIA=:CAT,');
  QInsereDados.SQL.Add('AVARIA = :AVA');
  QInsereDados.SQL.Add('where PLACA=:PL');
  QInsereDados.ParamByName('PL').Text := FormProcPlanAcelero.StringGridAcelero.Cells[5,I];
  QInsereDados.ParamByName('CAT').Text := FormProcPlanAcelero.StringGridAcelero.Cells[11,I];
   if FormProcPlanAcelero.StringGridAcelero.Cells[8,I] = '' then
   QInsereDados.ParamByName('AVA').AsCurrency := 0
   Else
  QInsereDados.ParamByName('AVA').AsCurrency := StrToCurr(FormProcPlanAcelero.StringGridAcelero.Cells[8,I]);
  QInsereDados.Execute;

   FormLoading.LabelStatus.Caption := 'Atualizou Neutron PLACA: '+UpperCase(FormProcPlanAcelero.StringGridAcelero.Cells[5,I]);
  End;

  End
  Else
  Begin //PrimeiraPalavra


    // Verifica modelo na conciliação de mod x fipe
    QConcFIPE.SQL.Clear;
    QConcFIPE.SQL.Add('select count(vlr_fipe) as existe from TBCONCFIPEMODELO where modelo = :mod AND ANO=:ANO and fornecedor = :FOR');
    QConcFIPE.ParamByName('mod').Text := FormProcPlanAcelero.StringGridAcelero.Cells[2,I];
    QConcFIPE.ParamByName('ANO').Text := FormProcPlanAcelero.StringGridAcelero.Cells[3,I];
    QConcFIPE.ParamByName('FOR').Text := PrimeiraPalavra(FormProcPlanAcelero.StringGridAcelero.Cells[0,I]);
    QConcFIPE.Open;

     if QConcFIPE.FieldByName('existe').AsInteger = 0 then
     Begin
      MessageDlg('Não foi encontrada vinculação de FIPE para o modelo, efetue-a.'+#13+
               'Modelo: '+FormProcPlanAcelero.StringGridAcelero.Cells[2,I], mtWarning, [mbok], 0);

      FormConciliacaoFipeModelo.EditModeloFIPE.Text := Copy(FormProcPlanAcelero.StringGridAcelero.Cells[2,I], 0, 10);
      FormConciliacaoFipeModelo.Position := poScreenCenter;
      FormConciliacaoFipeModelo.lblModeloPlan.Caption := FormProcPlanAcelero.StringGridAcelero.Cells[2,I];
      FormConciliacaoFipeModelo.EditAnoFIPE.Text := FormProcPlanAcelero.StringGridAcelero.Cells[3,I];
      FormConciliacaoFipeModelo.lblFornecedor.Caption := PrimeiraPalavra(FormProcPlanAcelero.StringGridAcelero.Cells[0,I]);

      FormConciliacaoFipeModelo.ShowModal;
     End;

      // Carrega cod_fipe da conciliação
     QBuscaMescla.SQL.Clear;
     QBuscaMescla.SQL.Add('select cod_fipe, VLR_FIPE from TBCONCFIPEMODELO where modelo=:mod and fornecedor = :FOR');
     QBuscaMescla.SQL.Add('and ANO=:ano');
     QBuscaMescla.ParamByName('mod').Text := FormProcPlanAcelero.StringGridAcelero.Cells[2,I];
     QBuscaMescla.ParamByName('ANO').Text := FormProcPlanAcelero.StringGridAcelero.Cells[3,I];
     QBuscaMescla.ParamByName('FOR').Text := PrimeiraPalavra(FormProcPlanAcelero.StringGridAcelero.Cells[0,I]);
     QBuscaMescla.Open;

     if not QBuscaMescla.IsEmpty then
     Begin
         //ShowMessage('Vai buscar venda 30d');
          cod_fipe := QBuscaMescla.FieldByName('cod_fipe').Text;
         // Carrega vendas dos ultimos 30 dias
         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select COUNT(*) as vnd from IMPORTASAVANNAVENDA30DIAS');
         QSavannaLocal.SQL.Add('where FIPE = :fipe and ano=:ANO');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := FormProcPlanAcelero.StringGridAcelero.Cells[3,I];
         QSavannaLocal.Open;

         //ShowMessage('Buscou venda 30d');

         Application.ProcessMessages;

         if not QSavannaLocal.FieldByName('vnd').IsNull then
         vendas30dias := QSavannaLocal.FieldByName('vnd').AsInteger
         Else
         vendas30dias := 0;

         // Carrega ultimo vlr de venda
         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select valor, data from IMPORTASAVANNAULTIMASVENDAS');
         QSavannaLocal.SQL.Add('where FIPE = :fipe and ano=:ano');
         QSavannaLocal.SQL.Add('order by data desc ');
         QSavannaLocal.SQL.Add('limit 1');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := FormProcPlanAcelero.StringGridAcelero.Cells[3,I];
         QSavannaLocal.Open;

       //ShowMessage('Buscou vlr venda');

         Application.ProcessMessages;

         if QSavannaLocal.FieldByName('valor').AsCurrency <> null then
         vl_ultima_venda := QSavannaLocal.FieldByName('valor').AsCurrency
         Else
         vl_ultima_venda := 0;

         if QSavannaLocal.FieldByName('data').AsDateTime <> null then
         DT_VENDA := QSavannaLocal.FieldByName('data').AsDateTime;

         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select sum(qtd) as  Estoque from IMPORTASAVANNAESTOQUE where FIPE = :fipe and ano=:ano');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := FormProcPlanAcelero.StringGridAcelero.Cells[3,I];
         QSavannaLocal.Open;

          Application.ProcessMessages;

         if not QSavannaLocal.FieldByName('Estoque').IsNull then
         EstoqueAtual := QSavannaLocal.FieldByName('Estoque').AsInteger
         Else
         EstoqueAtual := 0;

     End;

   QInsereDados.SQL.Clear;
   QInsereDados.SQL.Add('insert into TBPROCPLANS');
   QInsereDados.SQL.Add('( licitacao, lote, placa, modelo, km, ano, ano_mod, cor, vlr_min,');
   QInsereDados.SQL.Add('  vlr_min_fipe, vlr_min_dois, compra_ja, vlr_fipe, vlr_merc_um, vlr_merc_dois,');
   QInsereDados.SQL.Add('  venda_trinta_dias, estoque, vlr_ult_venda, dt_ult_venda, atacado_varejo, categoria, g_zero,');
   QInsereDados.SQL.Add(' mg, avaria, resultado, min_resultado, lance, lance_fipe, compra, sn,');
   QInsereDados.SQL.Add('  dt_pgto, qtd, fornecedor, id_plan_for, cod_fipe, situacao, data, onde, local)');
   QInsereDados.SQL.Add('values');
   QInsereDados.SQL.Add('(:licitacao, :lote, :placa, :modelo, :km, :ano, :anomod, :cor, :vlr_min,');
   QInsereDados.SQL.Add(':vlr_min_fipe, :vlr_min_dois, :compra_ja, :fipe, :vlr_m_um, :vlr_m_dois,');
   QInsereDados.SQL.Add(':venda_trinta_dias, :estoque, :vlr_ult_venda, :dt_venda, :ata_var, :cat, :gzero,');
   QInsereDados.SQL.Add(':mg, :avaria, :result, :min_result, :lance, :lance_fipe, :compra, :sn, :dt_pgto,');
   QInsereDados.SQL.Add(':qtd, :fornecedor, :id_plan, :c_fipe, :sit, :dt, :onde, :local)');
   QInsereDados.ParamByName('licitacao').Text := '';
   QInsereDados.ParamByName('lote').Text := '';
   QInsereDados.ParamByName('placa').Text := UpperCase(FormProcPlanAcelero.StringGridAcelero.Cells[5,I]);
   QInsereDados.ParamByName('modelo').Text := FormProcPlanAcelero.StringGridAcelero.Cells[2,I];
   QInsereDados.ParamByName('km').AsCurrency := StrToCurr(Alltrim(StringReplace(StringReplace(StringReplace(StringReplace(StringReplace(StringReplace(StringReplace(StringReplace(StringReplace(FormProcPlanAcelero.StringGridAcelero.Cells[6,I], '.', '', [rfReplaceAll]),'P. QUEBRADO', '0',[rfReplaceAll]), 'P  QUEBRADO', '0', [rfReplaceAll]),'P QUEBRADO', '0', [rfReplaceAll]), 'PAINEL APAGADO', '0', [rfReplaceAll]), ',', '', [rfReplaceAll]),'#N/D', '0', [rfReplaceAll]), 'PAINEL0QUEBRADO', '0', [rfReplaceAll]), 'PQUEBRADO', '0', [rfReplaceAll]) ));
   QInsereDados.ParamByName('ano').Text := FormProcPlanAcelero.StringGridAcelero.Cells[3,I];
   QInsereDados.ParamByName('dt_venda').AsDate := DT_VENDA;
   QInsereDados.ParamByName('anomod').Text := FormProcPlanAcelero.StringGridAcelero.Cells[3,I];
   QInsereDados.ParamByName('cor').Text := ''; //FormProcPlanAcelero.StringGridAcelero.Cells[3,I];
   QInsereDados.ParamByName('vlr_min').AsCurrency := 0; //StrToCurr(StringReplace(FormProcPlanAcelero.StringGridAcelero.Cells[11,I], '.', '  ', [rfReplaceAll]));
   QInsereDados.ParamByName('vlr_min_fipe').AsCurrency := 0;
   QInsereDados.ParamByName('vlr_min_dois').AsCurrency := 0;
   QInsereDados.ParamByName('compra_ja').AsCurrency := 0;
   QInsereDados.ParamByName('fipe').AsCurrency := QBuscaMescla.FieldByName('VLR_FIPE').AsCurrency;
   QInsereDados.ParamByName('vlr_m_um').AsCurrency := 0;
   QInsereDados.ParamByName('vlr_m_dois').AsCurrency := 0;
   QInsereDados.ParamByName('venda_trinta_dias').AsInteger := vendas30dias;
   QInsereDados.ParamByName('estoque').AsInteger := EstoqueAtual;
   QInsereDados.ParamByName('vlr_ult_venda').AsCurrency := vl_ultima_venda;
   QInsereDados.ParamByName('ata_var').Text := '';
   QInsereDados.ParamByName('gzero').AsCurrency := 0;
   QInsereDados.ParamByName('mg').AsCurrency :=  Margem;;
   QInsereDados.ParamByName('c_fipe').Text := QBuscaMescla.FieldByName('cod_fipe').Text;
   QInsereDados.ParamByName('sit').AsInteger := 0;
   QInsereDados.ParamByName('dt').AsDate := NOW;
   QInsereDados.ParamByName('onde').Text :=  '';
   QInsereDados.ParamByName('local').Text := '';
   QInsereDados.ParamByName('fornecedor').Text := PrimeiraPalavra(FormProcPlanAcelero.StringGridAcelero.Cells[0,I]);
   QInsereDados.ParamByName('cat').Text := FormProcPlanAcelero.StringGridAcelero.Cells[11,I];
   if FormProcPlanAcelero.StringGridAcelero.Cells[8,I] = '' then
   QInsereDados.ParamByName('avaria').AsCurrency := 0
   Else
   QInsereDados.ParamByName('avaria').AsCurrency := StrToCurr(FormProcPlanAcelero.StringGridAcelero.Cells[8,I]);
   QInsereDados.Execute;

    FormLoading.LabelStatus.Caption := 'Importando NEUTRON FINAL PLACA: '+UpperCase(FormProcPlanAcelero.StringGridAcelero.Cells[5,I]);


  Application.ProcessMessages;

  End;

  Application.ProcessMessages;

  End;

 Finally

 End;

  MessageDlg('Importação finalizada', mtInformation, [mbok], 0);
end;

procedure TFormNovoProcessamento.ImportaPlanOUROVERDE;
Var
  I, Qtd, vendas30dias, EstoqueAtual: integer;
  modelo, cod_fipe : string;
  vl_ultima_venda : Currency;
  DT_VENDA : TDate;
  Cidade, Endereco : String;
  KM : Double;
 Begin

   vendas30dias := 0;
   EstoqueAtual := 0;
   vl_ultima_venda := 0;

 Try
  for I := 0 to Pred(FormProcPlanAcelero.StringGridAcelero.RowCount) do
  Begin

  if I = 0 then
  Continue;

  if Trim(FormProcPlanAcelero.StringGridAcelero.Cells[0,I]) = '' then
  Continue;

    DataModuleConexao.qBuscaRefFipe.SQL.Clear;
    DataModuleConexao.qBuscaRefFipe.SQL.Add('select ref1 , ref2, ref3, principal from tbfiperef');
    DataModuleConexao.qBuscaRefFipe.Open;

    Principal := DataModuleConexao.qBuscaRefFipe.FieldByName('principal').Text;
    Ref1      := DataModuleConexao.qBuscaRefFipe.FieldByName('ref1').Text;
    Ref2      := DataModuleConexao.qBuscaRefFipe.FieldByName('ref2').Text;
    Ref3      := DataModuleConexao.qBuscaRefFipe.FieldByName('ref3').Text;

    if ref1 <> Principal then
    Begin

      ref1 := DataModuleConexao.qBuscaRefFipe.FieldByName('principal').Text;
      Ref2 := DataModuleConexao.qBuscaRefFipe.FieldByName('ref1').Text;
      ref3 := DataModuleConexao.qBuscaRefFipe.FieldByName('ref2').Text;

    End;

    // Verifica modelo na conciliação de mod x fipe
    QConcFIPE.SQL.Clear;
    QConcFIPE.SQL.Add('select count(vlr_fipe) as existe from TBCONCFIPEMODELO where modelo = :mod AND ANO=:ANO and fornecedor = ''OURO VERDE''');
    QConcFIPE.SQL.Add('and ref_fipe=:ref');
    QConcFIPE.ParamByName('mod').Text := FormProcPlanAcelero.StringGridAcelero.Cells[1,I];
    QConcFIPE.ParamByName('ANO').Text := FormProcPlanAcelero.StringGridAcelero.Cells[2,I];
    QConcFIPE.ParamByName('ref').Text := Principal;
    QConcFIPE.Open;

    if QConcFIPE.FieldByName('existe').AsInteger = 0 then
     Begin
      MessageDlg('Não foi encontrada vinculação de FIPE para o modelo, efetue-a.'+#13+
               'Modelo: '+FormProcPlanAcelero.StringGridAcelero.Cells[1,I], mtWarning, [mbok], 0);

      FormConciliacaoFipeModelo.EditModeloFIPE.Text := Copy(FormProcPlanAcelero.StringGridAcelero.Cells[1,I], 0, 10);
      FormConciliacaoFipeModelo.Position := poScreenCenter;
      FormConciliacaoFipeModelo.lblModeloPlan.Caption := FormProcPlanAcelero.StringGridAcelero.Cells[1,I];
      FormConciliacaoFipeModelo.EditAnoFIPE.Text := FormProcPlanAcelero.StringGridAcelero.Cells[2,I];
      FormConciliacaoFipeModelo.lblFornecedor.Caption := 'OURO VERDE';

      FormConciliacaoFipeModelo.ShowModal;
     End;

      // Carrega cod_fipe da conciliação
     QBuscaMescla.SQL.Clear;
     QBuscaMescla.SQL.Add('select cod_fipe, VLR_FIPE from TBCONCFIPEMODELO where modelo=:mod and fornecedor = ''OURO VERDE''');
     QBuscaMescla.SQL.Add('and ANO=:ano');
     QBuscaMescla.SQL.Add('and ref_fipe=:ref');
     QBuscaMescla.ParamByName('ano').Text := FormProcPlanAcelero.StringGridAcelero.Cells[2,I];
     QBuscaMescla.ParamByName('mod').Text := FormProcPlanAcelero.StringGridAcelero.Cells[1,I];
     QBuscaMescla.ParamByName('ref').Text := Principal;
     QBuscaMescla.Open;

     if not QBuscaMescla.IsEmpty then
     Begin
         //ShowMessage('Vai buscar venda 30d');
          cod_fipe := QBuscaMescla.FieldByName('cod_fipe').Text;
         // Carrega vendas dos ultimos 30 dias
         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select COUNT(*) as vnd from IMPORTASAVANNAVENDA30DIAS');
         QSavannaLocal.SQL.Add('where FIPE = :fipe and ano=:ANO');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := FormProcPlanAcelero.StringGridAcelero.Cells[2,I];
         QSavannaLocal.Open;

         //ShowMessage('Buscou venda 30d');

         Application.ProcessMessages;

         if not QSavannaLocal.FieldByName('vnd').IsNull then
         vendas30dias := QSavannaLocal.FieldByName('vnd').AsInteger
         Else
         vendas30dias := 0;

         // Carrega ultimo vlr de venda
         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select valor, data from IMPORTASAVANNAULTIMASVENDAS');
         QSavannaLocal.SQL.Add('where FIPE = :fipe and ano=:ano');
         QSavannaLocal.SQL.Add('order by data desc ');
         QSavannaLocal.SQL.Add('limit 1');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := FormProcPlanAcelero.StringGridAcelero.Cells[2,I];
         QSavannaLocal.Open;

       //ShowMessage('Buscou vlr venda');

         Application.ProcessMessages;

         if QSavannaLocal.FieldByName('valor').AsCurrency <> null then
         vl_ultima_venda := QSavannaLocal.FieldByName('valor').AsCurrency
         Else
         vl_ultima_venda := 0;

         if QSavannaLocal.FieldByName('data').AsDateTime <> null then
         DT_VENDA := QSavannaLocal.FieldByName('data').AsDateTime;

         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select sum(qtd) as  Estoque from IMPORTASAVANNAESTOQUE where FIPE = :fipe and ano=:ano');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := FormProcPlanAcelero.StringGridAcelero.Cells[2,I];
         QSavannaLocal.Open;

          Application.ProcessMessages;

         if not QSavannaLocal.FieldByName('Estoque').IsNull then
         EstoqueAtual := QSavannaLocal.FieldByName('Estoque').AsInteger
         Else
         EstoqueAtual := 0;

     End;

      // funcao de carga de categoria x avaria Neutron

     if Ref2 <> ' ' then
     Begin

       DataModuleConexao.qBuscaFipesRef.SQL.Clear;
       DataModuleConexao.qBuscaFipesRef.SQL.Add('select "'+'ANO'+FormProcPlanAcelero.StringGridAcelero.Cells[2,I]+'" as FIPE from TBFIPE where');
       DataModuleConexao.qBuscaFipesRef.SQL.Add(' "'+'ANO'+FormProcPlanAcelero.StringGridAcelero.Cells[2,I]+'" > 0 and cod_fipe = :codfipe and ref=:ref');
       DataModuleConexao.qBuscaFipesRef.ParamByName('codfipe').text := cod_fipe;
       DataModuleConexao.qBuscaFipesRef.ParamByName('ref').Text := Ref2;
       DataModuleConexao.qBuscaFipesRef.Open;

       ValorRef2 := DataModuleConexao.qBuscaFipesRef.FieldByName('FIPE').AsCurrency;

     End
     Else
     Begin
       ValorRef2 := 0;
     End;

     if Ref3 <> ' ' then
     Begin

       DataModuleConexao.qBuscaFipesRef.SQL.Clear;
       DataModuleConexao.qBuscaFipesRef.SQL.Add('select "'+'ANO'+FormProcPlanAcelero.StringGridAcelero.Cells[2,I]+'" as FIPE from TBFIPE where');
       DataModuleConexao.qBuscaFipesRef.SQL.Add(' "'+'ANO'+FormProcPlanAcelero.StringGridAcelero.Cells[2,I]+'" > 0 and cod_fipe = :codfipe and ref=:ref');
       DataModuleConexao.qBuscaFipesRef.ParamByName('codfipe').text := cod_fipe;
       DataModuleConexao.qBuscaFipesRef.ParamByName('ref').Text := Ref3;
       DataModuleConexao.qBuscaFipesRef.Open;

       ValorRef3 := DataModuleConexao.qBuscaFipesRef.FieldByName('FIPE').AsCurrency;

     End
     Else
     Begin
       ValorRef3 := 0;
     End;

     QBuscaAvaria.SQL.Clear;
     QBuscaAvaria.SQL.Add('select coalesce(avaria,0) as avaria, coalesce(categoria,'' '') as cat  from TBPLANNEUTRON where fornecedor = ''OURO VERDE'' and placa=:pl');
     QBuscaAvaria.ParamByName('pl').Text := FormProcPlanAcelero.StringGridAcelero.Cells[0,I];
     QBuscaAvaria.Open;

      // Valida placa se ja importou
  QValidaPlacaJaImportada.SQL.Clear;
  QValidaPlacaJaImportada.SQL.Add('select count(*) as Existe from TBPROCPLANS where PLACA=:PLACA and FORNECEDOR=:FOR');
  QValidaPlacaJaImportada.ParamByName('PLACA').Text := FormProcPlanAcelero.StringGridAcelero.Cells[0,I];
  QValidaPlacaJaImportada.ParamByName('FOR').Text := 'OURO VERDE';
  QValidaPlacaJaImportada.Open;

  if QValidaPlacaJaImportada.FieldByName('Existe').AsInteger > 0 then
   Begin

     // Avarias
     QBuscaAvaria.SQL.Clear;
     QBuscaAvaria.SQL.Add('select coalesce(avaria,0) as avaria, coalesce(categoria,'' '') as cat  from TBPLANNEUTRON where fornecedor = ''OURO VERDE'' and placa=:pl');
     QBuscaAvaria.ParamByName('pl').Text := FormProcPlanAcelero.StringGridAcelero.Cells[0,I];
     QBuscaAvaria.Open;

        // Carrega cod_fipe da conciliação
     QBuscaMescla.SQL.Clear;
     QBuscaMescla.SQL.Add('select cod_fipe, VLR_FIPE from TBCONCFIPEMODELO where modelo=:mod and fornecedor = ''OURO VERDE''');
     QBuscaMescla.SQL.Add('and ANO=:ano');
     QBuscaMescla.SQL.Add('and ref_fipe=:ref');
     QBuscaMescla.ParamByName('ano').Text := FormProcPlanAcelero.StringGridAcelero.Cells[2,I];
     QBuscaMescla.ParamByName('mod').Text := FormProcPlanAcelero.StringGridAcelero.Cells[1,I];
     QBuscaMescla.ParamByName('ref').Text := Principal;
     QBuscaMescla.Open;

     if not QBuscaMescla.IsEmpty then
     Begin
         //ShowMessage('Vai buscar venda 30d');
          cod_fipe := QBuscaMescla.FieldByName('cod_fipe').Text;
         // Carrega vendas dos ultimos 30 dias
         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select COUNT(*) as vnd from IMPORTASAVANNAVENDA30DIAS');
         QSavannaLocal.SQL.Add('where FIPE = :fipe and ano=:ANO');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := FormProcPlanAcelero.StringGridAcelero.Cells[2,I];
         QSavannaLocal.Open;

         //ShowMessage('Buscou venda 30d');

         Application.ProcessMessages;

         if not QSavannaLocal.FieldByName('vnd').IsNull then
         vendas30dias := QSavannaLocal.FieldByName('vnd').AsInteger
         Else
         vendas30dias := 0;

         // Carrega ultimo vlr de venda
         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select valor, data from IMPORTASAVANNAULTIMASVENDAS');
         QSavannaLocal.SQL.Add('where FIPE = :fipe and ano=:ano');
         QSavannaLocal.SQL.Add('order by data desc ');
         QSavannaLocal.SQL.Add('limit 1');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := FormProcPlanAcelero.StringGridAcelero.Cells[2,I];
         QSavannaLocal.Open;

       //ShowMessage('Buscou vlr venda');

         Application.ProcessMessages;

         if QSavannaLocal.FieldByName('valor').AsCurrency <> null then
         vl_ultima_venda := QSavannaLocal.FieldByName('valor').AsCurrency
         Else
         vl_ultima_venda := 0;

         if QSavannaLocal.FieldByName('data').AsDateTime <> null then
         DT_VENDA := QSavannaLocal.FieldByName('data').AsDateTime;

         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select sum(qtd) as  Estoque from IMPORTASAVANNAESTOQUE where FIPE = :fipe and ano=:ano');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := FormProcPlanAcelero.StringGridAcelero.Cells[2,I];
         QSavannaLocal.Open;

          Application.ProcessMessages;

         if not QSavannaLocal.FieldByName('Estoque').IsNull then
         EstoqueAtual := QSavannaLocal.FieldByName('Estoque').AsInteger
         Else
         EstoqueAtual := 0;

     End;

     QAtualizaG.SQL.Clear;
     QAtualizaG.SQL.Add('select');
     QAtualizaG.SQL.Add('coalesce(G_ZERO , 0) as G_ZERO, DT_G0');
     QAtualizaG.SQL.Add('from tbprocplans');
     QAtualizaG.SQL.Add('where COD_FIPE = :c_fipe');
     QAtualizaG.SQL.Add('and ANO_MOD = :ano');
     QAtualizaG.SQL.Add('and G_ZERO > 0');
     QAtualizaG.SQL.Add('order by id desc');
     QAtualizaG.SQL.Add('limit 1');
     QAtualizaG.ParamByName('c_fipe').Text := cod_fipe;
     QAtualizaG.ParamByName('ano').Text := modelo;
     QAtualizaG.Open;


     QValidaPlacaJaImportada.SQL.Clear;
     QValidaPlacaJaImportada.SQL.Add('update TBPROCPLANS set');
     QValidaPlacaJaImportada.SQL.Add('vlr_min=:vlr_min,');
     QValidaPlacaJaImportada.SQL.Add('km=:km,');
     QValidaPlacaJaImportada.SQL.Add('venda_trinta_dias=:venda_trinta_dias,');
     QValidaPlacaJaImportada.SQL.Add('estoque=:estoque,');
     QValidaPlacaJaImportada.SQL.Add('vlr_ult_venda=:vlr_ult_venda,');
     QValidaPlacaJaImportada.SQL.Add('dt_ult_venda=:dt_ult_venda,');
     QValidaPlacaJaImportada.SQL.Add('categoria=:cat,');
     QValidaPlacaJaImportada.SQL.Add('avaria=:avaria,');
     QValidaPlacaJaImportada.SQL.Add('DATA=:dt,');
     QValidaPlacaJaImportada.SQL.Add('onde=:onde,');
     QValidaPlacaJaImportada.SQL.Add('local=:local,');
	   QValidaPlacaJaImportada.SQL.Add('ULT_G0=:UG0,');
     QValidaPlacaJaImportada.SQL.Add('DT_G0=:DTG0,');
     QValidaPlacaJaImportada.SQL.Add('ref_fipe=:ref, fipe2:=:vlfipe2, ref_fipe2=:ref2, fipe3=:vlfipe3, ref_fipe3=:ref3,');
     QValidaPlacaJaImportada.SQL.Add('vlr_fipe=:fipe, IMPORT_PLANILHA=:PLAN, IMPORT_DATA=:DT, situacao = 0 where PLACA=:PLACA');
     QValidaPlacaJaImportada.ParamByName('PLAN').Text := LblNomeArquivo.Caption;
     QValidaPlacaJaImportada.ParamByName('DT').AsDate := NOW;
     QValidaPlacaJaImportada.ParamByName('placa').Text := FormProcPlanAcelero.StringGridAcelero.Cells[0,I];
     QValidaPlacaJaImportada.ParamByName('km').AsCurrency := StrToCurr(Alltrim(StringReplace(StringReplace(StringReplace(StringReplace(StringReplace(StringReplace(StringReplace(StringReplace(StringReplace(FormProcPlanAcelero.StringGridAcelero.Cells[3,I], '.', '', [rfReplaceAll]),'P. QUEBRADO', '0',[rfReplaceAll]), 'P  QUEBRADO', '0', [rfReplaceAll]),'P QUEBRADO', '0', [rfReplaceAll]), 'PAINEL APAGADO', '0', [rfReplaceAll]), ',', '', [rfReplaceAll]),'#N/D', '0', [rfReplaceAll]), 'PAINEL0QUEBRADO', '0', [rfReplaceAll]), 'PQUEBRADO', '0', [rfReplaceAll]) ));
     QValidaPlacaJaImportada.ParamByName('dt_ult_venda').AsDate := DT_VENDA;
     QValidaPlacaJaImportada.ParamByName('ref').Text := Principal;
     QValidaPlacaJaImportada.ParamByName('vlfipe2').AsCurrency := ValorRef2;
     QValidaPlacaJaImportada.ParamByName('ref2').Text := Ref2;
     QValidaPlacaJaImportada.ParamByName('vlfipe3').AsCurrency := ValorRef3;
     QValidaPlacaJaImportada.ParamByName('ref3').Text := Ref3;
     QValidaPlacaJaImportada.ParamByName('vlr_min').AsCurrency := StrToCurr(Alltrim(StringReplace(StringReplace(FormProcPlanAcelero.StringGridAcelero.Cells[6,I], '.', '', [rfReplaceAll]), 'R$', '', [rfReplaceAll])));
     QValidaPlacaJaImportada.ParamByName('fipe').AsCurrency := QBuscaMescla.FieldByName('VLR_FIPE').AsCurrency;
     QValidaPlacaJaImportada.ParamByName('venda_trinta_dias').AsInteger := vendas30dias;
     QValidaPlacaJaImportada.ParamByName('estoque').AsInteger := EstoqueAtual;
     QValidaPlacaJaImportada.ParamByName('vlr_ult_venda').AsCurrency := vl_ultima_venda;
     QValidaPlacaJaImportada.ParamByName('dt').AsDate := NOW;
     QValidaPlacaJaImportada.ParamByName('onde').Text :=  FormProcPlanAcelero.StringGridAcelero.Cells[5,I];
     QValidaPlacaJaImportada.ParamByName('local').Text := FormProcPlanAcelero.StringGridAcelero.Cells[4,I];
     QValidaPlacaJaImportada.ParamByName('cat').Text := QBuscaAvaria.FieldByName('cat').Text;
     if QBuscaAvaria.FieldByName('avaria').AsCurrency > 0 then
     QValidaPlacaJaImportada.ParamByName('avaria').AsCurrency := QBuscaAvaria.FieldByName('avaria').AsCurrency
     Else
     QValidaPlacaJaImportada.ParamByName('avaria').AsCurrency := 0;
     if QAtualizaG.FieldByName('G_ZERO').AsFloat > 0 then
     QValidaPlacaJaImportada.ParamByName('UG0').AsFloat := QAtualizaG.FieldByName('G_ZERO').AsFloat
     Else
     QValidaPlacaJaImportada.ParamByName('UG0').AsFloat := 0;
     if QAtualizaG.FieldByName('DT_G0').AsDateTime <> null then
     QValidaPlacaJaImportada.ParamByName('DTG0').AsDate := QAtualizaG.FieldByName('DT_G0').AsDateTime
     Else
     QValidaPlacaJaImportada.ParamByName('DTG0').AsDate := null;
     QValidaPlacaJaImportada.Execute;

     FormLoading.LabelStatus.Caption := 'Atualizando planilha OURO VERDE PLACA: '+FormProcPlanAcelero.StringGridAcelero.Cells[1,I];

  End
   Else
   Begin

     QAtualizaG.SQL.Clear;
     QAtualizaG.SQL.Add('select');
     QAtualizaG.SQL.Add('coalesce(G_ZERO , 0) as G_ZERO, DT_G0');
     QAtualizaG.SQL.Add('from tbprocplans');
     QAtualizaG.SQL.Add('where COD_FIPE = :c_fipe');
     QAtualizaG.SQL.Add('and ANO_MOD = :ano');
     QAtualizaG.SQL.Add('and G_ZERO > 0');
     QAtualizaG.SQL.Add('order by id desc');
     QAtualizaG.SQL.Add('limit 1');
     QAtualizaG.ParamByName('c_fipe').Text := cod_fipe;
     QAtualizaG.ParamByName('ano').Text := Modelo;
     QAtualizaG.Open;


   QInsereDados.SQL.Clear;
   QInsereDados.SQL.Add('insert into TBPROCPLANS');
   QInsereDados.SQL.Add('( licitacao, lote, placa, modelo, km, ano, ano_mod, cor, vlr_min,');
   QInsereDados.SQL.Add('  vlr_min_fipe, vlr_min_dois, compra_ja, vlr_fipe, vlr_merc_um, vlr_merc_dois,');
   QInsereDados.SQL.Add('  venda_trinta_dias, estoque, vlr_ult_venda, dt_ult_venda, atacado_varejo, categoria, g_zero,');
   QInsereDados.SQL.Add(' mg, avaria, resultado, min_resultado, lance, lance_fipe, compra, sn,');
   QInsereDados.SQL.Add('  dt_pgto, qtd, fornecedor, id_plan_for, cod_fipe, situacao, data, onde, local, ULT_G0, DT_G0, IMPORT_PLANILHA, IMPORT_DATA, IMPORT_STATUS, ref_fipe, fipe2, ref_fipe2, fipe3, ref_fipe3)');
   QInsereDados.SQL.Add('values');
   QInsereDados.SQL.Add('(:licitacao, :lote, :placa, :modelo, :km, :ano, :anomod, :cor, :vlr_min,');
   QInsereDados.SQL.Add(':vlr_min_fipe, :vlr_min_dois, :compra_ja, :fipe, :vlr_m_um, :vlr_m_dois,');
   QInsereDados.SQL.Add(':venda_trinta_dias, :estoque, :vlr_ult_venda, :dt_venda, :ata_var, :cat, :gzero,');
   QInsereDados.SQL.Add(':mg, :avaria, :result, :min_result, :lance, :lance_fipe, :compra, :sn, :dt_pgto,');
   QInsereDados.SQL.Add(':qtd, :fornecedor, :id_plan, :c_fipe, :sit, :dt, :onde, :local, :UG0, :DTG0, :PLANILHA, :DT_PLANILHA, :STATUS_PLANILHA, :ref, :vlfipe2, :ref2, :vlfipe3, :ref3)');
   QInsereDados.ParamByName('PLANILHA').Text := LblNomeArquivo.Caption;
   QInsereDados.ParamByName('DT_PLANILHA').AsDate := NOW;
   QInsereDados.ParamByName('STATUS_PLANILHA').Text := 'Em Analise';
   QInsereDados.ParamByName('licitacao').Text := '';
   QInsereDados.ParamByName('lote').Text := '';
   QInsereDados.ParamByName('ref').Text := Principal;
   QInsereDados.ParamByName('vlfipe2').AsCurrency := ValorRef2;
   QInsereDados.ParamByName('ref2').Text := Ref2;
   QInsereDados.ParamByName('vlfipe3').AsCurrency := ValorRef3;
   QInsereDados.ParamByName('ref3').Text := Ref3;
   QInsereDados.ParamByName('placa').Text := FormProcPlanAcelero.StringGridAcelero.Cells[0,I];
   QInsereDados.ParamByName('modelo').Text := FormProcPlanAcelero.StringGridAcelero.Cells[1,I];
   QInsereDados.ParamByName('km').AsCurrency := StrToCurr(Alltrim(StringReplace(StringReplace(StringReplace(StringReplace(StringReplace(StringReplace(StringReplace(StringReplace(StringReplace(FormProcPlanAcelero.StringGridAcelero.Cells[3,I], '.', '', [rfReplaceAll]),'P. QUEBRADO', '0',[rfReplaceAll]), 'P  QUEBRADO', '0', [rfReplaceAll]),'P QUEBRADO', '0', [rfReplaceAll]), 'PAINEL APAGADO', '0', [rfReplaceAll]), ',', '', [rfReplaceAll]),'#N/D', '0', [rfReplaceAll]), 'PAINEL0QUEBRADO', '0', [rfReplaceAll]), 'PQUEBRADO', '0', [rfReplaceAll]) ));
   QInsereDados.ParamByName('ano').Text := FormProcPlanAcelero.StringGridAcelero.Cells[2,I];
   QInsereDados.ParamByName('dt_venda').AsDate := DT_VENDA;
   QInsereDados.ParamByName('anomod').Text := FormProcPlanAcelero.StringGridAcelero.Cells[2,I];
   QInsereDados.ParamByName('cor').Text := ''; //FormProcPlanAcelero.StringGridAcelero.Cells[4,I];
   QInsereDados.ParamByName('vlr_min').AsCurrency := StrToCurr(Alltrim(StringReplace(StringReplace(FormProcPlanAcelero.StringGridAcelero.Cells[6,I], '.', '', [rfReplaceAll]), 'R$', '', [rfReplaceAll])));
   QInsereDados.ParamByName('vlr_min_fipe').AsCurrency := QBuscaMescla.FieldByName('VLR_FIPE').AsCurrency -  StrToCurr(Alltrim(StringReplace(StringReplace(FormProcPlanAcelero.StringGridAcelero.Cells[6,I], '.', '', [rfReplaceAll]), 'R$', '', [rfReplaceAll])));
   QInsereDados.ParamByName('vlr_min_dois').AsCurrency := 0;
   QInsereDados.ParamByName('compra_ja').AsCurrency := 0;
   QInsereDados.ParamByName('fipe').AsCurrency := QBuscaMescla.FieldByName('VLR_FIPE').AsCurrency;
   QInsereDados.ParamByName('vlr_m_um').AsCurrency := 0;
   QInsereDados.ParamByName('vlr_m_dois').AsCurrency := 0;
   QInsereDados.ParamByName('venda_trinta_dias').AsInteger := vendas30dias;
   QInsereDados.ParamByName('estoque').AsInteger := EstoqueAtual;
   QInsereDados.ParamByName('vlr_ult_venda').AsCurrency := vl_ultima_venda;
   QInsereDados.ParamByName('ata_var').Text := '';
   QInsereDados.ParamByName('gzero').AsCurrency := 0;
   QInsereDados.ParamByName('mg').AsCurrency :=  Margem;;
   QInsereDados.ParamByName('c_fipe').Text := cod_fipe;
   QInsereDados.ParamByName('sit').AsInteger := 0;
   QInsereDados.ParamByName('dt').AsDate := NOW;
   QInsereDados.ParamByName('onde').Text :=  FormProcPlanAcelero.StringGridAcelero.Cells[5,I];
   QInsereDados.ParamByName('local').Text := FormProcPlanAcelero.StringGridAcelero.Cells[4,I];
   QInsereDados.ParamByName('fornecedor').Text := 'OURO VERDE';
   QInsereDados.ParamByName('cat').Text := QBuscaAvaria.FieldByName('cat').Text;
   if QBuscaAvaria.FieldByName('avaria').AsCurrency > 0 then
   QInsereDados.ParamByName('avaria').AsCurrency := QBuscaAvaria.FieldByName('avaria').AsCurrency
   Else
   QInsereDados.ParamByName('avaria').AsCurrency := 0;
     if QAtualizaG.FieldByName('G_ZERO').AsFloat > 0 then
     QInsereDados.ParamByName('UG0').AsFloat := QAtualizaG.FieldByName('G_ZERO').AsFloat
     Else
     QInsereDados.ParamByName('UG0').AsFloat := 0;
     if QAtualizaG.FieldByName('DT_G0').AsDateTime <> null then
     QInsereDados.ParamByName('DTG0').AsDate := QAtualizaG.FieldByName('DT_G0').AsDateTime
     Else
     QInsereDados.ParamByName('DTG0').AsDate := null;
   QInsereDados.Execute;

    FormLoading.LabelStatus.Caption := 'Importando planilha OURO VERDE PLACA: '+FormProcPlanAcelero.StringGridAcelero.Cells[0,I];

    Application.ProcessMessages;
   End;

  End;
 Finally

 End;
  MessageDlg('Importação finalizada', mtInformation, [mbok], 0);
end;


procedure TFormNovoProcessamento.ImportaPlanUNIDAS;
Var
  I, Qtd, vendas30dias, EstoqueAtual: integer;
  modelo, cod_fipe : string;
  vl_ultima_venda : Currency;
  DT_VENDA : TDate;
  Cidade, Endereco : String;
  KM : Double;
 Begin

   vendas30dias := 0;
   EstoqueAtual := 0;
   vl_ultima_venda := 0;

 Try
  for I := 0 to Pred(FormProcPlanAcelero.StringGridAcelero.RowCount) do
  Begin

  if I = 0 then
  Continue;

  if Trim(FormProcPlanAcelero.StringGridAcelero.Cells[0,I]) = '' then
  Continue;

    DataModuleConexao.qBuscaRefFipe.SQL.Clear;
    DataModuleConexao.qBuscaRefFipe.SQL.Add('select ref1 , ref2, ref3, principal from tbfiperef');
    DataModuleConexao.qBuscaRefFipe.Open;

    Principal := DataModuleConexao.qBuscaRefFipe.FieldByName('principal').Text;
    Ref1      := DataModuleConexao.qBuscaRefFipe.FieldByName('ref1').Text;
    Ref2      := DataModuleConexao.qBuscaRefFipe.FieldByName('ref2').Text;
    Ref3      := DataModuleConexao.qBuscaRefFipe.FieldByName('ref3').Text;

    if ref1 <> Principal then
    Begin

      ref1 := DataModuleConexao.qBuscaRefFipe.FieldByName('principal').Text;
      Ref2 := DataModuleConexao.qBuscaRefFipe.FieldByName('ref1').Text;
      ref3 := DataModuleConexao.qBuscaRefFipe.FieldByName('ref2').Text;

    End;

    // Verifica modelo na conciliação de mod x fipe
    QConcFIPE.SQL.Clear;
    QConcFIPE.SQL.Add('select count(*) as existe from TBCONCFIPEMODELO where modelo = :mod AND ANO=:ANO and fornecedor = ''UNIDAS''');
    QConcFIPE.SQL.Add('and ref_fipe=:ref');
    QConcFIPE.ParamByName('mod').Text := FormProcPlanAcelero.StringGridAcelero.Cells[2,I];
    QConcFIPE.ParamByName('ANO').Text := FormProcPlanAcelero.StringGridAcelero.Cells[6,I];
    QConcFIPE.ParamByName('ref').Text := Principal;
    QConcFIPE.Open;

    if QConcFIPE.FieldByName('existe').AsInteger = 0 then
     Begin
      MessageDlg('Não foi encontrada vinculação de FIPE para o modelo, efetue-a.'+#13+
               'Modelo: '+FormProcPlanAcelero.StringGridAcelero.Cells[2,I], mtWarning, [mbok], 0);

      FormConciliacaoFipeModelo.EditModeloFIPE.Text := Copy(FormProcPlanAcelero.StringGridAcelero.Cells[2,I], 0, 10);
      FormConciliacaoFipeModelo.Position := poScreenCenter;
      FormConciliacaoFipeModelo.lblModeloPlan.Caption := FormProcPlanAcelero.StringGridAcelero.Cells[2,I];
      FormConciliacaoFipeModelo.EditAnoFIPE.Text := FormProcPlanAcelero.StringGridAcelero.Cells[6,I];
      FormConciliacaoFipeModelo.lblFornecedor.Caption := 'UNIDAS';

      FormConciliacaoFipeModelo.ShowModal;
     End;

      // Carrega cod_fipe da conciliação
     QBuscaMescla.SQL.Clear;
     QBuscaMescla.SQL.Add('select cod_fipe, VLR_FIPE from TBCONCFIPEMODELO where modelo=:mod and fornecedor = ''UNIDAS''');
     QBuscaMescla.SQL.Add('and ANO=:ano');
     QBuscaMescla.SQL.Add('and ref_fipe=:ref');
     QBuscaMescla.ParamByName('ano').Text := FormProcPlanAcelero.StringGridAcelero.Cells[6,I];
     QBuscaMescla.ParamByName('mod').Text := FormProcPlanAcelero.StringGridAcelero.Cells[2,I];
     QBuscaMescla.ParamByName('ref').Text := Principal;
     QBuscaMescla.Open;

     if not QBuscaMescla.IsEmpty then
     Begin
         //ShowMessage('Vai buscar venda 30d');
          cod_fipe := QBuscaMescla.FieldByName('cod_fipe').Text;
         // Carrega vendas dos ultimos 30 dias
         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select COUNT(*) as vnd from IMPORTASAVANNAVENDA30DIAS');
         QSavannaLocal.SQL.Add('where FIPE = :fipe and ano=:ANO');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := FormProcPlanAcelero.StringGridAcelero.Cells[6,I];
         QSavannaLocal.Open;

         //ShowMessage('Buscou venda 30d');

         Application.ProcessMessages;

         if not QSavannaLocal.FieldByName('vnd').IsNull then
         vendas30dias := QSavannaLocal.FieldByName('vnd').AsInteger
         Else
         vendas30dias := 0;

         // Carrega ultimo vlr de venda
         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select valor, data from IMPORTASAVANNAULTIMASVENDAS');
         QSavannaLocal.SQL.Add('where FIPE = :fipe and ano=:ano');
         QSavannaLocal.SQL.Add('order by data desc ');
         QSavannaLocal.SQL.Add('limit 1');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := FormProcPlanAcelero.StringGridAcelero.Cells[6,I];
         QSavannaLocal.Open;

       //ShowMessage('Buscou vlr venda');

         Application.ProcessMessages;

         if QSavannaLocal.FieldByName('valor').AsCurrency <> null then
         vl_ultima_venda := QSavannaLocal.FieldByName('valor').AsCurrency
         Else
         vl_ultima_venda := 0;

         if QSavannaLocal.FieldByName('data').AsDateTime <> null then
         DT_VENDA := QSavannaLocal.FieldByName('data').AsDateTime;

         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select sum(qtd) as  Estoque from IMPORTASAVANNAESTOQUE where FIPE = :fipe and ano=:ano');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := FormProcPlanAcelero.StringGridAcelero.Cells[6,I];
         QSavannaLocal.Open;

          Application.ProcessMessages;

         if not QSavannaLocal.FieldByName('Estoque').IsNull then
         EstoqueAtual := QSavannaLocal.FieldByName('Estoque').AsInteger
         Else
         EstoqueAtual := 0;

     End;

      // funcao de carga de categoria x avaria Neutron

     if Ref2 <> ' ' then
     Begin

       DataModuleConexao.qBuscaFipesRef.SQL.Clear;
       DataModuleConexao.qBuscaFipesRef.SQL.Add('select "'+'ANO'+FormProcPlanAcelero.StringGridAcelero.Cells[6,I]+'" as FIPE from TBFIPE where');
       DataModuleConexao.qBuscaFipesRef.SQL.Add(' "'+'ANO'+FormProcPlanAcelero.StringGridAcelero.Cells[6,I]+'" > 0 and cod_fipe = :codfipe and ref=:ref');
       DataModuleConexao.qBuscaFipesRef.ParamByName('codfipe').text := cod_fipe;
       DataModuleConexao.qBuscaFipesRef.ParamByName('ref').Text := Ref2;
       DataModuleConexao.qBuscaFipesRef.Open;

       ValorRef2 := DataModuleConexao.qBuscaFipesRef.FieldByName('FIPE').AsCurrency;

     End
     Else
     Begin
       ValorRef2 := 0;
     End;

     if Ref3 <> ' ' then
     Begin

       DataModuleConexao.qBuscaFipesRef.SQL.Clear;
       DataModuleConexao.qBuscaFipesRef.SQL.Add('select "'+'ANO'+FormProcPlanAcelero.StringGridAcelero.Cells[6,I]+'" as FIPE from TBFIPE where');
       DataModuleConexao.qBuscaFipesRef.SQL.Add(' "'+'ANO'+FormProcPlanAcelero.StringGridAcelero.Cells[6,I]+'" > 0 and cod_fipe = :codfipe and ref=:ref');
       DataModuleConexao.qBuscaFipesRef.ParamByName('codfipe').text := cod_fipe;
       DataModuleConexao.qBuscaFipesRef.ParamByName('ref').Text := Ref3;
       DataModuleConexao.qBuscaFipesRef.Open;

       ValorRef3 := DataModuleConexao.qBuscaFipesRef.FieldByName('FIPE').AsCurrency;

     End
     Else
     Begin
       ValorRef3 := 0;
     End;

     QBuscaAvaria.SQL.Clear;
     QBuscaAvaria.SQL.Add('select coalesce(avaria,0) as avaria, coalesce(categoria,'' '') as cat  from TBPLANNEUTRON where fornecedor = ''UNIDAS'' ');
     QBuscaAvaria.SQL.Add('and placa=:pl');
     QBuscaAvaria.ParamByName('pl').Text := FormProcPlanAcelero.StringGridAcelero.Cells[1,I];
     QBuscaAvaria.Open;

      // Valida placa se ja importou
  QValidaPlacaJaImportada.SQL.Clear;
  QValidaPlacaJaImportada.SQL.Add('select count(*) as Existe from TBPROCPLANS where PLACA=:PLACA and FORNECEDOR=:FOR');
  QValidaPlacaJaImportada.ParamByName('PLACA').Text := FormProcPlanAcelero.StringGridAcelero.Cells[1,I];
  QValidaPlacaJaImportada.ParamByName('FOR').Text := 'UNIDAS';
  QValidaPlacaJaImportada.Open;

 if QValidaPlacaJaImportada.FieldByName('Existe').AsInteger > 0 then
   Begin

     // Avarias
     QBuscaAvaria.SQL.Clear;
     QBuscaAvaria.SQL.Add('select coalesce(avaria,0) as avaria, coalesce(categoria,'' '') as cat  from TBPLANNEUTRON ');
     QBuscaAvaria.SQL.Add('where fornecedor = ''UNIDAS'' and placa=:pl');
     QBuscaAvaria.ParamByName('pl').Text := FormProcPlanAcelero.StringGridAcelero.Cells[1,I];
     QBuscaAvaria.Open;

        // Carrega cod_fipe da conciliação
     QBuscaMescla.SQL.Clear;
     QBuscaMescla.SQL.Add('select cod_fipe, VLR_FIPE from TBCONCFIPEMODELO where modelo=:mod and fornecedor = ''UNIDAS''');
     QBuscaMescla.SQL.Add('and ANO=:ano');
     QBuscaMescla.SQL.Add('and ref_fipe=:ref');
     QBuscaMescla.ParamByName('ano').Text := FormProcPlanAcelero.StringGridAcelero.Cells[6,I];
     QBuscaMescla.ParamByName('mod').Text := FormProcPlanAcelero.StringGridAcelero.Cells[2,I];
     QBuscaMescla.ParamByName('ref').Text := Principal;
     QBuscaMescla.Open;

     if not QBuscaMescla.IsEmpty then
     Begin
         //ShowMessage('Vai buscar venda 30d');
          cod_fipe := QBuscaMescla.FieldByName('cod_fipe').Text;
         // Carrega vendas dos ultimos 30 dias
         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select COUNT(*) as vnd from IMPORTASAVANNAVENDA30DIAS');
         QSavannaLocal.SQL.Add('where FIPE = :fipe and ano=:ANO');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := FormProcPlanAcelero.StringGridAcelero.Cells[6,I];
         QSavannaLocal.Open;

         //ShowMessage('Buscou venda 30d');

         Application.ProcessMessages;

         if not QSavannaLocal.FieldByName('vnd').IsNull then
         vendas30dias := QSavannaLocal.FieldByName('vnd').AsInteger
         Else
         vendas30dias := 0;

         // Carrega ultimo vlr de venda
         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select valor, data from IMPORTASAVANNAULTIMASVENDAS');
         QSavannaLocal.SQL.Add('where FIPE = :fipe and ano=:ano');
         QSavannaLocal.SQL.Add('order by data desc ');
         QSavannaLocal.SQL.Add('limit 1');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := FormProcPlanAcelero.StringGridAcelero.Cells[6,I];
         QSavannaLocal.Open;

       //ShowMessage('Buscou vlr venda');

         Application.ProcessMessages;

         if QSavannaLocal.FieldByName('valor').AsCurrency <> null then
         vl_ultima_venda := QSavannaLocal.FieldByName('valor').AsCurrency
         Else
         vl_ultima_venda := 0;

         if QSavannaLocal.FieldByName('data').AsDateTime <> null then
         DT_VENDA := QSavannaLocal.FieldByName('data').AsDateTime;

         QSavannaLocal.SQL.Clear;
         QSavannaLocal.SQL.Add('select sum(qtd) as  Estoque from IMPORTASAVANNAESTOQUE where FIPE = :fipe and ano=:ano');
         QSavannaLocal.ParamByName('fipe').Text := cod_fipe;
         QSavannaLocal.ParamByName('ano').Text  := FormProcPlanAcelero.StringGridAcelero.Cells[6,I];
         QSavannaLocal.Open;

          Application.ProcessMessages;

         if not QSavannaLocal.FieldByName('Estoque').IsNull then
         EstoqueAtual := QSavannaLocal.FieldByName('Estoque').AsInteger
         Else
         EstoqueAtual := 0;

     End;

     QAtualizaG.SQL.Clear;
     QAtualizaG.SQL.Add('select');
     QAtualizaG.SQL.Add('coalesce(G_ZERO , 0) as G_ZERO, DT_G0');
     QAtualizaG.SQL.Add('from tbprocplans');
     QAtualizaG.SQL.Add('where COD_FIPE = :c_fipe');
     QAtualizaG.SQL.Add('and ANO_MOD = :ano');
     QAtualizaG.SQL.Add('and G_ZERO > 0');
     QAtualizaG.SQL.Add('order by id desc');
     QAtualizaG.SQL.Add('limit 1');
     QAtualizaG.ParamByName('c_fipe').Text := cod_fipe;
     QAtualizaG.ParamByName('ano').Text := FormProcPlanAcelero.StringGridAcelero.Cells[6,I];
     QAtualizaG.Open;


       QValidaPlacaJaImportada.SQL.Clear;
     QValidaPlacaJaImportada.SQL.Add('update TBPROCPLANS set');
     QValidaPlacaJaImportada.SQL.Add('vlr_min=:vlr_min,');
     QValidaPlacaJaImportada.SQL.Add('km=:km,');
     QValidaPlacaJaImportada.SQL.Add('venda_trinta_dias=:venda_trinta_dias,');
     QValidaPlacaJaImportada.SQL.Add('estoque=:estoque,');
     QValidaPlacaJaImportada.SQL.Add('vlr_ult_venda=:vlr_ult_venda,');
     QValidaPlacaJaImportada.SQL.Add('dt_ult_venda=:dt_ult_venda,');
     QValidaPlacaJaImportada.SQL.Add('categoria=:cat,');
     QValidaPlacaJaImportada.SQL.Add('avaria=:avaria,');
     QValidaPlacaJaImportada.SQL.Add('DATA=:dt,');
     QValidaPlacaJaImportada.SQL.Add('onde=:onde,');
     QValidaPlacaJaImportada.SQL.Add('local=:local,');
   	 QValidaPlacaJaImportada.SQL.Add('ULT_G0=:UG0,');
     QValidaPlacaJaImportada.SQL.Add('DT_G0=:DTG0,');
     QValidaPlacaJaImportada.SQL.Add('ref_fipe=:ref, fipe2:=:vlfipe2, ref_fipe2=:ref2, fipe3=:vlfipe3, ref_fipe3=:ref3,');
      QValidaPlacaJaImportada.SQL.Add('vlr_fipe=:fipe, IMPORT_PLANILHA=:PLAN, IMPORT_DATA=:DT, situacao = 0 where PLACA=:PLACA');
     QValidaPlacaJaImportada.ParamByName('PLAN').Text := LblNomeArquivo.Caption;
     QValidaPlacaJaImportada.ParamByName('DT').AsDate := NOW;
     QValidaPlacaJaImportada.ParamByName('placa').Text := FormProcPlanAcelero.StringGridAcelero.Cells[1,I];
     QValidaPlacaJaImportada.ParamByName('km').AsCurrency := StrToCurr(FormProcPlanAcelero.StringGridAcelero.Cells[5,I]);
     QValidaPlacaJaImportada.ParamByName('dt_ult_venda').AsDate := DT_VENDA;
     QValidaPlacaJaImportada.ParamByName('ref').Text := Principal;
     QValidaPlacaJaImportada.ParamByName('vlfipe2').AsCurrency := ValorRef2;
     QValidaPlacaJaImportada.ParamByName('ref2').Text := Ref2;
     QValidaPlacaJaImportada.ParamByName('vlfipe3').AsCurrency := ValorRef3;
     QValidaPlacaJaImportada.ParamByName('ref3').Text := Ref3;
     QValidaPlacaJaImportada.ParamByName('vlr_min').AsCurrency := StrToCurr(StringReplace(FormProcPlanAcelero.StringGridAcelero.Cells[7,I],'#N/D','NADA INFORMADO', [rfReplaceAll]));
     QValidaPlacaJaImportada.ParamByName('fipe').AsCurrency := QBuscaMescla.FieldByName('VLR_FIPE').AsCurrency;
     QValidaPlacaJaImportada.ParamByName('venda_trinta_dias').AsInteger := vendas30dias;
     QValidaPlacaJaImportada.ParamByName('estoque').AsInteger := EstoqueAtual;
     QValidaPlacaJaImportada.ParamByName('vlr_ult_venda').AsCurrency := vl_ultima_venda;
     QValidaPlacaJaImportada.ParamByName('dt').AsDate := NOW;
     QValidaPlacaJaImportada.ParamByName('onde').Text :=  FormProcPlanAcelero.StringGridAcelero.Cells[0,I];
     QValidaPlacaJaImportada.ParamByName('local').Text := '';
     QValidaPlacaJaImportada.ParamByName('cat').Text := QBuscaAvaria.FieldByName('cat').Text;
     if QBuscaAvaria.FieldByName('avaria').AsCurrency > 0 then
     QValidaPlacaJaImportada.ParamByName('avaria').AsCurrency := QBuscaAvaria.FieldByName('avaria').AsCurrency
     Else
     QValidaPlacaJaImportada.ParamByName('avaria').AsCurrency := 0;
     if QAtualizaG.FieldByName('G_ZERO').AsFloat > 0 then
     QValidaPlacaJaImportada.ParamByName('UG0').AsFloat := QAtualizaG.FieldByName('G_ZERO').AsFloat
     Else
     QValidaPlacaJaImportada.ParamByName('UG0').AsFloat := 0;
     if QAtualizaG.FieldByName('DT_G0').AsDateTime <> null then
     QValidaPlacaJaImportada.ParamByName('DTG0').AsDate := QAtualizaG.FieldByName('DT_G0').AsDateTime
     Else
     QValidaPlacaJaImportada.ParamByName('DTG0').AsDate := null;
     QValidaPlacaJaImportada.Execute;

     FormLoading.LabelStatus.Caption := 'Importando planilha UNIDAS PLACA: '+FormProcPlanAcelero.StringGridAcelero.Cells[1,I];
   End
    Else
   Begin

     QAtualizaG.SQL.Clear;
     QAtualizaG.SQL.Add('select');
     QAtualizaG.SQL.Add('coalesce(G_ZERO , 0) as G_ZERO, DT_G0');
     QAtualizaG.SQL.Add('from tbprocplans');
     QAtualizaG.SQL.Add('where COD_FIPE = :c_fipe');
     QAtualizaG.SQL.Add('and ANO_MOD = :ano');
     QAtualizaG.SQL.Add('and G_ZERO > 0');
     QAtualizaG.SQL.Add('order by id desc');
     QAtualizaG.SQL.Add('limit 1');
     QAtualizaG.ParamByName('c_fipe').Text := cod_fipe;
     QAtualizaG.ParamByName('ano').Text := FormProcPlanAcelero.StringGridAcelero.Cells[6,I];
     QAtualizaG.Open;


   QInsereDados.SQL.Clear;
   QInsereDados.SQL.Add('insert into TBPROCPLANS');
   QInsereDados.SQL.Add('( licitacao, lote, placa, modelo, km, ano, ano_mod, cor, vlr_min,');
   QInsereDados.SQL.Add('  vlr_min_fipe, vlr_min_dois, compra_ja, vlr_fipe, vlr_merc_um, vlr_merc_dois,');
   QInsereDados.SQL.Add('  venda_trinta_dias, estoque, vlr_ult_venda, dt_ult_venda, atacado_varejo, categoria, g_zero,');
   QInsereDados.SQL.Add(' mg, avaria, resultado, min_resultado, lance, lance_fipe, compra, sn,');
   QInsereDados.SQL.Add('  dt_pgto, qtd, fornecedor, id_plan_for, cod_fipe, situacao, data, onde, local, ULT_G0, DT_G0, IMPORT_PLANILHA, IMPORT_DATA, IMPORT_STATUS, ref_fipe, fipe2, ref_fipe2, fipe3, ref_fipe3)');
   QInsereDados.SQL.Add('values');
   QInsereDados.SQL.Add('(:licitacao, :lote, :placa, :modelo, :km, :ano, :anomod, :cor, :vlr_min,');
   QInsereDados.SQL.Add(':vlr_min_fipe, :vlr_min_dois, :compra_ja, :fipe, :vlr_m_um, :vlr_m_dois,');
   QInsereDados.SQL.Add(':venda_trinta_dias, :estoque, :vlr_ult_venda, :dt_venda, :ata_var, :cat, :gzero,');
   QInsereDados.SQL.Add(':mg, :avaria, :result, :min_result, :lance, :lance_fipe, :compra, :sn, :dt_pgto,');
   QInsereDados.SQL.Add(':qtd, :fornecedor, :id_plan, :c_fipe, :sit, :dt, :onde, :local, :UG0, :DTG0, :PLANILHA, :DT_PLANILHA, :STATUS_PLANILHA, :ref, :vlfipe2, :ref2, :vlfipe3, :ref3)');
   QInsereDados.ParamByName('PLANILHA').Text := LblNomeArquivo.Caption;
   QInsereDados.ParamByName('DT_PLANILHA').AsDate := NOW;
   QInsereDados.ParamByName('STATUS_PLANILHA').Text := 'Em Analise';
   QInsereDados.ParamByName('licitacao').Text := '';
   QInsereDados.ParamByName('lote').Text := '';
   QInsereDados.ParamByName('ref').Text := Principal;
   QInsereDados.ParamByName('vlfipe2').AsCurrency := ValorRef2;
   QInsereDados.ParamByName('ref2').Text := Ref2;
   QInsereDados.ParamByName('vlfipe3').AsCurrency := ValorRef3;
   QInsereDados.ParamByName('ref3').Text := Ref3;
   QInsereDados.ParamByName('placa').Text := FormProcPlanAcelero.StringGridAcelero.Cells[1,I];
   QInsereDados.ParamByName('modelo').Text := FormProcPlanAcelero.StringGridAcelero.Cells[2,I];
   QInsereDados.ParamByName('km').AsCurrency := StrToCurr(FormProcPlanAcelero.StringGridAcelero.Cells[5,I]);
   QInsereDados.ParamByName('ano').Text := FormProcPlanAcelero.StringGridAcelero.Cells[6,I];
   QInsereDados.ParamByName('dt_venda').AsDate := DT_VENDA;
   QInsereDados.ParamByName('anomod').Text := FormProcPlanAcelero.StringGridAcelero.Cells[6,I];
   QInsereDados.ParamByName('cor').Text := FormProcPlanAcelero.StringGridAcelero.Cells[3,I];
   QInsereDados.ParamByName('vlr_min').AsCurrency := StrToCurr(StringReplace(FormProcPlanAcelero.StringGridAcelero.Cells[7,I],'#N/D','NADA INFORMADO', [rfReplaceAll]));
   QInsereDados.ParamByName('vlr_min_fipe').AsCurrency := QBuscaMescla.FieldByName('VLR_FIPE').AsCurrency - StrToCurr(StringReplace(FormProcPlanAcelero.StringGridAcelero.Cells[7,I],'#N/D','NADA INFORMADO', [rfReplaceAll]));
   QInsereDados.ParamByName('vlr_min_dois').AsCurrency := 0;
   QInsereDados.ParamByName('compra_ja').AsCurrency := 0;
   QInsereDados.ParamByName('fipe').AsCurrency := QBuscaMescla.FieldByName('VLR_FIPE').AsCurrency;
   QInsereDados.ParamByName('vlr_m_um').AsCurrency := 0;
   QInsereDados.ParamByName('vlr_m_dois').AsCurrency := 0;
   QInsereDados.ParamByName('venda_trinta_dias').AsInteger := vendas30dias;
   QInsereDados.ParamByName('estoque').AsInteger := EstoqueAtual;
   QInsereDados.ParamByName('vlr_ult_venda').AsCurrency := vl_ultima_venda;
   QInsereDados.ParamByName('ata_var').Text := '';
   QInsereDados.ParamByName('gzero').AsCurrency := 0;
   QInsereDados.ParamByName('mg').AsCurrency :=  Margem;;
   QInsereDados.ParamByName('c_fipe').Text := cod_fipe;
   QInsereDados.ParamByName('sit').AsInteger := 0;
   QInsereDados.ParamByName('dt').AsDate := NOW;
   QInsereDados.ParamByName('onde').Text :=  FormProcPlanAcelero.StringGridAcelero.Cells[0,I];
   QInsereDados.ParamByName('local').Text := '';
   QInsereDados.ParamByName('fornecedor').Text := 'UNIDAS';
   QInsereDados.ParamByName('cat').Text := QBuscaAvaria.FieldByName('cat').Text;
   if QBuscaAvaria.FieldByName('avaria').AsCurrency > 0 then
   QInsereDados.ParamByName('avaria').AsCurrency := QBuscaAvaria.FieldByName('avaria').AsCurrency
   Else
   QInsereDados.ParamByName('avaria').AsCurrency := 0;
     if QAtualizaG.FieldByName('G_ZERO').AsFloat > 0 then
     QInsereDados.ParamByName('UG0').AsFloat := QAtualizaG.FieldByName('G_ZERO').AsFloat
     Else
     QInsereDados.ParamByName('UG0').AsFloat := 0;
     if QAtualizaG.FieldByName('DT_G0').AsDateTime <> null then
     QInsereDados.ParamByName('DTG0').AsDate := QAtualizaG.FieldByName('DT_G0').AsDateTime
     Else
     QInsereDados.ParamByName('DTG0').AsDate := null;
   QInsereDados.Execute;

    FormLoading.LabelStatus.Caption := 'Importando planilha UNIDAS PLACA: '+FormProcPlanAcelero.StringGridAcelero.Cells[1,I];

    Application.ProcessMessages;
   End;

  End;

 Finally

 End;
  MessageDlg('Importação finalizada', mtInformation, [mbok], 0);
end;

procedure TFormNovoProcessamento.ProcPlanAcelero;
begin

 if FormProcPlanFinal.CheckListBox1.Selected[0] then
 Begin
   ShowMessage('ESTA MARCADO');
 End;


end;

procedure TFormNovoProcessamento.ProcPlanALD;
begin

end;

procedure TFormNovoProcessamento.ProcPlanArval;
begin

end;

procedure TFormNovoProcessamento.ProcPlanJSL;
begin

end;

procedure TFormNovoProcessamento.ProcPlanLM;
begin

end;

procedure TFormNovoProcessamento.ProcPlanLocaliza;
begin

end;

procedure TFormNovoProcessamento.ProcPlanMovida;
begin

end;

procedure TFormNovoProcessamento.ProcPlanNeutron;
begin

end;

procedure TFormNovoProcessamento.ProcPlanOuroVerde;
begin

end;

procedure TFormNovoProcessamento.ProcPlanUnidas;
begin

end;

procedure TFormNovoProcessamento.btnALDprecoFixoClick(Sender: TObject);
begin
 if EditDiretorioALD.Text <> ''  then
 Begin
   if not FileExists(EditDiretorioALD.Text) then
   Begin
     MessageDlg('Arquivo do diretório não encontrado. Recarregue o arquivo no diretório', mtWarning, [mbok], 0);
   End
   Else
   Begin
     FormLoading.LabelStatus.Caption := 'Importando planilha ALD Preço Fixo';
     FormLoading.Position := poScreenCenter;
     FormLoading.Show;
     Application.ProcessMessages;
     CarregaExcelALDprecoFixo;
     Application.ProcessMessages;
     ImportaPlanALDprecoFixo;
     FormLoading.Close;

     // REVISAR QTD da planilha importada
     QGravaPlanilha.SQL.Clear;
     QGravaPlanilha.SQL.Add('insert TBIMPORTACOES (PLANILHA, DATAIMPORT, FORNECEDOR, STATUS) values (:PLAN, :DT, :FOR, ''Em Analise'')');
     QGravaPlanilha.ParamByName('PLAN').Text := LblNomeArquivo.Caption;
     QGravaPlanilha.ParamByName('DT').AsDate := NOW;
     QGravaPlanilha.ParamByName('FOR').Text := 'ALD PREÇO FIXO';
     QGravaPlanilha.Execute;

     LblNomeArquivo.Caption := '';
   End;
 End;
end;

procedure TFormNovoProcessamento.btnCancelarClick(Sender: TObject);
begin
 close;
end;

procedure TFormNovoProcessamento.BtnGeraPlanFinalClick(Sender: TObject);
var
objExcel,Sheet,Chart,s : Variant;
cTitulo : string;
i : integer;
Begin

   // Exporta excel

   QExportaExcel.SQL.Clear;
   QExportaExcel.SQL.Add('select');
   QExportaExcel.SQL.Add('p.licitacao, p.lote, p.placa, p.modelo, p.km, p.ano, p.ano_mod, p.cor,');
   QExportaExcel.SQL.Add('p.vlr_min as "MIN",  case when p.vlr_fipe > p.vlr_min then (p.vlr_min / p.vlr_fipe * 100) else 0 end as "MIN/FIPE", p.vlr_min_dois as "MIN_2", p.compra_ja as "JA",');
   QExportaExcel.SQL.Add('p.vlr_fipe as "FIPE", p.vlr_merc_um as  "MERC1", p.vlr_merc_dois as "MERC2", p.venda_trinta_dias as "VENDA 30 DIAS",');
   QExportaExcel.SQL.Add('p.estoque, p.vlr_ult_venda, p.dt_ult_venda, p.atacado_varejo as "A/V", p.categoria, p.g_zero "G0",');
   QExportaExcel.SQL.Add('p.mg as "MG", p.avaria , p.resultado, p.min_resultado, p.lance, p.lance_fipe as "LANC/FIPE",');
   QExportaExcel.SQL.Add('p.compra, p.sn as "S/N", p.dt_pgto as "PGTO", p.qtd, p.Fornecedor, p.cod_fipe');
   QExportaExcel.SQL.Add('from TBPROCPLANS p');
   //QExportaExcel.SQL.Add(' where id_plan_for = :id');
   //QExportaExcel.ParamByName('id').AsInteger := StrToInt(EditIDPlanilha.Text);
   QExportaExcel.Open;

 // exportando
// Cria uma instancia para utilizar o Excel
  cTitulo := 'Planilha de Teste';
  objExcel := CreateOleObject('Excel.Application');
  //objExcel.Visible := True;
  objExcel.Caption := cTitulo;

  objExcel.Workbooks.Add;
  objExcel.Workbooks[1].Sheets.Add;
  objExcel.Workbooks[1].WorkSheets[1].Name := cTitulo;
  Sheet := objExcel.Workbooks[1].WorkSheets[cTitulo];

  Sheet.cells[1,1] := 'LICITACAO';
  Sheet.cells[1,2] := 'LOTE';
  Sheet.cells[1,3] := 'PLACA';
  Sheet.cells[1,4] := 'MODELO';
  Sheet.cells[1,5] := 'ANO_MODELO';
  Sheet.cells[1,6] := 'KM';
  Sheet.cells[1,7] := 'COR';
  Sheet.cells[1,8] := 'VLR MIN';
  Sheet.cells[1,9] := 'FIPE';
  Sheet.cells[1,10] := 'MIN/FIPE';
  Sheet.cells[1,11] := 'MIN/FIPE 2';
  Sheet.cells[1,12] := 'C JA';
  Sheet.cells[1,13] := 'VLR MERC 1';
  Sheet.cells[1,14] := 'VLR MERC 2';
  Sheet.cells[1,15] := '30D';
  Sheet.cells[1,16] := 'EST';
  Sheet.cells[1,17] := 'ULT VND';
  Sheet.cells[1,18] := 'DT ULT V';
  Sheet.cells[1,19] := 'AT/VA';
  Sheet.cells[1,20] := 'CAT';
  Sheet.cells[1,21] := 'G0';
  Sheet.cells[1,22] := 'MG';
  Sheet.cells[1,23] := 'VLR AVARIA';
  Sheet.cells[1,24] := 'RESUL';
  Sheet.cells[1,25] := 'MIN/RESUL';
  Sheet.cells[1,26] := 'LANCE';
  Sheet.cells[1,27] := 'LANCE/FIPE';
  Sheet.cells[1,28] := 'COMPRA';
  Sheet.cells[1,29] := 'SIM/NAO';
  Sheet.cells[1,30] := 'DT PGTO';
  Sheet.cells[1,31] := 'QTD C';
  Sheet.cells[1,32] := 'FORNECEDOR';
  Sheet.cells[1,33] := 'COD_FIPE';

  FormLoading.LabelStatus.Caption := 'Gerando Planilha, aguarde...';
  FormLoading.Position := poScreenCenter;
  FormLoading.Show;
  Application.ProcessMessages;

  i := 2;

  QExportaExcel.First;

  while not QExportaExcel.Eof do
  Begin

  Sheet.cells[i,1] := QExportaExcel.FieldByName('licitacao').AsString;
  Sheet.cells[i,2] := QExportaExcel.FieldByName('lote').AsString;
  Sheet.cells[i,3] := QExportaExcel.FieldByName('placa').AsString;
  Sheet.cells[i,4] := QExportaExcel.FieldByName('modelo').AsString;
  Sheet.cells[i,5] := QExportaExcel.FieldByName('ano_mod').AsString;
  Sheet.cells[i,6] := QExportaExcel.FieldByName('km').AsInteger;
  Sheet.cells[i,7] := QExportaExcel.FieldByName('cor').AsString;
  Sheet.cells[i,8] := QExportaExcel.FieldByName('min').AsCurrency;
  Sheet.cells[i,9] := QExportaExcel.FieldByName('fipe').AsCurrency;
  Sheet.cells[i,10] := QExportaExcel.FieldByName('MIN/FIPE').AsInteger;
  Sheet.cells[i,11] := QExportaExcel.FieldByName('min_2').AsCurrency;
  Sheet.cells[i,12] := QExportaExcel.FieldByName('JA').AsCurrency;
  Sheet.cells[i,13] := QExportaExcel.FieldByName('merc1').AsCurrency;
  Sheet.cells[i,14] := QExportaExcel.FieldByName('merc2').AsCurrency;
  Sheet.cells[i,15] := QExportaExcel.FieldByName('VENDA 30 DIAS').AsInteger;
  Sheet.cells[i,16] := QExportaExcel.FieldByName('estoque').AsInteger;
  Sheet.cells[i,17] := QExportaExcel.FieldByName('vlr_ult_venda').AsCurrency;
  Sheet.cells[i,18] := QExportaExcel.FieldByName('dt_ult_venda').Text;
  Sheet.cells[i,19] := ' ';
  Sheet.cells[i,20] := QExportaExcel.FieldByName('categoria').AsString;
  Sheet.cells[i,21] := QExportaExcel.FieldByName('g0').AsCurrency;
  Sheet.cells[i,22] := QExportaExcel.FieldByName('mg').AsCurrency;
  Sheet.cells[i,23] := QExportaExcel.FieldByName('avaria').AsCurrency;
  Sheet.cells[i,24] := QExportaExcel.FieldByName('resultado').AsCurrency;
  //Sheet.cells[i,23] := format('=SE(S2="C";SOMA(I2 - V2);0)', [i]);
  Sheet.cells[i,25] := QExportaExcel.FieldByName('min_resultado').AsCurrency;
  Sheet.cells[i,26] := QExportaExcel.FieldByName('lance').AsCurrency;
  Sheet.cells[i,27] := QExportaExcel.FieldByName('LANC/FIPE').AsCurrency;
  Sheet.cells[i,28] := QExportaExcel.FieldByName('compra').AsCurrency;
  Sheet.cells[i,29] := QExportaExcel.FieldByName('s/n').AsString;
  Sheet.cells[i,30] := QExportaExcel.FieldByName('pgto').Text;
  Sheet.cells[i,31] := QExportaExcel.FieldByName('qtd').AsString;
  Sheet.cells[i,32] := QExportaExcel.FieldByName('fornecedor').AsString;
  Sheet.cells[i,33] := QExportaExcel.FieldByName('cod_fipe').Text;

   QExportaExcel.Next;

     Application.ProcessMessages;

   Sheet.columns.autofit;

   I := I+1;

  end;

  FormLoading.Close;

  objExcel.Visible := True;


end;

procedure TFormNovoProcessamento.btnProcessaALDClick(Sender: TObject);
begin
 if EditDiretorioALD.Text <> ''  then
 Begin
   if not FileExists(EditDiretorioALD.Text) then
   Begin
     MessageDlg('Arquivo do diretório não encontrado. Recarregue o arquivo no diretório', mtWarning, [mbok], 0);
   End
   Else
   Begin

     if FormLoading = nil then
     Begin
       FormLoading := TFormLoading.Create(self);
     End;

     FormLoading.LabelStatus.Caption := 'Importando planilha ALD';
     FormLoading.Position := poScreenCenter;
     FormLoading.Show;
     Application.ProcessMessages;
     CarregaExcelALD;
     Application.ProcessMessages;
     ImportaPlanALD;
     FormLoading.Close;

     // REVISAR QTD da planilha importada
     QGravaPlanilha.SQL.Clear;
     QGravaPlanilha.SQL.Add('insert TBIMPORTACOES (PLANILHA, DATAIMPORT, FORNECEDOR, STATUS) values (:PLAN, :DT, :FOR, ''Em Analise'')');
     QGravaPlanilha.ParamByName('PLAN').Text := LblNomeArquivo.Caption;
     QGravaPlanilha.ParamByName('DT').AsDate := NOW;
     QGravaPlanilha.ParamByName('FOR').Text := 'ALD';
     QGravaPlanilha.Execute;

     LblNomeArquivo.Caption := '';
   End;
 End;
end;

procedure TFormNovoProcessamento.btnProcessaArvalClick(Sender: TObject);
begin

   if FormLoading = nil then
   Begin
    FormLoading := TFormLoading.Create(self);
   End;

   if FormLotesArval = nil then
   Begin
    FormLotesArval := TFormLotesArval.Create(self);
   End;

 if EditDiretorioARVAL.Text <> ''  then
 Begin
   if not FileExists(EditDiretorioArval.Text) then
   Begin
     MessageDlg('Arquivo do diretório não encontrado. Recarregue o arquivo no diretório', mtWarning, [mbok], 0);
   End
   Else
   Begin

     FormLoading.LabelStatus.Caption := 'Importando planilha ARVAL';
     FormLoading.Position := poScreenCenter;
     FormLoading.Show;

     Application.ProcessMessages;

     CarregaExcelARVAL;

     Application.ProcessMessages;

     FormLotesArval.Position := poScreenCenter;
     FormLotesArval.ShowModal;

     //ImportaPlanARVAL;
     FormLotesArval.Close;

     FormLoading.Close;

     // REVISAR QTD da planilha importada
     QGravaPlanilha.SQL.Clear;
     QGravaPlanilha.SQL.Add('insert TBIMPORTACOES (PLANILHA, DATAIMPORT, FORNECEDOR, STATUS) values (:PLAN, :DT, :FOR, ''Em Analise'')');
     QGravaPlanilha.ParamByName('PLAN').Text := LblNomeArquivo.Caption;
     QGravaPlanilha.ParamByName('DT').AsDate := NOW;
     QGravaPlanilha.ParamByName('FOR').Text := 'ARVAL';
     QGravaPlanilha.Execute;

     LblNomeArquivo.Caption := '';
   End;
 End;
end;

procedure TFormNovoProcessamento.btnProcessaLMClick(Sender: TObject);
begin
 if EditDiretorioLM.Text <> ''  then
 Begin
   if not FileExists(EditDiretorioLM.Text) then
   Begin
     MessageDlg('Arquivo do diretório não encontrado. Recarregue o arquivo no diretório', mtWarning, [mbok], 0);
   End
   Else
   Begin

     if FormLoading = nil then
     FormLoading := TFormLoading.Create(self);


     FormLoading.LabelStatus.Caption := 'Importando planilha LM';
     FormLoading.Position := poScreenCenter;
     FormLoading.Show;
     Application.ProcessMessages;
     CarregaExcelLM;
     Application.ProcessMessages;
     ImportaPlanLM;
     FormLoading.Close;

     // REVISAR QTD da planilha importada
     QGravaPlanilha.SQL.Clear;
     QGravaPlanilha.SQL.Add('insert TBIMPORTACOES (PLANILHA, DATAIMPORT, FORNECEDOR, STATUS) values (:PLAN, :DT, :FOR, ''Em Analise'')');
     QGravaPlanilha.ParamByName('PLAN').Text := LblNomeArquivo.Caption;
     QGravaPlanilha.ParamByName('DT').AsDate := NOW;
     QGravaPlanilha.ParamByName('FOR').Text := 'LM';
     QGravaPlanilha.Execute;

     LblNomeArquivo.Caption := '';
   End;
 End;

end;

procedure TFormNovoProcessamento.btnProcessaLocalizaClick(Sender: TObject);
begin
 if EditDiretorioLOCALIZA.Text <> ''  then
 Begin
   if not FileExists(EditDiretorioLOCALIZA.Text) then
   Begin
     MessageDlg('Arquivo do diretório não encontrado. Recarregue o arquivo no diretório', mtWarning, [mbok], 0);
   End
   Else
   Begin

     if FormLoading = nil then
     FormLoading := TFormLoading.Create(self);


     FormLoading.LabelStatus.Caption := 'Importando planilha Lozaliza';
     FormLoading.Position := poScreenCenter;
     FormLoading.Show;
     Application.ProcessMessages;
     //ShowMessage('Vai carregar');
     CarregaExcelLOCALIZA;
     //ShowMessage('Vai Carregou');
     Application.ProcessMessages;
     ImportaPlanLOCALIZA;
     FormLoading.Close;

     // REVISAR QTD da planilha importada
     QGravaPlanilha.SQL.Clear;
     QGravaPlanilha.SQL.Add('insert TBIMPORTACOES (PLANILHA, DATAIMPORT, FORNECEDOR, STATUS) values (:PLAN, :DT, :FOR, ''Em Analise'')');
     QGravaPlanilha.ParamByName('PLAN').Text := LblNomeArquivo.Caption;
     QGravaPlanilha.ParamByName('DT').AsDate := NOW;
     QGravaPlanilha.ParamByName('FOR').Text := 'LOCALIZA';
     QGravaPlanilha.Execute;

     LblNomeArquivo.Caption := '';

   End;
 End;
end;

procedure TFormNovoProcessamento.btnProcessaOuroVerdeClick(Sender: TObject);
begin
 if EditDiretorioOuroVerde.Text <> ''  then
 Begin
   if not FileExists(EditDiretorioOuroVerde.Text) then
   Begin
     MessageDlg('Arquivo do diretório não encontrado. Recarregue o arquivo no diretório', mtWarning, [mbok], 0);
   End
   Else
   Begin

     if FormLoading = nil then
     FormLoading := TFormLoading.Create(self);


     FormLoading.LabelStatus.Caption := 'Importando planilha Ouro Verde';
     FormLoading.Position := poScreenCenter;
     FormLoading.Show;
     Application.ProcessMessages;
     CarregaExcelOUROVERDE;
     Application.ProcessMessages;
     ImportaPlanOUROVERDE;
     FormLoading.Close;

     // REVISAR QTD da planilha importada
     QGravaPlanilha.SQL.Clear;
     QGravaPlanilha.SQL.Add('insert TBIMPORTACOES (PLANILHA, DATAIMPORT, FORNECEDOR, STATUS) values (:PLAN, :DT, :FOR, ''Em Analise'')');
     QGravaPlanilha.ParamByName('PLAN').Text := LblNomeArquivo.Caption;
     QGravaPlanilha.ParamByName('DT').AsDate := NOW;
     QGravaPlanilha.ParamByName('FOR').Text := 'OURO VERDE';
     QGravaPlanilha.Execute;

     LblNomeArquivo.Caption := '';
   End;
 End;
end;

procedure TFormNovoProcessamento.btnProcessaUnidasClick(Sender: TObject);
begin

 {ShowMessage('Importação da UNIDAS em manutenção!!!!');
 Abort; }

 if EditDiretorioUnidas.Text <> ''  then
 Begin
   if not FileExists(EditDiretorioUnidas.Text) then
   Begin
     MessageDlg('Arquivo do diretório não encontrado. Recarregue o arquivo no diretório', mtWarning, [mbok], 0);
   End
   Else
   Begin

     if FormLoading = nil then
     FormLoading := TFormLoading.Create(self);


     FormLoading.LabelStatus.Caption := 'Importando planilha Unidas';
     FormLoading.Position := poScreenCenter;
     FormLoading.Show;
     Application.ProcessMessages;
     CarregaExcelUNIDAS;
     Application.ProcessMessages;
     ImportaPlanUNIDAS;
     FormLoading.Close;

     // REVISAR QTD da planilha importada
     QGravaPlanilha.SQL.Clear;
     QGravaPlanilha.SQL.Add('insert TBIMPORTACOES (PLANILHA, DATAIMPORT, FORNECEDOR, STATUS) values (:PLAN, :DT, :FOR, ''Em Analise'')');
     QGravaPlanilha.ParamByName('PLAN').Text := LblNomeArquivo.Caption;
     QGravaPlanilha.ParamByName('DT').AsDate := NOW;
     QGravaPlanilha.ParamByName('FOR').Text := 'UNIDAS';
     QGravaPlanilha.Execute;

     LblNomeArquivo.Caption := '';
   End;
 End;
end;

procedure TFormNovoProcessamento.btnProcNeutronClick(Sender: TObject);
begin
 if EditDiretorioNeutron.Text <> ''  then
 Begin
   if not FileExists(EditDiretorioNeutron.Text) then
   Begin
     MessageDlg('Arquivo do diretório não encontrado. Recarregue o arquivo no diretório', mtWarning, [mbok], 0);
   End
   Else
   Begin

     if FormLoading = nil then
     FormLoading := TFormLoading.Create(self);


     FormLoading.LabelStatus.Caption := 'Importando planilha Neutron';
     FormLoading.Position := poScreenCenter;
     FormLoading.Show;
     Application.ProcessMessages;
     CarregaExcelNeutron;
     Application.ProcessMessages;
     ImportaPlanNeutron;
     FormLoading.Close;
     QAtuProcPlan.SQL.Clear;

     {QAtuProcPlan.SQL.Add('update TBPLANILHAS set neutron = 1 where id=:id');
     QAtuProcPlan.ParamByName('id').AsInteger := strtoint(EditIDPlanilha.Text);
     QAtuProcPlan.Execute;
     //ShowMessage('Tabela Importada com sucesso');

     EditDiretorioNeutron.Color := $00D1FFC1;  }
   End;
 End;
end;

procedure TFormNovoProcessamento.btnProcessaMovidaClick(Sender: TObject);
begin
 if EditDiretorioMOVIDA.Text <> ''  then
 Begin
   if not FileExists(EditDiretorioMOVIDA.Text) then
   Begin
     MessageDlg('Arquivo do diretório não encontrado. Recarregue o arquivo no diretório', mtWarning, [mbok], 0);
   End
   Else
   Begin

     if FormLoading = nil then
     FormLoading := TFormLoading.Create(self);


     FormLoading.LabelStatus.Caption := 'Importando planilha Movida';
     FormLoading.Position := poScreenCenter;
     FormLoading.Show;
     Application.ProcessMessages;

     CarregaExcelMOVIDA;

     FormLoading.ProgressBar1.Max := FormProcPlanAcelero.StringGridAcelero.RowCount;

     Application.ProcessMessages;

     ImportaPlanMOVIDA;

     FormLoading.Close;

     // REVISAR QTD da planilha importada
     QGravaPlanilha.SQL.Clear;
     QGravaPlanilha.SQL.Add('insert TBIMPORTACOES (PLANILHA, DATAIMPORT, FORNECEDOR, STATUS) values (:PLAN, :DT, :FOR, ''Em Analise'')');
     QGravaPlanilha.ParamByName('PLAN').Text := LblNomeArquivo.Caption;
     QGravaPlanilha.ParamByName('DT').AsDate := NOW;
     QGravaPlanilha.ParamByName('FOR').Text := 'MOVIDA';
     QGravaPlanilha.Execute;

     LblNomeArquivo.Caption := '';
   End;
 End;
end;

procedure TFormNovoProcessamento.btnProcessaJSLClick(Sender: TObject);
begin
 if EditDiretorioJSL.Text <> ''  then
 Begin
   if not FileExists(EditDiretorioJSL.Text) then
   Begin
     MessageDlg('Arquivo do diretório não encontrado. Recarregue o arquivo no diretório', mtWarning, [mbok], 0);
   End
   Else
   Begin

     if FormLoading = nil then
     FormLoading := TFormLoading.Create(self);


     FormLoading.LabelStatus.Caption := 'Importando planilha JSL';
     FormLoading.Position := poScreenCenter;
     FormLoading.Show;
     Application.ProcessMessages;
     CarregaExcelJSL;
     Application.ProcessMessages;
     ImportaPlanJSL;
     FormLoading.Close;

     // REVISAR QTD da planilha importada
     QGravaPlanilha.SQL.Clear;
     QGravaPlanilha.SQL.Add('insert TBIMPORTACOES (PLANILHA, DATAIMPORT, FORNECEDOR, STATUS) values (:PLAN, :DT, :FOR, ''Em Analise'')');
     QGravaPlanilha.ParamByName('PLAN').Text := LblNomeArquivo.Caption;
     QGravaPlanilha.ParamByName('DT').AsDate := NOW;
     QGravaPlanilha.ParamByName('FOR').Text := 'JSL';
     QGravaPlanilha.Execute;

     LblNomeArquivo.Caption := '';
   End;
 End;
end;

Function quantaslin ( nomeDoArquivo: String ):integer;
var arq: TextFile;nr:integer;
linha: String;
begin
nr:=0;
AssignFile ( arq, nomeDoArquivo );
Reset ( arq );
ReadLn ( arq, linha );
while not Eof ( arq ) do
begin
ReadLn ( arq, linha );
nr:=nr+1;
end;
CloseFile ( arq );
quantaslin:=nr;
end;

procedure TFormNovoProcessamento.EditDiretorioAceleroClick(Sender: TObject);
begin

 if FormLoading = nil then
 Begin
   FormLoading := TFormLoading.Create(self);
 End;

 if OpenDialogBuscaPlan.Execute() then
 Begin
   if OpenDialogBuscaPlan.FileName <> '' then
   Begin
     EditDiretorioAcelero.Text := OpenDialogBuscaPlan.FileName;

     FormLoading.ProgressBar1.Max := quantaslin(EditDiretorioAcelero.Text);
     FormLoading.ProgressBar1.Position := 0;

     QAtualizaDiretorios.SQL.Clear;
     QAtualizaDiretorios.SQL.Add('update TBPLANILHASEMPROCESSAMENTO set diretorio = :dir where fornecedor = ''ACELERO'' ');
     QAtualizaDiretorios.ParamByName('dir').Text := EditDiretorioAcelero.Text;
     QAtualizaDiretorios.Execute;

     LblNomeArquivo.Caption := ExtractFileName(OpenDialogBuscaPlan.FileName);

     if MessageDlg('Deseja importar planilha?', mtInformation, [mbno, mbyes], 0) = mrYes then
     Begin
       BtnProcessarAcelero.Click();
     End;

   End;
 End;

end;

procedure TFormNovoProcessamento.EditDiretorioALDClick(Sender: TObject);
begin
 if OpenDialogBuscaPlan.Execute() then
 Begin
   if OpenDialogBuscaPlan.FileName <> '' then
   Begin
     EditDiretorioALD.Text := OpenDialogBuscaPlan.FileName;

     QAtualizaDiretorios.SQL.Clear;
     QAtualizaDiretorios.SQL.Add('update TBPLANILHASEMPROCESSAMENTO set diretorio = :dir where fornecedor = ''ALD'' ');
     QAtualizaDiretorios.ParamByName('dir').Text := EditDiretorioALD.Text;
     QAtualizaDiretorios.Execute;

     if MessageDlg('Deseja importar planilha?', mtInformation, [mbno, mbyes], 0) = mrYes then
     Begin
       btnProcessaALD.Click();
     End;

   End;
 End;
end;

procedure TFormNovoProcessamento.EditDiretorioArvalClick(Sender: TObject);
begin
 if OpenDialogBuscaPlan.Execute() then
 Begin
   if OpenDialogBuscaPlan.FileName <> '' then
   Begin
     EditDiretorioArval.Text := OpenDialogBuscaPlan.FileName;

     QAtualizaDiretorios.SQL.Clear;
     QAtualizaDiretorios.SQL.Add('update TBPLANILHASEMPROCESSAMENTO set diretorio = :dir where fornecedor = ''ARVAL'' ');
     QAtualizaDiretorios.ParamByName('dir').Text := EditDiretorioARVAL.Text;
     QAtualizaDiretorios.Execute;

     if MessageDlg('Deseja importar planilha?', mtInformation, [mbno, mbyes], 0) = mrYes then
     Begin
       btnProcessaArval.Click();
     End;

   End;
 End;
end;

procedure TFormNovoProcessamento.EditDiretorioJSLClick(Sender: TObject);
begin
 if OpenDialogBuscaPlan.Execute() then
 Begin
   if OpenDialogBuscaPlan.FileName <> '' then
   Begin
     EditDiretorioJSL.Text := OpenDialogBuscaPlan.FileName;

     QAtualizaDiretorios.SQL.Clear;
     QAtualizaDiretorios.SQL.Add('update TBPLANILHASEMPROCESSAMENTO set diretorio = :dir where fornecedor = ''JSL'' ');
     QAtualizaDiretorios.ParamByName('dir').Text := EditDiretorioJSL.Text;
     QAtualizaDiretorios.Execute;

     if MessageDlg('Deseja importar planilha?', mtInformation, [mbno, mbyes], 0) = mrYes then
     Begin
       btnProcessaJSL.Click();
     End;

   End;
 End;
end;

procedure TFormNovoProcessamento.EditDiretorioLMClick(Sender: TObject);
begin
 if OpenDialogBuscaPlan.Execute() then
 Begin
   if OpenDialogBuscaPlan.FileName <> '' then
   Begin
     EditDiretorioLM.Text := OpenDialogBuscaPlan.FileName;

     QAtualizaDiretorios.SQL.Clear;
     QAtualizaDiretorios.SQL.Add('update TBPLANILHASEMPROCESSAMENTO set diretorio = :dir where fornecedor = ''LM'' ');
     QAtualizaDiretorios.ParamByName('dir').Text := EditDiretorioLM.Text;
     QAtualizaDiretorios.Execute;

     if MessageDlg('Deseja importar planilha?', mtInformation, [mbno, mbyes], 0) = mrYes then
     Begin
       btnProcessaLM.Click();
     End;

   End;
 End;
end;

procedure TFormNovoProcessamento.EditDiretorioLOCALIZAClick(Sender: TObject);
begin
 if OpenDialogBuscaPlan.Execute() then
 Begin
   if OpenDialogBuscaPlan.FileName <> '' then
   Begin
     EditDiretorioLOCALIZA.Text := OpenDialogBuscaPlan.FileName;

     QAtualizaDiretorios.SQL.Clear;
     QAtualizaDiretorios.SQL.Add('update TBPLANILHASEMPROCESSAMENTO set diretorio = :dir where fornecedor = ''LOCALIZA'' ');
     QAtualizaDiretorios.ParamByName('dir').Text := EditDiretorioLOCALIZA.Text;
     QAtualizaDiretorios.Execute;

     if MessageDlg('Deseja importar planilha?', mtInformation, [mbno, mbyes], 0) = mrYes then
     Begin
       btnProcessaLocaliza.Click();
     End;

   End;
 End;
end;

procedure TFormNovoProcessamento.EditDiretorioMOVIDAClick(Sender: TObject);
begin
 if OpenDialogBuscaPlan.Execute() then
 Begin
   if OpenDialogBuscaPlan.FileName <> '' then
   Begin
     EditDiretorioMOVIDA.Text := OpenDialogBuscaPlan.FileName;

     QAtualizaDiretorios.SQL.Clear;
     QAtualizaDiretorios.SQL.Add('update TBPLANILHASEMPROCESSAMENTO set diretorio = :dir where fornecedor = ''MOVIDA'' ');
     QAtualizaDiretorios.ParamByName('dir').Text := EditDiretorioMOVIDA.Text;
     QAtualizaDiretorios.Execute;

     if MessageDlg('Deseja importar planilha?', mtInformation, [mbno, mbyes], 0) = mrYes then
     Begin
       btnProcessaMovida.Click();
     End;

   End;
 End;
end;

procedure TFormNovoProcessamento.EditDiretorioNeutronClick(Sender: TObject);
begin
 if OpenDialogBuscaPlan.Execute() then
 Begin
   if OpenDialogBuscaPlan.FileName <> '' then
   Begin
     EditDiretorioNeutron.Text := OpenDialogBuscaPlan.FileName;

     QAtualizaDiretorios.SQL.Clear;
     QAtualizaDiretorios.SQL.Add('update TBPLANILHASEMPROCESSAMENTO set diretorio = :dir where fornecedor = ''NEUTRON'' ');
     QAtualizaDiretorios.ParamByName('dir').Text := EditDiretorioNeutron.Text;
     QAtualizaDiretorios.Execute;

      if MessageDlg('Deseja importar planilha?', mtInformation, [mbno, mbyes], 0) = mrYes then
     Begin
       btnProcNeutron.Click();
     End;

   End;
 End;
end;

procedure TFormNovoProcessamento.EditDiretorioOuroVerdeClick(Sender: TObject);
begin
 if OpenDialogBuscaPlan.Execute() then
 Begin
   if OpenDialogBuscaPlan.FileName <> '' then
   Begin
     EditDiretorioOuroVerde.Text := OpenDialogBuscaPlan.FileName;

     QAtualizaDiretorios.SQL.Clear;
     QAtualizaDiretorios.SQL.Add('update TBPLANILHASEMPROCESSAMENTO set diretorio = :dir where fornecedor = ''OURO VERDE'' ');
     QAtualizaDiretorios.ParamByName('dir').Text := EditDiretorioOuroVerde.Text;
     QAtualizaDiretorios.Execute;

     if MessageDlg('Deseja importar planilha?', mtInformation, [mbno, mbyes], 0) = mrYes then
     Begin
       btnProcessaOuroVerde.Click();
     End;

   End;
 End;
end;

procedure TFormNovoProcessamento.EditDiretorioUnidasClick(Sender: TObject);
begin
 if OpenDialogBuscaPlan.Execute() then
 Begin
   if OpenDialogBuscaPlan.FileName <> '' then
   Begin
     EditDiretorioUnidas.Text := OpenDialogBuscaPlan.FileName;

     QAtualizaDiretorios.SQL.Clear;
     QAtualizaDiretorios.SQL.Add('update TBPLANILHASEMPROCESSAMENTO set diretorio = :dir where fornecedor = ''UNIDAS'' ');
     QAtualizaDiretorios.ParamByName('dir').Text := EditDiretorioUNIDAS.Text;
     QAtualizaDiretorios.Execute;

     if MessageDlg('Deseja importar planilha?', mtInformation, [mbno, mbyes], 0) = mrYes then
     Begin
       btnProcessaUnidas.Click();
     End;

   End;
 End;
end;

procedure TFormNovoProcessamento.FormShow(Sender: TObject);
var
 query : TUniQuery;
begin

 if FormConciliacaoFipeModelo  = nil then
 Begin
   FormConciliacaoFipeModelo := TFormConciliacaoFipeModelo.Create(self);
 End;

 query := TUniQuery.Create(self);
 query.Connection := DataModuleConexao.UniConnection1;

 with query do
 Begin
   sql.Clear;
   sql.Add('select coalesce(vlrMargemCompras,0) as vlrMargemCompras from tbparametros');
   Open;

   Margem := FieldByName('vlrMargemCompras').AsCurrency;
 End;

 query.DisposeOf;

end;



end.
