unit UFormAlteraFipeDePaxa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, MemDS, DBAccess, Uni;

type
  TFormAlteraFipeDePara = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    EditCodFipe: TEdit;
    EditAno: TEdit;
    EditModeloFipe: TEdit;
    EditValorFipe: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    DBGrid1: TDBGrid;
    qBuscaFipe: TUniQuery;
    DataSource1: TDataSource;
    qAjustaFipe: TUniQuery;
    Panel2: TPanel;
    Image2: TImage;
    Image3: TImage;
    procedure Image2Click(Sender: TObject);
    procedure EditAnoKeyPress(Sender: TObject; var Key: Char);
    procedure EditModeloFipeKeyPress(Sender: TObject; var Key: Char);
    procedure Image3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAlteraFipeDePara: TFormAlteraFipeDePara;

implementation

{$R *.dfm}

uses FMX.UFormGraficosAtendimento, Loading, UDataModuleBancoVistoria,
  UDataModuleConexao, UFormAgendamento, UFormAnaliseCompra,
  UFormAnaliseCompraQuery, UFormAnaliseComprasTabela, UFormAplicaMargem,
  UFormAtendimentoMultasVeiculo, UFormAtendimentoNovo, UFormAtendimentos,
  UFormAtualizaTabelaFipe, UFormAtuHistFIPE, UFormAtuTabFIpe,
  UFormAvaliarAvaliacao, UFormAvarias, UFormCadaNovoUsuMobile, UFormCadaUsuario,
  UFormCadaUsuariosMobile, UFormCadVistoriadores, UFormColunasOcultas,
  UFormConcedePermissao, UFormConcFipeModelo, UFormConsutaPlacaAvaliacao,
  UFormCruzamentoFipes, UFormDadosPerfil, UFormDetalhesAtendimento,
  UFormDetalhesAvaliacao, UFormDownloadNovaVersao, UFormExcelCompras,
  UFormGestaoAvaliacoes, UFormGestaoVistoria, UFormHistFIPE,
  UFormHistoricoAvaliacoes, UFormImagem, UFormImportacoesEfetuadas,
  UFormInformacoes, UFormLoading, UFormLoadingOpaco, UFormLoginSavauto,
  UFormLotesArval, UFormNovoProcessamento, UFormNovoVistoriador,
  UFormPadroesPlanilhas, UFormPerfis, UFormPermissoesCarga, UFormPesquisaFipe,
  UFormPrincipal, UFormProcPlanAcelero, UFormProcPlanFinal,
  UFormQuitacoesVeiculo, UFormSegIPVALic, UFormUltimasAtualizacoes,
  UFormUsuarios, UFormVistoriadores, UFormVistoriasDetalhes, UFormWebBrowse,
  UforTestesDiversos, UnitLogin;

procedure TFormAlteraFipeDePara.EditAnoKeyPress(Sender: TObject; var Key: Char);
begin

 if key = #13 then
 Begin

 if EditAno.Text <> '' then
 Begin
    if EditModeloFipe.Text <> '' then
    Begin
     qBuscaFipe.SQL.Clear;
     qBuscaFipe.SQL.Add('select COD_FIPE, UPPER(modelo) as MODELO, "'+'ANO'+EditAno.Text+'" as FIPE');
     qBuscaFipe.SQL.Add('from TBFIPE where UPPER(modelo) like '+QuotedStr('%'+UpperCase(EditModeloFipe.Text)+'%')+' and');
     qBuscaFipe.SQL.Add(' "'+'ANO'+EditAno.Text+'" > 0 order by marca, modelo');
     qBuscaFipe.open;

     DBGrid1.Columns[0].Width := 100;
     DBGrid1.Columns[1].Width := 350;
     DBGrid1.Columns[2].Width := 150;

     TNumericField(qBuscaFipe.FieldByName('FIPE')).DisplayFormat := ',0.00;-,0.00';
    End;
 End;

 End;

end;

