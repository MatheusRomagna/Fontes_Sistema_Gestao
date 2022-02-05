unit UFormAnaliseCompraQuery;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, MemDS, DBAccess, Uni, Vcl.StdCtrls, Vcl.ComCtrls, Data.Win.ADODB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, Vcl.Mask, Vcl.Menus, Vcl.Buttons, ComObj,
  Datasnap.DBClient, System.ImageList, Vcl.ImgList, uDWConstsData, DateUtils,
  uRESTDWPoolerDB, Vcl.Imaging.pngimage;

type
  TFormAnaliseCompraQuery = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    QBuscaPlan: TUniQuery;
    DataSource1: TDataSource;
    UniTransaction1: TUniTransaction;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    DBGrid1: TDBGrid;
    Label3: TLabel;
    EditModelo: TEdit;
    Label4: TLabel;
    EditFornecedor: TEdit;
    CheckBox1: TCheckBox;
    Label5: TLabel;
    EditKM: TEdit;
    DateTimeInicial: TDateTimePicker;
    DateTimeFinal: TDateTimePicker;
    Label6: TLabel;
    EditMargem: TEdit;
    Label7: TLabel;
    ComboBoxCategoria: TComboBox;
    btnAtualizaInfo: TButton;
    QAtualizaInfo: TUniQuery;
    QBuscaPlanID: TIntegerField;
    QBuscaPlanMODELO: TStringField;
    QBuscaPlanKM: TFloatField;
    QBuscaPlanANO: TStringField;
    QBuscaPlanANO_MOD: TStringField;
    QBuscaPlanCOR: TStringField;
    QBuscaPlanVLR_MIN: TFloatField;
    QBuscaPlanVLR_MIN_FIPE: TFloatField;
    QBuscaPlanVLR_MIN_DOIS: TFloatField;
    QBuscaPlanCOMPRA_JA: TFloatField;
    QBuscaPlanVLR_FIPE: TFloatField;
    QBuscaPlanVLR_MERC_UM: TFloatField;
    QBuscaPlanVLR_MERC_DOIS: TFloatField;
    QBuscaPlanVENDA_TRINTA_DIAS: TFloatField;
    QBuscaPlanESTOQUE: TFloatField;
    QBuscaPlanVLR_ULT_VENDA: TFloatField;
    QBuscaPlanDT_ULT_VENDA: TDateField;
    QBuscaPlanATACADO_VAREJO: TStringField;
    QBuscaPlanATAC_VAREJ: TStringField;
    QBuscaPlanCATEGORIA: TStringField;
    QBuscaPlanG_ZERO: TFloatField;
    QBuscaPlanMG: TFloatField;
    QBuscaPlanAVARIA: TFloatField;
    QBuscaPlanRESULTADO: TFloatField;
    QBuscaPlanMIN_RESULTADO: TFloatField;
    QBuscaPlanLANCE: TFloatField;
    QBuscaPlanLANCE_FIPE: TFloatField;
    QBuscaPlanCOMPRA: TFloatField;
    QBuscaPlanSN: TStringField;
    QBuscaPlanDT_PGTO: TDateField;
    QBuscaPlanQTD: TIntegerField;
    QBuscaPlanFORNECEDOR: TStringField;
    QBuscaPlanID_PLAN_FOR: TIntegerField;
    QBuscaPlanPLACA: TStringField;
    QBuscaPlanLICITACAO: TStringField;
    QBuscaPlanLOTE: TStringField;
    QBuscaPlanCOD_FIPE: TStringField;
    QBuscaPlanSITUACAO: TIntegerField;
    QBuscaPlanDATA: TDateField;
    Label8: TLabel;
    ComboBoxSituacao: TComboBox;
    PopupMenu1: TPopupMenu;
    Inativar1: TMenuItem;
    Ativar1: TMenuItem;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    btnExportarExcel: TSpeedButton;
    OcultarColuna1: TMenuItem;
    ColunasOcultas1: TMenuItem;
    ImageList1: TImageList;
    ComboBoxFornecedor: TComboBox;
    AjustarMargem1: TMenuItem;
    QBuscaPlanONDE: TStringField;
    QBuscaPlanLOCAL: TStringField;
    DadosdaVistoriaemcriao1: TMenuItem;
    EnviarparaVistoriaemcriao1: TMenuItem;
    btnImportaPlan: TButton;
    Panel8: TPanel;
    Label9: TLabel;
    LblTotalResultado: TLabel;
    Label10: TLabel;
    LblTotalAvarias: TLabel;
    QAtualizaLayoutGrid: TUniQuery;
    QBuscaPlanULT_G0: TFloatField;
    QBuscaPlanDT_G0: TDateField;
    btnPesquisar: TSpeedButton;
    BtnImportacoes: TSpeedButton;
    Label11: TLabel;
    LblQtd: TLabel;
    EditPlanAnalise: TEdit;
    Label12: TLabel;
    SpeedButton1: TSpeedButton;
    Label13: TLabel;
    ComboBoxLote: TComboBox;
    btnAtuFIPE: TSpeedButton;
    Label14: TLabel;
    EditPlaca: TEdit;
    btnAtualizaVistorias: TButton;
    qAtualizaVistorias: TUniQuery;
    UniQuery1: TUniQuery;
    QBuscaPlanid_vistoria: TIntegerField;
    MainMenu1: TMainMenu;
    ConfigurarPermisses1: TMenuItem;
    CriarPadrodeVisualizao1: TMenuItem;
    qGeraPadrao: TUniQuery;
    ComboBoxRefFipe: TComboBox;
    qBuscaRefFipe: TUniQuery;
    QBuscaPlanREF_FIPE: TStringField;
    QBuscaPlanFIPE2: TFloatField;
    QBuscaPlanFIPE3: TFloatField;
    QBuscaPlanREF_FIPE2: TStringField;
    QBuscaPlanREF_FIPE3: TStringField;
    AtualizarValores1: TMenuItem;
    qAtualizaFipesTela: TUniQuery;
    btnCompraVeiculo: TSpeedButton;
    QBuscaPlanCOMPRADO: TStringField;
    Label15: TLabel;
    Label16: TLabel;
    ComboFipe2: TComboBox;
    ComboFipe3: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ButtonFiltrarClick(Sender: TObject);
    procedure BtnPesquisaClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure btnAtualizaInfoClick(Sender: TObject);
    procedure btnAplicaMargemClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Inativar1Click(Sender: TObject);
    procedure Ativar1Click(Sender: TObject);
    procedure btnExportarExcelClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure OcultarColuna1Click(Sender: TObject);
    procedure ColunasOcultas1Click(Sender: TObject);
    procedure EditFornecedorKeyPress(Sender: TObject; var Key: Char);
    procedure EditModeloKeyPress(Sender: TObject; var Key: Char);
    procedure EditKMKeyPress(Sender: TObject; var Key: Char);
    procedure EditMargemKeyPress(Sender: TObject; var Key: Char);
    procedure ComboBoxCategoriaSelect(Sender: TObject);
    procedure ComboBoxSituacaoSelect(Sender: TObject);
    procedure ComboBoxFornecedorSelect(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure QBuscaPlanG_ZEROChange(Sender: TField);
    procedure AjustarMargem1Click(Sender: TObject);
    procedure QBuscaPlanMGChange(Sender: TField);
    procedure btnImportaPlanClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QBuscaPlanCATEGORIAChange(Sender: TField);
    procedure btnPesquisarClick(Sender: TObject);
    procedure BtnImportacoesClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure ComboBoxLoteSelect(Sender: TObject);
    procedure EnviarparaVistoriaemcriao1Click(Sender: TObject);
    procedure btnAtuFIPEClick(Sender: TObject);
    procedure EditPlacaKeyPress(Sender: TObject; var Key: Char);
    procedure btnAtualizaVistoriasClick(Sender: TObject);
    procedure QBuscaPlanVLR_MINChange(Sender: TField);
    procedure DadosdaVistoriaemcriao1Click(Sender: TObject);
    procedure QBuscaPlanAVARIAChange(Sender: TField);
    procedure ConfigurarPermisses1Click(Sender: TObject);
    procedure CriarPadrodeVisualizao1Click(Sender: TObject);
    procedure ImageBuscaRefClick(Sender: TObject);
    procedure QBuscaPlanVLR_FIPEChange(Sender: TField);
    procedure AtualizarValores1Click(Sender: TObject);
    procedure btnCompraVeiculoClick(Sender: TObject);
  private
    procedure CarregaComboFipes(combo: TComboBox);
    { Private declarations }
  public
    { Public declarations }
    Ascendente : Boolean;
  end;

var
  FormAnaliseCompraQuery: TFormAnaliseCompraQuery;

implementation

{$R *.dfm}

uses UDataModuleConexao, UFormAnaliseComprasTabela, UFormAtualizaTabelaFipe,
  UFormAtuHistFIPE, UFormConcFipeModelo, UFormExcelCompras, UFormHistFIPE,
  UFormLoading, UFormNovoProcessamento, UFormPrincipal, UFormProcPlanAcelero,
  UFormProcPlanFinal, UFormAplicaMargem, UFormColunasOcultas,
  UFormDownloadNovaVersao, UFormImagem, UFormImportacoesEfetuadas,
  UFormPadroesPlanilhas, UFormAnaliseCompra, UDataModuleRESTDWvistoria,
  UFormCadVistoriadores, UFormGestaoVistoria, UFormNovoVistoriador,
  UFormUltimasAtualizacoes, UFormVistoriadores, UFormWebBrowse, Loading,
  UDMRestDataWareDB, UFormAvarias, UFormLoadingOpaco, UFormVistoriasDetalhes,
  UforTestesDiversos, UDataModuleBancoVistoria, UFormAtuTabFIpe,
  UFormConsutaPlacaAvaliacao, UFormDetalhesAvaliacao, UFormGestaoAvaliacoes,
  UFormLotesArval, UnitLogin, UFormAvaliarAvaliacao, UFormHistoricoAvaliacoes,
  UFormLoginSavauto, UFormPermissoesCarga, FMX.UFormGraficosAtendimento,
  UFormAgendamento, UFormAtendimentoMultasVeiculo, UFormAtendimentoNovo,
  UFormAtendimentos, UFormCadaNovoUsuMobile, UFormCadaUsuario,
  UFormCadaUsuariosMobile, UFormConcedePermissao, UFormCruzamentoFipes,
  UFormDadosPerfil, UFormDetalhesAtendimento, UFormInformacoes, UFormPerfis,
  UFormPesquisaFipe, UFormQuitacoesVeiculo, UFormSegIPVALic, UFormUsuarios,
  UDMPermissoes, UFormAlteraFipeDePaxa, UFormLiberaPermissao, UFormRefFipes,
  UFormHistoricoObsAtn, UFormLoadingCarregamento, UFormNovaAvaliacao,
  UformNovaObs;

procedure TFormAnaliseCompraQuery.CarregaComboFipes(combo :TComboBox);
var
 query : TUniQuery;
Begin

 query := TUniQuery.Create(self);
 query.Connection := DataModuleConexao.UniConnection1;

 try

  combo.Items.Clear;

  query.SQL.Clear;
  query.SQL.Add('select * from tbfiperef');
  query.Open;

  combo.Text := query.FieldByName('principal').Text;
  ComboFipe2.Text := query.FieldByName('ref1').Text;
  ComboFipe3.Text := query.FieldByName('ref2').Text;

  Except
  On E:Exception do
  Begin
    ShowMessage('Falha ao tentar criar referencias das Fipes, tente novamente. ' + e.Message);
  End;

 end;

End;

procedure TFormAnaliseCompraQuery.Button1Click(Sender: TObject);
begin

 if UniTransaction1.Active = true then
 UniTransaction1.Commit;

end;

procedure TFormAnaliseCompraQuery.AjustarMargem1Click(Sender: TObject);
var
contador: Integer;
begin

       FormAplicaMargem.Position := poScreenCenter;
       FormAplicaMargem.ShowModal;

 With DBGrid1 do
  Begin
    for contador:= 0 to Pred(SelectedRows.Count) do
    Begin
       Datasource.Dataset.Bookmark:= SelectedRows[contador]; //O comando SelectedRows irá indicar qual o registro atual no DataSet

       QAtualizaInfo.SQL.Clear;
       QAtualizaInfo.SQL.Add('update TBPROCPLANS set MG=:Margem where PLACA=:PL');
       QAtualizaInfo.ParamByName('PL').Text := DataSource.DataSet.FieldByName('PLACA').Text;
       QAtualizaInfo.ParamByName('Margem').AsFloat := StrToFloat(FormAplicaMargem.EditMargem.Text);
       QAtualizaInfo.Execute;

    end;
    btnPesquisar.Click();
  End;

end;

procedure TFormAnaliseCompraQuery.Ativar1Click(Sender: TObject);
var
contador: Integer;
begin

 With DBGrid1 do
  Begin
    for contador:= 0 to Pred(SelectedRows.Count) do
    Begin
       Datasource.Dataset.Bookmark:= SelectedRows[contador]; //O comando SelectedRows irá indicar qual o registro atual no DataSet

     QAtualizaInfo.SQL.Clear;
     QAtualizaInfo.SQL.Add('update TBPROCPLANS set SITUACAO = :S where PLACA=:PL');
     QAtualizaInfo.ParamByName('PL').Text := DBGrid1.DataSource.DataSet.FieldByName('PLACA').Text;
     QAtualizaInfo.ParamByName('S').AsInteger := 0;
     QAtualizaInfo.Execute;

    end;
    btnPesquisar.Click();

end;

end;

procedure TFormAnaliseCompraQuery.AtualizarValores1Click(Sender: TObject);
begin

 {DataModuleConexao.qBuscaFipesRef.SQL.Clear;
 DataModuleConexao.qBuscaFipesRef.sql.Add('select principal as PRINCIPAL,   from tbfiperef');
 DataModuleConexao.qBuscaFipesRef.Open;}

  if FormLoadingCarregamento = nil then
  Begin
    FormLoadingCarregamento := TFormLoadingCarregamento.Create(self);
  End;

  FormLoadingCarregamento.Position := poScreenCenter;
  FormLoadingCarregamento.Show;
  FormLoadingCarregamento.lblLoading.Caption := 'Loading.';
  FormLoadingCarregamento.lblLoading.Refresh;

  FormLoadingCarregamento.LblStatus.Caption := 'Atualizando Fipe...Aguarde...';
  FormLoadingCarregamento.LblStatus.Refresh;

  DBGrid1.DataSource.DataSet.First;
   while not DBGrid1.DataSource.DataSet.Eof do
    Begin
      FormLoadingCarregamento.lblLoading.Caption := 'Loading..';
      FormLoadingCarregamento.lblLoading.Refresh;

       DataModuleConexao.qBuscaFipesRef.SQL.Clear;
       DataModuleConexao.qBuscaFipesRef.SQL.Add('select "'+'ANO'+DBGrid1.DataSource.DataSet.FieldByName('ANO_MOD').Text+'" as FIPE from TBFIPE where');
       DataModuleConexao.qBuscaFipesRef.SQL.Add(' "'+'ANO'+DBGrid1.DataSource.DataSet.FieldByName('ANO_MOD').Text+'" > 0 and cod_fipe = :codfipe and ref=:ref');
       DataModuleConexao.qBuscaFipesRef.ParamByName('codfipe').text := DBGrid1.DataSource.DataSet.FieldByName('cod_fipe').Text;
       DataModuleConexao.qBuscaFipesRef.ParamByName('ref').Text := DBGrid1.DataSource.DataSet.FieldByName('REF_FIPE').Text;
       DataModuleConexao.qBuscaFipesRef.Open;

       FormLoadingCarregamento.lblLoading.Caption := 'Loading...';
       FormLoadingCarregamento.lblLoading.Refresh;

       qAtualizaFipesTela.SQL.Clear;
       qAtualizaFipesTela.SQL.Add('update tbprocplans set vlr_fipe=:vlFipe where id=:id');
       qAtualizaFipesTela.ParamByName('vlFipe').AsCurrency := DataModuleConexao.qBuscaFipesRef.FieldByName('FIPE').AsCurrency;
       qAtualizaFipesTela.ParamByName('id').AsInteger := DBGrid1.DataSource.DataSet.FieldByName('id').AsInteger;
       qAtualizaFipesTela.Execute;

       DBGrid1.DataSource.DataSet.Next;

       FormLoadingCarregamento.lblLoading.Caption := 'Loading.';
       FormLoadingCarregamento.lblLoading.Refresh;

    End;

  DBGrid1.DataSource.DataSet.First;

  FormLoadingCarregamento.lblLoading.Caption := 'Loading.';
  FormLoadingCarregamento.LblStatus.Caption := 'Aguarde...Atualizando Valores...';
  FormLoadingCarregamento.lblLoading.Refresh;
  Sleep(1000);

  while not DBGrid1.DataSource.DataSet.Eof do
  Begin

     DBGrid1.DataSource.DataSet.Edit;

  FormLoadingCarregamento.lblLoading.Caption := 'Loading..';
  FormLoadingCarregamento.LblStatus.Caption := 'Aguarde...Atualizando Valores...';
  FormLoadingCarregamento.lblLoading.Refresh;

     if DBGrid1.DataSource.DataSet.FieldByName('CATEGORIA').Text = '' then
     Begin
       DBGrid1.DataSource.DataSet.FieldByName('RESULTADO').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('G_ZERO').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('MG').AsCurrency;
       DBGrid1.DataSource.DataSet.FieldByName('MIN_RESULTADO').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('RESULTADO').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN').AsCurrency;
       DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN_FIPE').AsCurrency :=  DBGrid1.DataSource.DataSet.FieldByName('VLR_FIPE').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN').AsCurrency;
     End;
      if DBGrid1.DataSource.DataSet.FieldByName('CATEGORIA').Text = 'C' then
     Begin
       if DBGrid1.DataSource.DataSet.FieldByName('G_ZERO').AsCurrency > 0 then
       DBGrid1.DataSource.DataSet.FieldByName('RESULTADO').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('G_ZERO').AsCurrency -
                                                                         DBGrid1.DataSource.DataSet.FieldByName('MG').AsCurrency -
                                                                         DBGrid1.DataSource.DataSet.FieldByName('AVARIA').AsCurrency;
       DBGrid1.DataSource.DataSet.FieldByName('MIN_RESULTADO').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('RESULTADO').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN').AsCurrency;
       DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN_FIPE').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('VLR_FIPE').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN').AsCurrency;
     End;
      if DBGrid1.DataSource.DataSet.FieldByName('CATEGORIA').Text = 'D' then
     Begin
       if DBGrid1.DataSource.DataSet.FieldByName('G_ZERO').AsCurrency > 0 then
       DBGrid1.DataSource.DataSet.FieldByName('RESULTADO').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('G_ZERO').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('MG').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('AVARIA').AsCurrency;
       DBGrid1.DataSource.DataSet.FieldByName('MIN_RESULTADO').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('RESULTADO').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN').AsCurrency;
       DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN_FIPE').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('VLR_FIPE').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN').AsCurrency;
     End;
     if DBGrid1.DataSource.DataSet.FieldByName('CATEGORIA').Text = 'A' then
     Begin
       if DBGrid1.DataSource.DataSet.FieldByName('G_ZERO').AsCurrency > 0 then
       DBGrid1.DataSource.DataSet.FieldByName('RESULTADO').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('G_ZERO').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('MG').AsCurrency;
       DBGrid1.DataSource.DataSet.FieldByName('MIN_RESULTADO').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('RESULTADO').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN').AsCurrency;
       DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN_FIPE').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('VLR_FIPE').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN').AsCurrency;
     End;
     if DBGrid1.DataSource.DataSet.FieldByName('CATEGORIA').Text = 'B' then
     Begin
       if DBGrid1.DataSource.DataSet.FieldByName('G_ZERO').AsCurrency > 0 then
       DBGrid1.DataSource.DataSet.FieldByName('RESULTADO').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('G_ZERO').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('MG').AsCurrency;
       DBGrid1.DataSource.DataSet.FieldByName('MIN_RESULTADO').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('RESULTADO').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN').AsCurrency;
       DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN_FIPE').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('VLR_FIPE').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN').AsCurrency;
     End;

     DBGrid1.DataSource.DataSet.Post;

  FormLoadingCarregamento.lblLoading.Caption := 'Loading...';
  FormLoadingCarregamento.LblStatus.Caption := 'Aguarde...Atualizando Valores...';
  FormLoadingCarregamento.lblLoading.Refresh;

     DBGrid1.DataSource.DataSet.Next;

  End;

  FormLoadingCarregamento.Close;

  QBuscaPlan.Refresh;

