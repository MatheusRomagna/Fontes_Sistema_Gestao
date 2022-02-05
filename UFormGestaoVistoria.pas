unit UFormGestaoVistoria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.XPMan,
  Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uDWConstsData,
  uRESTDWPoolerDB, Vcl.StdCtrls, Vcl.ComCtrls, System.Rtti,
  System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope,
  Vcl.Imaging.pngimage, MemDS, DBAccess, Uni, Vcl.Menus, System.Win.ComObj,
  Vcl.Mask, System.DateUtils ;

type
  TFormGestaoVistoria = class(TForm)
    XPManifest1: TXPManifest;
    PenelPrincipal: TPanel;
    PenelTopo: TPanel;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    DataSource1: TDataSource;
    btnBuscar: TSpeedButton;
    Label3: TLabel;
    ComboFornecedores: TComboBox;
    Label4: TLabel;
    EditPlaca: TEdit;
    Label5: TLabel;
    ComboVistoriador: TComboBox;
    qBuscaVistorias: TUniQuery;
    qBuscaVistoriasid: TIntegerField;
    qBuscaVistoriasfornecedor: TStringField;
    qBuscaVistoriasplaca: TStringField;
    qBuscaVistoriasano_modelo: TStringField;
    qBuscaVistoriasmodelo: TStringField;
    qBuscaVistoriasportas: TIntegerField;
    qBuscaVistoriasKM: TFloatField;
    qBuscaVistoriascor: TStringField;
    qBuscaVistoriasopcionais: TStringField;
    qBuscaVistoriascod_fipe: TStringField;
    qBuscaVistoriasvlr_fipe: TFloatField;
    qBuscaVistoriasvlr_tot_avaria: TFloatField;
    qBuscaVistoriasCategoria: TStringField;
    qBuscaVistoriasDataVistoria: TDateTimeField;
    qBuscaVistoriasvistoria_dt_envio: TDateTimeField;
    qBuscaVistoriasusuario: TStringField;
    qBuscaVistoriasvistoria_dt_finalizado: TDateTimeField;
    MainMenu1: TMainMenu;
    ConfigurarPermisses1: TMenuItem;
    btnGeraExecl: TButton;
    DtInicial: TMaskEdit;
    DtFinal: TMaskEdit;
    qBuscaVistoriasid_fornecedor: TIntegerField;
    qBuscaVistoriasano: TStringField;
    qBuscaVistoriastipo_motor: TStringField;
    qBuscaVistoriasid_usuario: TIntegerField;
    qBuscaVistoriasid_empresa: TIntegerField;
    qBuscaVistoriasempresa: TStringField;
    qBuscaVistoriascnpj_emp: TStringField;
    qBuscaVistoriasEnvio: TIntegerField;
    qBuscaVistoriasDt_Termino: TDateTimeField;
    qBuscaVistoriasobs: TStringField;
    qBuscaVistoriascep: TStringField;
    qBuscaVistoriascidade: TStringField;
    qBuscaVistoriasuf: TStringField;
    qBuscaVistoriasbairro: TStringField;
    qBuscaVistoriaslogradouro: TStringField;
    qBuscaVistoriasAgColeta: TIntegerField;
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure img_vistoriadoresClick(Sender: TObject);
    procedure ConfigurarPermisses1Click(Sender: TObject);
    procedure btnGeraExeclClick(Sender: TObject);
  private
    { Private declarations }
  public
  Ascendente : Boolean;
    { Public declarations }
  end;

var
  FormGestaoVistoria: TFormGestaoVistoria;

implementation

{$R *.dfm}

uses UDataModuleConexao, UFormAnaliseCompra, UFormAnaliseCompraQuery,
  UFormAnaliseComprasTabela, UFormAplicaMargem, UFormAtualizaTabelaFipe,
  UFormAtuHistFIPE, UFormColunasOcultas, UFormConcFipeModelo,
  UFormDownloadNovaVersao, UFormExcelCompras, UFormHistFIPE, UFormImagem,
  UFormImportacoesEfetuadas, UFormLoading, UFormNovoProcessamento,
  UFormPadroesPlanilhas, UFormPrincipal, UFormProcPlanAcelero,
  UFormProcPlanFinal, UFormUltimasAtualizacoes, UFormWebBrowse,
  UFormCadVistoriadores, UDataModuleRESTDWvistoria, UDMRestDataWareDB,
  UFormNovoVistoriador, UFormVistoriadores, UFormVistoriasDetalhes, Loading,
  UFormAvarias, UFormLoadingOpaco, UforTestesDiversos, UDataModuleBancoVistoria,
  UFormAtuTabFIpe, UFormAvaliarAvaliacao, UFormConsutaPlacaAvaliacao,
  UFormDetalhesAvaliacao, UFormGestaoAvaliacoes, UFormHistoricoAvaliacoes,
  UFormLoginSavauto, UFormLotesArval, UFormPermissoesCarga, UnitLogin,
  FMX.UFormGraficosAtendimento, UDMPermissoes, UFormAgendamento,
  UFormAlteraFipeDePaxa, UFormAtendimentoMultasVeiculo, UFormAtendimentoNovo,
  UFormAtendimentos, UFormCadaNovoUsuMobile, UFormCadaUsuario,
  UFormCadaUsuariosMobile, UFormConcedePermissao, UFormCruzamentoFipes,
  UFormDadosPerfil, UFormDetalhesAtendimento, UFormInformacoes,
  UFormLiberaPermissao, UFormPerfis, UFormPesquisaFipe, UFormQuitacoesVeiculo,
  UFormSegIPVALic, UFormUsuarios;