procedure TFormAlteraFipeDePara.EditModeloFipeKeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
 Begin

 if EditAno.Text <> '' then
 Begin
    if EditModeloFipe.Text <> '' then
    Begin
     qBuscaFipe.SQL.Clear;
     qBuscaFipe.SQL.Add('select COD_FIPE, UPPER(modelo) as MODELO, "'+'ANO'+EditAno.Text+'" as FIPE, REF');
     qBuscaFipe.SQL.Add('from TBFIPE where UPPER(modelo) like '+QuotedStr('%'+UpperCase(EditModeloFipe.Text)+'%')+' and');
     qBuscaFipe.SQL.Add(' "'+'ANO'+EditAno.Text+'" > 0 order by marca, modelo');
     qBuscaFipe.open;

     DBGrid1.Columns[0].Width := 100;
     DBGrid1.Columns[1].Width := 350;
     DBGrid1.Columns[2].Width := 150;

     TNumericField(qBuscaFipe.FieldByName('FIPE')).DisplayFormat := ',0.00;-,0.00';
    End;
 End;

 End;
end;

procedure TFormAlteraFipeDePara.FormShow(Sender: TObject);
begin

 qBuscaFipe.Active := false;
 qBuscaFipe.SQL.Clear;

end;

procedure TFormAlteraFipeDePara.Image2Click(Sender: TObject);
begin

 if EditAno.Text <> '' then
 Begin
    if EditModeloFipe.Text <> '' then
    Begin
     qBuscaFipe.SQL.Clear;
     qBuscaFipe.SQL.Add('select COD_FIPE, UPPER(modelo) as MODELO, "'+'ANO'+EditAno.Text+'" as FIPE');
     qBuscaFipe.SQL.Add('from TBFIPE where UPPER(modelo) like '+QuotedStr('%'+UpperCase(EditModeloFipe.Text)+'%')+' and');
     qBuscaFipe.SQL.Add(' "'+'ANO'+EditAno.Text+'" > 0 order by marca, modelo');
     qBuscaFipe.open;

     DBGrid1.Columns[0].Width := 100;
     DBGrid1.Columns[1].Width := 350;
     DBGrid1.Columns[2].Width := 150;

     TNumericField(qBuscaFipe.FieldByName('FIPE')).DisplayFormat := ',0.00;-,0.00';
    End;
 End;

end;

procedure TFormAlteraFipeDePara.Image3Click(Sender: TObject);
begin

 if MessageDlg('Deseja mesmo alterar as seguintes informações: '+ #13 +
               #13 +
               'Ano antigo: ' + FormCruzamentoFipes.DBGrid1.DataSource.DataSet.FieldByName('ano').Text + #13 +
               'Modelo antigo: ' + FormCruzamentoFipes.DBGrid1.DataSource.DataSet.FieldByName('modelo_fipe').Text + #13 +
               ' ' + #13 +
               'Ano novo: ' + EditAno.Text + #13 +
               'Modelo novo: ' + DBGrid1.DataSource.DataSet.FieldByName('MODELO').Text + #13 +
               ' ' + #13 +
               'Confirme para ajustar?' , mtInformation, [mbno, mbyes] , 0) = mrYes
               Then
                Begin

                  qAjustaFipe.SQL.Clear;
                  qAjustaFipe.SQL.Add('update tbconcfipemodelo set cod_fipe=:cod_fipe,');
                  qAjustaFipe.SQL.Add('vlr_fipe=:vlr_fipe,');
                  qAjustaFipe.SQL.Add('modelo_fipe=:modelo,');
                  qAjustaFipe.SQL.Add('ano=:ano, REF_FIPE=:REF where id=:id');
                  qAjustaFipe.ParamByName('cod_fipe').Text := DBGrid1.DataSource.DataSet.FieldByName('cod_fipe').Text;
                  qAjustaFipe.ParamByName('vlr_fipe').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('fipe').AsCurrency;
                  qAjustaFipe.ParamByName('modelo').Text := DBGrid1.DataSource.DataSet.FieldByName('modelo').Text;
                  qAjustaFipe.ParamByName('ano').Text := EditAno.Text;
                  qAjustaFipe.ParamByName('id').AsInteger := FormCruzamentoFipes.DBGrid1.DataSource.DataSet.FieldByName('id').AsInteger;
                  qAjustaFipe.ParamByName('REF').Text := DBGrid1.DataSource.DataSet.FieldByName('REF').Text;
                  qAjustaFipe.Execute;

                  FormCruzamentoFipes.qBuscaFipes.Refresh;

                  Close;

                End;

end;

end.