end;

procedure TFormAnaliseCompraQuery.btnAplicaMargemClick(Sender: TObject);
begin

 if FormAplicaMargem = nil then
 Begin
   FormAplicaMargem := TFormAplicaMargem.Create(self);
 End;

 if MessageDlg('A margem será aplicada apenas para as placas na seleção atual', mtWarning, [mbno, mbyes] , 0) = mrYes then
 Begin

   FormAplicaMargem.Position := poScreenCenter;
   FormAplicaMargem.ShowModal;

   DBGrid1.DataSource.DataSet.First;

   while not DBGrid1.DataSource.DataSet.Eof do begin

   QAtualizaInfo.SQL.Clear;
   QAtualizaInfo.SQL.Add('update TBPROCPLANS set MG=:Margem where PLACA=:PL');
   QAtualizaInfo.ParamByName('PL').Text := DBGrid1.DataSource.DataSet.FieldByName('PLACA').Text;
   QAtualizaInfo.ParamByName('Margem').AsFloat := StrToFloat(FormAplicaMargem.EditMargem.Text);
   QAtualizaInfo.Execute;

   DBGrid1.DataSource.DataSet.Next;

   end;

   btnAtualizaInfo.Click();
   btnPesquisar.Click();

 End;

end;

procedure TFormAnaliseCompraQuery.BtnPesquisaClick(Sender: TObject);
Var
 Sit : Integer;
begin

 if ComboBoxSituacao.Text = 'Ativo' then
 Sit := 0
 Else
 Sit := 1;

 Application.ProcessMessages;

 QBuscaPlan.SQL.Clear;
 QBuscaPlan.SQL.Add('select * from TBPROCPLANS');
 QBuscaPlan.SQL.Add('where');
 QBuscaPlan.SQL.Add('modelo like '+QuotedStr('%'+EditModelo.Text+'%'));
 if CheckBox1.Checked = true then
 QBuscaPlan.SQL.Add('and DATA>=:DtIni');
 if CheckBox1.Checked = true then
 QBuscaPlan.SQL.Add('and DATA<=:DtFim');
 QBuscaPlan.SQL.Add('and FORNECEDOR like'+QuotedStr('%'+ComboBoxFornecedor.Text+'%'));
 if EditKM.Text <> '' then
 QBuscaPlan.SQL.Add('and KM <= :KM');
 if EditMargem.Text <> '' then
 QBuscaPlan.SQL.Add('and MG >=:Margem');
 if ComboBoxCategoria.Text <> '' then
 QBuscaPlan.SQL.Add('and CATEGORIA=:CAT');
 if ComboBoxSituacao.Text <> '' then
 QBuscaPlan.SQL.Add('and SITUACAO = :S');
 QBuscaPlan.SQL.Add('order by MODELO');
 if EditKM.Text <> '' then
 QBuscaPlan.ParamByName('KM').AsFloat := StrToFloat(EditKM.Text);
 if CheckBox1.Checked = true then
 QBuscaPlan.ParamByName('DtIni').AsDate := DateTimeInicial.Date;
 if CheckBox1.Checked = true then
 QBuscaPlan.ParamByName('DtFim').AsDate := DateTimeFinal.Date;
 if EditMargem.Text <> '' then
 QBuscaPlan.ParamByName('Margem').AsFloat := StrToFloat(EditMargem.Text);
 if ComboBoxCategoria.Text <> '' then
 QBuscaPlan.ParamByName('CAT').Text := ComboBoxCategoria.Text;
 if ComboBoxSituacao.Text <> '' then
 QBuscaPlan.ParamByName('S').AsInteger := Sit;
 QBuscaPlan.Open;

 Application.ProcessMessages;

 FormLoading.Close;

end;

procedure TFormAnaliseCompraQuery.btnAtualizaInfoClick(Sender: TObject);
Var
 ESTOQUE, VND_30D : integer;
 VLR_VND, AVARIA, RESULTADO : Currency;
 DT_VND : TDate;
 CAT : String;
begin

 if FormCruzamentoFipes = nil then
 Begin
   FormCruzamentoFipes := TFormCruzamentoFipes.Create(self);
 End;

 FormCruzamentoFipes.WindowState := wsMaximized;
 FormCruzamentoFipes.ShowModal;

{ if MessageDlg('Os processos deverão estarem atualizados:'+#13+
 ''+#13+
 '1. Sincronia no Servidor'+#13+
 '2. Importação da Planilha do Neutron efetuada ou Vistoria feita no App'+#13+
 ' '+#13+
 'As atualização serão aplicadas apenas nas placas listadas na tela, deseja prosseguir?', mtWarning, [mbno, mbyes], 0) = mrYes then
 Begin
   DBGrid1.DataSource.DataSet.First;

   while not DBGrid1.DataSource.DataSet.Eof  do Begin

   RESULTADO := 0;

   // Atualiza informações SAVAUTO
   QAtualizaInfo.SQL.Clear;
   QAtualizaInfo.SQL.Add('select sum(QTD) as QTD from IMPORTASAVANNAESTOQUE where FIPE=:FP and ANO=:ANO');
   QAtualizaInfo.ParamByName('FP').Text := DBGrid1.DataSource.DataSet.FieldByName('COD_FIPE').Text;
   QAtualizaInfo.ParamByName('ANO').Text := DBGrid1.DataSource.DataSet.FieldByName('ANO_MOD').Text;
   QAtualizaInfo.Open;

   if QAtualizaInfo.FieldByName('QTD').AsInteger < 0 then
   ESTOQUE := 0
   Else
   ESTOQUE := QAtualizaInfo.FieldByName('QTD').AsInteger;

   QAtualizaInfo.SQL.Clear;
   QAtualizaInfo.SQL.Add('select VALOR, DATA from IMPORTASAVANNAULTIMASVENDAS where FIPE=:FP and ANO=:ANO order by DATA desc limit 1');
   QAtualizaInfo.ParamByName('FP').Text := DBGrid1.DataSource.DataSet.FieldByName('COD_FIPE').Text;
   QAtualizaInfo.ParamByName('ANO').Text := DBGrid1.DataSource.DataSet.FieldByName('ANO_MOD').Text;
   QAtualizaInfo.Open;

   if QAtualizaInfo.FieldByName('VALOR').AsCurrency < 0 then
   VLR_VND := 0
   Else
   VLR_VND := QAtualizaInfo.FieldByName('VALOR').AsCurrency;
   DT_VND := QAtualizaInfo.FieldByName('DATA').AsDateTime;

   QAtualizaInfo.SQL.Clear;
   QAtualizaInfo.SQL.Add('select sum(QTD) as QTD from IMPORTASAVANNAVENDA30DIAS where FIPE=:FP and ANO=:ANO');
   QAtualizaInfo.ParamByName('FP').Text := DBGrid1.DataSource.DataSet.FieldByName('COD_FIPE').Text;
   QAtualizaInfo.ParamByName('ANO').Text := DBGrid1.DataSource.DataSet.FieldByName('ANO_MOD').Text;
   QAtualizaInfo.Open;

   if QAtualizaInfo.FieldByName('QTD').AsInteger < 0 then
   VND_30D := 0
   Else
   VND_30D := QAtualizaInfo.FieldByName('QTD').AsInteger;

   QAtualizaInfo.SQL.Clear;
   QAtualizaInfo.SQL.Add('select sum(AVARIA) as AVARIA, CATEGORIA from TBPLANNEUTRON where PLACA=:PLACA');
   QAtualizaInfo.ParamByName('PLACA').Text := DBGrid1.DataSource.DataSet.FieldByName('PLACA').Text;
   QAtualizaInfo.Open;

   AVARIA := QAtualizaInfo.FieldByName('AVARIA').AsCurrency;
   CAT := QAtualizaInfo.FieldByName('CATEGORIA').Text;

   QAtualizaInfo.SQL.Clear;
   QAtualizaInfo.SQL.Add('update TBPROCPLANS set');
   QAtualizaInfo.SQL.Add('VENDA_TRINTA_DIAS = :V30,');
   QAtualizaInfo.SQL.Add('ESTOQUE = :EST,');
   QAtualizaInfo.SQL.Add('VLR_ULT_VENDA = :VLR_ULT,');
   QAtualizaInfo.SQL.Add('DT_ULT_VENDA = :DT,');
   QAtualizaInfo.SQL.Add('CATEGORIA = :C,');
   QAtualizaInfo.SQL.Add('AVARIA = :A');
   QAtualizaInfo.SQL.Add('where PLACA = :PL');
   QAtualizaInfo.ParamByName('V30').AsInteger := VND_30D;
   QAtualizaInfo.ParamByName('EST').AsInteger := ESTOQUE;
   QAtualizaInfo.ParamByName('VLR_ULT').AsCurrency := VLR_VND;
   QAtualizaInfo.ParamByName('DT').AsDate := DT_VND;
   QAtualizaInfo.ParamByName('C').Text := CAT;
   QAtualizaInfo.ParamByName('A').AsCurrency := AVARIA;
   QAtualizaInfo.ParamByName('PL').Text := DBGrid1.DataSource.DataSet.FieldByName('PLACA').Text;
   QAtualizaInfo.Execute;

   DBGrid1.DataSource.DataSet.Next;
   End;
   btnPesquisar.Click();
 End;
  }
