unit UFormAtendimentoMultasVeiculo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, MemDS, DBAccess, Uni,
  Vcl.ComCtrls;

type
  TFormAtendimentoMultasVeiculo = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Label10: TLabel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    DataSourceMultas: TDataSource;
    qBuscaMultas: TUniQuery;
    qDeletaMultas: TUniQuery;
    qBuscaMultasid: TIntegerField;
    qBuscaMultasid_atendimento: TIntegerField;
    qBuscaMultasdata: TDateField;
    qBuscaMultascodigo: TStringField;
    qBuscaMultasvalor: TFloatField;
    Image2: TImage;
    Image3: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DateTimeData: TDateTimePicker;
    EditValorMulta: TEdit;
    EditCodigoMulta: TEdit;
    qInsereMultas: TUniQuery;
    Image4: TImage;
    qAtualizaAtendimento: TUniQuery;
    procedure Image3Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure AtualizaValores(id: integer);
    { Public declarations }
  end;

var
  FormAtendimentoMultasVeiculo: TFormAtendimentoMultasVeiculo;

implementation

{$R *.dfm}

uses Loading, UDataModuleBancoVistoria, UDataModuleConexao, UFormAnaliseCompra,
  UFormAnaliseCompraQuery, UFormAnaliseComprasTabela, UFormAplicaMargem,
  UFormAtendimentoNovo, UFormAtendimentos, UFormAtualizaTabelaFipe,
  UFormAtuHistFIPE, UFormAtuTabFIpe, UFormAvaliarAvaliacao, UFormAvarias,
  UFormCadaUsuario, UFormCadVistoriadores, UFormColunasOcultas,
  UFormConcedePermissao, UFormConcFipeModelo, UFormConsutaPlacaAvaliacao,
  UFormDadosPerfil, UFormDetalhesAtendimento, UFormDetalhesAvaliacao,
  UFormDownloadNovaVersao, UFormExcelCompras, UFormGestaoAvaliacoes,
  UFormGestaoVistoria, UFormHistFIPE, UFormHistoricoAvaliacoes, UFormImagem,
  UFormImportacoesEfetuadas, UFormLoading, UFormLoadingOpaco, UFormLoginSavauto,
  UFormLotesArval, UFormNovoProcessamento, UFormNovoVistoriador,
  UFormPadroesPlanilhas, UFormPerfis, UFormPermissoesCarga, UFormPesquisaFipe,
  UFormPrincipal, UFormProcPlanAcelero, UFormProcPlanFinal,
  UFormUltimasAtualizacoes, UFormUsuarios, UFormVistoriadores,
  UFormVistoriasDetalhes, UFormWebBrowse, UforTestesDiversos, UnitLogin;

procedure TFormAtendimentoMultasVeiculo.AtualizaValores(id: integer);
var
 query : TUniQuery;
 multas, documento, quitacao : Currency;