procedure TFormGestaoVistoria.btnBuscarClick(Sender: TObject);
begin


 qBuscaVistorias.Close;

 qBuscaVistorias.SQL.Clear;
 qBuscaVistorias.SQL.Add('select * from tbVistoria');
 qBuscaVistorias.SQL.Add('where DataVistoria >=:dtini and DataVistoria <=:dtfim');

 if ComboFornecedores.Text <> '' then
 Begin
 qBuscaVistorias.SQL.Add('and fornecedor = '''+ComboFornecedores.Text+'''');
 End;
 if ComboVistoriador.Text <> '' then
 Begin
 qBuscaVistorias.SQL.Add('and usuario = '''+ComboVistoriador.Text+'''');
 End;
 if EditPlaca.Text <> '' then
 Begin
 qBuscaVistorias.SQL.Add('and placa = '''+EditPlaca.Text+'''')
 End;
 qBuscaVistorias.SQL.Add('order by DataVistoria desc');
 qBuscaVistorias.ParamByName('dtini').AsDate := StrToDate(DtInicial.Text);
 qBuscaVistorias.ParamByName('dtfim').AsDate := StrToDate(DtFinal.Text) +1;
 qBuscaVistorias.Open;

 DBGrid1.Columns[0].Width := 45;
 DBGrid1.Columns[1].Width := 90;
 DBGrid1.Columns[3].Width := 45;
 DBGrid1.Columns[12].Width := 45;
 DBGrid1.Columns[15].Width := 100;

end;

procedure TFormGestaoVistoria.btnGeraExeclClick(Sender: TObject);
var
objExcel,Sheet,Chart,s : Variant;
cTitulo : string;
i : integer;
begin

 if FormLoading = nil then
 Begin
   FormLoading := TFormLoading.Create(self);
 End;

 if MessageDlg('A exportação será aplicada apenas para as informações na tela, deseja prosseguir?', mtWarning, [mbno, mbyes] , 0) = mrYes  then
 Begin

  DBGrid1.DataSource.DataSet.First;

// Cria uma instancia para utilizar o Excel
  cTitulo := 'Vistorias';
  objExcel := CreateOleObject('Excel.Application');
  //objExcel.Visible := True;
  objExcel.Caption := cTitulo;

  objExcel.Workbooks.Add;
  objExcel.Workbooks[1].Sheets.Add;
  objExcel.Workbooks[1].WorkSheets[1].Name := cTitulo;
  Sheet := objExcel.Workbooks[1].WorkSheets[cTitulo];

  Sheet.cells[1,1] := 'ID';
  Sheet.cells[1,2] := 'FORNECEDOR';
  Sheet.cells[1,3] := 'PLACA';
  Sheet.cells[1,4] := 'ANO';
  Sheet.cells[1,5] := 'MODELO';
  Sheet.cells[1,6] := 'PORTAS';
  Sheet.cells[1,7] := 'KM';
  Sheet.cells[1,8] := 'COR';
  Sheet.cells[1,9] := 'OPCIONAIS';
  Sheet.cells[1,10] := 'COD_FIPE';
  Sheet.cells[1,11] := 'VLR FIPE';
  Sheet.cells[1,12] := 'VLR AVARIA';
  Sheet.cells[1,13] := 'CATEGORIA';
  Sheet.cells[1,14] := 'DATA';
  Sheet.cells[1,15] := 'USUARIO';

  FormLoading.LabelStatus.Caption := 'Gerando Planilha, aguarde...';
  FormLoading.Position := poScreenCenter;
  FormLoading.Show;
  Application.ProcessMessages;

  i := 2;

  while not DBGrid1.DataSource.DataSet.Eof do
  Begin

  Sheet.cells[i,1] := DBGrid1.DataSource.DataSet.FieldByName('id').AsInteger;
  Sheet.cells[i,2] := DBGrid1.DataSource.DataSet.FieldByName('fornecedor').Text;
  Sheet.cells[i,3] := DBGrid1.DataSource.DataSet.FieldByName('placa').Text;
  Sheet.cells[i,4] := DBGrid1.DataSource.DataSet.FieldByName('ano_modelo').Text;
  Sheet.cells[i,5] := DBGrid1.DataSource.DataSet.FieldByName('modelo').Text;
  Sheet.cells[i,6] := DBGrid1.DataSource.DataSet.FieldByName('portas').Text;
  Sheet.cells[i,7] := DBGrid1.DataSource.DataSet.FieldByName('KM').AsFloat;
  Sheet.cells[i,8] := DBGrid1.DataSource.DataSet.FieldByName('COR').Text;
  Sheet.cells[i,9] := DBGrid1.DataSource.DataSet.FieldByName('opcionais').Text;
  Sheet.cells[i,10] := DBGrid1.DataSource.DataSet.FieldByName('cod_fipe').text;
  Sheet.cells[i,11] := DBGrid1.DataSource.DataSet.FieldByName('vlr_fipe').AsCurrency;
  Sheet.cells[i,12] := DBGrid1.DataSource.DataSet.FieldByName('vlr_tot_avaria').AsCurrency;
  Sheet.cells[i,13] := DBGrid1.DataSource.DataSet.FieldByName('Categoria').text;
  Sheet.cells[i,14] := DBGrid1.DataSource.DataSet.FieldByName('DataVistoria').AsDateTime;
  Sheet.cells[i,15] := DBGrid1.DataSource.DataSet.FieldByName('usuario').Text;

  DBGrid1.DataSource.DataSet.Next;

  Application.ProcessMessages;

   Sheet.columns.autofit;

   I := I+1;

  end;

  FormLoading.Close;

  objExcel.Visible := True;
 End;
end;


procedure TFormGestaoVistoria.ConfigurarPermisses1Click(Sender: TObject);
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

procedure TFormGestaoVistoria.DBGrid1DblClick(Sender: TObject);
begin

 if FormVistoriaDetalhes = nil then
 Begin
   FormVistoriaDetalhes := TFormVistoriaDetalhes.Create(self);
 End;

 FormVistoriaDetalhes.WindowState := wsMaximized;

 FormVistoriaDetalhes.qBuscaDadosVistoria.Filter := 'placa='+QuotedStr(DBGrid1.DataSource.DataSet.FieldByName('placa').Text);
 FormVistoriaDetalhes.qBuscaDadosVistoria.Filtered := true;
 FormVistoriaDetalhes.qBuscaDadosVistoria.Open;

 FormVistoriaDetalhes.Tag := DBGrid1.DataSource.DataSet.FieldByName('id').AsInteger;

 FormVistoriaDetalhes.ShowModal;

end;

procedure TFormGestaoVistoria.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  If qBuscaVistoriasCategoria.Text = 'A' then
  Begin
   Dbgrid1.Canvas.Brush.Color:= $0080FF00;
   Dbgrid1.DefaultDrawDataCell(Rect, dbgrid1.columns[datacol].field, State);
  End;

  If qBuscaVistoriasCategoria.Text = 'B' then
  Begin
   Dbgrid1.Canvas.Brush.Color:= $00FF7D7D;
   //DBGrid1.Canvas.Font.Color := clBlack;
   Dbgrid1.DefaultDrawDataCell(Rect, dbgrid1.columns[datacol].field, State);
  End;

  If qBuscaVistoriasCategoria.Text = 'C' then
  Begin
   Dbgrid1.Canvas.Brush.Color:= $006CB3FF;
   Dbgrid1.DefaultDrawDataCell(Rect, dbgrid1.columns[datacol].field, State);
  End;

  If qBuscaVistoriasCategoria.Text = 'D' then
  Begin
   Dbgrid1.Canvas.Brush.Color:= $006464FF;
   //DBGrid1.Canvas.Font.Color := clBlack;
   Dbgrid1.DefaultDrawDataCell(Rect, dbgrid1.columns[datacol].field, State);
  End;

  If qBuscaVistoriasCategoria.Text = '' then
  Begin
   Dbgrid1.Canvas.Brush.Color:= $00CDCDCD;
   //DBGrid1.Canvas.Font.Color := clBlack;
   Dbgrid1.DefaultDrawDataCell(Rect, dbgrid1.columns[datacol].field, State);
  End;

end;

procedure TFormGestaoVistoria.FormShow(Sender: TObject);
Var
 i: string;
begin

 if MonthOf(NOW) < 10 then
 i := '0';

 DtInicial.Text := '01' + '/' + i + IntToStr( monthOf(NOW) ) + '/' + intToStr( YearOf(NOw) );


 DtFinal.Text := DateToStr(NOW);

 qBuscaVistorias.Active := true;

 ComboVistoriador.Text := '';

end;

procedure TFormGestaoVistoria.img_vistoriadoresClick(Sender: TObject);
begin

 if FormCadVistoriadores = nil then
 Begin
   FormCadVistoriadores := TFormCadVistoriadores.Create(self);
 End;

 FormCadVistoriadores.Position := poScreenCenter;
 FormCadVistoriadores.ShowModal;
end;

procedure TFormGestaoVistoria.SpeedButton3Click(Sender: TObject);
begin

 FormCadVistoriadores.Position := poScreenCenter;
 FormCadVistoriadores.ShowModal;

end;

end.
