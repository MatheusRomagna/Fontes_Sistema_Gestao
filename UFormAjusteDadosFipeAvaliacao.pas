unit UFormAjusteDadosFipeAvaliacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, MemDS, DBAccess, Uni;

type
  TFormAjusteDadosFipeAvaliacao = class(TForm)
    GroupBox1: TGroupBox;
    EditAno: TEdit;
    EditModelo: TEdit;
    EditCodFipe: TEdit;
    EditVlrFipe: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    Panel2: TPanel;
    Panel3: TPanel;
    Label5: TLabel;
    ComboBoxRefFipe: TComboBox;
    Label6: TLabel;
    EditNovoAno: TEdit;
    Label7: TLabel;
    EditNovoModelo: TEdit;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    qBuscaFipe: TUniQuery;
    qBuscaRefFipe: TUniQuery;
    qAtualiza: TUniQuery;
    procedure EditNovoModeloKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAjusteDadosFipeAvaliacao: TFormAjusteDadosFipeAvaliacao;

implementation

{$R *.dfm}

uses FMX.UFormGraficosAtendimento, Loading, UDataModuleBancoVistoria,
  UDataModuleConexao, UDMPermissoes, UFormAgendamento, UFormAlteraFipeDePaxa,
  UFormAnaliseCompra, UFormAnaliseCompraQuery, UFormAnaliseComprasTabela,
  UFormAplicaMargem, UFormAtendimentoMultasVeiculo, UFormAtendimentoNovo,
  UFormAtendimentos, UFormAtualizaTabelaFipe, UFormAtuHistFIPE, UFormAtuTabFIpe,
  UFormAvaliarAvaliacao, UFormAvarias, UFormCadaNovoUsuMobile, UFormCadaUsuario,
  UFormCadaUsuariosMobile, UFormCadVistoriadores, UFormColunasOcultas,
  UFormConcedePermissao, UFormConcFipeModelo, UFormConsutaPlacaAvaliacao,
  UFormCruzamentoFipes, UFormDadosPagamento, UFormDadosPerfil,
  UFormDataPagamento, UFormDetalhesAtendimento, UFormDetalhesAvaliacao,
  UFormDownloadNovaVersao, UFormExcelCompras, UFormExtratoPgtoVeiculos,
  UFormGestaoAvaliacoes, UFormGestaoVistoria, UFormHistFIPE,
  UFormHistoricoAvaliacoes, UFormHistoricoObsAtn, UFormImagem,
  UFormImportacoesEfetuadas, UFormInformacoes, UFormLiberaPermissao,
  UFormLoading, UFormLoadingCarregamento, UFormLoadingOpaco, UFormLoginSavauto,
  UFormLotesArval, UFormMenuFinanceiro, UFormNovaAvaliacao, UformNovaObs,
  UFormNovoProcessamento, UFormNovoVistoriador, UFormPadroesPlanilhas,
  UFormPagamentoVeiculo, UFormPerfis, UFormPermissoesCarga, UFormPesquisaFipe,
  UFormPgtoExtratoVeiculo, UFormPrincipal, UFormProcPlanAcelero,
  UFormProcPlanFinal, UFormQuitacoesVeiculo, UFormRefFipes, UFormSegIPVALic,
  UFormUltimasAtualizacoes, UFormUsuarios, UFormVistoriadores,
  UFormVistoriasDetalhes, UFormWebBrowse, UforTestesDiversos, UnitLogin;

procedure TFormAjusteDadosFipeAvaliacao.DBGrid1DblClick(Sender: TObject);
begin

 if MessageDlg('Deseja mesmo alterar as seguintes informações: '+ #13 +
               #13 +
               'Ano antigo: ' + EditAno.Text + #13 +
               'Modelo antigo: ' + EditModelo.Text + #13 +
               ' ' + #13 +
               'Ano novo: ' + EditNovoAno.Text + #13 +
               'Modelo novo: ' + DBGrid1.DataSource.DataSet.FieldByName('modelo').Text + #13 +
               ' ' + #13 +
               'Confirme para ajustar?' , mtInformation, [mbno, mbyes] , 0) = mrYes
               Then
                Begin

                  qAtualiza.SQL.Clear;
                  qAtualiza.SQL.Add('update tbavaliacoes set cod_fipe=:cod_fipe,');
                  qAtualiza.SQL.Add('vlr_fipe=:vlr_fipe,');
                  qAtualiza.SQL.Add('modelo=:modelo,');
                  qAtualiza.SQL.Add('ano=:ano where id=:id');
                  qAtualiza.ParamByName('cod_fipe').Text := DBGrid1.DataSource.DataSet.FieldByName('cod_fipe').Text;
                  qAtualiza.ParamByName('vlr_fipe').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('fipe').AsCurrency;
                  qAtualiza.ParamByName('modelo').Text := DBGrid1.DataSource.DataSet.FieldByName('modelo').Text;
                  qAtualiza.ParamByName('ano').Text := EditNovoAno.Text;
                  qAtualiza.ParamByName('id').AsInteger := FormGestaoAvaliacoes.DBGrid1.DataSource.DataSet.FieldByName('id').AsInteger;
                  //qAtualiza.ParamByName('REF').Text := DBGrid1.DataSource.DataSet.FieldByName('REF').Text;
                  qAtualiza.Execute;

                  DataModuleBancoVistoria.qBuscaAvaliacoes.Refresh;

                  Close;

                End;

end;

procedure TFormAjusteDadosFipeAvaliacao.EditNovoModeloKeyPress(Sender: TObject;
  var Key: Char);
begin

 if key = #13 then
 Begin
   if EditNovoAno.Text <> '' then
   Begin
      if EditNovoModelo.Text <> '' then
      Begin
         qBuscaFipe.SQL.Clear;
         qBuscaFipe.SQL.Add('select COD_FIPE, UPPER(modelo) as MODELO, "'+'ANO'+EditNovoAno.Text+'" as FIPE');
         qBuscaFipe.SQL.Add('from TBFIPE where UPPER(modelo) like '+QuotedStr('%'+UpperCase(EditNovoModelo.Text)+'%')+' and');
         qBuscaFipe.SQL.Add(' "'+'ANO'+EditNovoAno.Text+'" > 0 and ref=:ref order by marca, modelo');
         qBuscaFipe.ParamByName('ref').Text := ComboBoxRefFipe.Text;
         qBuscaFipe.open;

       DBGrid1.Columns[0].Width := 100;
       DBGrid1.Columns[1].Width := 350;
       DBGrid1.Columns[2].Width := 150;

       TNumericField(qBuscaFipe.FieldByName('FIPE')).DisplayFormat := ',0.00;-,0.00';
      End;
   End;
 End;

end;

procedure TFormAjusteDadosFipeAvaliacao.FormShow(Sender: TObject);
begin

 ComboBoxRefFipe.Clear;

 EditNovoAno.Text := '';
 EditNovoModelo.Text := '';

 qBuscaRefFipe.SQL.Clear;
 qBuscaRefFipe.SQL.Add('select ref1, ref2 , ref3 from tbfiperef');
 qBuscaRefFipe.Open;

 ComboBoxRefFipe.Items.Add(qBuscaRefFipe.FieldByName('ref1').Text);
 ComboBoxRefFipe.Items.Add(qBuscaRefFipe.FieldByName('ref2').Text);
 ComboBoxRefFipe.Items.Add(qBuscaRefFipe.FieldByName('ref3').Text);

end;

end.