Begin

 multas := 0;
 documento := 0;
 quitacao := 0;

 FormDetalhesAtendimento.EditVlrMultasPgto.Text := '0,00';
 FormDetalhesAtendimento.EditVlrDocsPgto.Text := '0,00';
 FormDetalhesAtendimento.EditVlrQuitacaoPgto.Text := '0,00';
 FormDetalhesAtendimento.EditVlrTransPgto.Text := '0,00';
 FormDetalhesAtendimento.EditVlrDutPgto.Text := '0,00';
 FormDetalhesAtendimento.EditTotalDescontos.Text := '0,00';
 FormDetalhesAtendimento.EditLiqPgto.Text := '0,00';

 FormDetalhesAtendimento.EditTotalMultas.Text := '0,00';
 FormDetalhesAtendimento.EditTotalIPVASegLic.Text := '0,00';
 FormDetalhesAtendimento.EditTotalQuitacao.Text := '0,00';

 query := TUniQuery.Create(self);
 query.Connection := DataModuleConexao.UniConnection1;

 try

  query.SQL.Clear;
  query.SQL.Add('select coalesce(sum(valor),0) as valor from tbcompras_multas_veiculo where id_atendimento = :id');
  query.ParamByName('id').AsInteger := id;
  query.Open;

  multas := query.FieldByName('valor').AsCurrency;

  query.SQL.Clear;
  query.SQL.Add('select coalesce(sum(valor) , 0 ) as valor from tbcompras_doc_veiculio where id_atendimento = :id');
  query.ParamByName('id').AsInteger := id;
  query.Open;

  documento := query.FieldByName('valor').AsCurrency;

  query.SQL.Clear;
  query.SQL.Add('select coalesce(sum(valor),0) as valor from tbcompras_doc_financeiro where id_atendimento = :id');
  query.ParamByName('id').AsInteger;
  query.Open;

  quitacao := query.FieldByName('valor').AsCurrency;

  query.SQL.Clear;
  query.SQL.Add('update tbcompras_doc_leilao set total_multas=:multas, total_ipva_seg_lic=:documento, quitacao=:quitacao where id_atendimento=:id');
  query.ParamByName('multas').AsCurrency := multas;
  query.ParamByName('documento').AsCurrency := documento;
  query.ParamByName('quitacao').AsCurrency := quitacao;
  query.ParamByName('id').AsInteger := id;
  query.execute;

  FormDetalhesAtendimento.EditVlrMultasPgto.Text := CurrToStr(multas);
  FormDetalhesAtendimento.EditVlrDocsPgto.Text   := CurrToStr(documento);
  FormDetalhesAtendimento.EditVlrQuitacaoPgto.Text := CurrToStr(quitacao);

  FormDetalhesAtendimento.EditTotalMultas.Text := CurrToStr(multas);
  FormDetalhesAtendimento.EditTotalIPVASegLic.Text := CurrToStr(documento);
  FormDetalhesAtendimento.EditTotalQuitacao.Text := CurrToStr(quitacao);

  FormDetalhesAtendimento.EditTotalDescontos.Text :=
  CurrToStr(
   StrToCurr(FormDetalhesAtendimento.EditVlrMultasPgto.Text) +
   StrToCurr(FormDetalhesAtendimento.EditVlrDocsPgto.Text ) +
   StrToCurr(FormDetalhesAtendimento.EditVlrQuitacaoPgto.Text) +
   StrToCurr(FormDetalhesAtendimento.EditVlrTransPgto.Text) +
   StrToCurr(FormDetalhesAtendimento.EditVlrDutPgto.Text)
   );

   FormDetalhesAtendimento.EditLiqPgto.Text := StringReplace(  StringReplace( FormDetalhesAtendimento.EditLiqPgto.Text, 'R$', '', [rfReplaceAll] ), '.', '', [rfReplaceAll]);

   FormDetalhesAtendimento.EditLiqPgto.Text :=
   CurrToStr(
    StrToCurr( StringReplace( stringReplace( FormDetalhesAtendimento.EditVlrAvaliacaoPgto.Text, 'R$' , '', [rfReplaceAll]), '.' , '', [rfReplaceAll])) -
    StrToCurr( StringReplace( stringReplace( FormDetalhesAtendimento.EditTotalDescontos.Text, 'R$' , '', [rfReplaceAll]), '.' , '', [rfReplaceAll]))
    );

   FormDetalhesAtendimento.EditVlrMultasPgto.Text := floatToStrF(StrToCurr(FormDetalhesAtendimento.EditVlrMultasPgto.Text),  ffCurrency,10,2);
   FormDetalhesAtendimento.EditVlrDocsPgto.Text := floatToStrF(StrToCurr(FormDetalhesAtendimento.EditVlrDocsPgto.Text),  ffCurrency,10,2);
   FormDetalhesAtendimento.EditVlrQuitacaoPgto.Text := floatToStrF(StrToCurr(FormDetalhesAtendimento.EditVlrQuitacaoPgto.Text),  ffCurrency,10,2);
   FormDetalhesAtendimento.EditVlrTransPgto.Text := floatToStrF(StrToCurr(FormDetalhesAtendimento.EditVlrTransPgto.Text),  ffCurrency,10,2);
   FormDetalhesAtendimento.EditVlrDutPgto.Text := floatToStrF(StrToCurr(FormDetalhesAtendimento.EditVlrDutPgto.Text),  ffCurrency,10,2);
   FormDetalhesAtendimento.EditTotalDescontos.Text := floatToStrF(StrToCurr(FormDetalhesAtendimento.EditTotalDescontos.Text),  ffCurrency,10,2);
   FormDetalhesAtendimento.EditLiqPgto.Text := floatToStrF(StrToCurr(FormDetalhesAtendimento.EditLiqPgto.Text),  ffCurrency,10,2);

   FormDetalhesAtendimento.EditTotalMultas.Text := floatToStrF(StrToCurr(FormDetalhesAtendimento.EditTotalMultas.Text),  ffCurrency,10,2);
   FormDetalhesAtendimento.EditTotalIPVASegLic.Text := floatToStrF(StrToCurr(FormDetalhesAtendimento.EditTotalIPVASegLic.Text),  ffCurrency,10,2);
   FormDetalhesAtendimento.EditTotalQuitacao.Text := floatToStrF(StrToCurr(FormDetalhesAtendimento.EditTotalQuitacao.Text),  ffCurrency,10,2);

  Except
  On E:Exception Do
  Begin

   ShowMessage('Falha ao atualizar valores do atendimento! ' + e.Message);

  End;

 end;

