unit UFormQuitacoesVeiculo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, MemDS,
  DBAccess, Uni;

type
  TFormQuitacoesVeiculo = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Label10: TLabel;
    Panel2: TPanel;
    Image2: TImage;
    Image3: TImage;
    Label2: TLabel;
    Label3: TLabel;
    Image4: TImage;
    EditValor: TEdit;
    EditFinanceira: TEdit;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    qBuscaQuitacoes: TUniQuery;
    qDeletaQuitacoes: TUniQuery;
    qAtualizaAtendimento: TUniQuery;
    qInsereQuitacoes: TUniQuery;
    qBuscaQuitacoesid: TIntegerField;
    qBuscaQuitacoesid_atendimento: TIntegerField;
    qBuscaQuitacoesfinanceira: TStringField;
    qBuscaQuitacoesvalor: TFloatField;
    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormQuitacoesVeiculo: TFormQuitacoesVeiculo;

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
  UFormDadosPerfil, UFormDetalhesAtendimento, UFormDetalhesAvaliacao,
  UFormDownloadNovaVersao, UFormExcelCompras, UFormGestaoAvaliacoes,
  UFormGestaoVistoria, UFormHistFIPE, UFormHistoricoAvaliacoes, UFormImagem,
  UFormImportacoesEfetuadas, UFormLoading, UFormLoadingOpaco, UFormLoginSavauto,
  UFormLotesArval, UFormNovoProcessamento, UFormNovoVistoriador,
  UFormPadroesPlanilhas, UFormPerfis, UFormPermissoesCarga, UFormPesquisaFipe,
  UFormPrincipal, UFormProcPlanAcelero, UFormProcPlanFinal, UFormSegIPVALic,
  UFormUltimasAtualizacoes, UFormUsuarios, UFormVistoriadores,
  UFormVistoriasDetalhes, UFormWebBrowse, UforTestesDiversos, UnitLogin;

procedure TFormQuitacoesVeiculo.Image2Click(Sender: TObject);
begin

 EditFinanceira.Enabled := true;
 EditFinanceira.Text := '';

 EditValor.Enabled := true;
 EditValor.Text := '';

 Image2.Visible := false;
 Image4.Visible := true;

end;

procedure TFormQuitacoesVeiculo.Image3Click(Sender: TObject);
Var
 Valor : Currency;
begin
 if Image2.Visible = false then
 Begin
   EditFinanceira.Enabled := false;
   EditFinanceira.Text := '';

   EditValor.Enabled := false;
   EditValor.Text := '';

   Image2.Visible := true;
   Image4.Visible := false;
  End
  Else
  Begin
   if MessageDlg('Deseja mesmo deletar a quitação selecionada de ID: '+IntToStr(DBGrid1.DataSource.DataSet.FieldByName('id').AsInteger), mtWarning, [mbno, mbyes] , 0) = mryes then
   Begin

    Valor := DBGrid1.DataSource.DataSet.FieldByName('valor').AsCurrency;
    qDeletaQuitacoes.SQL.Clear;
    qDeletaQuitacoes.SQL.Add('delete from tbcompras_doc_financeiro where id = :id');
    qDeletaQuitacoes.ParamByName('id').AsInteger := DBGrid1.DataSource.DataSet.FieldByName('id').AsInteger;
    qDeletaQuitacoes.Execute;


    FormDetalhesAtendimento.EditTotalQuitacao.Text :=
    CurrToStr(StrToCurr(FormDetalhesAtendimento.EditTotalQuitacao.Text) - Valor);

    qBuscaQuitacoes.Refresh;
   End
  End;

end;

procedure TFormQuitacoesVeiculo.Image4Click(Sender: TObject);
var
 Total : Currency;
begin

 Total := 0;

 if EditValor.Text <> '' then
 Begin
    if EditFinanceira.Text <> '' then
    Begin

       qInsereQuitacoes.SQL.Clear;
       qInsereQuitacoes.SQL.Add('insert into tbcompras_doc_financeiro (id_atendimento, financeira, valor)');
       qInsereQuitacoes.SQL.Add('values (:id, :financ, :valor)');
       qInsereQuitacoes.ParamByName('id').AsInteger := FormAtendimentos.DataSourceAtendimentos.DataSet.FieldByName('id').AsInteger;
       qInsereQuitacoes.ParamByName('financ').Text := EditFinanceira.Text;
       if EditValor.Text = '' then
       qInsereQuitacoes.ParamByName('valor').AsCurrency := 0
       Else
       qInsereQuitacoes.ParamByName('valor').AsCurrency := StrToCurr(EditValor.Text);
       qInsereQuitacoes.ExecSQL;

        EditFinanceira.Enabled := false;
        EditFinanceira.Text := '';

        EditValor.Enabled := false;
        EditValor.Text := '';

        Image2.Visible := true;
        Image4.Visible := false;

       {FormAtendimentoMultasVeiculo.qBuscaMultas.Filtered := false;
       FormAtendimentoMultasVeiculo.qBuscaMultas.Filter := 'id_atendimento='+QuotedStr( IntToStr(FormAtendimentos.DataSourceAtendimentos.DataSet.FieldByName('id').AsInteger));
       FormAtendimentoMultasVeiculo.qBuscaMultas.Filtered := true;}
       qBuscaQuitacoes.Refresh;

       qBuscaQuitacoes.First;
       while not qBuscaQuitacoes.Eof do
       Begin
         Total := Total + qBuscaQuitacoes.FieldByName('valor').AsCurrency;
         qBuscaQuitacoes.Next;
       End;

       qAtualizaAtendimento.SQL.Clear;
       qAtualizaAtendimento.SQL.Add('update tbcompras_doc_leilao set quitacao = :total where id_atendimento=:id');
       qAtualizaAtendimento.ParamByName('id').AsInteger := FormAtendimentos.DataSourceAtendimentos.DataSet.FieldByName('id').AsInteger;
       qAtualizaAtendimento.ParamByName('total').AsCurrency := Total;
       qAtualizaAtendimento.Execute;

       FormDetalhesAtendimento.EditTotalQuitacao.Text := CurrToStr(Total);

       FormAtendimentos.qBuscaAtendimentos.Refresh;

    End;
 End;

end;

end.