end;

procedure TFormAnaliseCompraQuery.btnAtualizaVistoriasClick(Sender: TObject);
begin

 if FormLoadingOpaco = nil then
 Begin
   FormLoadingOpaco := TFormLoadingOpaco.Create(self);
 End;

 FormLoadingOpaco.WindowState := wsMaximized;
 FormLoadingOpaco.Label1.Caption := 'Aguarde... Consultando Placas...';
 FormLoadingOpaco.Show;

 DBGrid1.DataSource.DataSet.First;

 while not DBGrid1.DataSource.DataSet.Eof do
 begin

    DataModuleBancoVistoria.qConsultaPlaca.sql.Clear;
    DataModuleBancoVistoria.qConsultaPlaca.sql.Add('select id, vlr_tot_avaria, categoria from tbVistoria where placa = :placa and categoria is not null order by DataVistoria desc LIMIT 1');
    DataModuleBancoVistoria.qConsultaPlaca.ParamByName('placa').Text := DBGrid1.DataSource.DataSet.FieldByName('placa').Text;
    DataModuleBancoVistoria.qConsultaPlaca.Open;

    FormLoadingOpaco.Label1.Caption := 'Consultando Placa '+DBGrid1.DataSource.DataSet.FieldByName('placa').Text;

    if DataModuleBancoVistoria.qConsultaPlaca.RecordCount > 0 then
    Begin

       FormLoadingOpaco.Label1.Caption := 'Atualizando vistoria para a placa '+DBGrid1.DataSource.DataSet.FieldByName('placa').Text;
       Application.ProcessMessages;

       qAtualizaVistorias.SQL.Clear;
       qAtualizaVistorias.SQL.Add('update TBPROCPLANS set AVARIA = :totalavaria, CATEGORIA=:cat, id_vistoria=:id where placa = :placa');
       qAtualizaVistorias.ParamByName('totalavaria').AsCurrency := DataModuleBancoVistoria.qConsultaPlaca.FieldByName('vlr_tot_avaria').AsCurrency;
       qAtualizaVistorias.ParamByName('cat').Text               := DataModuleBancoVistoria.qConsultaPlaca.FieldByName('categoria').Text;
       qAtualizaVistorias.ParamByName('placa').Text             := DBGrid1.DataSource.DataSet.FieldByName('placa').Text;
       qAtualizaVistorias.ParamByName('id').AsInteger           := DataModuleBancoVistoria.qConsultaPlaca.FieldByName('id').AsInteger;
       qAtualizaVistorias.Execute;
    End;
   DBGrid1.DataSource.DataSet.Next;
   Application.ProcessMessages;
   End;
   DBGrid1.DataSource.DataSet.Next;
   Application.ProcessMessages;

 btnPesquisar.Click();
 FormLoadingOpaco.Close;
end;

procedure TFormAnaliseCompraQuery.btnAtuFIPEClick(Sender: TObject);
Var
 CountMAX, CountAtual, I : Integer;
begin

 if FormLoading = nil then
 Begin
   FormLoading := TFormLoading.Create(self);
 End;

 if MessageDlg('Esta atualizaçãos será aplicada apenas para os veículos da tela, deseja prosseguir?', mtInformation, [mbno, mbyes] , 0) = mrYes then
 Begin
  FormLoading.LabelStatus.Caption := 'Aguarde, aualizando FIPE de Veículos...';
  FormLoading.LabelStatus.Refresh;

  FormLoading.Position := poScreenCenter;
  FormLoading.Show;

  DBGrid1.DataSource.DataSet.Last;

  I := 0;
  FormLoading.ProgressBar1.Position := i;
  CountMAX := DBGrid1.DataSource.DataSet.RecordCount;
  FormLoading.ProgressBar1.Max := CountMAX;

  DBGrid1.DataSource.DataSet.First;

  while not DBGrid1.DataSource.DataSet.Eof do
  Begin

     FormPrincipal.QBuscaFIPE.SQL.Clear;
     FormPrincipal.QBuscaFIPE.SQL.Add('select valor as VLR_NEW from TBNEWFIPE');
     FormPrincipal.QBuscaFIPE.SQL.Add('where COD_FIPE = :c_fipe and ANO=:ANO');
     FormPrincipal.QBuscaFIPE.SQL.Add('and ref=:ref');
     FormPrincipal.QBuscaFIPE.ParamByName('c_fipe').Text := DBGrid1.DataSource.DataSet.FieldByName('COD_FIPE').Text;
     FormPrincipal.QBuscaFIPE.ParamByName('ANO').Text    := DBGrid1.DataSource.DataSet.FieldByName('ANO_MOD').Text;
     FormPrincipal.QBuscaFIPE.ParamByName('ref').Text    := ComboFipe2.Text;
     FormPrincipal.QBuscaFIPE.Open;

      FormPrincipal.QAtualizaFIPEveiculos.SQL.Clear;
      FormPrincipal.QAtualizaFIPEveiculos.SQL.Add('update TBPROCPLANS set FIPE2 = :NEW_FIPE, REF_FIPE2=:ref where');
      FormPrincipal.QAtualizaFIPEveiculos.SQL.Add('PLACA=:PL');
      FormPrincipal.QAtualizaFIPEveiculos.ParamByName('PL').Text := DBGrid1.DataSource.DataSet.FieldByName('PLACA').Text;
      FormPrincipal.QAtualizaFIPEveiculos.ParamByName('NEW_FIPE').AsCurrency := FormPrincipal.QBuscaFIPE.FieldByName('VLR_NEW').AsCurrency;
      FormPrincipal.QAtualizaFIPEveiculos.ParamByName('ref').text := ComboFipe2.Text;
      FormPrincipal.QAtualizaFIPEveiculos.Execute;

     FormPrincipal.QBuscaFIPE.SQL.Clear;
     FormPrincipal.QBuscaFIPE.SQL.Add('select valor as VLR_NEW from TBNEWFIPE');
     FormPrincipal.QBuscaFIPE.SQL.Add('where COD_FIPE = :c_fipe and ANO=:ANO');
     FormPrincipal.QBuscaFIPE.SQL.Add('and ref=:ref');
     FormPrincipal.QBuscaFIPE.ParamByName('c_fipe').Text := DBGrid1.DataSource.DataSet.FieldByName('COD_FIPE').Text;
     FormPrincipal.QBuscaFIPE.ParamByName('ANO').Text    := DBGrid1.DataSource.DataSet.FieldByName('ANO_MOD').Text;
     FormPrincipal.QBuscaFIPE.ParamByName('ref').Text    := ComboFipe3.Text;
     FormPrincipal.QBuscaFIPE.Open;

      FormPrincipal.QAtualizaFIPEveiculos.SQL.Clear;
      FormPrincipal.QAtualizaFIPEveiculos.SQL.Add('update TBPROCPLANS set FIPE3 = :NEW_FIPE, REF_FIPE3=:ref where');
      FormPrincipal.QAtualizaFIPEveiculos.SQL.Add('PLACA=:PL');
      FormPrincipal.QAtualizaFIPEveiculos.ParamByName('PL').Text := DBGrid1.DataSource.DataSet.FieldByName('PLACA').Text;
      FormPrincipal.QAtualizaFIPEveiculos.ParamByName('NEW_FIPE').AsCurrency := FormPrincipal.QBuscaFIPE.FieldByName('VLR_NEW').AsCurrency;
      FormPrincipal.QAtualizaFIPEveiculos.ParamByName('ref').text := ComboFipe2.Text;
      FormPrincipal.QAtualizaFIPEveiculos.Execute;

      FormLoading.LabelStatus.Caption := 'Atualizou Veículo PLACA: '+DBGrid1.DataSource.DataSet.FieldByName('PLACA').Text;

      Application.ProcessMessages;

      FormLoading.ProgressBar1.Position := FormLoading.ProgressBar1.Position +1;

      DBGrid1.DataSource.DataSet.Next;
     End;

     FormLoading.LabelStatus.Caption := 'Processo finalizado!';
     ShowMessage('Atualização aplicada com sucesso');

     btnPesquisar.Click;

     FormLoading.ProgressBar1.Position := 0;

     FormLoading.Close;
 End;

end;

procedure TFormAnaliseCompraQuery.btnCompraVeiculoClick(Sender: TObject);
var
query : TUniQuery;
selecionado: Integer;
begin

 try

 query := TUniQuery.Create(self);
 query.Connection := DataModuleConexao.UniConnection1;

 With DBGrid1 do
  Begin
    for selecionado:= 0 to Pred(SelectedRows.Count) do
    Begin
       Datasource.Dataset.Bookmark:= SelectedRows[selecionado]; //O comando SelectedRows irá indicar qual o registro atual no DataSet

       if DBGrid1.DataSource.DataSet.FieldByName('COMPRADO').Text = 'NAO' then
       Begin
         query.SQL.Clear;
         query.SQL.Add('update TBPROCPLANS set comprado = :SIM, puxado=0 where PLACA=:PL and ID=:id');
         query.ParamByName('PL').Text := DBGrid1.DataSource.DataSet.FieldByName('PLACA').Text;
         query.ParamByName('SIM').Text := 'SIM';
         query.ParamByName('id').AsInteger := DBGrid1.DataSource.DataSet.FieldByName('ID').AsInteger;
         query.Execute;

         query.SQL.Clear;
         query.SQL.Add('insert into tbcompras_pagamento_detalhe (placa, valor_avaliacao, valor_pagar, tipo , usuario, concluido, data, valor_pago)');
         query.SQL.Add('values (:placa, :vlraval, :vlrpagar, :tipo, :usuario, 0 , :dt, :vlrpago)');
         query.ParamByName('placa').Text := DBGrid1.DataSource.DataSet.FieldByName('PLACA').Text;
         query.ParamByName('vlraval').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN').AsCurrency;
         query.ParamByName('vlrpagar').AsCurrency:= DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN').AsCurrency;
         query.ParamByName('vlrpago').AsCurrency := 0;
         query.ParamByName('tipo').Text := 'COMPRA FROTISTA';
         query.ParamByName('usuario').Text := FormLoginSavauto.EditUsuario.Text;
         query.ParamByName('dt').AsDateTime := NOW;
         query.ExecSQL;
       End
       Else
       Begin
         query.SQL.Clear;
         query.SQL.Add('update TBPROCPLANS set comprado = :SIM where PLACA=:PL and ID=:id');
         query.ParamByName('PL').Text := DBGrid1.DataSource.DataSet.FieldByName('PLACA').Text;
         query.ParamByName('SIM').Text := 'NAO';
         query.ParamByName('id').AsInteger := DBGrid1.DataSource.DataSet.FieldByName('ID').AsInteger;
         query.Execute;

         query.SQL.Clear;
         query.SQL.Add('delete from tbcompras_pagamento_detalhe where placa=:placa');
         query.ParamByName('placa').Text := DBGrid1.DataSource.DataSet.FieldByName('PLACA').Text;
         query.Execute;
       End;

    end;
    btnPesquisar.Click();
  End;

  query.DisposeOf;

 Except
 On E:Exception do
 Begin
    ShowMessage('Falha ao concluir operação, refaça o procedimento! ' + E.Message);
 End;

 end;

end;

procedure TFormAnaliseCompraQuery.btnExportarExcelClick(Sender: TObject);
var
objExcel,Sheet,Chart,s : Variant;
cTitulo : string;
i : integer;
begin

 if MessageDlg('A exportação será aplicada apenas para as informações na tela, deseja prosseguir?', mtWarning, [mbno, mbyes] , 0) = mrYes  then
 Begin

  DBGrid1.DataSource.DataSet.First;