End;

procedure TFormAtendimentoMultasVeiculo.Image2Click(Sender: TObject);
begin
 DateTimeData.Enabled := true;
 EditValorMulta.Text := '0,00';
 EditValorMulta.Enabled := true;
 EditCodigoMulta.Text := '';
 EditCodigoMulta.Enabled := true;
 Image4.Visible := true;
 Image2.Visible := false;
end;

procedure TFormAtendimentoMultasVeiculo.Image3Click(Sender: TObject);
var
 TotalMultas : Currency;
begin
 if Image2.Visible = false then
 Begin
   DateTimeData.Enabled := false;
   EditValorMulta.Text := '0,00';
   EditValorMulta.Enabled := false;
   EditCodigoMulta.Text := '';
   EditCodigoMulta.Enabled := false;
   Image4.Visible := false;
   Image2.Visible := true;
  End
  Else
  Begin
   if MessageDlg('Deseja mesmo deletar a multa selecionada de ID: '+IntToStr(DBGrid1.DataSource.DataSet.FieldByName('id').AsInteger), mtWarning, [mbno, mbyes] , 0) = mryes then
   Begin

    qDeletaMultas.SQL.Clear;
    qDeletaMultas.SQL.Add('delete from tbcompras_multas_veiculo where id = :id');
    qDeletaMultas.ParamByName('id').AsInteger := DBGrid1.DataSource.DataSet.FieldByName('id').AsInteger;
    qDeletaMultas.Execute;

    qBuscaMultas.Refresh;

    AtualizaValores( FormAtendimentos.DataSourceAtendimentos.DataSet.FieldByName('id').AsInteger );

    FormAtendimentos.qBuscaAtendimentos.Refresh;

   End
  End;
end;

procedure TFormAtendimentoMultasVeiculo.Image4Click(Sender: TObject);
var
 TotalMultas : Currency;
begin

 TotalMultas := 0;

 if EditValorMulta.Text <> '' then
 Begin
    if EditCodigoMulta.Text <> '' then
    Begin

       qInsereMultas.SQL.Clear;
       qInsereMultas.SQL.Add('insert into tbcompras_multas_veiculo (id_atendimento, data, codigo, valor)');
       qInsereMultas.SQL.Add('values (:id, :data, :codigo, :valor)');
       qInsereMultas.ParamByName('id').AsInteger := FormAtendimentos.DataSourceAtendimentos.DataSet.FieldByName('id').AsInteger;
       qInsereMultas.ParamByName('data').AsDate := DateTimeData.Date;
       qInsereMultas.ParamByName('codigo').Text := EditCodigoMulta.Text;
       if EditValorMulta.Text = '' then
       qInsereMultas.ParamByName('valor').AsCurrency := 0
       Else
       qInsereMultas.ParamByName('valor').AsCurrency := StrToCurr(EditValorMulta.Text);
       qInsereMultas.ExecSQL;

       DateTimeData.Enabled := false;
       EditValorMulta.Text := '0,00';
       EditValorMulta.Enabled := false;
       EditCodigoMulta.Text := '';
       EditCodigoMulta.Enabled := false;
       Image4.Visible := false;
       Image2.Visible := true;

       qBuscaMultas.Refresh;

       AtualizaValores( FormAtendimentos.DataSourceAtendimentos.DataSet.FieldByName('id').AsInteger );

       FormAtendimentos.qBuscaAtendimentos.Refresh;

    End;
 End;

end;

end.
