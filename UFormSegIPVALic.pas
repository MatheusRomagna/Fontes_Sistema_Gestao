unit UFormSegIPVALic;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Imaging.pngimage, Vcl.ExtCtrls, MemDS, DBAccess, Uni;

type
  TFormSeguroIPVALic = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Label10: TLabel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Image2: TImage;
    Image3: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Image4: TImage;
    EditAno: TEdit;
    EditValor: TEdit;
    ComboTipo: TComboBox;
    DataSource1: TDataSource;
    qBuscaDocs: TUniQuery;
    qBuscaDocsid: TIntegerField;
    qBuscaDocsid_atendimento: TIntegerField;
    qBuscaDocstipo: TStringField;
    qBuscaDocsano: TStringField;
    qBuscaDocsvalor: TFloatField;
    qInsereDoc: TUniQuery;
    qAtualizaValores: TUniQuery;
    qDeletaIPVA: TUniQuery;
    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure EditValorKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSeguroIPVALic: TFormSeguroIPVALic;

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
  UFormPrincipal, UFormProcPlanAcelero, UFormProcPlanFinal,
  UFormUltimasAtualizacoes, UFormUsuarios, UFormVistoriadores,
  UFormVistoriasDetalhes, UFormWebBrowse, UforTestesDiversos, UnitLogin;

procedure TFormSeguroIPVALic.EditValorKeyPress(Sender: TObject; var Key: Char);
begin

 if not (key in ['0'..'9',',',#8]) then key :=#0;

end;

procedure TFormSeguroIPVALic.Image2Click(Sender: TObject);
begin

 ComboTipo.Enabled := true;
 EditAno.Enabled := true;
 EditValor.Enabled := true;

 EditAno.Text := '';
 EditValor.Text := '';

 Image4.Visible := true;
 Image2.Visible := false;

end;

procedure TFormSeguroIPVALic.Image3Click(Sender: TObject);
begin
 if Image2.Visible = false then
 Begin
   ComboTipo.Text := '';
   ComboTipo.SelText := '';

   ComboTipo.Enabled := false;

   EditAno.Text := '';
   EditAno.Enabled := false;

   EditValor.Text := '';
   EditValor.Enabled := false;

   Image4.Visible := false;
   Image2.Visible := true;
  End
  Else
  Begin
   if MessageDlg('Deseja mesmo deletar o documento selecionada de ID: '+IntToStr(DBGrid1.DataSource.DataSet.FieldByName('id').AsInteger), mtWarning, [mbno, mbyes] , 0) = mryes then
   Begin
    qDeletaIPVA.SQL.Clear;
    qDeletaIPVA.SQL.Add('delete from tbcompras_doc_veiculio where id = :id');
    qDeletaIPVA.ParamByName('id').AsInteger := DBGrid1.DataSource.DataSet.FieldByName('id').AsInteger;
    qDeletaIPVA.Execute;

    FormDetalhesAtendimento.EditTotalIPVASegLic.Text := CurrToStr(StrtoCurr(FormDetalhesAtendimento.EditTotalIPVASegLic.Text) - DBGrid1.DataSource.DataSet.FieldByName('valor').asCurrency);

    qBuscaDocs.Refresh;


   End
  End;


end;

procedure TFormSeguroIPVALic.Image4Click(Sender: TObject);
Var
 total : currency;
begin

 if ComboTipo.Text <> '' then
 Begin
    if EditAno.Text <> '' then
    Begin
       if EditValor.Text <> '' then
       Begin
         try

         qInsereDoc := TUniQuery.Create(self);
         qInsereDoc.Connection := DataModuleConexao.UniConnection1;

         qAtualizaValores := TUniQuery.Create(self);
         qAtualizaValores.Connection := DataModuleConexao.UniConnection1;

         qInsereDoc.SQL.Clear;
         qInsereDoc.SQL.Add('insert into tbcompras_doc_veiculio (id_atendimento, tipo, ano, valor)');
         qInsereDoc.SQL.Add('values (:id, :tipo, :ano, :valor)');
         qInsereDoc.ParamByName('id').AsInteger := FormAtendimentos.DataSourceAtendimentos.DataSet.FieldByName('id').AsInteger;
         qInsereDoc.ParamByName('tipo').Text := ComboTipo.Text;
         qInsereDoc.ParamByName('ano').Text := EditAno.Text;
         qInsereDoc.ParamByName('valor').AsCurrency := StrToCurr(EditValor.Text);
         qInsereDoc.ExecSQL;

         qAtualizaValores.SQL.Clear;
         qAtualizaValores.SQL.Add('select sum(valor) as valor from tbcompras_doc_veiculio where id_atendimento=:id');
         qAtualizaValores.ParamByName('id').AsInteger := FormAtendimentos.DataSourceAtendimentos.DataSet.FieldByName('id').AsInteger;
         qAtualizaValores.Open;

         total := qAtualizaValores.FieldByName('valor').AsCurrency;

         qAtualizaValores.SQL.Clear;
         qAtualizaValores.SQL.Add('update tbcompras_doc_leilao set total_ipva_seg_lic = :total where id_atendimento=:id');
         qAtualizaValores.ParamByName('id').AsInteger := FormAtendimentos.DataSourceAtendimentos.DataSet.FieldByName('id').AsInteger;
         qAtualizaValores.ParamByName('total').AsCurrency := total;
         qAtualizaValores.Execute;

         FormDetalhesAtendimento.EditTotalIPVASegLic.Text := CurrToStr(total);

         qBuscaDocs.Refresh;

         finally

          ComboTipo.SelText := '';
          ComboTipo.Enabled := false;
          EditAno.Text := '';
          EditAno.Enabled := false;
          EditValor.Text := '';
          EditValor.Enabled := false;

          Image4.Visible := false;
          Image2.Visible := true;

          qInsereDoc.Free;
          qAtualizaValores.Free;

         end;

       End;
    End;
 End;

end;

end.