// Cria uma instancia para utilizar o Excel
  cTitulo := 'Planilha de Teste';
  objExcel := CreateOleObject('Excel.Application');
  //objExcel.Visible := True;
  objExcel.Caption := cTitulo;

  objExcel.Workbooks.Add;
  objExcel.Workbooks[1].Sheets.Add;
  objExcel.Workbooks[1].WorkSheets[1].Name := cTitulo;
  Sheet := objExcel.Workbooks[1].WorkSheets[cTitulo];

  Sheet.cells[1,1] := 'FORNECEDOR';
  Sheet.cells[1,2] := 'MODELO';
  Sheet.cells[1,3] := 'KM';
  Sheet.cells[1,4] := 'ANO_MOD';
  Sheet.cells[1,5] := 'COR';
  Sheet.cells[1,6] := 'VLR_MIN';
  Sheet.cells[1,7] := 'VLR_FIPE';
  Sheet.cells[1,8] := 'VLR_VENDA';
  Sheet.cells[1,9] := 'DT_VENDA';
  Sheet.cells[1,10] := 'CAT';
  Sheet.cells[1,11] := 'AVARIA';
  Sheet.cells[1,12] := 'G0';
  Sheet.cells[1,13] := 'MG';
  Sheet.cells[1,14] := 'RESULTADO';
  Sheet.cells[1,15] := 'V30D';
  Sheet.cells[1,16] := 'EST';
  Sheet.cells[1,17] := 'VLR_MIN_DOIS';
  Sheet.cells[1,18] := 'MIN/FIPE';
  Sheet.cells[1,19] := 'COMPRA_JA';
  Sheet.cells[1,20] := 'VMERC_1';
  Sheet.cells[1,21] := 'VMERC_2';
  Sheet.cells[1,22] := 'ATAC_VAREJ';
  Sheet.cells[1,23] := 'MIN/RESUL';
  Sheet.cells[1,24] := 'LANCE';
  Sheet.cells[1,25] := 'LANCE/FIPE';
  Sheet.cells[1,26] := 'COMPRA';
  Sheet.cells[1,27] := 'SN';
  Sheet.cells[1,28] := 'DT_PGTO';
  Sheet.cells[1,29] := 'QTD';
  Sheet.cells[1,30] := 'ID_PLAN_FOR';
  Sheet.cells[1,31] := 'PLACA';
  Sheet.cells[1,32] := 'LICITACAO';
  Sheet.cells[1,33] := 'LOTE';
  Sheet.cells[1,34] := 'COD_FIPE';
  Sheet.cells[1,35] := 'SITUACAO';
  Sheet.cells[1,36] := 'DATA';
  Sheet.cells[1,37] := 'LOCAL';
  Sheet.cells[1,38] := 'ONDE';

  if FormLoading = nil then
  BEgin
    FormLoading := TFormLoading.Create(self);
  End;

  FormLoading.LabelStatus.Caption := 'Gerando Planilha, aguarde...';
  FormLoading.Position := poScreenCenter;
  FormLoading.Show;
  Application.ProcessMessages;

  i := 2;

  while not DBGrid1.DataSource.DataSet.Eof do
  Begin

  Sheet.cells[i,1] := DBGrid1.DataSource.DataSet.FieldByName('FORNECEDOR').Text;
  Sheet.cells[i,2] := DBGrid1.DataSource.DataSet.FieldByName('MODELO').Text;
  Sheet.cells[i,3] := DBGrid1.DataSource.DataSet.FieldByName('KM').Text;
  Sheet.cells[i,4] := DBGrid1.DataSource.DataSet.FieldByName('ANO_MOD').Text;
  Sheet.cells[i,5] := DBGrid1.DataSource.DataSet.FieldByName('COR').Text;
  Sheet.cells[i,6] := DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN').AsCurrency;
  Sheet.cells[i,7] := DBGrid1.DataSource.DataSet.FieldByName('VLR_FIPE').AsCurrency;
  Sheet.cells[i,8] := DBGrid1.DataSource.DataSet.FieldByName('VLR_ULT_VENDA').AsCurrency;
  if DBGrid1.DataSource.DataSet.FieldByName('DT_ULT_VENDA').Text = '30/12/1899' then
  Sheet.cells[i,9] := ''
  Else
  Sheet.cells[i,9] := DBGrid1.DataSource.DataSet.FieldByName('DT_ULT_VENDA').AsDateTime;
  Sheet.cells[i,10] := DBGrid1.DataSource.DataSet.FieldByName('CATEGORIA').Text;
  Sheet.cells[i,11] := DBGrid1.DataSource.DataSet.FieldByName('AVARIA').AsCurrency;
  Sheet.cells[i,12] := DBGrid1.DataSource.DataSet.FieldByName('G_ZERO').AsCurrency;
  Sheet.cells[i,13] := DBGrid1.DataSource.DataSet.FieldByName('MG').AsCurrency;
  Sheet.cells[i,14] := DBGrid1.DataSource.DataSet.FieldByName('RESULTADO').AsCurrency;
  Sheet.cells[i,15] := DBGrid1.DataSource.DataSet.FieldByName('VENDA_TRINTA_DIAS').AsInteger;
  Sheet.cells[i,16] := DBGrid1.DataSource.DataSet.FieldByName('ESTOQUE').AsInteger;
  Sheet.cells[i,17] := DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN_DOIS').AsCurrency;
  Sheet.cells[i,18] := DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN_FIPE').AsCurrency;
  Sheet.cells[i,19] := DBGrid1.DataSource.DataSet.FieldByName('COMPRA_JA').AsCurrency;
  Sheet.cells[i,20] := DBGrid1.DataSource.DataSet.FieldByName('VLR_MERC_UM').AsCurrency;
  Sheet.cells[i,21] := DBGrid1.DataSource.DataSet.FieldByName('VLR_MERC_DOIS').AsCurrency;
  Sheet.cells[i,22] := DBGrid1.DataSource.DataSet.FieldByName('ATAC_VAREJ').Text;
  Sheet.cells[i,23] := DBGrid1.DataSource.DataSet.FieldByName('MIN_RESULTADO').AsCurrency;
  Sheet.cells[i,24] := DBGrid1.DataSource.DataSet.FieldByName('LANCE').AsCurrency;
  //Sheet.cells[i,23] := format('=SE(S2="C";SOMA(I2 - V2);0)', [i]);
  Sheet.cells[i,25] := DBGrid1.DataSource.DataSet.FieldByName('LANCE_FIPE').AsCurrency;
  Sheet.cells[i,26] := DBGrid1.DataSource.DataSet.FieldByName('COMPRA').AsCurrency;
  Sheet.cells[i,27] := DBGrid1.DataSource.DataSet.FieldByName('SN').Text;
  Sheet.cells[i,28] := DBGrid1.DataSource.DataSet.FieldByName('DT_PGTO').AsDateTime;
  Sheet.cells[i,29] := DBGrid1.DataSource.DataSet.FieldByName('QTD').Text;
  Sheet.cells[i,30] := DBGrid1.DataSource.DataSet.FieldByName('ID_PLAN_FOR').AsInteger;
  Sheet.cells[i,31] := DBGrid1.DataSource.DataSet.FieldByName('PLACA').Text;
  Sheet.cells[i,32] := DBGrid1.DataSource.DataSet.FieldByName('LICITACAO').Text;
  Sheet.cells[i,33] := DBGrid1.DataSource.DataSet.FieldByName('LOTE').Text;
  Sheet.cells[i,34] := DBGrid1.DataSource.DataSet.FieldByName('COD_FIPE').Text;
  Sheet.cells[i,35] := DBGrid1.DataSource.DataSet.FieldByName('SITUACAO').AsInteger;
  Sheet.cells[i,36] := DBGrid1.DataSource.DataSet.FieldByName('DATA').AsDateTime;
  Sheet.cells[i,37] := DBGrid1.DataSource.DataSet.FieldByName('LOCAL').Text;
  Sheet.cells[i,38] := DBGrid1.DataSource.DataSet.FieldByName('ONDE').Text;

  DBGrid1.DataSource.DataSet.Next;

  Application.ProcessMessages;

   Sheet.columns.autofit;

   I := I+1;

  end;

  FormLoading.Close;

  objExcel.Visible := True;
 End;

end;

procedure TFormAnaliseCompraQuery.BtnImportacoesClick(Sender: TObject);
begin

 if FormImportacoesEfetuadas = nil then
 Begin
   FormImportacoesEfetuadas := TFormImportacoesEfetuadas.Create(self);
 End;

 FormImportacoesEfetuadas.Position := poScreenCenter;
 FormImportacoesEfetuadas.ShowModal;

end;

procedure TFormAnaliseCompraQuery.btnImportaPlanClick(Sender: TObject);
begin

 if FormNovoProcessamento = nil then
 Begin
   FormNovoProcessamento := TFormNovoProcessamento.Create(self);
 End;

 FormNovoProcessamento.Position := poScreenCenter;
 FormNovoProcessamento.ShowModal;

end;

procedure TFormAnaliseCompraQuery.ButtonFiltrarClick(Sender: TObject);
begin

 QBuscaPlan.SQL.Clear;
 QBuscaPlan.SQL.Add('select * from TBPROCPLANS');
 QBuscaPlan.Open;

end;

procedure TFormAnaliseCompraQuery.CheckBox1Click(Sender: TObject);
begin

 if CheckBox1.Checked = true then
 Begin
    DateTimeInicial.Enabled := true;
    DateTimeFinal.Enabled := true;
 End
 Else
 Begin
    DateTimeInicial.Enabled := false;
    DateTimeFinal.Enabled := false;
 End;


end;

procedure TFormAnaliseCompraQuery.ColunasOcultas1Click(Sender: TObject);
begin

 FormColunasOcultas.Position := poScreenCenter;
 FormColunasOcultas.ShowModal;

end;

procedure TFormAnaliseCompraQuery.ComboBoxCategoriaSelect(Sender: TObject);
Var
 Sit : Integer;
 T_RESULTADO, T_AVARIAS : Currency;
begin



  T_RESULTADO := 0;
  T_AVARIAS := 0;

 if ComboBoxSituacao.Text = 'Ativo' then
 Sit := 0
 Else
 Sit := 1;

 Application.ProcessMessages;

 QBuscaPlan.SQL.Clear;
 QBuscaPlan.SQL.Add('select * from TBPROCPLANS');
 QBuscaPlan.SQL.Add('where');
 QBuscaPlan.SQL.Add('modelo like '+QuotedStr('%'+EditModelo.Text+'%'));
 if EditPlanAnalise.Text <> '' then
 QBuscaPlan.SQL.Add('and IMPORT_PLANILHA = '''+EditPlanAnalise.Text+'''');
 if EditPlanAnalise.Text <> '' then
 QBuscaPlan.SQL.Add('AND IMPORT_DATA = :DT_IMPORT');
 if CheckBox1.Checked = true then
 QBuscaPlan.SQL.Add('and DATA>=:DtIni');
 if CheckBox1.Checked = true then
 QBuscaPlan.SQL.Add('and DATA<=:DtFim');
 QBuscaPlan.SQL.Add('and FORNECEDOR like'+QuotedStr('%'+ComboBoxFornecedor.Text+'%'));
 if EditKM.Text <> '' then
 QBuscaPlan.SQL.Add('and KM <= :KM');
 if EditMargem.Text <> '' then
 QBuscaPlan.SQL.Add('and MG >=:Margem');
 if ComboBoxCategoria.Text <> '' then
 QBuscaPlan.SQL.Add('and CATEGORIA=:CAT');
 if ComboBoxSituacao.Text <> '' then
 QBuscaPlan.SQL.Add('and SITUACAO = :S');
 if ComboBoxLote.Text <> '' then
 QBuscaPlan.SQL.Add('and LOTE=:LT');
 if EditPlaca.Text <> '' then
 QBuscaPlan.SQL.Add('and PLACA=:PL');
 QBuscaPlan.SQL.Add('order by MODELO');
 if EditKM.Text <> '' then
 QBuscaPlan.ParamByName('KM').AsFloat := StrToFloat(EditKM.Text);
 if CheckBox1.Checked = true then
 QBuscaPlan.ParamByName('DtIni').AsDate := DateTimeInicial.Date;
 if CheckBox1.Checked = true then
 QBuscaPlan.ParamByName('DtFim').AsDate := DateTimeFinal.Date;
 if EditMargem.Text <> '' then
 QBuscaPlan.ParamByName('Margem').AsFloat := StrToFloat(EditMargem.Text);
 if ComboBoxCategoria.Text <> '' then
 QBuscaPlan.ParamByName('CAT').Text := ComboBoxCategoria.Text;
 if ComboBoxSituacao.Text <> '' then
 QBuscaPlan.ParamByName('S').AsInteger := Sit;
 if ComboBoxLote.Text <> '' then
 QBuscaPlan.ParamByName('LT').Text := ComboBoxLote.Text;
 if EditPlanAnalise.Text <> '' then
 QBuscaPlan.ParamByName('DT_IMPORT').AsDate := FormImportacoesEfetuadas.DBGrid1.DataSource.DataSet.FieldByName('DATA').AsDateTime;
 if EditPlaca.Text <> '' then
 QBuscaPlan.ParamByName('PL').Text := EditPlaca.Text;
 QBuscaPlan.Open;

{ if QBuscaPlan.FieldByName('REF_FIPE2').Text <> ' ' then
 Begin
   DBGrid1.Columns[10].Title.Caption := 'FIPE ' + QBuscaPlan.FieldByName('REF_FIPE2').Text;
 End;

 if QBuscaPlan.FieldByName('REF_FIPE3').Text <> ' ' then
 Begin
   DBGrid1.Columns[11].Title.Caption := 'FIPE ' + QBuscaPlan.FieldByName('REF_FIPE3').Text;
 End;
 }
DBGrid1.DataSource.DataSet.First;

 while not DBGrid1.DataSource.DataSet.Eof do
 Begin

 T_RESULTADO := T_RESULTADO + DBGrid1.DataSource.DataSet.FieldByName('RESULTADO').AsCurrency;
 T_AVARIAS   := T_AVARIAS   + DBGrid1.DataSource.DataSet.FieldByName('AVARIA').AsCurrency;

 DBGrid1.DataSource.DataSet.Next;
 Application.ProcessMessages;
 End;

 LblTotalResultado.Caption :=  FormatFloat('R$ #,,,,0.00', T_RESULTADO);
 LblTotalAvarias.Caption   :=  FormatFloat('R$ #,,,,0.00', T_AVARIAS);

 DBGrid1.DataSource.DataSet.First;

 Application.ProcessMessages;

 FormLoading.Close;
end;

procedure TFormAnaliseCompraQuery.ComboBoxFornecedorSelect(Sender: TObject);
Var
 Sit : Integer;
 T_RESULTADO, T_AVARIAS : Currency;
begin

 if FormLoading = nil then
 Begin
   FormLoading := TFormLoading.Create(self);
 End;

  T_RESULTADO := 0;
  T_AVARIAS := 0;

 if ComboBoxSituacao.Text = 'Ativo' then
 Sit := 0
 Else
 Sit := 1;

 Application.ProcessMessages;

 btnPesquisar.Click;

end;

procedure TFormAnaliseCompraQuery.ComboBoxLoteSelect(Sender: TObject);
Var
 Sit : Integer;
 T_RESULTADO, T_AVARIAS : Currency;
begin

  T_RESULTADO := 0;
  T_AVARIAS := 0;

 if ComboBoxSituacao.Text = 'Ativo' then
 Sit := 0
 Else
 Sit := 1;

 Application.ProcessMessages;

 QBuscaPlan.SQL.Clear;
 QBuscaPlan.SQL.Add('select * from TBPROCPLANS');
 QBuscaPlan.SQL.Add('where');
 QBuscaPlan.SQL.Add('modelo like '+QuotedStr('%'+EditModelo.Text+'%'));
 if EditPlanAnalise.Text <> '' then
 QBuscaPlan.SQL.Add('and IMPORT_PLANILHA = '''+EditPlanAnalise.Text+'''');
 if EditPlanAnalise.Text <> '' then
 QBuscaPlan.SQL.Add('AND IMPORT_DATA = :DT_IMPORT');
 if CheckBox1.Checked = true then
 QBuscaPlan.SQL.Add('and DATA>=:DtIni');
 if CheckBox1.Checked = true then
 QBuscaPlan.SQL.Add('and DATA<=:DtFim');
 QBuscaPlan.SQL.Add('and FORNECEDOR like'+QuotedStr('%'+ComboBoxFornecedor.Text+'%'));
 if EditKM.Text <> '' then
 QBuscaPlan.SQL.Add('and KM <= :KM');
 if EditMargem.Text <> '' then
 QBuscaPlan.SQL.Add('and MG >=:Margem');
 if ComboBoxCategoria.Text <> '' then
 QBuscaPlan.SQL.Add('and CATEGORIA=:CAT');
 if ComboBoxSituacao.Text <> '' then
 QBuscaPlan.SQL.Add('and SITUACAO = :S');
 if ComboBoxLote.Text <> '' then
 QBuscaPlan.SQL.Add('and LOTE=:LT');
 if EditPlaca.Text <> '' then
 QBuscaPlan.SQL.Add('and PLACA=:PL');
 QBuscaPlan.SQL.Add('order by MODELO');
 if EditKM.Text <> '' then
 QBuscaPlan.ParamByName('KM').AsFloat := StrToFloat(EditKM.Text);
 if CheckBox1.Checked = true then
 QBuscaPlan.ParamByName('DtIni').AsDate := DateTimeInicial.Date;
 if CheckBox1.Checked = true then
 QBuscaPlan.ParamByName('DtFim').AsDate := DateTimeFinal.Date;
 if EditMargem.Text <> '' then
 QBuscaPlan.ParamByName('Margem').AsFloat := StrToFloat(EditMargem.Text);
 if ComboBoxCategoria.Text <> '' then
 QBuscaPlan.ParamByName('CAT').Text := ComboBoxCategoria.Text;
 if ComboBoxSituacao.Text <> '' then
 QBuscaPlan.ParamByName('S').AsInteger := Sit;
 if ComboBoxLote.Text <> '' then
 QBuscaPlan.ParamByName('LT').Text := ComboBoxLote.Text;
 if EditPlanAnalise.Text <> '' then
 QBuscaPlan.ParamByName('DT_IMPORT').AsDate := FormImportacoesEfetuadas.DBGrid1.DataSource.DataSet.FieldByName('DATA').AsDateTime;
 if EditPlaca.Text <> '' then
 QBuscaPlan.ParamByName('PL').Text := EditPlaca.Text;
 QBuscaPlan.Open;

DBGrid1.DataSource.DataSet.First;
{
 if QBuscaPlan.FieldByName('REF_FIPE2').Text <> ' ' then
 Begin
   DBGrid1.Columns[10].Title.Caption := 'FIPE ' + QBuscaPlan.FieldByName('REF_FIPE2').Text;
 End;

 if QBuscaPlan.FieldByName('REF_FIPE3').Text <> ' ' then
 Begin
   DBGrid1.Columns[11].Title.Caption := 'FIPE ' + QBuscaPlan.FieldByName('REF_FIPE3').Text;
 End;
}
 while not DBGrid1.DataSource.DataSet.Eof do
 Begin

 T_RESULTADO := T_RESULTADO + DBGrid1.DataSource.DataSet.FieldByName('RESULTADO').AsCurrency;
 T_AVARIAS   := T_AVARIAS   + DBGrid1.DataSource.DataSet.FieldByName('AVARIA').AsCurrency;

 DBGrid1.DataSource.DataSet.Next;
 Application.ProcessMessages;
 End;

 LblTotalResultado.Caption :=  FormatFloat('R$ #,,,,0.00', T_RESULTADO);
 LblTotalAvarias.Caption   :=  FormatFloat('R$ #,,,,0.00', T_AVARIAS);

 DBGrid1.DataSource.DataSet.First;

 Application.ProcessMessages;

 FormLoading.Close;
end;

procedure TFormAnaliseCompraQuery.ComboBoxSituacaoSelect(Sender: TObject);
Var
 Sit : Integer;
 T_RESULTADO, T_AVARIAS : Currency;
begin

  T_RESULTADO := 0;
  T_AVARIAS := 0;

 if ComboBoxSituacao.Text = 'Ativo' then
 Sit := 0
 Else
 Sit := 1;

 Application.ProcessMessages;

 QBuscaPlan.SQL.Clear;
 QBuscaPlan.SQL.Add('select * from TBPROCPLANS');
 QBuscaPlan.SQL.Add('where');
 QBuscaPlan.SQL.Add('modelo like '+QuotedStr('%'+EditModelo.Text+'%'));
 if EditPlanAnalise.Text <> '' then
 QBuscaPlan.SQL.Add('and IMPORT_PLANILHA = '''+EditPlanAnalise.Text+'''');
 if EditPlanAnalise.Text <> '' then
 QBuscaPlan.SQL.Add('AND IMPORT_DATA = :DT_IMPORT');
 if CheckBox1.Checked = true then
 QBuscaPlan.SQL.Add('and IMPORT_DATA>=:DtIni');
 if CheckBox1.Checked = true then
 QBuscaPlan.SQL.Add('and IMPORT_DATA<=:DtFim');
 QBuscaPlan.SQL.Add('and FORNECEDOR like'+QuotedStr('%'+ComboBoxFornecedor.Text+'%'));
 if EditKM.Text <> '' then
 QBuscaPlan.SQL.Add('and KM <= :KM');
 if EditMargem.Text <> '' then
 QBuscaPlan.SQL.Add('and MG >=:Margem');
 if ComboBoxCategoria.Text <> '' then
 QBuscaPlan.SQL.Add('and CATEGORIA=:CAT');
 if ComboBoxSituacao.Text <> '' then
 QBuscaPlan.SQL.Add('and SITUACAO = :S');
 if ComboBoxLote.Text <> '' then
 QBuscaPlan.SQL.Add('and LOTE=:LT');
 if EditPlaca.Text <> '' then
 QBuscaPlan.SQL.Add('and PLACA=:PL');
 QBuscaPlan.SQL.Add('order by MODELO');
 if EditKM.Text <> '' then
 QBuscaPlan.ParamByName('KM').AsFloat := StrToFloat(EditKM.Text);
 if CheckBox1.Checked = true then
 QBuscaPlan.ParamByName('DtIni').AsDateTime := DateTimeInicial.DateTime;
 if CheckBox1.Checked = true then
 QBuscaPlan.ParamByName('DtFim').AsDateTime := DateTimeFinal.DateTime;
 if EditMargem.Text <> '' then
 QBuscaPlan.ParamByName('Margem').AsFloat := StrToFloat(EditMargem.Text);
 if ComboBoxCategoria.Text <> '' then
 QBuscaPlan.ParamByName('CAT').Text := ComboBoxCategoria.Text;
 if ComboBoxSituacao.Text <> '' then
 QBuscaPlan.ParamByName('S').AsInteger := Sit;
 if ComboBoxLote.Text <> '' then
 QBuscaPlan.ParamByName('LT').Text := ComboBoxLote.Text;
 if EditPlanAnalise.Text <> '' then
 QBuscaPlan.ParamByName('DT_IMPORT').AsDate := FormImportacoesEfetuadas.DBGrid1.DataSource.DataSet.FieldByName('DATA').AsDateTime;
 if EditPlaca.Text <> '' then
 QBuscaPlan.ParamByName('PL').Text := EditPlaca.Text;
 QBuscaPlan.Open;
 {
 if QBuscaPlan.FieldByName('REF_FIPE2').Text <> ' ' then
 Begin
   DBGrid1.Columns[10].Title.Caption := 'FIPE ' + QBuscaPlan.FieldByName('REF_FIPE2').Text;
 End;

 if QBuscaPlan.FieldByName('REF_FIPE3').Text <> ' ' then
 Begin
   DBGrid1.Columns[11].Title.Caption := 'FIPE ' + QBuscaPlan.FieldByName('REF_FIPE3').Text;
 End;
 }
DBGrid1.DataSource.DataSet.First;

 while not DBGrid1.DataSource.DataSet.Eof do
 Begin

 T_RESULTADO := T_RESULTADO + DBGrid1.DataSource.DataSet.FieldByName('RESULTADO').AsCurrency;
 T_AVARIAS   := T_AVARIAS   + DBGrid1.DataSource.DataSet.FieldByName('AVARIA').AsCurrency;

 DBGrid1.DataSource.DataSet.Next;
 Application.ProcessMessages;
 End;

 LblTotalResultado.Caption :=  FormatFloat('R$ #,,,,0.00', T_RESULTADO);
 LblTotalAvarias.Caption   :=  FormatFloat('R$ #,,,,0.00', T_AVARIAS);

 DBGrid1.DataSource.DataSet.First;

 Application.ProcessMessages;

 FormLoading.Close;
end;

procedure TFormAnaliseCompraQuery.ConfigurarPermisses1Click(Sender: TObject);
begin

 if UpperCase(FormLoginSavauto.EditUsuario.Text) <> 'ADMINISTRADOR' then
 Begin
    MessageDlg('Usuário sem permissao', mtError, [mbok] , 0);
    Abort;
 End
 Else
 Begin
   if FormLiberaPermissao = nil then
   FormLiberaPermissao := TFormLiberaPermissao.Create(self);

   FormLiberaPermissao.Tela := name;
   FormLiberaPermissao.Position := poScreenCenter;
   FormLiberaPermissao.ShowModal;
 End;

end;

procedure TFormAnaliseCompraQuery.CriarPadrodeVisualizao1Click(Sender: TObject);
var

  i, f, m :integer;

begin

 { ShowMessage( IntToStr( DBGrid1.Columns.Items[DBGrid1.selectedindex].Index ));

  DBGrid1.Columns.Items[DBGrid1.SelectedIndex].}

end;

procedure TFormAnaliseCompraQuery.DadosdaVistoriaemcriao1Click(Sender: TObject);
begin

  if FormVistoriaDetalhes = nil then
  Begin
    FormVistoriaDetalhes := TFormVistoriaDetalhes.Create(self);
  End;

 if QBuscaPlan.FieldByName('Categoria').Text <> '' then
 Begin

   FormVistoriaDetalhes.WindowState := wsMaximized;

   FormVistoriaDetalhes.qBuscaDadosVistoria.Filter := 'placa='+QuotedStr(DBGrid1.DataSource.DataSet.FieldByName('placa').Text);
   FormVistoriaDetalhes.qBuscaDadosVistoria.Filtered := true;
   FormVistoriaDetalhes.qBuscaDadosVistoria.Open;

   FormVistoriaDetalhes.Tag := DBGrid1.DataSource.DataSet.FieldByName('id_vistoria').AsInteger;

   FormVistoriaDetalhes.ShowModal;
 End;


end;

procedure TFormAnaliseCompraQuery.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Bitmap:TBitmap;
  nIndiceImagem: byte;
begin

  If QBuscaPlan.FieldByName('CATEGORIA').Text = 'A' then
  Begin
   Dbgrid1.Canvas.Brush.Color:= $0080FF00;
   DBGrid1.Canvas.Font.Color := clBlack;
   Dbgrid1.DefaultDrawDataCell(Rect, dbgrid1.columns[datacol].field, State);
  End;

  If QBuscaPlan.FieldByName('CATEGORIA').Text = 'B' then
  Begin
   Dbgrid1.Canvas.Brush.Color:= $00FF7D7D;
   DBGrid1.Canvas.Font.Color := clBlack;
   Dbgrid1.DefaultDrawDataCell(Rect, dbgrid1.columns[datacol].field, State);
  End;

  If QBuscaPlan.FieldByName('CATEGORIA').Text = 'C' then
  Begin
   Dbgrid1.Canvas.Brush.Color:= $006CB3FF;
   DBGrid1.Canvas.Font.Color := clBlack;
   Dbgrid1.DefaultDrawDataCell(Rect, dbgrid1.columns[datacol].field, State);
  End;

  If QBuscaPlan.FieldByName('CATEGORIA').Text = 'D' then
  Begin
   Dbgrid1.Canvas.Brush.Color:= $006464FF;
   DBGrid1.Canvas.Font.Color := clBlack;
   Dbgrid1.DefaultDrawDataCell(Rect, dbgrid1.columns[datacol].field, State);
  End;

  If QBuscaPlan.FieldByName('CATEGORIA').Text = '' then
  Begin
   Dbgrid1.Canvas.Brush.Color:= $00CDCDCD;
   DBGrid1.Canvas.Font.Color := clBlack;
   DBGrid1.Columns[10].Font.Color := $00A5F3A0;
   Dbgrid1.DefaultDrawDataCell(Rect, dbgrid1.columns[datacol].field, State);
  End;

   if Column.Field = DBGrid1.DataSource.DataSet.FieldByName('COMPRADO') then
     if DBGrid1.DataSource.DataSet.FieldByName('COMPRADO').Text ='NAO' then
     begin
       DBGrid1.Canvas.Font.Style :=
       DBGrid1.Canvas.Font.Style + [fsBold];
       DBGrid1.Canvas.Font.Color := clRed;
       DBGrid1.DefaultDrawDataCell(rect,Column.Field,State);
     end
     eLSE
     bEGIN
       DBGrid1.Canvas.Font.Style :=
       DBGrid1.Canvas.Font.Style + [fsBold];
       DBGrid1.Canvas.Font.Color := clGreen;
       DBGrid1.DefaultDrawDataCell(rect,Column.Field,State);
     end;

end;

procedure TFormAnaliseCompraQuery.DBGrid1KeyPress(Sender: TObject;
  var Key: Char);
  Var
  RESULTADO : Currency;
begin



end;

procedure TFormAnaliseCompraQuery.DBGrid1TitleClick(Column: TColumn);
Begin

 if Ascendente = false then
 Begin
   QBuscaPlan.IndexFieldNames := Column.FieldName + ' ASC';
   Ascendente := true;
   DBGrid1.DataSource.DataSet.First;
 End
 Else
 Begin
   QBuscaPlan.IndexFieldNames := Column.FieldName + ' DESC';
   Ascendente := false;
   DBGrid1.DataSource.DataSet.First;
 End;

end;

procedure TFormAnaliseCompraQuery.EditFornecedorKeyPress(Sender: TObject;
  var Key: Char);
     Var
 Sit : Integer;
begin

 if key = #13 then
 Begin

 if ComboBoxSituacao.Text = 'Ativo' then
 Sit := 0
 Else
 Sit := 1;

 Application.ProcessMessages;

 QBuscaPlan.SQL.Clear;
 QBuscaPlan.SQL.Add('select * from TBPROCPLANS');
 QBuscaPlan.SQL.Add('where');
 QBuscaPlan.SQL.Add('modelo like '+QuotedStr('%'+EditModelo.Text+'%'));
 if CheckBox1.Checked = true then
 QBuscaPlan.SQL.Add('and DATA>=:DtIni');
 if CheckBox1.Checked = true then
 QBuscaPlan.SQL.Add('and DATA<=:DtFim');
 QBuscaPlan.SQL.Add('and FORNECEDOR like'+QuotedStr('%'+EditFornecedor.Text+'%'));
 if EditKM.Text <> '' then
 QBuscaPlan.SQL.Add('and KM <= :KM');
 if EditMargem.Text <> '' then
 QBuscaPlan.SQL.Add('and MG >=:Margem');
 if ComboBoxCategoria.Text <> '' then
 QBuscaPlan.SQL.Add('and CATEGORIA=:CAT');
 if ComboBoxSituacao.Text <> '' then
 QBuscaPlan.SQL.Add('and SITUACAO = :S');
 QBuscaPlan.SQL.Add('order by MODELO');
 if EditKM.Text <> '' then
 QBuscaPlan.ParamByName('KM').AsFloat := StrToFloat(EditKM.Text);
 if CheckBox1.Checked = true then
 QBuscaPlan.ParamByName('DtIni').AsDate := DateTimeInicial.Date;
 if CheckBox1.Checked = true then
 QBuscaPlan.ParamByName('DtFim').AsDate := DateTimeFinal.Date;
 if EditMargem.Text <> '' then
 QBuscaPlan.ParamByName('Margem').AsFloat := StrToFloat(EditMargem.Text);
 if ComboBoxCategoria.Text <> '' then
 QBuscaPlan.ParamByName('CAT').Text := ComboBoxCategoria.Text;
 if ComboBoxSituacao.Text <> '' then
 QBuscaPlan.ParamByName('S').AsInteger := Sit;
 QBuscaPlan.Open;

 Application.ProcessMessages;

 FormLoading.Close;
 End;

end;

procedure TFormAnaliseCompraQuery.EditKMKeyPress(Sender: TObject;
  var Key: Char);
Var
 Sit : Integer;
 T_RESULTADO, T_AVARIAS : Currency;
begin

  T_RESULTADO := 0;
  T_AVARIAS := 0;

 if key = #13 then
 Begin

 if ComboBoxSituacao.Text = 'Ativo' then
 Sit := 0
 Else
 Sit := 1;

 Application.ProcessMessages;

 QBuscaPlan.SQL.Clear;
 QBuscaPlan.SQL.Add('select * from TBPROCPLANS');
 QBuscaPlan.SQL.Add('where');
 QBuscaPlan.SQL.Add('modelo like '+QuotedStr('%'+EditModelo.Text+'%'));
 if EditPlanAnalise.Text <> '' then
 QBuscaPlan.SQL.Add('and IMPORT_PLANILHA = '''+EditPlanAnalise.Text+'''');
 if EditPlanAnalise.Text <> '' then
 QBuscaPlan.SQL.Add('AND IMPORT_DATA = :DT_IMPORT');
 if CheckBox1.Checked = true then
 QBuscaPlan.SQL.Add('and DATA>=:DtIni');
 if CheckBox1.Checked = true then
 QBuscaPlan.SQL.Add('and DATA<=:DtFim');
 QBuscaPlan.SQL.Add('and FORNECEDOR like'+QuotedStr('%'+ComboBoxFornecedor.Text+'%'));
 if EditKM.Text <> '' then
 QBuscaPlan.SQL.Add('and KM <= :KM');
 if EditMargem.Text <> '' then
 QBuscaPlan.SQL.Add('and MG >=:Margem');
 if ComboBoxCategoria.Text <> '' then
 QBuscaPlan.SQL.Add('and CATEGORIA=:CAT');
 if ComboBoxSituacao.Text <> '' then
 QBuscaPlan.SQL.Add('and SITUACAO = :S');
 if ComboBoxLote.Text <> '' then
 QBuscaPlan.SQL.Add('and LOTE=:LT');
 if EditPlaca.Text <> '' then
 QBuscaPlan.SQL.Add('and PLACA=:PL');
 QBuscaPlan.SQL.Add('order by MODELO');
 if EditKM.Text <> '' then
 QBuscaPlan.ParamByName('KM').AsFloat := StrToFloat(EditKM.Text);
 if CheckBox1.Checked = true then
 QBuscaPlan.ParamByName('DtIni').AsDate := DateTimeInicial.Date;
 if CheckBox1.Checked = true then
 QBuscaPlan.ParamByName('DtFim').AsDate := DateTimeFinal.Date;
 if EditMargem.Text <> '' then
 QBuscaPlan.ParamByName('Margem').AsFloat := StrToFloat(EditMargem.Text);
 if ComboBoxCategoria.Text <> '' then
 QBuscaPlan.ParamByName('CAT').Text := ComboBoxCategoria.Text;
 if ComboBoxSituacao.Text <> '' then
 QBuscaPlan.ParamByName('S').AsInteger := Sit;
 if ComboBoxLote.Text <> '' then
 QBuscaPlan.ParamByName('LT').Text := ComboBoxLote.Text;
 if EditPlanAnalise.Text <> '' then
 QBuscaPlan.ParamByName('DT_IMPORT').AsDate := FormImportacoesEfetuadas.DBGrid1.DataSource.DataSet.FieldByName('DATA').AsDateTime;
 if EditPlaca.Text <> '' then
 QBuscaPlan.ParamByName('PL').Text := EditPlaca.Text;
 QBuscaPlan.Open;

DBGrid1.DataSource.DataSet.First;

 while not DBGrid1.DataSource.DataSet.Eof do
 Begin

 T_RESULTADO := T_RESULTADO + DBGrid1.DataSource.DataSet.FieldByName('RESULTADO').AsCurrency;
 T_AVARIAS   := T_AVARIAS   + DBGrid1.DataSource.DataSet.FieldByName('AVARIA').AsCurrency;

 DBGrid1.DataSource.DataSet.Next;
 Application.ProcessMessages;
 End;

 LblTotalResultado.Caption :=  FormatFloat('R$ #,,,,0.00', T_RESULTADO);
 LblTotalAvarias.Caption   :=  FormatFloat('R$ #,,,,0.00', T_AVARIAS);

 DBGrid1.DataSource.DataSet.First;

 Application.ProcessMessages;

 FormLoading.Close;
 End;
end;

procedure TFormAnaliseCompraQuery.EditMargemKeyPress(Sender: TObject;
  var Key: Char);
Var
 Sit : Integer;
 T_RESULTADO, T_AVARIAS : Currency;
begin

  T_RESULTADO := 0;
  T_AVARIAS := 0;

 if key = #13 then
 Begin

 if ComboBoxSituacao.Text = 'Ativo' then
 Sit := 0
 Else
 Sit := 1;

 Application.ProcessMessages;

 QBuscaPlan.SQL.Clear;
 QBuscaPlan.SQL.Add('select * from TBPROCPLANS');
 QBuscaPlan.SQL.Add('where');
 QBuscaPlan.SQL.Add('modelo like '+QuotedStr('%'+EditModelo.Text+'%'));
 if EditPlanAnalise.Text <> '' then
 QBuscaPlan.SQL.Add('and IMPORT_PLANILHA = '''+EditPlanAnalise.Text+'''');
 if EditPlanAnalise.Text <> '' then
 QBuscaPlan.SQL.Add('AND IMPORT_DATA = :DT_IMPORT');
 if CheckBox1.Checked = true then
 QBuscaPlan.SQL.Add('and DATA>=:DtIni');
 if CheckBox1.Checked = true then
 QBuscaPlan.SQL.Add('and DATA<=:DtFim');
 QBuscaPlan.SQL.Add('and FORNECEDOR like'+QuotedStr('%'+ComboBoxFornecedor.Text+'%'));
 if EditKM.Text <> '' then
 QBuscaPlan.SQL.Add('and KM <= :KM');
 if EditMargem.Text <> '' then
 QBuscaPlan.SQL.Add('and MG >=:Margem');
 if ComboBoxCategoria.Text <> '' then
 QBuscaPlan.SQL.Add('and CATEGORIA=:CAT');
 if ComboBoxSituacao.Text <> '' then
 QBuscaPlan.SQL.Add('and SITUACAO = :S');
 if ComboBoxLote.Text <> '' then
 QBuscaPlan.SQL.Add('and LOTE=:LT');
 QBuscaPlan.SQL.Add('order by MODELO');
 if EditKM.Text <> '' then
 QBuscaPlan.ParamByName('KM').AsFloat := StrToFloat(EditKM.Text);
 if CheckBox1.Checked = true then
 QBuscaPlan.ParamByName('DtIni').AsDate := DateTimeInicial.Date;
 if CheckBox1.Checked = true then
 QBuscaPlan.ParamByName('DtFim').AsDate := DateTimeFinal.Date;
 if EditMargem.Text <> '' then
 QBuscaPlan.ParamByName('Margem').AsFloat := StrToFloat(EditMargem.Text);
 if ComboBoxCategoria.Text <> '' then
 QBuscaPlan.ParamByName('CAT').Text := ComboBoxCategoria.Text;
 if ComboBoxSituacao.Text <> '' then
 QBuscaPlan.ParamByName('S').AsInteger := Sit;
 if ComboBoxLote.Text <> '' then
 QBuscaPlan.ParamByName('LT').Text := ComboBoxLote.Text;
 if EditPlanAnalise.Text <> '' then
 QBuscaPlan.ParamByName('DT_IMPORT').AsDate := FormImportacoesEfetuadas.DBGrid1.DataSource.DataSet.FieldByName('DATA').AsDateTime;
 QBuscaPlan.Open;

DBGrid1.DataSource.DataSet.First;

 while not DBGrid1.DataSource.DataSet.Eof do
 Begin

 T_RESULTADO := T_RESULTADO + DBGrid1.DataSource.DataSet.FieldByName('RESULTADO').AsCurrency;
 T_AVARIAS   := T_AVARIAS   + DBGrid1.DataSource.DataSet.FieldByName('AVARIA').AsCurrency;

 DBGrid1.DataSource.DataSet.Next;
 Application.ProcessMessages;
 End;

 LblTotalResultado.Caption :=  FormatFloat('R$ #,,,,0.00', T_RESULTADO);
 LblTotalAvarias.Caption   :=  FormatFloat('R$ #,,,,0.00', T_AVARIAS);

 DBGrid1.DataSource.DataSet.First;

 Application.ProcessMessages;

 FormLoading.Close;
 End;
end;

procedure TFormAnaliseCompraQuery.EditModeloKeyPress(Sender: TObject;
  var Key: Char);
Var
 Sit : Integer;
 T_RESULTADO, T_AVARIAS : Currency;
begin

  T_RESULTADO := 0;
  T_AVARIAS := 0;

 if key = #13 then
 Begin

 if ComboBoxSituacao.Text = 'Ativo' then
 Sit := 0
 Else
 Sit := 1;

 Application.ProcessMessages;

 QBuscaPlan.SQL.Clear;
 QBuscaPlan.SQL.Add('select * from TBPROCPLANS');
 QBuscaPlan.SQL.Add('where');
 QBuscaPlan.SQL.Add('modelo like '+QuotedStr('%'+EditModelo.Text+'%'));
 if EditPlanAnalise.Text <> '' then
 QBuscaPlan.SQL.Add('and IMPORT_PLANILHA = '''+EditPlanAnalise.Text+'''');
 if EditPlanAnalise.Text <> '' then
 QBuscaPlan.SQL.Add('AND IMPORT_DATA = :DT_IMPORT');
 if CheckBox1.Checked = true then
 QBuscaPlan.SQL.Add('and DATA>=:DtIni');
 if CheckBox1.Checked = true then
 QBuscaPlan.SQL.Add('and DATA<=:DtFim');
 QBuscaPlan.SQL.Add('and FORNECEDOR like'+QuotedStr('%'+ComboBoxFornecedor.Text+'%'));
 if EditKM.Text <> '' then
 QBuscaPlan.SQL.Add('and KM <= :KM');
 if EditMargem.Text <> '' then
 QBuscaPlan.SQL.Add('and MG >=:Margem');
 if ComboBoxCategoria.Text <> '' then
 QBuscaPlan.SQL.Add('and CATEGORIA=:CAT');
 if ComboBoxSituacao.Text <> '' then
 QBuscaPlan.SQL.Add('and SITUACAO = :S');
 if ComboBoxLote.Text <> '' then
 QBuscaPlan.SQL.Add('and LOTE=:LT');
 if EditPlaca.Text <> '' then
 QBuscaPlan.SQL.Add('and PLACA=:PL');
 QBuscaPlan.SQL.Add('order by MODELO');
 if EditKM.Text <> '' then
 QBuscaPlan.ParamByName('KM').AsFloat := StrToFloat(EditKM.Text);
 if CheckBox1.Checked = true then
 QBuscaPlan.ParamByName('DtIni').AsDate := DateTimeInicial.Date;
 if CheckBox1.Checked = true then
 QBuscaPlan.ParamByName('DtFim').AsDate := DateTimeFinal.Date;
 if EditMargem.Text <> '' then
 QBuscaPlan.ParamByName('Margem').AsFloat := StrToFloat(EditMargem.Text);
 if ComboBoxCategoria.Text <> '' then
 QBuscaPlan.ParamByName('CAT').Text := ComboBoxCategoria.Text;
 if ComboBoxSituacao.Text <> '' then
 QBuscaPlan.ParamByName('S').AsInteger := Sit;
 if ComboBoxLote.Text <> '' then
 QBuscaPlan.ParamByName('LT').Text := ComboBoxLote.Text;
 if EditPlanAnalise.Text <> '' then
 QBuscaPlan.ParamByName('DT_IMPORT').AsDate := FormImportacoesEfetuadas.DBGrid1.DataSource.DataSet.FieldByName('DATA').AsDateTime;
 if EditPlaca.Text <> '' then
 QBuscaPlan.ParamByName('PL').Text := EditPlaca.Text;
 QBuscaPlan.Open;
 {
 if QBuscaPlan.FieldByName('REF_FIPE2').Text <> ' ' then
 Begin
   DBGrid1.Columns[10].Title.Caption := 'FIPE ' + QBuscaPlan.FieldByName('REF_FIPE2').Text;
 End;

 if QBuscaPlan.FieldByName('REF_FIPE3').Text <> ' ' then
 Begin
   DBGrid1.Columns[11].Title.Caption := 'FIPE ' + QBuscaPlan.FieldByName('REF_FIPE3').Text;
 End;
 }
DBGrid1.DataSource.DataSet.First;

 while not DBGrid1.DataSource.DataSet.Eof do
 Begin

 T_RESULTADO := T_RESULTADO + DBGrid1.DataSource.DataSet.FieldByName('RESULTADO').AsCurrency;
 T_AVARIAS   := T_AVARIAS   + DBGrid1.DataSource.DataSet.FieldByName('AVARIA').AsCurrency;

 DBGrid1.DataSource.DataSet.Next;
 Application.ProcessMessages;
 End;

 LblTotalResultado.Caption :=  FormatFloat('R$ #,,,,0.00', T_RESULTADO);
 LblTotalAvarias.Caption   :=  FormatFloat('R$ #,,,,0.00', T_AVARIAS);

 DBGrid1.DataSource.DataSet.First;

 Application.ProcessMessages;

 FormLoading.Close;
 End;
end;

procedure TFormAnaliseCompraQuery.EditPlacaKeyPress(Sender: TObject;
  var Key: Char);
Var
 Sit : Integer;
 T_RESULTADO, T_AVARIAS : Currency;
begin

  T_RESULTADO := 0;
  T_AVARIAS := 0;

 if key = #13 then
 Begin

 if ComboBoxSituacao.Text = 'Ativo' then
 Sit := 0
 Else
 Sit := 1;

 Application.ProcessMessages;

 QBuscaPlan.SQL.Clear;
 QBuscaPlan.SQL.Add('select * from TBPROCPLANS');
 QBuscaPlan.SQL.Add('where');
 QBuscaPlan.SQL.Add('modelo like '+QuotedStr('%'+EditModelo.Text+'%'));
 if EditPlanAnalise.Text <> '' then
 QBuscaPlan.SQL.Add('and IMPORT_PLANILHA = '''+EditPlanAnalise.Text+'''');
 if EditPlanAnalise.Text <> '' then
 QBuscaPlan.SQL.Add('AND IMPORT_DATA = :DT_IMPORT');
 if CheckBox1.Checked = true then
 QBuscaPlan.SQL.Add('and DATA>=:DtIni');
 if CheckBox1.Checked = true then
 QBuscaPlan.SQL.Add('and DATA<=:DtFim');
 QBuscaPlan.SQL.Add('and FORNECEDOR like'+QuotedStr('%'+ComboBoxFornecedor.Text+'%'));
 if EditKM.Text <> '' then
 QBuscaPlan.SQL.Add('and KM <= :KM');
 if EditMargem.Text <> '' then
 QBuscaPlan.SQL.Add('and MG >=:Margem');
 if ComboBoxCategoria.Text <> '' then
 QBuscaPlan.SQL.Add('and CATEGORIA=:CAT');
 if ComboBoxSituacao.Text <> '' then
 QBuscaPlan.SQL.Add('and SITUACAO = :S');
 if ComboBoxLote.Text <> '' then
 QBuscaPlan.SQL.Add('and LOTE=:LT');
 if EditPlaca.Text <> '' then
 QBuscaPlan.SQL.Add('and PLACA=:PL');
 QBuscaPlan.SQL.Add('order by MODELO');
 if EditKM.Text <> '' then
 QBuscaPlan.ParamByName('KM').AsFloat := StrToFloat(EditKM.Text);
 if CheckBox1.Checked = true then
 QBuscaPlan.ParamByName('DtIni').AsDate := DateTimeInicial.Date;
 if CheckBox1.Checked = true then
 QBuscaPlan.ParamByName('DtFim').AsDate := DateTimeFinal.Date;
 if EditMargem.Text <> '' then
 QBuscaPlan.ParamByName('Margem').AsFloat := StrToFloat(EditMargem.Text);
 if ComboBoxCategoria.Text <> '' then
 QBuscaPlan.ParamByName('CAT').Text := ComboBoxCategoria.Text;
 if ComboBoxSituacao.Text <> '' then
 QBuscaPlan.ParamByName('S').AsInteger := Sit;
 if ComboBoxLote.Text <> '' then
 QBuscaPlan.ParamByName('LT').Text := ComboBoxLote.Text;
 if EditPlanAnalise.Text <> '' then
 QBuscaPlan.ParamByName('DT_IMPORT').AsDate := FormImportacoesEfetuadas.DBGrid1.DataSource.DataSet.FieldByName('DATA').AsDateTime;
 if EditPlaca.Text <> '' then
 QBuscaPlan.ParamByName('PL').Text := EditPlaca.Text;
 QBuscaPlan.Open;
 {
 if QBuscaPlan.FieldByName('REF_FIPE2').Text <> ' ' then
 Begin
   DBGrid1.Columns[10].Title.Caption := 'FIPE ' + QBuscaPlan.FieldByName('REF_FIPE2').Text;
 End;

 if QBuscaPlan.FieldByName('REF_FIPE3').Text <> ' ' then
 Begin
   DBGrid1.Columns[11].Title.Caption := 'FIPE ' + QBuscaPlan.FieldByName('REF_FIPE3').Text;
 End;
 }
DBGrid1.DataSource.DataSet.First;

 while not DBGrid1.DataSource.DataSet.Eof do
 Begin

 T_RESULTADO := T_RESULTADO + DBGrid1.DataSource.DataSet.FieldByName('RESULTADO').AsCurrency;
 T_AVARIAS   := T_AVARIAS   + DBGrid1.DataSource.DataSet.FieldByName('AVARIA').AsCurrency;

 DBGrid1.DataSource.DataSet.Next;
 Application.ProcessMessages;
 End;

 LblTotalResultado.Caption :=  FormatFloat('R$ #,,,,0.00', T_RESULTADO);
 LblTotalAvarias.Caption   :=  FormatFloat('R$ #,,,,0.00', T_AVARIAS);

 DBGrid1.DataSource.DataSet.First;

 Application.ProcessMessages;

 FormLoading.Close;
 End;
end;

procedure TFormAnaliseCompraQuery.EnviarparaVistoriaemcriao1Click(
  Sender: TObject);
begin

 if MessageDlg('Deseja enviar para todos vistoriadores?', mtInformation, [mbno, mbyes] , 0) = mryes then
 Begin

 End
 Else
 Begin
   FormVistoriadores.Position := poScreenCenter;
   FormVistoriadores.ShowModal;
 End;
end;

function GetNomeComputador : String;
const
  Buff_Size = MAX_COMPUTERNAME_LENGTH + 1;
var
  lpBuffer : PChar;
  nSize : DWord;
begin
  nSize := Buff_Size;
  lpBuffer := StrAlloc(Buff_Size);
  GetComputerName(lpBuffer, nSize);
  Result := String(lpBuffer);
  StrDispose(lpBuffer);
end;


procedure TFormAnaliseCompraQuery.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  i, f:integer;
begin
  {inherited;
  for i:=0 To DBGrid1.DataSource.DataSet.FieldCount-1 do
  begin
    f:= i;
    while f <= DBGrid1.DataSource.DataSet.FieldCount-1 do
    begin
      //if i = DBGrid1.Fields[f].FieldNo-1 then
      ShowMessage('Index: '+IntToStr(DBGrid1.DataSource.DataSet.Fields[f].Index)+ ' Coluna: ' + DBGrid1.DataSource.DataSet.Fields[f].FieldName);
        //DBGrid1.Fields[f].Index:=DBGrid1.Fields[f].FieldNo-1;
      f:= f + 1;
    end;
  end; }
end;

procedure TFormAnaliseCompraQuery.FormShow(Sender: TObject);
Var
 Dia, Mes, Ano : Integer;
 DataStr: String;
 DataDate: TDate;
begin

 Dia := DayOf(now);
 Mes := MonthOf(NOW);
 Ano := YearOf(NOW);

 DataStr := IntToStr(Dia) + '/' + IntToStr(Mes) + '/' + IntToStr(Ano);

 DataDate := StrToDate(DataStr);

 DateTimeInicial.Date := DataDate;
 DateTimeFinal.Date   := DataDate;

 //ShowMessage(GetNomeComputador);

 Ascendente := false;

 ComboBoxSituacao.Text := 'Ativo';

 // Funcao de carregamento do fornecedor
 ComboBoxFornecedor.Clear;
 QAtualizaInfo.SQL.Clear;
 QAtualizaInfo.SQL.Add('select distinct FORNECEDOR from TBPROCPLANS where FORNECEDOR is not null order by FORNECEDOR');
 QAtualizaInfo.Open;
 QAtualizaInfo.First;
 while not QAtualizaInfo.Eof do
 Begin
   ComboBoxFornecedor.Items.Add(QAtualizaInfo.FieldByName('FORNECEDOR').Text);
   QAtualizaInfo.Next;
 End;


 CarregaComboFipes( ComboBoxRefFipe );

end;

procedure TFormAnaliseCompraQuery.ImageBuscaRefClick(Sender: TObject);
begin

 if FormRefFipes = nil then
 Begin
   FormRefFipes := TFormRefFipes.Create(self);
 End;

 FormRefFipes.qBuscaRef.Refresh;

 FormRefFipes.Position := poScreenCenter;
 FormRefFipes.ShowModal;

end;

procedure TFormAnaliseCompraQuery.Inativar1Click(Sender: TObject);
var
contador: Integer;
begin

 With DBGrid1 do
  Begin
    for contador:= 0 to Pred(SelectedRows.Count) do
    Begin
       Datasource.Dataset.Bookmark:= SelectedRows[contador]; //O comando SelectedRows irá indicar qual o registro atual no DataSet

     QAtualizaInfo.SQL.Clear;
     QAtualizaInfo.SQL.Add('update TBPROCPLANS set SITUACAO = :S where PLACA=:PL');
     QAtualizaInfo.ParamByName('PL').Text := DBGrid1.DataSource.DataSet.FieldByName('PLACA').Text;
     QAtualizaInfo.ParamByName('S').AsInteger := 1;
     QAtualizaInfo.Execute;

    end;
    btnPesquisar.Click();
  End;

end;
procedure TFormAnaliseCompraQuery.OcultarColuna1Click(Sender: TObject);
Var
 i:integer;
Begin

  i:= DBGrid1.Columns.Items[DBGrid1.selectedindex].Index;

  DBGrid1.Columns.Items[i].Visible := false;

  FormColunasOcultas.QColunas.SQL.Clear;
  FormColunasOcultas.QColunas.SQL.Add('insert into TBCOLUNASOCULTAS (id, nome, HOSTNAME) values (:id, :nome, :HOST)');
  FormColunasOcultas.QColunas.ParamByName('id').AsInteger := i;
  FormColunasOcultas.QColunas.ParamByName('nome').Text := DBGrid1.SelectedField.FieldName;
  FormColunasOcultas.QColunas.ParamByName('HOST').Text := FormLoginSavauto.EditUsuario.Text;
  FormColunasOcultas.QColunas.ExecSQL;

end;

procedure TFormAnaliseCompraQuery.QBuscaPlanAVARIAChange(Sender: TField);
begin

  if DBGrid1.DataSource.DataSet.FieldByName('AVARIA').AsCurrency >= 0 then
  BEGIN

   if DBGrid1.DataSource.DataSet.FieldByName('CATEGORIA').Text = '' then
   Begin
     DBGrid1.DataSource.DataSet.FieldByName('RESULTADO').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('G_ZERO').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('MG').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('AVARIA').AsCurrency;
     DBGrid1.DataSource.DataSet.FieldByName('MIN_RESULTADO').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('RESULTADO').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN').AsCurrency;
     DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN_FIPE').AsCurrency :=  DBGrid1.DataSource.DataSet.FieldByName('VLR_FIPE').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN').AsCurrency;
   End;
    if DBGrid1.DataSource.DataSet.FieldByName('CATEGORIA').Text = 'C' then
   Begin
     if DBGrid1.DataSource.DataSet.FieldByName('G_ZERO').AsCurrency > 0 then
     DBGrid1.DataSource.DataSet.FieldByName('RESULTADO').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('G_ZERO').AsCurrency -
                                                                       DBGrid1.DataSource.DataSet.FieldByName('MG').AsCurrency -
                                                                       DBGrid1.DataSource.DataSet.FieldByName('AVARIA').AsCurrency;
     DBGrid1.DataSource.DataSet.FieldByName('MIN_RESULTADO').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('RESULTADO').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN').AsCurrency;
     DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN_FIPE').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('VLR_FIPE').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN').AsCurrency;
   End;
    if DBGrid1.DataSource.DataSet.FieldByName('CATEGORIA').Text = 'D' then
   Begin
     if DBGrid1.DataSource.DataSet.FieldByName('G_ZERO').AsCurrency > 0 then
     DBGrid1.DataSource.DataSet.FieldByName('RESULTADO').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('G_ZERO').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('MG').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('AVARIA').AsCurrency;
     DBGrid1.DataSource.DataSet.FieldByName('MIN_RESULTADO').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('RESULTADO').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN').AsCurrency;
     DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN_FIPE').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('VLR_FIPE').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN').AsCurrency;
   End;
   if DBGrid1.DataSource.DataSet.FieldByName('CATEGORIA').Text = 'A' then
   Begin
     if DBGrid1.DataSource.DataSet.FieldByName('G_ZERO').AsCurrency > 0 then
     DBGrid1.DataSource.DataSet.FieldByName('RESULTADO').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('G_ZERO').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('MG').AsCurrency;
     DBGrid1.DataSource.DataSet.FieldByName('MIN_RESULTADO').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('RESULTADO').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN').AsCurrency;
     DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN_FIPE').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('VLR_FIPE').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN').AsCurrency;
   End;
   if DBGrid1.DataSource.DataSet.FieldByName('CATEGORIA').Text = 'B' then
   Begin
     if DBGrid1.DataSource.DataSet.FieldByName('G_ZERO').AsCurrency > 0 then
     DBGrid1.DataSource.DataSet.FieldByName('RESULTADO').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('G_ZERO').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('MG').AsCurrency;
     DBGrid1.DataSource.DataSet.FieldByName('MIN_RESULTADO').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('RESULTADO').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN').AsCurrency;
     DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN_FIPE').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('VLR_FIPE').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN').AsCurrency;
   End;

END;
end;

procedure TFormAnaliseCompraQuery.QBuscaPlanCATEGORIAChange(Sender: TField);
begin


   if DBGrid1.DataSource.DataSet.FieldByName('CATEGORIA').Text = '' then
   Begin
     DBGrid1.DataSource.DataSet.FieldByName('RESULTADO').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('G_ZERO').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('MG').AsCurrency;
     DBGrid1.DataSource.DataSet.FieldByName('MIN_RESULTADO').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('RESULTADO').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN').AsCurrency;
     DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN_FIPE').AsCurrency :=  DBGrid1.DataSource.DataSet.FieldByName('VLR_FIPE').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN').AsCurrency;
   End;
    if DBGrid1.DataSource.DataSet.FieldByName('CATEGORIA').Text = 'C' then
   Begin
     if DBGrid1.DataSource.DataSet.FieldByName('G_ZERO').AsCurrency > 0 then
     DBGrid1.DataSource.DataSet.FieldByName('RESULTADO').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('G_ZERO').AsCurrency -
                                                                       DBGrid1.DataSource.DataSet.FieldByName('MG').AsCurrency -
                                                                       DBGrid1.DataSource.DataSet.FieldByName('AVARIA').AsCurrency;
     DBGrid1.DataSource.DataSet.FieldByName('MIN_RESULTADO').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('RESULTADO').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN').AsCurrency;
     DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN_FIPE').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('VLR_FIPE').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN').AsCurrency;
   End;
    if DBGrid1.DataSource.DataSet.FieldByName('CATEGORIA').Text = 'D' then
   Begin
     if DBGrid1.DataSource.DataSet.FieldByName('G_ZERO').AsCurrency > 0 then
     DBGrid1.DataSource.DataSet.FieldByName('RESULTADO').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('G_ZERO').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('MG').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('AVARIA').AsCurrency;
     DBGrid1.DataSource.DataSet.FieldByName('MIN_RESULTADO').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('RESULTADO').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN').AsCurrency;
     DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN_FIPE').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('VLR_FIPE').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN').AsCurrency;
   End;
   if DBGrid1.DataSource.DataSet.FieldByName('CATEGORIA').Text = 'A' then
   Begin
     if DBGrid1.DataSource.DataSet.FieldByName('G_ZERO').AsCurrency > 0 then
     DBGrid1.DataSource.DataSet.FieldByName('RESULTADO').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('G_ZERO').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('MG').AsCurrency;
     DBGrid1.DataSource.DataSet.FieldByName('MIN_RESULTADO').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('RESULTADO').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN').AsCurrency;
     DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN_FIPE').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('VLR_FIPE').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN').AsCurrency;
   End;
   if DBGrid1.DataSource.DataSet.FieldByName('CATEGORIA').Text = 'B' then
   Begin
     if DBGrid1.DataSource.DataSet.FieldByName('G_ZERO').AsCurrency > 0 then
     DBGrid1.DataSource.DataSet.FieldByName('RESULTADO').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('G_ZERO').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('MG').AsCurrency;
     DBGrid1.DataSource.DataSet.FieldByName('MIN_RESULTADO').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('RESULTADO').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN').AsCurrency;
     DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN_FIPE').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('VLR_FIPE').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN').AsCurrency;
   End;

end;

procedure TFormAnaliseCompraQuery.QBuscaPlanG_ZEROChange(Sender: TField);
begin
 if DBGrid1.SelectedField.FieldName = 'G_ZERO' then
 Begin
   DBGrid1.DataSource.DataSet.FieldByName('RESULTADO').AsCurrency :=
   DBGrid1.DataSource.DataSet.FieldByName('G_ZERO').AsCurrency -
   DBGrid1.DataSource.DataSet.FieldByName('AVARIA').AsCurrency;

   if DBGrid1.DataSource.DataSet.FieldByName('CATEGORIA').Text = '' then
   Begin
     DBGrid1.DataSource.DataSet.FieldByName('RESULTADO').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('G_ZERO').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('MG').AsCurrency;
     DBGrid1.DataSource.DataSet.FieldByName('MIN_RESULTADO').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('RESULTADO').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN').AsCurrency;
     DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN_FIPE').AsCurrency :=  DBGrid1.DataSource.DataSet.FieldByName('VLR_FIPE').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN').AsCurrency;
   End;
    if DBGrid1.DataSource.DataSet.FieldByName('CATEGORIA').Text = 'C' then
   Begin
     if DBGrid1.DataSource.DataSet.FieldByName('G_ZERO').AsCurrency > 0 then
     DBGrid1.DataSource.DataSet.FieldByName('RESULTADO').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('G_ZERO').AsCurrency -
                                                                       DBGrid1.DataSource.DataSet.FieldByName('MG').AsCurrency -
                                                                       DBGrid1.DataSource.DataSet.FieldByName('AVARIA').AsCurrency;
     DBGrid1.DataSource.DataSet.FieldByName('MIN_RESULTADO').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('RESULTADO').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN').AsCurrency;
     DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN_FIPE').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('VLR_FIPE').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN').AsCurrency;
   End;
    if DBGrid1.DataSource.DataSet.FieldByName('CATEGORIA').Text = 'D' then
   Begin
     if DBGrid1.DataSource.DataSet.FieldByName('G_ZERO').AsCurrency > 0 then
     DBGrid1.DataSource.DataSet.FieldByName('RESULTADO').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('G_ZERO').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('MG').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('AVARIA').AsCurrency;
     DBGrid1.DataSource.DataSet.FieldByName('MIN_RESULTADO').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('RESULTADO').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN').AsCurrency;
     DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN_FIPE').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('VLR_FIPE').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN').AsCurrency;
   End;
   if DBGrid1.DataSource.DataSet.FieldByName('CATEGORIA').Text = 'A' then
   Begin
     if DBGrid1.DataSource.DataSet.FieldByName('G_ZERO').AsCurrency > 0 then
     DBGrid1.DataSource.DataSet.FieldByName('RESULTADO').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('G_ZERO').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('MG').AsCurrency;
     DBGrid1.DataSource.DataSet.FieldByName('MIN_RESULTADO').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('RESULTADO').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN').AsCurrency;
     DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN_FIPE').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('VLR_FIPE').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN').AsCurrency;
   End;
   if DBGrid1.DataSource.DataSet.FieldByName('CATEGORIA').Text = 'B' then
   Begin
     if DBGrid1.DataSource.DataSet.FieldByName('G_ZERO').AsCurrency > 0 then
     DBGrid1.DataSource.DataSet.FieldByName('RESULTADO').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('G_ZERO').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('MG').AsCurrency;
     DBGrid1.DataSource.DataSet.FieldByName('MIN_RESULTADO').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('RESULTADO').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN').AsCurrency;
     DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN_FIPE').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('VLR_FIPE').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN').AsCurrency;
   End;


 End;
end;

procedure TFormAnaliseCompraQuery.QBuscaPlanMGChange(Sender: TField);
begin
 if DBGrid1.SelectedField.FieldName = 'MG' then
 Begin
   DBGrid1.DataSource.DataSet.FieldByName('RESULTADO').AsCurrency :=
   DBGrid1.DataSource.DataSet.FieldByName('G_ZERO').AsCurrency -
   DBGrid1.DataSource.DataSet.FieldByName('AVARIA').AsCurrency;

   if DBGrid1.DataSource.DataSet.FieldByName('CATEGORIA').Text = '' then
   Begin
     DBGrid1.DataSource.DataSet.FieldByName('RESULTADO').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('G_ZERO').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('MG').AsCurrency;
     DBGrid1.DataSource.DataSet.FieldByName('MIN_RESULTADO').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('RESULTADO').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN').AsCurrency;
     DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN_FIPE').AsCurrency :=  DBGrid1.DataSource.DataSet.FieldByName('VLR_FIPE').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN').AsCurrency;
   End;
    if DBGrid1.DataSource.DataSet.FieldByName('CATEGORIA').Text = 'C' then
   Begin
     if DBGrid1.DataSource.DataSet.FieldByName('G_ZERO').AsCurrency > 0 then
     DBGrid1.DataSource.DataSet.FieldByName('RESULTADO').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('G_ZERO').AsCurrency -
     DBGrid1.DataSource.DataSet.FieldByName('MG').AsCurrency -
     DBGrid1.DataSource.DataSet.FieldByName('AVARIA').AsCurrency;
     DBGrid1.DataSource.DataSet.FieldByName('MIN_RESULTADO').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('RESULTADO').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN').AsCurrency;
     DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN_FIPE').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('VLR_FIPE').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN').AsCurrency;
   End;
    if DBGrid1.DataSource.DataSet.FieldByName('CATEGORIA').Text = 'D' then
   Begin
     if DBGrid1.DataSource.DataSet.FieldByName('G_ZERO').AsCurrency > 0 then
     DBGrid1.DataSource.DataSet.FieldByName('RESULTADO').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('G_ZERO').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('MG').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('AVARIA').AsCurrency;
     DBGrid1.DataSource.DataSet.FieldByName('MIN_RESULTADO').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('RESULTADO').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN').AsCurrency;
     DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN_FIPE').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('VLR_FIPE').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN').AsCurrency;
   End;
   if DBGrid1.DataSource.DataSet.FieldByName('CATEGORIA').Text = 'A' then
   Begin
     if DBGrid1.DataSource.DataSet.FieldByName('G_ZERO').AsCurrency > 0 then
     DBGrid1.DataSource.DataSet.FieldByName('RESULTADO').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('G_ZERO').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('MG').AsCurrency;
     DBGrid1.DataSource.DataSet.FieldByName('MIN_RESULTADO').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('RESULTADO').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN').AsCurrency;
     DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN_FIPE').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('VLR_FIPE').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN').AsCurrency;
   End;
   if DBGrid1.DataSource.DataSet.FieldByName('CATEGORIA').Text = 'B' then
   Begin
     if DBGrid1.DataSource.DataSet.FieldByName('G_ZERO').AsCurrency > 0 then
     DBGrid1.DataSource.DataSet.FieldByName('RESULTADO').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('G_ZERO').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('MG').AsCurrency;
     DBGrid1.DataSource.DataSet.FieldByName('MIN_RESULTADO').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('RESULTADO').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN').AsCurrency;
     DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN_FIPE').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('VLR_FIPE').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN').AsCurrency;
   End;


 End;
end;

procedure TFormAnaliseCompraQuery.QBuscaPlanVLR_FIPEChange(Sender: TField);
begin

 if QBuscaPlan.FieldByName('VLR_FIPE').AsCurrency > 0 then
 Begin

     DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN_FIPE').AsCurrency :=  DBGrid1.DataSource.DataSet.FieldByName('VLR_FIPE').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN').AsCurrency;

 End;

end;

procedure TFormAnaliseCompraQuery.QBuscaPlanVLR_MINChange(Sender: TField);
begin

  if DBGrid1.SelectedField.FieldName = 'VLR_MIN' then
 Begin

     DBGrid1.DataSource.DataSet.FieldByName('RESULTADO').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('G_ZERO').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('MG').AsCurrency;
     DBGrid1.DataSource.DataSet.FieldByName('MIN_RESULTADO').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('RESULTADO').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN').AsCurrency;
     DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN_FIPE').AsCurrency :=  DBGrid1.DataSource.DataSet.FieldByName('VLR_FIPE').AsCurrency - DBGrid1.DataSource.DataSet.FieldByName('VLR_MIN').AsCurrency;

 End;

end;

procedure TFormAnaliseCompraQuery.SpeedButton1Click(Sender: TObject);
begin

 EditPlanAnalise.Text := '';

end;

procedure TFormAnaliseCompraQuery.SpeedButton2Click(Sender: TObject);
begin

 MessageDlg('Menu indisponível', mtInformation, [mbok] , 0);

end;

procedure TFormAnaliseCompraQuery.btnPesquisarClick(Sender: TObject);
Var
 Sit, Qtd : Integer;
 T_RESULTADO, T_AVARIAS : Currency;
begin

 T_RESULTADO := 0;
 T_AVARIAS := 0;

 Qtd := 0;


 if ComboBoxSituacao.Text = 'Ativo' then
 Sit := 0
 Else
 Sit := 1;

 if FormImportacoesEfetuadas = nil then
 Begin
   FormImportacoesEfetuadas := TFormImportacoesEfetuadas.Create(self);
 End;

 if FormLoading = nil then
 Begin
   FormLoading := TFormLoading.Create(self);
 End;

 Application.ProcessMessages;

 QBuscaPlan.SQL.Clear;
 QBuscaPlan.SQL.Add('select * from TBPROCPLANS');
 QBuscaPlan.SQL.Add('where');
 QBuscaPlan.SQL.Add('modelo like '+QuotedStr('%'+EditModelo.Text+'%'));
 if EditPlanAnalise.Text <> '' then
 QBuscaPlan.SQL.Add('and IMPORT_PLANILHA = '''+EditPlanAnalise.Text+'''');
 if EditPlanAnalise.Text <> '' then
 QBuscaPlan.SQL.Add('AND IMPORT_DATA = :DT_IMPORT');
 if CheckBox1.Checked = true then
 QBuscaPlan.SQL.Add('and IMPORT_DATA>=:DtIni');
 if CheckBox1.Checked = true then
 QBuscaPlan.SQL.Add('and IMPORT_DATA<=:DtFim');
 QBuscaPlan.SQL.Add('and FORNECEDOR like'+QuotedStr('%'+ComboBoxFornecedor.Text+'%'));
 if EditKM.Text <> '' then
 QBuscaPlan.SQL.Add('and KM <= :KM');
 if EditMargem.Text <> '' then
 QBuscaPlan.SQL.Add('and MG >=:Margem');
 if ComboBoxCategoria.Text <> '' then
 QBuscaPlan.SQL.Add('and CATEGORIA=:CAT');
 if ComboBoxSituacao.Text <> '' then
 QBuscaPlan.SQL.Add('and SITUACAO = :S');
 if ComboBoxLote.Text <> '' then
 QBuscaPlan.SQL.Add('and LOTE=:LT');
 if EditPlaca.Text <> '' then
 QBuscaPlan.SQL.Add('and PLACA=:PL');
 QBuscaPlan.SQL.Add('order by MODELO');
 if EditKM.Text <> '' then
 QBuscaPlan.ParamByName('KM').AsFloat := StrToFloat(EditKM.Text);
 if CheckBox1.Checked = true then
 QBuscaPlan.ParamByName('DtIni').AsDate := DateTimeInicial.Date;
 if CheckBox1.Checked = true then
 QBuscaPlan.ParamByName('DtFim').AsDate := DateTimeFinal.Date;
 if EditMargem.Text <> '' then
 QBuscaPlan.ParamByName('Margem').AsFloat := StrToFloat(EditMargem.Text);
 if ComboBoxCategoria.Text <> '' then
 QBuscaPlan.ParamByName('CAT').Text := ComboBoxCategoria.Text;
 if ComboBoxSituacao.Text <> '' then
 QBuscaPlan.ParamByName('S').AsInteger := Sit;
 if ComboBoxLote.Text <> '' then
 QBuscaPlan.ParamByName('LT').Text := ComboBoxLote.Text;
 if EditPlanAnalise.Text <> '' then
 QBuscaPlan.ParamByName('DT_IMPORT').AsDate := FormImportacoesEfetuadas.DBGrid1.DataSource.DataSet.FieldByName('DATA').AsDateTime;
 if EditPlaca.Text <> '' then
 QBuscaPlan.ParamByName('PL').Text := EditPlaca.Text;
 QBuscaPlan.Open;

 // atualiza grid ref2 e ref3
 { qBuscaRefFipe.SQL.Clear;
 qBuscaRefFipe.SQL.Add('select ref2, ref3 from tbfiperef');
 qBuscaRefFipe.Open; }

 if QBuscaPlan.FieldByName('REF_FIPE2').Text <> ' ' then
 Begin
   //DBGrid1.Columns[DBGrid1.DataSource.DataSet.FieldByName('REF_FIPE2').Index].Title.Caption := 'FIPE ' + QBuscaPlan.FieldByName('REF_FIPE2').Text;
   //DBGrid1.Columns[10].Title.Caption := 'FIPE ' + QBuscaPlan.FieldByName('REF_FIPE2').Text;
 End;

 if QBuscaPlan.FieldByName('REF_FIPE3').Text <> ' ' then
 Begin
   //DBGrid1.Columns[11].Title.Caption := 'FIPE ' + QBuscaPlan.FieldByName('REF_FIPE3').Text;
 End;

 Application.ProcessMessages;

 DBGrid1.DataSource.DataSet.First;

 while not DBGrid1.DataSource.DataSet.Eof do
 Begin

 T_RESULTADO := T_RESULTADO + DBGrid1.DataSource.DataSet.FieldByName('RESULTADO').AsCurrency;
 T_AVARIAS   := T_AVARIAS   + DBGrid1.DataSource.DataSet.FieldByName('AVARIA').AsCurrency;

 DBGrid1.DataSource.DataSet.Next;

 Qtd := Qtd +1;

 Application.ProcessMessages;
 End;

 LblTotalResultado.Caption :=  FormatFloat('R$ #,,,,0.00', T_RESULTADO);
 LblTotalAvarias.Caption   :=  FormatFloat('R$ #,,,,0.00', T_AVARIAS);

 DBGrid1.DataSource.DataSet.First;

 LblQtd.Caption := IntToStr(Qtd);
 LblQtd.Refresh;

 FormLoading.Close;

end;

end
.
